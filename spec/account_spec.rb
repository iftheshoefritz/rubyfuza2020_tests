require 'rspec'
require_relative '../account.rb'

describe Account do
  context 'logic tests' do
    it 'opened with zero plus zero value transaction' do
      account = Account.new(0)
      tx = Transaction.new(0)
      account.add_transaction(tx)
      expect(account.balance).to eq(0 + tx.value)
    end

    it 'zero plus positive transaction' do
      account = Account.new(0)
      tx = Transaction.new(1000)
      account.add_transaction(tx)
      expect(account.balance).to eq(0 + tx.value)
    end

    it 'balance after two deposits' do
      account = Account.new(0)
      tx1 = Transaction.new(1000)
      tx2 = Transaction.new(1000)
      account.add_transaction(tx1)
      account.add_transaction(tx2)
      expect(account.balance).to eq(tx1.value + tx2.value)
    end
  end

  context 'explicit values' do
    it 'opened with zero plus zero value transaction' do
      account = Account.new(0)
      tx = Transaction.new(0)
      account.add_transaction(tx)
      expect(account.balance).to eq(0)
    end

    it 'zero plus positive transaction' do
      account = Account.new(0)
      tx = Transaction.new(1000)
      account.add_transaction(tx)
      expect(account.balance).to eq(1000)
    end

    it 'balance after two deposits is the sum of the values' do
      account = Account.new(0)
      tx1 = Transaction.new(1000)
      tx2 = Transaction.new(1000)
      account.add_transaction(tx1)
      account.add_transaction(tx2)
      expect(account.balance).to eq(2000)
    end
  end

  context 'mocking' do
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
