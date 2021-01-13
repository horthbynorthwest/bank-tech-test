require 'transaction'

describe Transaction do
  before(:each) do
    @deposit_transaction = Transaction.new(date: '11/01/2021', credit: 1000, debit: 0, balance: 1000)
    @withdraw_transaction = Transaction.new(date: '11/01/2021', credit: 0, debit: 500, balance: 500)
  end

  it 'should initalize with a date' do
    expect(@deposit_transaction.date).to eq '11/01/2021'
    expect(@withdraw_transaction.date).to eq '11/01/2021'
  end
end