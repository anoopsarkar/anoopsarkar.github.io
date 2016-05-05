
from nltk.tokenizer import *
from nltk.draw.rdparser import RecursiveDescentParserDemo

def regexp():
    """
    Demo regexp grammar
    """
    from nltk.cfg import Nonterminal, CFGProduction, CFG
    nonterminals = 'NP NP1 N AND'
    (NP, NP1, N, AND) = [Nonterminal(s) for s in nonterminals.split()]
    productions = (
        CFGProduction(NP, N, NP1),
        CFGProduction(NP1, AND, NP, NP1),
        CFGProduction(NP1),

        CFGProduction(N, 'cabbages'),
        CFGProduction(AND, 'and'),
        CFGProduction(N, 'kings'),
        )
    grammar = CFG(NP, productions)

    sent = 'cabbages and kings'
    text = WSTokenizer().tokenize(sent)

    RecursiveDescentParserDemo(grammar, text).mainloop()

    
if __name__ == '__main__': regexp()

