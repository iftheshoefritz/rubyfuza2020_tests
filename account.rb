class Account
  attr_reader :balance
  def initialize(opening_balance)
    @balance = opening_balance
  end

  def add_transaction(tx)
    @balance += tx.value
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
