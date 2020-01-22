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
  attr_reader :value

  # at each stage, demonstrate that the code is broken in the console
  # (or in a slide)
  # then show what happens with the tests
  def initialize(value)
    @value = 0
  end
end
