# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end
end
