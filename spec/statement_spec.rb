# frozen_string_literal: true

require 'statement'

describe Statement do
  before(:each) do
    @credit_transaction = double(date: '11/01/2021', credit: 1000, debit: 0, balance: 1000)
    @debit_transaction = double(date: '11/01/2021', credit: 0, debit: 500, balance: 500)
    @transactions = double(list: [@credit_transaction, @debit_transaction])
    @statement = Statement.new
  end

  describe '#show_statement' do
    it 'prints the whole statement' do
      expect do
        @statement.show_statement(@transactions.list)
      end.to output("date || credit || debit || balance\n11/01/2021 || 0.00 || 500.00 || 500.00\n11/01/2021 || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end
end
