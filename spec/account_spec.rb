require 'rspec'
require_relative '../account.rb'

describe Account do
  let(:source) { Object.new }
  context 'logic tests' do
    it 'opened with zero plus zero value transaction' do
      account = Account.new(0)
      tx = Transaction.new(0, source)
      account.add_transaction(tx)
      expect(account.balance).to eq(0 + tx.value)
    end

    it 'zero plus positive transaction' do
      account = Account.new(0)
      tx = Transaction.new(1000, source)
      account.add_transaction(tx)
      expect(account.balance).to eq(0 + tx.value)
    end

    it 'balance after two deposits' do
      account = Account.new(0)
      tx1 = Transaction.new(1000, source)
      tx2 = Transaction.new(1000, source)
      account.add_transaction(tx1)
      account.add_transaction(tx2)
      expect(account.balance).to eq(tx1.value + tx2.value)
    end
  end

  context 'explicit values' do
    it 'opened with zero plus zero value transaction' do
      account = Account.new(0)
      tx = Transaction.new(0, source)
      account.add_transaction(tx)
      expect(account.balance).to eq(0)
    end

    it 'zero plus positive transaction' do
      account = Account.new(0)
      tx = Transaction.new(1000, Source.new('Internet Banking'))
      account.add_transaction(tx)
      expect(account.balance).to eq(1000)
    end

    it 'balance after two deposits is the sum of the values' do
      account = Account.new(0)
      tx1 = Transaction.new(1000, source)
      tx2 = Transaction.new(1000, source)
      account.add_transaction(tx1)
      account.add_transaction(tx2)
      expect(account.balance).to eq(2000)
    end
  end

  context 'collaboration' do
    # these are good collaboration tests because they will only fail if
    # account is bad ... not if Transaction is bad
    # tests should only have a single reason to fail
    # drawbacks: will be harder to refactor. Make sure that there is a good
    # reason for the abstraction that separates the collaborators
    # collaboration tests are only ok if we have a contract test of Transaction
    #
    # doubles don't care how transactions are created, so can add any number of parameters to transaction construction without affecting
    #
    it 'opened with zero plus zero value transaction' do
      account = Account.new(0)
      tx = double('transaction', value: 0)
      account.add_transaction(tx)
      expect(account.balance).to eq(0)
    end

    it 'zero plus positive transaction' do
      account = Account.new(0)
      tx = double('transaction', value: 1000)
      account.add_transaction(tx)
      expect(account.balance).to eq(1000)
    end

    it 'balance after two deposits is the sum of the values' do
      account = Account.new(0)
      tx1 = double('transaction', value: 1000)
      tx2 = double('transaction', value: 1000)
      account.add_transaction(tx1)
      account.add_transaction(tx2)
      expect(account.balance).to eq(2000)
    end
  end
end
