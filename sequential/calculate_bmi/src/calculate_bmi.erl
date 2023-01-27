-module(calculate_bmi).

-export([bmi/1, classify/1]).

-include("../src/person_record.hrl").

bmi(Person) ->
  Person#person.weight / (math:pow(Person#person.height, 2)).

get_classification(BMI) when BMI < 18.4 ->
  underweight;
get_classification(BMI) when BMI < 24.9 ->
  normal;
get_classification(BMI) when BMI < 29.9 ->
  overweight;
get_classification(_) ->
  obese.

classify(Person) ->
  get_classification(bmi(Person)).
