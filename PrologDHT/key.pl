:- module(key,[generate/1, btween/3]).

generate(Key) :-
	random_between(0, 1000000000, Key).
	
btween(Key, _, Key) :- !.
btween(_, Full, Full) :- !.
btween(Key, From, To) :-
	(From < To -> (Key > From, Key < To); (Key > From, ! ; Key < To)).
	