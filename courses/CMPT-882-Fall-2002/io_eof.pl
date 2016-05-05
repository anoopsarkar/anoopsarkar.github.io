%  Input routine based on Pereira & Shieber - Prolog and Natural 
%  Language Analysis

read_sent(Words) :-
  get0(Char),                 %prime lookahead
  read_sent(Char, Words), !.  %get words

% Period terminates input, as does question mark or end of file.
read_sent(C,[]) :- period(C),!.
read_sent(C,[]) :- q_mark(C),!.
read_sent(C,[]) :- e_mark(C),!.
read_sent(C,[end_of_file]) :- eof(C), !.

% Stuff is ignored.
read_sent(C,Words) :-
  ignore(C),!,
  get0(Char),
  read_sent(Char, Words).

read_sent(C,Words) :-
  65 =< C, C =< 90,
  !,
  Ch is C + 32,
  read_sent(Ch,Words).

read_sent(C, [Ch|Words]) :-
  dquote(C), !,
  name(Ch, [C]),
  get0(Char),
  read_sent(Char, Words).

% Everything else starts a word.
read_sent(Char, [Word|Words]) :-
  65 =< Char, Char =< 90,
  !,
  Ch is Char + 32,
  read_word(Ch, Chars, Next),    %get the word
  name(Word, Chars),               %pack the characters into an atom
  read_sent(Next, Words).          %get some more words

read_sent(Char, [Word|Words]) :-
  read_word(Char, Chars, Next),    %get the word
  name(Word, Chars),               %pack the characters into an atom
  read_sent(Next, Words).          %get some more words

% Certain stuff is to be ignored.
ignore(C) :- space(C).
ignore(C) :- newline(C).
ignore(C) :- newline2(C).
ignore(C) :- slash(C).
ignore(C) :- comma(C).
%ignore(C) :- underscore(C).
ignore(C) :- asterisk(C).
ignore(C) :- caret(C).
ignore(C) :- dquote(C).
ignore(C) :- squote1(C).
ignore(C) :- squote2(C).
ignore(C) :- squote3(C).
ignore(C) :- zero(C).

% Space, slash, underscore, period, question mark, and newline end a 
%word.
read_word(C,[],C) :- space(C),!.
read_word(C,[],C) :- newline(C),!.
read_word(C,[],C) :- newline2(C),!.
read_word(C,[],C) :- period(C),!.
read_word(C,[],C) :- comma(C),!.
read_word(C,[],C) :- q_mark(C),!.
read_word(C,[],C) :- e_mark(C),!.
read_word(C,[],C) :- dquote(C),!.
read_word(C,[],C) :- slash(C),!.
%read_word(C,[],C) :- underscore(C),!.

% All other chars are added to the list.

% Change upper-case to lower
read_word(Char, [NewChar|Chars], Last) :-
  65 =< Char, Char =< 90,
%  !,
  NewChar is Char + 32,
  get0(Next),
  read_word(Next, Chars, Last).

read_word(Char, [Char|Chars], Last) :- 
  get0(Next), 
  read_word(Next, Chars, Last).

space(32).
newline(10).
newline2('\n').
period(46).
comma(44).
q_mark(63).
e_mark(33).
dquote(34).
slash(47).
underscore(95).
asterisk(42).
caret(94).
hyphen(45).
squote1(39).
squote2(96).
squote3(180).
zero(48).
eof(-1).
