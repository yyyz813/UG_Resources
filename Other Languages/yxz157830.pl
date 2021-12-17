
%1
oddMultOf3(N) :- (
                 not(integer(N))      % Check if the input is a integer or not.
                 ->
                 write('ERROR, the given parameter is not an integer.')    % if not, then print error
                 ;   %else 
                 0 is N mod 3 , !, 1 is N mod 2   %Check if the input can be divided by 3 and is odd or not.
                 ).
                 
%2
list_prod(list,integer).
list_prod([],0).    % empty list
list_prod([H],H). % list with single element 
list_prod([H|T], Product) :- list_prod(T, Rest), Product is Rest * H.    % multiply the element.
  
%3
segregate([],[],[]).  % if the input list is empty then predicate return empty
segregate(List,Even,Odd) :-
                            [X|Xs]=List,        %Check the number is odd or even, and put it to the correspond list.
                            0 is X mod 2,(Even=[X|Even1],
                            segregate(Xs,Even1,Odd)).
segregate(List,Even,Odd) :-
                            [X|Xs]=List,
                            1 is X mod 2,(Odd=[X|Odd1],
                            segregate(Xs,Even,Odd1)).
                          
 
%4
path(fresno,seattle).       % define path for each line from graph.
path(fresno,albany).
path(fresno,boston).
path(seattle,omaha).
path(seattle,dallas).
path(omaha,albany).
path(omaha,atlanta).
path(albany,seattle).
path(albany,dallas).
path(atlanta,boston).
path(atlanta,dallas).
path(atlanta,albany).
path(dallas,seattle).
path(dallas,albany).

route(A,B,Route) :- direction(A,B,[A],Q), reverse(Q,Route).   % take two cities as its argument
direction(A,B,P,[B|P]) :- path(A,B).                          % find routes from city A to B
direction(A,B,Visited,Route) :- path(A,C), C \== B, \+member(C,Visited), direction(C,B,[C|Visited],Route).   



%5
male(adam).    % define knoeledge base
male(bob).
male(brett).
male(charles).
male(chris).
male(clay).
female(ava).
female(barbara).
female(betty).
female(colette).
female(carrie).
parent(adam,bob).
parent(adam,barbara).
parent(ava,bob).
parent(ava,barbara).
parent(bob,clay).
parent(barbara,colette).

parents(X,Y):-     %logic implement
parent(X,Y).

mother(X,Y):-
parents(X,Y),
female(X).

father(X,Y):-
parents(X,Y),
male(X).

child(X,Y):-
parents(X,Y).

grandparent(X,Y):-
parents(Z,Y),
parents(X,Z).

grandfather(X,Y):-
male(X),
parents(Z,Y),
parents(X,Z).

grandmother(X,Y):-
parents(Z,Y),
parents(X,Z),
female(X).

grandchild(X,Y):-
parents(Y,Z),
parents(Z,X).

grandson(X,Y):-
parents(Y,Z),
parents(Z,X),
male(X).

granddaughter(X,Y):-
parents(Y,Z),
parents(Z,X),
female(X).

sibling(X,Y):-
parents(Z,X),
parents(Z,Y),
not(X=Y).