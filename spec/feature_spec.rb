# frozen_string_literal: true

require 'bank_account'
require 'statement'

describe 'example transaction' do
  it 'programme displays statement correctly' do
    @bank_account = BankAccount.new
    allow(@bank_account).to receive(:date) { '11/01/2021' }
    @bank_account.deposit(1000)
    @bank_account.deposit(2000)
    @bank_account.withdraw(500)
    msg = "date || credit || debit || balance\n11/01/2021 || 0.00 || 500.00 || 2500.00\n11/01/2021 || 2000.00 || 0.00 || 3000.00\n11/01/2021 || 1000.00 || 0.00 || 1000.00\n"
    expect { @bank_account.print_statement }.to output(msg).to_stdout
  end
end
