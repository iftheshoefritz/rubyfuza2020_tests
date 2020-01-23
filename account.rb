class Account
  def initialize(opening_balance)
    @balance = opening_balance
    @transactions = []
  end

  def add_transaction(tx)
    @transactions << tx
  end

  def balance
    @transactions.map(&:value).inject(:+)
  end
end

class Transaction
  attr_reader :value, :source

  # at each stage, demonstrate that the code is broken in the console
  # (or in a slide)
  # then show what happens with the tests
  # extra params in constructor are the less hidden equivalent of required validations
  def initialize(value, source)
    @value = value
    @source = source
  end
end

class Source
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
