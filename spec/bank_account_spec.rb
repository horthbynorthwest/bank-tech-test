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
    it 'should respond respond with 1 argument' do
      expect(@bank_account).to respond_to(:deposit).with(1).argument
    end

    it 'should increase balance by number given' do
      expect { @bank_account.deposit(5) }.to change { @bank_account.balance }.by(5)
      expect(@bank_account.current_balance).to eq 'Your current balance is £5.00'
    end

    it 'raise error if trying to deposit a negative amount' do
      expect { @bank_account.deposit(-5) }.to raise_error 'Please deposit a positive amount'
    end
  end
end
