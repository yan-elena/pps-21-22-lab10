%---- Part1 -----

%==== Ex 1.1 ====
% search(Elem , List)

search(X, [X|_]) .
search(X, [_| Xs]) :- search(X, Xs) .

%==== Ex 1.2 ====
% search2(Elem, List)
% looks for two consecutive occurrences of Elem

search2(X, [X, X|_]) .
search2(X, [_|Xs]) :- search2(X, Xs) .

%==== Ex 1.3 ====
% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between !

search_two(X, [X,_|T]) :- search(X, T) .
search_two(X, [_|Xs]) :- search_two(X, Xs) .

%==== Ex 1.4 ====
% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere

search_anytwo(X, [X|T]) :- search(X, T) .
search_anytwo(X, [_|Xs]) :- search_anytwo(X, Xs) .


%---- Part2 ----

%==== Ex 2.1 ====
% size(List, Size)
% Size will contain the number of elements in List

size([], 0) .
size([_|Xs], N) :- size(Xs, N2), N is N2 + 1.

%==== Ex 2.2 ====
% size (List, Size)
% Size will contain the number of elements in List ,
% written using notation zero , s( zero ), s(s( zero ))..

size_2([], zero) .
size_2([_|Xs], s(N)) :- size_2(Xs, N) .

%==== Ex 2.3 ====
% sum(List, Sum)

sum([], 0) .
sum([H|Xs], S) :- sum(Xs, S2), S is S2 + H  .


%==== Ex 2.4 ====
% average(List, Average)
% it uses average(List, Count, Sum, Average)

average(List, A) :- average(List, 0, 0, A) .
average([], C, S, A) :- A is S / C .
average([X|Xs], C, S, A) :- 
	C2 is C + 1, 
	S2 is S + X, 
	average(Xs, C2, S2, A).

%==== Ex 2.5 ====
% max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element

max([H|T], M) :- max(T, M, H) .
max([], M, M) .
max([H|T], M, TM) :- H >= TM, max(T, M, H) .
max([H|T], M, TM) :- H < TM, max(T, M, TM) .

%==== Ex 2.6 ====
% max(List, Max, Min)
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element

maxmin([H|T], Max, Min) :- maxmin([H|T], Max, Min, H, H) .
maxmin([], Max, Min, Max, Min) .
maxmin([H|T], Max, Min, TMax, TMin) :- H =< TMax, H > TMin , maxmin(T, Max, Min, TMax, TMin) .
maxmin([H|T], Max, Min, TMax, TMin) :- H >= TMax, maxmin(T, Max, Min, H, TMax) .
maxmin([H|T], Max, Min, TMax, TMin) :- H < TMin, maxmin(T, Max, Min, TMax, H) .


%---- Part3 ----

%==== Ex 3.1 ====
% same(List1, List2)
% are the two lists exactly the same ?

same([], []) .
same([X|Xs], [X|Ys]) :- same(Xs, Ys).

%==== Ex 3.2 ====
% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10, 20, 30, 40], [9, 19, 29, 39]) .

all_bigger([], []) .
all_bigger([X|Xs], [Y|Ys]) :- X > Y, all_bigger(Xs, Ys) .

%==== Ex 3.3 ====
% sublist(List1, List2)
% List1 should contain elements all also in List2
% example: sublist([1, 2], [5, 3, 2, 1]).

sublist([], _) .
sublist([X|Xs], Y) :- member(X, Y), sublist(Xs, Y) .


%---- Part4 ----

%==== Ex 4.1 ====
% seq(N, List )
% example : seq(5, [0, 0, 0, 0, 0]).

seq(0, []).
seq(N, [0|T]) :- N2 is N - 1, seq(N2, T) .

%==== Ex 4.2 ====
% seqR(N, List )
% example: seqR(4 ,[4 ,3 ,2 ,1 ,0]).

seqR(0, [0]) .
seqR(N, [N|T]) :- N2 is N - 1, seqR(N2, T) .

%==== Ex 4.2 ====
% seqR2(N, List )
% example : seqR2(4 ,[0 ,1 ,2 ,3 ,4]).

addLast([], X, [X]) .
addLast([H|T], X, [H|L]) :- addLast(T, X, L) .

seqR2(0, [0]) .
seqR2(N, L) :- addLast(L2, N, L), N2 is N-1, seqR2(N2, L2) .


% ---- Part5 ----

%==== Last ====
% last(List, E) 
% select the last element in this list
% example: last([1,2,3], 3).

last([X], X) .
last([_|T], X) :- last(T, X) .

%==== Drop ====
% drop(List1, N, List2) 
% selects all elements except first N ones
% example: drop([1,2,3,4], 2, [3,4]).

drop(L, 0, L) .
drop([H|T], N, L) :- N > 0, N2 is N - 1, drop(T, N2, L) .

%==== Take ====
% take(List1, N, List2) 
% selects first N elements
% example: take([1,2,3,4], 2, [1,2]).

take(L, 0, []) .
take([H|T], N, [H|L]) :- N > 0, N2 is N - 1, take(T, N2, L) .
