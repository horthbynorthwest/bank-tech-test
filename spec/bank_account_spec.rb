# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  before(:each) do
    @bank_account = BankAccount.new
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
    it 'should respond with 1 argument' do
      expect(@bank_account).to respond_to(:deposit).with(1).argument
    end

    it 'should increase balance by number given' do
      expect { @bank_account.deposit(5) }.to change { @bank_account.balance }.by(5)
      expect(@bank_account.current_balance).to eq 'Your current balance is £5.00'
    end

    it 'raise error if trying to deposit a negative amount' do
      expect { @bank_account.deposit(-5) }.to raise_error 'Please enter a positive amount'
    end
  end

  describe '#withdraw' do
    before(:each) do
      @funded_account = BankAccount.new(15)
    end
    it 'should respond with 1 argument' do
      expect(@bank_account).to respond_to(:withdraw).with(1).argument
    end

    it 'should decrease balance by number given' do
      expect { @funded_account.withdraw(5) }.to change { @funded_account.balance }.by(-5)
      expect(@funded_account.current_balance).to eq 'Your current balance is £10.00'
    end

    it 'raise error if trying to withdraw a negative amount' do
      expect { @funded_account.withdraw(-5) }.to raise_error 'Please enter a positive amount'
    end
  end

  describe '#print_statment' do
    it 'should print out date || credit || debit || balance as a blank statement' do
      expect { @bank_account.print_statment }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'should print out a deposit transaction' do
      @bank_account.deposit(100)
      expect(@bank_account.current_balance).to eq 'Your current balance is £100.00'
      expect { @bank_account.print_statment }.to output("date || credit || debit || balance\n10/01/2021 || 100.00 || 0.00 || 100.00\n").to_stdout
    end

    it 'should print put a withdraw transaction' do
      a = BankAccount.new(100)
      a.withdraw(50)
      expect { a.print_statment }.to output("date || credit || debit || balance\n11/01/2021 || 0.00 || 50.00 || 50.00\n").to_stdout
    end

    it 'should print out both deposit & withdraw transactions' do
      @bank_account.deposit(100)
      @bank_account.withdraw(50)
      expect { @bank_account.print_statment }.to output("date || credit || debit || balance\n11/01/2021 || 0.00 || 50.00 || 50.00\n10/01/2021 || 100.00 || 0.00 || 100.00\n").to_stdout
    end
  end
end
