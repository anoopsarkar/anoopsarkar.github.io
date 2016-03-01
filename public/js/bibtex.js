---
---
// Issues:
//  no comment handling within strings
//  no string concatenation
//  no variable values yet

// Grammar implemented here:
//  bibtex -> (string | preamble | comment | entry)*;
//  string -> '@STRING' '{' key_equals_value '}';
//  preamble -> '@PREAMBLE' '{' value '}';
//  comment -> '@COMMENT' '{' value '}';
//  entry -> '@' key '{' key ',' key_value_list '}';
//  key_value_list -> key_equals_value (',' key_equals_value)*;
//  key_equals_value -> key '=' value;
//  value -> value_quotes | value_braces | key;
//  value_quotes -> '"' .*? '"'; // not quite
//  value_braces -> '{' .*? '"'; // not quite
function author_tex_reformat(input){
    if (input.indexOf(",") > -1){
      return input.split(',')[1] + " " + input.split(',')[0];
    } else{ 
      return input;
    }
  }

function BibtexParser() {
  this.pos = 0;
  this.input = "";
  
  this.entries = {};
  this.strings = {
      JAN: "January",
      FEB: "February",
      MAR: "March",      
      APR: "April",
      MAY: "May",
      JUN: "June",
      JUL: "July",
      AUG: "August",
      SEP: "September",
      OCT: "October",
      NOV: "November",
      DEC: "December"
  };
  this.currentKey = "";
  this.currentEntry = "";
  

  this.setInput = function(t) {
    this.input = t;
  }
  
  this.getEntries = function() {
      return this.entries;
  }

  this.isWhitespace = function(s) {
    return (s == ' ' || s == '\r' || s == '\t' || s == '\n');
  }

  this.match = function(s) {
    this.skipWhitespace();
    if (this.input.substring(this.pos, this.pos+s.length) == s) {
      this.pos += s.length;
    } else {
      throw "Token mismatch, expected " + s + ", found " + this.input.substring(this.pos);
    }
    this.skipWhitespace();
  }

  this.tryMatch = function(s) {
    this.skipWhitespace();
    if (this.input.substring(this.pos, this.pos+s.length) == s) {
      return true;
    } else {
      return false;
    }
    this.skipWhitespace();
  }

  this.skipWhitespace = function() {
    while (this.isWhitespace(this.input[this.pos])) {
      this.pos++;
    }
    if (this.input[this.pos] == "%") {
      while(this.input[this.pos] != "\n") {
        this.pos++;
      }
      this.skipWhitespace();
    }
  }

  this.value_braces = function() {
    var bracecount = 0;
    this.match("{");
    var start = this.pos;
    while(true) {
      if (this.input[this.pos] == '}' && this.input[this.pos-1] != '\\') {
        if (bracecount > 0) {
          bracecount--;
        } else {
          var end = this.pos;
          this.match("}");
          return this.input.substring(start, end);
        }
      } else if (this.input[this.pos] == '{') {
        bracecount++;
      } else if (this.pos == this.input.length-1) {
        throw "Unterminated value";
      }
      this.pos++;
    }
  }

  this.value_quotes = function() {
    this.match('"');
    var start = this.pos;
    while(true) {
      if (this.input[this.pos] == '"' && this.input[this.pos-1] != '\\') {
          var end = this.pos;
          this.match('"');
          return this.input.substring(start, end);
      } else if (this.pos == this.input.length-1) {
        throw "Unterminated value:" + this.input.substring(start);
      }
      this.pos++;
    }
  }
  
  this.single_value = function() {
    var start = this.pos;
    if (this.tryMatch("{")) {
      return this.value_braces();
    } else if (this.tryMatch('"')) {
      return this.value_quotes();
    } else {
      var k = this.key();
      if (this.strings[k.toUpperCase()]) {
        return this.strings[k];
      } else if (k.match("^[0-9]+$")) {
        return k;
      } else {
        throw "Value expected:" + this.input.substring(start);
      }
    }
  }
  
  this.value = function() {
    var values = [];
    values.push(this.single_value());
    while (this.tryMatch("#")) {
      this.match("#");
      values.push(this.single_value());
    }
    return values.join("");
  }

  this.key = function() {
    var start = this.pos;
    while(true) {
      if (this.pos == this.input.length) {
        throw "Runaway key";
      }
    
      if (this.input[this.pos].match("[a-zA-Z0-9_:\\./-]")) {
        this.pos++
      } else {
        return this.input.substring(start, this.pos).toUpperCase();
      }
    }
  }

  this.key_equals_value = function() {
    var key = this.key();
    if (this.tryMatch("=")) {
      this.match("=");
      var val = this.value();
      return [ key, val ];
    } else {
      throw "... = value expected, equals sign missing:" + this.input.substring(this.pos);
    }
  }

  this.key_value_list = function() {
    // this.entries[this.currentEntry]['bibtex'] = this. ????????;
    
    var kv = this.key_equals_value();
    this.entries[this.currentEntry][kv[0]] = kv[1];
    while (this.tryMatch(",")) {
      this.match(",");
      // fixes problems with commas at the end of a list
      if (this.tryMatch("}")) {
        break;
      }
      kv = this.key_equals_value();
      this.entries[this.currentEntry][kv[0]] = kv[1];
    }
    // this.entries[this.currentEntry]['bibtex'] = this.input.substring(this.pos,lastpos);

  }

  this.entry_body = function() {
    this.currentEntry = this.key();
    this.entries[this.currentEntry] = new Object(); 
    this.match(",");
    this.key_value_list();

  }

  this.directive = function () {
    this.match("@");
    return "@"+this.key();
  }

  this.string = function () {
    var kv = this.key_equals_value();
    this.strings[kv[0].toUpperCase()] = kv[1];
  }

  this.preamble = function() {
    this.value();
  }

  this.comment = function() {
    this.value(); // this is wrong
  }

  this.entry = function() {
    this.entry_body();
  }

  this.bibtex = function() {
    var is_entry =false;
    while(this.tryMatch("@")) {
      var lastpos = this.pos;
      var d = this.directive().toUpperCase();
      this.match("{");
      if (d == "@STRING") {
        this.string();
      } else if (d == "@PREAMBLE") {
        this.preamble();
      } else if (d == "@COMMENT") {
        this.comment();
      } else {
        this.entry();
        is_entry=true;
      }
      this.match("}");
      // if (is_entry == true) {

        this.entries[this.currentEntry]['BIBTEX'] = this.input.substring(this.pos,lastpos).replace(/\n/g, "<br /> &#160;&#160;").replace(/\}/g," &#125; ").replace(/\{/g," &#123; ");
        // is_entry = false;
        // }
    }
  }
}

