class Person
  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

  def deposit(amount)
    @cash -= amount
  end

  def withdraw(amount)
    @cash += amount
  end
end