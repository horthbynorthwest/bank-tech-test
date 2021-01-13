# frozen_string_literal: true

require_relative 'bank_account'

class Statement

  def header
    puts 'date || credit || debit || balance'
  end

  def statement_content(list)
    list.reverse.each do |t|
      puts "#{t[:date]} || #{format(t[:credit])} || #{format(t[:debit])} || #{format(t[:balance])}"
    end
  end

  def print_statement(list)
    header
    statement_content(list)
  end

  private

  def format(num)
    '%.2f' % num
  end
end