function BibtexDisplay() {
  this.fixValue = function (value) {
    value = value.replace(/\\glqq\s?/g, "&bdquo;");
    value = value.replace(/\\grqq\s?/g, '&rdquo;');
    value = value.replace(/\\ /g, '&nbsp;');
    value = value.replace(/\\url/g, '');
    value = value.replace(/---/g, '&mdash;');
    value = value.replace(/{\\"a}/g, '&auml;');
    value = value.replace(/\{\\"o\}/g, '&ouml;');
    value = value.replace(/{\\"u}/g, '&uuml;');
    value = value.replace(/{\\"A}/g, '&Auml;');
    value = value.replace(/{\\"O}/g, '&Ouml;');
    value = value.replace(/{\\"U}/g, '&Uuml;');
    value = value.replace(/\\ss/g, '&szlig;');
    value = value.replace(/\{(.*?)\}/g, '$1');
    return value;
  }

  this.get_years = function (input,constraints){

    var dic = {};
    var b = new BibtexParser();
    b.setInput(input);
    b.bibtex();
         // iterate over bibTeX entries
     var entries = b.getEntries();
     // console.log(entries);
   for (var entryKey in entries) {
      var entry = entries[entryKey];
       var approved = true;

        for (var constraint in constraints)  {
            var key = constraint;
            var value = constraints[constraint];
            if (key == 'YEAR'){
              if (entry['YEAR'] != value){
                approved=false;
              }
            }
            if (key == 'AUTHOR'){
                  var author_found =  false;
                  if (entry['AUTHOR'].indexOf(' and ') >-1) {
                        entry['AUTHOR'].split(' and ').forEach(function(item) { 
                          item = item.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          if (item.indexOf(value) > -1){
                            author_found = true;
                          }
                        });


                  } else {
                          item = entry['AUTHOR'].replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          if (item.indexOf(value) > -1){
                            author_found = true;
                          }
                  }
                 if (author_found == false){
                    approved=false;
                 }
            }

        }
        if (approved == true){
          if (dic[entry['YEAR']] != null){
            dic[entry['YEAR']] = dic[entry['YEAR']] + 1;
          } else {
            dic[entry['YEAR']] = 1;
          }

        }

    }

    return dic;
    // return [{"year":"2014","value":"1"},{"year":"2013","value":"2"}];

  }
    this.get_authors = function (input){

    var dic = {};
    var b = new BibtexParser();
    b.setInput(input);
    b.bibtex();
         // iterate over bibTeX entries
     var entries = b.getEntries();
     // console.log(entries);
    for (var entryKey in entries) {
      var entry = entries[entryKey];

      entry['AUTHOR'].split(' and ').forEach(function(item) { 
          item = item.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
          item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
         if (dic[item] != null){
            dic[item] = dic[item] + 1;
         } else {
           dic[item] = 1;
         }
      });
      // for each (var item in entry['AUTHOR'].split(' and ')){
      //    if (dic[item] != null){
      //       dic[item] = dic[item] + 1;
      //    } else {
      //      dic[item] = 1;
      //    }
      // }
     
    }
    return dic;
    // return [{"year":"2014","value":"1"},{"year":"2013","value":"2"}];

  }


  this.displayBibtex3 = function(i, o) {
    var b = new BibtexParser();
    b.setInput(i);
    b.bibtex();

    var years = {};

    var e = b.getEntries();

// Counting Years
    // for (var item in e) {
    //   if (years[e[item]['YEAR']]){
    //       years[e[item]['YEAR']] = years[e[item]['YEAR']] + 1
    //   } else{
    //     years[e[item]['YEAR']] = 1
    //   } 
    // }


    // for key in e[item]['YEAR'].keys(){
    //       $(".years").append( '<button class="btn btn-primary" type="button">'+ key+'<span class="badge">'years[key]'</span>');
    // }
    var old = o.find("*");
  
    for (var item in e) {

      var tpl = $(".bibtex_template").clone().removeClass('bibtex_template');
      tpl.addClass("unused");


      for (var key in e[item]) {
        var fields = tpl.find("." + key.toLowerCase());
        for (var i = 0; i < fields.size(); i++) {
          var f = $(fields[i]);
          f.removeClass("unused");
          var value = this.fixValue(e[item][key]);
          if (f.is("a")) {
            f.attr("href", value);
          } else {
            var currentHTML = f.html() || "";
            if (currentHTML.match("%")) {
              // "complex" template field
              f.html(currentHTML.replace("%", value));
            } else {
              // simple field
              f.html(value);
            }
          }
        }
      }
    
      var emptyFields = tpl.find("span .unused");
      emptyFields.each(function (key,f) {
        if (f.innerHTML.match("%")) {
          f.innerHTML = "";
        }
      });
    // TODO counter 
    // if (e[item]['YEAR'] == '2012'){
      o.append(tpl);
    // }
      tpl.show();
    }
    
    old.remove();
  }



  
  this.displayBibtex2 = function(i, o) {
    var b = new BibtexParser();
    b.setInput(i);
    b.bibtex();

    var e = b.getEntries();
    var old = o.find("*");
  
    for (var item in e) {
      var tpl = $(".bibtex_template").clone().removeClass('bibtex_template');
      tpl.addClass("unused");
      
      for (var key in e[item]) {
      
        var fields = tpl.find("." + key.toLowerCase());
        for (var i = 0; i < fields.size(); i++) {
          var f = $(fields[i]);
          f.removeClass("unused");
          var value = this.fixValue(e[item][key]);
          if (f.is("a")) {
            f.attr("href", value);
          } else {
            var currentHTML = f.html() || "";
            if (currentHTML.match("%")) {
              // "complex" template field
              f.html(currentHTML.replace("%", value));
            } else {
              // simple field
              f.html(value);
            }
          }
        }
      }
    
      var emptyFields = tpl.find("span .unused");
      emptyFields.each(function (key,f) {
        if (f.innerHTML.match("%")) {
          f.innerHTML = "";
        }
      });
    
      o.append(tpl);
      tpl.show();
    }
    
    old.remove();
  }


  this.displayBibtex = function(input, output, constraints) {
    // parse bibtex input - filter_type, filter_value

    // console.log(constraints);
    var b = new BibtexParser();
    b.setInput(input);
    b.bibtex();
    
    // save old entries to remove them later
    var old = output.find("*");    

    // iterate over bibTeX entries
    var entries = b.getEntries();
    var last_counter = 1;

    // console.log(entries);
    for (var entryKey in entries) {
      var entry = entries[entryKey];
      
      // find template
      // $(".years").innerHTML().append('hi');
      var tpl = $(".bibtex_template").clone().removeClass('bibtex_template');
      
      // find all keys in the entry
      var keys = [];
      for (var key in entry) {
        keys.push(key.toUpperCase());
      }
      
      // find all ifs and check them
      var removed = false;
      do {
        // find next if
        var conds = tpl.find(".if");
        if (conds.size() == 0) {
          break;
        }
        
        // check if
        var cond = conds.first();
        cond.removeClass("if");
        var ifTrue = true;
        var classList = cond.attr('class').split(' ');
        $.each( classList, function(index, cls){
          if(keys.indexOf(cls.toUpperCase()) < 0) {
            ifTrue = false;
          }
          cond.removeClass(cls);
        });
        
        // remove false ifs
        if (!ifTrue) {
          cond.remove();
        }
      } while (true);
      
      // fill in remaining fields 
      
      tpl.find("div.bibtexdata").attr('id', "bib"+entryKey.replace(/\:/g,""));
      //tpl.find("a.bibtex_but").attr('data-target', "#bib"+entryKey.replace(/\:/g,""));
      tpl.find("a.bibtex_but").attr('href', "#bib"+entryKey.replace(/\:/g,""));
      tpl.find("a.bibtex_but").attr('onclick', "mytoggle(\'bib"+entryKey.replace(/\:/g,"")+"\')");

      tpl.find("div.abstractdata").attr('id', "abs"+entryKey.replace(/\:/g,""));
      //tpl.find("a.abstract_but").attr('data-target', "#abs"+entryKey.replace(/\:/g,""));     
      tpl.find("a.abstract_but").attr('href', "#abs"+entryKey.replace(/\:/g,""));     
      tpl.find("a.abstract_but").attr('onclick', "mytoggle(\'abs"+entryKey.replace(/\:/g,"")+"\')");


      for (var index in keys) {
        var key = keys[index];
        var value = entry[key] || "";
        tpl.find("span:not(a)." + key.toLowerCase()).html(this.fixValue(value));
        tpl.find("button:not(a)." + key.toLowerCase()).attr('data-content', this.fixValue(value));
        // tpl.find("span:not(a).abstract").html(this.key);
        tpl.find("a." + key.toLowerCase()).attr('href', this.fixValue(value));
      }
      if (constraints == null) {

        output.append(tpl);

      } else {
        var approved = true;

        for (var constraint in constraints)  {
            var key = constraint;
            var value = constraints[constraint];
            if (key == 'YEAR'){
              if (entry['YEAR'] != value){
                approved=false;
              }
            }
            if (key == 'AUTHOR'){
                  var author_found =  false;
                  // alert(entry['AUTHOR']);
                 if (entry['AUTHOR'].indexOf("and") >-1) {
                        entry['AUTHOR'].split(' and ').forEach(function(item) { 
                          item = item.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          if (item.indexOf(value) > -1){
                            author_found = true;
                          }
                        });


                  } else {
                          item = entry['AUTHOR'].replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                          if (item.indexOf(value) > -1){
                            author_found = true;
                          }
                  }
                 // entry['AUTHOR'].split(' and ').forEach(function(item) { 
                 //  item = item.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                 //  item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                 //  if (item.indexOf(value) > -1){
                 //    author_found = true;
                 //  }
                  // if (item == value){
                      
                  // }
                // });
                 if (author_found == false){
                    approved=false;
                 }
            }

        }
        if (approved == true){
          // console.log(entry['AUTHOR']);
          if ( constraints['LAST'] != null ){
              if (last_counter <= constraints['LAST'] ){
                  output.append(tpl);
              }
              last_counter += 1;
          } else {
            output.append(tpl);
          }
        }

      }
      // if (filter_type != 'non'){
      //   if (filter_type == 'YEAR'){
      //     if (entry['YEAR'] == filter_value){
      //        output.append(tpl);
      //     }
      //   }
      //   if (filter_type == 'AUTHORS'){
      //         entry['AUTHOR'].split(' and ').forEach(function(item) { 
      //            item = item.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
      //            item = author_tex_reformat(item).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
      //           if (item.indexOf(filter_value) > -1){
      //              output.append(tpl);
      //           }
      //        });
      //   }
      // }
      // else {
      //    output.append(tpl);
      // }
      
      tpl.show();
    }
    
    // remove old entries
    old.remove();
  }
}

function bibtex_js_draw() {
  $(".bibtex_template").hide();
  (new BibtexDisplay()).displayBibtex($("#bibtex_input").val(), $("#bibtex_display"));
}

// check whether or not jquery is present
if (typeof jQuery == 'undefined') {  
  // an interesting idea is loading jquery here. this might be added
  // in the future.
  alert("Please include jquery in all pages using bibtex_js!");
} else {
  // draw bibtex when loaded
  $(document).ready(function () {
    // check for template, add default
    if ($(".bibtex_template").size() == 0) {
      $("body").append("<div class=\"bibtex_template\"><div class=\"if author\" style=\"font-weight: bold;\">\n  <span class=\"if year\">\n    <span class=\"year\"></span>, \n  </span>\n  <span class=\"author\"></span>\n  <span class=\"if url\" style=\"margin-left: 20px\">\n    <a class=\"url\" style=\"color:black; font-size:10px\">(view online)</a>\n  </span>\n</div>\n<div style=\"margin-left: 10px; margin-bottom:5px;\">\n  <span class=\"title\"></span>\n</div></div>");
    }

    bibtex_js_draw();
  });
}
