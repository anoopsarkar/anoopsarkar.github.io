# gem install bibtex-ruby
# gem install citeproc XXX
# gem install latex-decode XXX
require 'bibtex'
#require 'citeproc'
require 'yaml'
#require 'latex/decode'
b = BibTeX.open('publications.bib')
#puts b['@inproceedings'].length
#b.each do |p|
#    CiteProc.process p.to_citeproc, :style => :apa
#end
puts b.to_yaml
