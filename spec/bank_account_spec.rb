# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  it 'an instance can be made of account' do
    expect(subject).to be_instance_of BankAccount
  end

  it 'should initialize with a balance of 0 as default' do
    expect(subject.balance).to eq 0
  end

  it 'should be able to initalize with a custom balance' do
    a = BankAccount.new(15)
    expect(a.balance).to eq 15
  end
end
