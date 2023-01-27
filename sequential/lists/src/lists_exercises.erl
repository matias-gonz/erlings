-module(lists_exercises).

-export([reverse/1,
         rmconsecutive/1,
         even_fib_numbers/0,
         foldl/3,
         foldl/2,
         rotate/2,
         run_length_encode/1,
         list_any/1,
         anagram/2,
         last_letter/1]).

reverse(List) ->
  reverse(List, []).

reverse([], NewList) ->
  NewList;
reverse([Head|Tail], NewList) ->
  reverse(Tail, [Head | NewList]).

rmconsecutive(List) ->
  rmconsecutive(List, [], none).

rmconsecutive([], NewList, _) ->
  reverse(NewList);
rmconsecutive([H|T], NewList, H) ->
  rmconsecutive(T, NewList, H);
rmconsecutive([H|T], NewList, _) ->
  rmconsecutive(T, [H|NewList], H).

even_fib_numbers() ->
  even_fib_numbers(1, 2, 0).

even_fib_numbers(_, B, Sum) when B >= 4000000 ->
  Sum;
even_fib_numbers(A, B, Sum) when B rem 2 =:= 0 ->
  even_fib_numbers(B, A+B, Sum+B);
even_fib_numbers(A, B, Sum) ->
  even_fib_numbers(B, A+B, Sum).


foldl(_, Acc, []) ->
  Acc;
foldl(Fun, Acc, [H|T]) ->
  foldl(Fun, Fun(Acc, H), T).

foldl(_, List) when length(List) < 2 ->
  undefined;
foldl(Fun, [A, B | T]) ->
  foldl(Fun, A, [B|T]).

rotate(List, {_, 0}) ->
  List;
rotate([H|T], {left, N}) ->
  L = [H | reverse(T)],
  rotate(reverse(L), {left, N-1});
rotate([H|T], {right, N}) ->
  [Last|TailLast] = reverse([H|T]),
  rotate([Last | reverse(TailLast)], {right, N-1}).


run_length_encode(List) ->
  put_your_solution_here.

list_any(N) ->
  put_your_solution_here.

anagram(List, S) -> 
  put_your_solution_here.

last_letter(List) ->
  put_your_solution_here.
