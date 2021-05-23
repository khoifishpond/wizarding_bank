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

  def test_credit_cannot_be_charged_over_limit
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)
    amex.open_credit(person, 100, 0.5)

    amex.charge(person, 150)

    refute_equal(0, amex.balance)
  end

  def test_balance_can_be_paid_down
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 1000)
    amex.open_credit(person, 100, 0.5)
    amex.charge(person, 25)

    amex.pay_off(person, 25)

    assert_equal(0, amex.balance)
  end

  def test_cannot_pay_with_more_than_cash_on_hand
    amex = CreditCard.new("AMEX")
    person = Person.new("Minerva", 10)
    amex.open_credit(person, 100, 0.5)
    amex.charge(person, 25)

    amex.pay_off(person, 25)

    refute_equal(0, amex.balance)
  end
end
