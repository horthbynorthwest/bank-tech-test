# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(num)
    pos_deposit(num)
    @balance += num
  end

  def current_balance
    "Your current balance is £#{format('%.2f', @balance)}"
  end

  private

  def pos_deposit(num)
    fail 'Please deposit a positive amount' if num < 0
  end
end
