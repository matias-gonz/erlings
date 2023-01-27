-module(bank_account).

-export([process_operation/2]).

find_account(Bank, OperationAccount) ->
  try
    [{AccountNumber,AccountAmount}] = lists:filter(fun({Acc,_}) -> Acc =:= OperationAccount end, Bank) of
      _ -> {AccountNumber,AccountAmount}
  catch
    error:_ -> erlang:error(account_not_found)
  end.

update_amount(withdraw, AccountAmount, OperationAmount) when AccountAmount >= OperationAmount ->
  AccountAmount - OperationAmount;
update_amount(withdraw, _, _) ->
  erlang:error(insufficient_funds);
update_amount(deposit, AccountAmount, OperationAmount) ->
  AccountAmount + OperationAmount.

process_operation(Bank, {OperationAccount, Operation, OperationAmount}) ->
  try
    {AccountNumber,AccountAmount} = find_account(Bank, OperationAccount),
    NewAmount = update_amount(Operation,AccountAmount,OperationAmount) of
      _ -> {AccountNumber, NewAmount}
  catch
    error:account_not_found -> {error, account_not_found};
    error:insufficient_funds -> {error, insufficient_funds}
  end.