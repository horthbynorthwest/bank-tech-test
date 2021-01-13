# frozen_string_literal: true

require_relative 'statement'

class BankAccount
  attr_reader :balance

  def initialize(balance = 0, statement = Statement, transaction = Transaction)
    @balance = balance
    @transactions = []
    @statement = statement
    @transaction = transaction
  end

  def deposit(num)
    positive?(num)
    change_balance('credit', num)
    @transactions << create_debit_transaction(num, date)
  end

  def withdraw(num)
    positive?(num)
    overdrawn?(num)
    change_balance('debit', num)
    @transactions << create_credit_transaction(num, date)
  end

  def current_balance
    "Your current balance is £#{format(@balance)}"
  end

  def show_statement
    print = @statement.new
    print.show_statement(@transactions)
  end

  private

  def create_debit_transaction(num, date)
    @transaction.new(date: date, credit: num, debit: 0, balance: @balance)
  end

  def create_credit_transaction(num, date)
    @transaction.new(date: date, credit: 0, debit: num, balance: @balance)
  end

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
