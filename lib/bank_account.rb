# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(num)
    is_positive?(num)
    @balance += num
    @transactions << { date: (Time.now - 86400).strftime("%d/%m/%Y"), credit: num, debit: 0, balance: @balance }
  end

  def withdraw(num)
    is_positive?(num)
    is_overdrawn?(num)
    @balance -= num
    @transactions << { date: Time.now.strftime("%d/%m/%Y"), credit: 0, debit: num, balance: @balance }
  end

  def current_balance
    "Your current balance is £#{format('%.2f', @balance)}"
  end

  def print_statment
    puts 'date || credit || debit || balance'
    @transactions.reverse.each do |t|
      puts "#{t[:date]} || #{'%.2f' % t[:credit]} || #{'%.2f' % t[:debit]} || #{'%.2f' % t[:balance]}"
    end
  end

  private

  def is_positive?(num)
    fail 'Please enter a positive amount' if num.negative?
  end

  def is_overdrawn?(num)
    fail 'This will overdraw your account' if (@balance - num).negative?
  end
end
