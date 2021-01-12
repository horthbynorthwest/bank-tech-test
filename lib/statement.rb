# frozen_string_literal: true

require_relative 'bank_account'

class Statement
  def initialize(list)
    @list = list
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def statement_content
    @list.reverse.each do |t|
      puts "#{t[:date]} || #{'%.2f' % t[:credit]} || #{'%.2f' % t[:debit]} || #{'%.2f' % t[:balance]}"
    end
  end

  def print_statement
    header
    statement_content
  end
end
