# frozen_string_literal: true

require_relative 'statement'

class BankAccount
  attr_reader :balance

  def initialize(balance = 0, statement = Statement)
    @balance = balance
    @transactions = []
    @statement = statement
  end

  def deposit(num)
    positive?(num)
    change_balance('credit', num)
    @transactions << { date: date, credit: num, debit: 0, balance: @balance }
  end

  def withdraw(num)
    positive?(num)
    overdrawn?(num)
    change_balance('debit', num)
    @transactions << { date: date, credit: 0, debit: num, balance: @balance }
  end

  def current_balance
    "Your current balance is £#{format(@balance)}"
  end

  def print_statement
    print = @statement.new
    print.print_statement(@transactions)
  end

  private

  def change_balance(type_of_transaction, num)
    type_of_transaction == 'credit' ? @balance += num : @balance -= num
  end

  def format(num)
    '%.2f' % num
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def positive?(num)
    raise 'Please enter a positive amount' if num.negative?
  end

  def overdrawn?(num)
    raise 'This will overdraw your account' if (@balance - num).negative?
  end
end
