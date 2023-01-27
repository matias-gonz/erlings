-module(filter_fibonacci_numbers).

-export([filter/1]).

is_perfect_square(X) ->
  trunc(math:sqrt(X)) == math:sqrt(X).

is_fibonacci_number(X) ->
  is_perfect_square(5 * math:pow(X,2) + 4) or is_perfect_square(5 * math:pow(X,2) - 4).

filter(List) ->
  [X || X <- List, is_fibonacci_number(X)].
