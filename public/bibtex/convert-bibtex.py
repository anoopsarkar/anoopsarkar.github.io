import bibtexparser, json

def convert_bibtex(contents):
    bib = bibtexparser.loads(contents)
    return json.dumps(bib.entries, sort_keys=True, indent=4)

if __name__ == '__main__':
    import sys
    contents = ''
    if len(sys.argv) > 1:
        with open(sys.argv[1]) as f: contents = f.read()
    else:
        contents = sys.stdin.read()
    print convert_bibtex(contents)
