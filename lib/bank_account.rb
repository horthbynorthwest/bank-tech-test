# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(num)
    is_positive?(num)
    @balance += num
  end

  def withdraw(num)
    is_positive?(num)
    @balance -= num
  end

  def current_balance
    "Your current balance is £#{format('%.2f', @balance)}"
  end

  private

  def is_positive?(num)
    fail 'Please enter a positive amount' if num.negative?
  end
end
