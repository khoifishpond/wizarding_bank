require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'
require './lib/person'

class CreditCardTest < Minitest::Test
  def test_credit_card_exists
    amex = CreditCard.new("AMEX")

    assert_instance_of(CreditCard, amex)
  end

  def test_credit_card_belongs_to_a_person
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)

    amex.open_credit(person, 100, 0.5)

    assert_equal("Minerva", amex.person.name)
  end
end
