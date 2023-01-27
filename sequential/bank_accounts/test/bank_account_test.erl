-module(bank_account_test).

-include_lib("eunit/include/eunit.hrl").

process_operation_withdraw_ok_test() ->
  Bank = [{213, 150}, {214, 0}],
  Op = {213, withdraw, 50},
  Res = {213, 100},
  ?assertEqual(Res, bank_account:process_operation(Bank, Op)).

process_operation_deposit_ok_test() ->
  Bank = [{213, 150}, {214, 0}],
  Op = {214, deposit, 50},
  Res = {214, 50},
  ?assertEqual(Res, bank_account:process_operation(Bank, Op)).

process_operation_not_found_test() ->
  Bank = [{214, 0}],
  Op = {213, deposit, 20},
  Res = {error, account_not_found},
  ?assertEqual(Res, bank_account:process_operation(Bank, Op)).

process_operation_insufficient_funds_test() ->
  Bank = [{213, 150}, {214, 0}],
  Op = {213, withdraw, 200},
  Res = {error, insufficient_funds},
  ?assertEqual(Res, bank_account:process_operation(Bank, Op)).
