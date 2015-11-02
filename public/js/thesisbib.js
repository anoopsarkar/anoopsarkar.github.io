---
---
bibtex_reader = new BibtexDisplay();
constraints = {};
/// Add always constrains here like constrains['AUTHOR']='Anoop Sarkar'

//constraints['AUTHOR']='Anoop Sarkar';

function get_years(){
  years = bibtex_reader.get_years($("#bibtex_input").val(),constraints);
  // years = [{"year":"2014","value":"1"},{"year":"2013","value":"2"}]
  $.each(years, function (key, value) {
    $('.years').append('<a href="#year" class="years_btn button" year="'+key+'">'+key+'<span class="badge">'+value+'</span></a>');
  });
  $('.years_btn').click(function() {
              $(".bibtex_template").hide();
              //constraints['YEAR']=$(this).val();
              constraints['YEAR']=$(this).attr("year");
              (new BibtexDisplay()).displayBibtex($("#bibtex_input").val(), $("#bibtex_display"),constraints);
        });

  $('.allyears').click(function() {
    $(".bibtex_template").hide();
    delete constraints['YEAR'];
    (new BibtexDisplay()).displayBibtex($("#bibtex_input").val(), $("#bibtex_display"),constraints);
    });
}

function bibtex_js_draw() {
  year="all"
  $(".bibtex_template").hide();
  bibtex_reader.displayBibtex($("#bibtex_input").val(), $("#bibtex_display"),constraints);
}

function mytoggle(name){
    $("#"+name).toggle( "drop" );
    return false;
}

$(document).ready( function() {
  $(".bibtexdata").hide();
  $(".abstractdata").hide();
  $("#bibtex_input").load( "{{ site.baseurl }}/public/bibtex/theses.bib", bibtex_js_draw );  
  $("#bibtex_input").load( "{{ site.baseurl }}/public/bibtex/theses.bib", get_years );  
} );

