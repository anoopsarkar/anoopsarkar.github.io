function bibtex_js_draw() {
    bibtex_reader = new BibtexDisplay()
    constraints = {};
    constraints['LAST'] = 5;
    $(".bibtex_template").hide();
    bibtex_reader.displayBibtex($("#bibtex_input").val(), $("#bibtex_display"), constraints);
}

$(document).ready( function() {
  $(".bibtexdata").hide();
  $(".abstractdata").hide();
  $("#bibtex_input").load( "http://127.0.0.1:4000/public/bibtex/anoopsarkar.bib", bibtex_js_draw );  
} );
