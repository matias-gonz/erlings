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
  put_your_solution_here.

even_fib_numbers() ->
  put_your_solution_here.

foldl(Fun, Acc, List) ->
  put_your_solution_here.

foldl(Fun, List) ->
  put_your_solution_here.

rotate(List, Tuple) ->
  put_your_solution_here.

run_length_encode(List) ->
  put_your_solution_here.

list_any(N) ->
  put_your_solution_here.

anagram(List, S) -> 
  put_your_solution_here.

last_letter(List) ->
  put_your_solution_here.
