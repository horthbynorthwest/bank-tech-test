# frozen_string_literal: true

require 'transaction'

describe Transaction do
  before(:each) do
    @deposit_transaction = Transaction.new(date: '11/01/2021', credit: 1000, debit: 0, balance: 1000)
    @withdraw_transaction = Transaction.new(date: '11/01/2021', credit: 0, debit: 500, balance: 500)
  end

  it "should know the transaction's a date" do
    expect(@deposit_transaction.date).to eq '11/01/2021'
    expect(@withdraw_transaction.date).to eq '11/01/2021'
  end

  it "should know the transaction's credit amount" do
    expect(@deposit_transaction.credit).to eq 1000
    expect(@withdraw_transaction.credit).to eq 0
  end

  it "should know the transaction's debit amount" do
    expect(@deposit_transaction.debit).to eq 0
    expect(@withdraw_transaction.debit).to eq 500
  end

  it "should know the transaction's balace amount" do
    expect(@deposit_transaction.balance).to eq 1000
    expect(@withdraw_transaction.balance).to eq 500
  end
end
