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

  def test_credit_has_limit
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)

    amex.open_credit(person, 100, 0.5)

    assert_equal(100, amex.limit)
  end

  def test_credit_has_interest_rate
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)

    amex.open_credit(person, 100, 0.5)

    assert_equal(0.5, amex.interest)
  end

  def test_credit_can_be_charged
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)
    amex.open_credit(person, 100, 0.5)

    amex.charge(person, 25)

    assert_equal(25, amex.balance)
  end
end
