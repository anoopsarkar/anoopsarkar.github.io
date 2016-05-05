
from nltk_lite import tokenize
from nltk_lite.parse import cfg
from nltk_lite.draw.rdparser import RecursiveDescentDemo

productions = """
NP -> N NP1
NP1 -> AND NP NP1
NP1 ->
N -> "cabbages"
N -> "kings"
AND -> "and"
"""
grammar = cfg.parse_grammar(productions)
text = list(tokenize.whitespace('cabbages and kings'))
RecursiveDescentDemo(grammar, text).mainloop()

