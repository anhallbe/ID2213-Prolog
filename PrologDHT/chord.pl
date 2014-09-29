use_module(library(random)).
use_module(library(lists)).
use_module(library(tipc/tipc_linda)).

init_node :-
	linda_client(global),
	run.
	
run :-
	print("Waiting for message..."),
	in(message(M)),
	chord(M),
	run.
	
chord(Message).

put(Value, Map, NKey, NMap) :-
	random_between(1, 1000000, NKey),
	NMap = [(NKey, Value)|Map].
	
get(Key, Map, Value) :-
	member((Key, Value), Map).