require './lib/account'

class Bank
  attr_reader :name, :account, :all_accounts

  def initialize(name)
    @name = name
    @all_accounts = []
  end

  def open_account(person)
    @all_accounts << Account.new(person)
    @account = @all_accounts.last
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

  def all_funds
    total_cash = 0
    @all_accounts.each { |account| total_cash += account.balance }

    total_cash
  end
end
