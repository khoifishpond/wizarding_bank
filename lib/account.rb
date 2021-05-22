class Account
  attr_reader :person, :balance

  def initialize(person)
    @person = person
    @balance = 0
  end
end