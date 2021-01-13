# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  before(:each) do
    @statement_double = double :statement
    statement_class_double = double :statement_class, new: @statement_double
    @transaction_double = double :transaction
    transaction_class_double = double :transaction_class, new: @transaction_double
    @bank_account = BankAccount.new(0, statement_class_double, transaction_class_double)
    allow(@bank_account).to receive(:date) { '11/01/2021' }
  end

  it 'an instance can be made of account' do
    expect(@bank_account).to be_instance_of BankAccount
  end

  it 'should initialize with a balance of 0 as default' do
    expect(@bank_account.current_balance).to eq 'Your current balance is £0.00'
  end

  it 'should be able to initalize with a custom balance' do
    a = BankAccount.new(15)
    expect(a.current_balance).to eq 'Your current balance is £15.00'
  end

  describe '#deposit' do
    it 'should increase balance by number given' do
      expect { @bank_account.deposit(5) }.to change { @bank_account.balance }.by(5)
      expect(@bank_account.current_balance).to eq 'Your current balance is £5.00'
    end

    it 'raise error if trying to deposit a negative amount' do
      expect { @bank_account.deposit(-5) }.to raise_error 'Please enter a positive amount'
    end

    it 'puts an instance of transaction class into the transactions array' do
      allow(@bank_account).to receive(:create_credit_transaction) { @transaction_double }
      @bank_account.deposit(5)
      expect(@bank_account.transactions[0]).to eq @transaction_double
    end
  end

  describe '#withdraw' do
    before(:each) do
      @funded_account = BankAccount.new(15)
    end

    it 'should decrease balance by number given' do
      expect { @funded_account.withdraw(5) }.to change { @funded_account.balance }.by(-5)
      expect(@funded_account.current_balance).to eq 'Your current balance is £10.00'
    end

    it 'raise error if trying to withdraw a negative amount' do
      expect { @funded_account.withdraw(-5) }.to raise_error 'Please enter a positive amount'
    end

    it 'raises an error if trying to withdraw more than the balance' do
      expect { @funded_account.withdraw(20) }.to raise_error 'This will overdraw your account'
    end

    it 'puts an instance of transaction class into the transactions array' do
      allow(@bank_account).to receive(:create_debit_transaction) { @transaction_double }
      @bank_account.deposit(5)
      expect(@bank_account.transactions[0]).to eq @transaction_double
    end
  end

  describe '#show_statment' do
    it 'should print out date || credit || debit || balance as a blank statement' do
      msg = "date || credit || debit || balance\n"
      allow(@statement_double).to receive(:show_statement) { puts msg }
      expect { @bank_account.show_statement }.to output(msg).to_stdout
    end

    it 'should print out a deposit transaction' do
      msg = "date || credit || debit || balance\n11/01/2021 || 100.00 || 0.00 || 100.00\n"
      allow(@statement_double).to receive(:show_statement) { puts msg }
      @bank_account.deposit(100)

      expect { @bank_account.show_statement }.to output(msg).to_stdout
    end

    it 'should print put a withdraw transaction' do
      msg = "date || credit || debit || balance\n11/01/2021 || 0.00 || 50.00 || 50.00\n"

      allow(@statement_double).to receive(:show_statement) { puts msg }
      expect { @bank_account.show_statement }.to output(msg).to_stdout
    end

    it 'should print out both deposit & withdraw transactions' do
      msg = "date || credit || debit || balance\n11/01/2021 || 0.00 || 50.00 || 50.00\n11/01/2021 || 100.00 || 0.00 || 100.00\n"
      allow(@statement_double).to receive(:show_statement) { puts msg }
      expect { @bank_account.show_statement }.to output(msg).to_stdout
    end
  end
end
