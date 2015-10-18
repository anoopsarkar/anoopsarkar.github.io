---
---
bibtex_reader = new BibtexDisplay()
constraints = {};
constraints['LAST'] = 5;

function bibtex_js_draw() {
    $(".bibtex_template").hide();
    bibtex_reader.displayBibtex($("#bibtex_input").val(), $("#bibtex_display"), constraints);
}

function mytoggle(name){
    //this.parent.parent.$(".bibtexdata").first()
    // alert(item);
    $("#"+name).toggle( "drop" );
}

$(document).ready( function() {
  $(".bibtexdata").hide();
  $(".abstractdata").hide();
  $("#bibtex_input").load( "{{ site.baseurl }}public/bibtex/anoopsarkar.bib", bibtex_js_draw );  
} );
