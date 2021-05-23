class CreditCard
  attr_reader :bank, :person

  def initialize(bank)
    @bank = bank
  end

  def open_credit(person, limit, interest)
    @person = person
    @limit = limit
    @interest = interest
  end
end
