require './lib/account'

class Bank
  attr_reader :name, :account

  def initialize(name)
    @name = name
  end

  def open_account(person)
    @account = Account.new(person)
  end

  def deposit(person, amount)
    if amount > person.cash
      "Insufficient cash!"
    else
      @account.deposit(person, amount)
    end
  end

  def withdraw(person, amount)
    if amount > @account.balance
      "Insufficient funds!"
    else
      @account.withdraw(person, amount)
    end
  end

  def transfer(person, bank, amount)
    if bank.account.nil?
      "#{person.name} does not have an account with #{bank.name}."
    else
      @account.send_transfer(amount)
      bank.account.receive_transfer(amount)
    end
  end
end
