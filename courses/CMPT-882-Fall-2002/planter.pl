%PLANTER--Created by Julia Birke for Cmpt 882 HW1 for Sept.9, 2002

:- consult(library(lists)).
:- consult(io_eof).

%Takes parameter for concordance word (with tag), 
%and number of words in context (either side)

planter(Word,Num) :- 
	see('nanc_nyt98_plant_sents.txt'),
	read_file(Word,Num),
	seen,
	nl.
	
read_file(Word,Num) :- 
	repeat,
	read_sent(Sentence),
	tell('plantout.txt'),
	cooc_out(Sentence,Word,Num),
	told.
	
cooc_out([end_of_file],_,_).

cooc_out(Sentence,Word,Num) :-
	nth(N,Sentence,Word),
	nl,
	(N==1;print_pre(N,Sentence,Num)),
	writeln2(['\t\t ',Word,' \t']),!,
	print_post(N,Sentence,Num),!,
	fail.
	
%Print context preceeding concordance word

print_pre(N,Sentence,Num) :-
	M1 is N-Num,
	((M1 >= 1,M is M1);M is 1),
	print_list(Sentence,M,N).
	
%Print context following concordance word
	
print_post(N,Sentence,Num) :-
	length(Sentence,L),
	NewN is N+1,
	NewN =< L,
	O1 is NewN+Num,
	((O1 =< L,O is O1);O is L),
	print_list(Sentence,NewN,O).
	
%Prints list of words
	
print_list(Sentence,N,N).

print_list(Sentence,M,N) :-
	nth(M,Sentence,Word),
	writeln2(Word),
	NewM is M+1,!,
	print_list(Sentence,NewM,N).
	
%writeln2(L) writes each element of list L 
%(previously adapted from some library function)

writeln2([]) :- write(''). 
writeln2([H|T]) :- writeln2(H), write(' '), writeln2(T).
writeln2([H|T]) :- write(H), write(' '), writeln2(T).
writeln2(S) :- write(S), write(' ').
