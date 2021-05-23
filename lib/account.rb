require './lib/person'

class Account
  attr_reader :person, :balance

  def initialize(person)
    @person = person
    @balance = 0
  end

  def deposit(person, amount)
    person.deposit(amount)
    @balance += amount
  end

  def withdraw(person, amount)
    person.withdraw(amount)
    @balance -= amount
  end

  def send_transfer(amount)
    @balance -= amount
  end

  def receive_transfer(amount)
    @balance += amount
  end
end