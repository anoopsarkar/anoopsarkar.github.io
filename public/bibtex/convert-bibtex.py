import bibtexparser, json
from bibtexparser.bparser import BibTexParser
from bibtexparser.customization import convert_to_unicode
from bibtexparser.bwriter import BibTexWriter
from bibtexparser.bibdatabase import BibDatabase

def add_raw_bibtex(contents):
    parser = BibTexParser()
    bib = bibtexparser.loads(contents, parser=parser)
    writer = BibTexWriter()
    for i in bib.entries:
        print writer.write(i)

def convert_bibtex(contents):
    parser = BibTexParser()
    parser.customization = convert_to_unicode
    bib = bibtexparser.loads(contents, parser=parser)
    return json.dumps(bib.entries, sort_keys=True, indent=4)

if __name__ == '__main__':
    import sys
    contents = ''
    if len(sys.argv) > 1:
        with open(sys.argv[1]) as f: contents = f.read()
    else:
        contents = sys.stdin.read()
    print convert_bibtex(contents)
