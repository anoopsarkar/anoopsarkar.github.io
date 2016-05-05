
from nltk.draw.chart import *

def test():
    nonterminals = 'S VP NP PP P N Name V Det'
    (S, VP, NP, PP, P, N, Name, V, Det) = [Nonterminal(s)
                                           for s in nonterminals.split()]
    
    grammar_rules1 = [
        CFGProduction(NP, Det, N), CFGProduction(NP, NP, PP),
        CFGProduction(NP, 'John'), #CFGProduction(NP, 'I'), 
        CFGProduction(Det, 'the'), #CFGProduction(Det, 'my'),
        #CFGProduction(N, 'dog'),
        CFGProduction(N, 'cookie'),
        CFGProduction(N, 'table'),

        CFGProduction(VP, VP, PP), CFGProduction(VP, V, NP),
        CFGProduction(VP, V),

        CFGProduction(V, 'ate'),  #CFGProduction(V, 'saw'),

        CFGProduction(S, NP, VP),  CFGProduction(PP, P, NP),
        CFGProduction(P, 'on'), #CFGProduction(P, 'under')
        ]

    grammar = CFG(S, grammar_rules1)
    #sent = 'John ate the cookie on the table'
    sent = 'John ate on the table'
    tok_sent = WSTokenizer().tokenize(sent)

    print 'grammar= ('
    for rule in grammar.productions():
        print '    ', repr(rule)+','
    print ')'
    print 'sentence = %r' % sent
    print 'Calling "ChartDemo(grammar, tok_sent)"...'
    ChartDemo(grammar, tok_sent)

test()

