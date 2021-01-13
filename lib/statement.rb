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
      puts "#{t[:date]} || #{format(t[:credit])} || #{format(t[:debit])} || #{format(t[:balance])}"
    end
  end

  def print_statement
    header
    statement_content
  end

  private

  def format(num)
    '%.2f' % num
  end
end
