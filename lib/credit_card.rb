require './lib/person'

class CreditCard
  attr_reader :bank, :person, :limit, :interest, :balance

  def initialize(bank)
    @bank = bank
  end

  def open_credit(person, limit, interest)
    @person = person
    @limit = limit
    @interest = interest
    @balance = 0
  end

  def charge(person, amount)
    if amount > @limit
      "Transaction declined."
    else
      @balance += amount
    end
  end

  def pay_off(person, amount)
    if amount > person.cash
      "Insufficient cash!"
    else
      person.pay_off_credit_card(amount)
      @balance -= amount
    end
  end
end
