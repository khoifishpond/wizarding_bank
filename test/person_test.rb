require 'minitest/autorun'
require './lib/person'

class PersonTest < Minitest::Test
  def test_is_a_person
    person = Person.new("Minerva", 1000)

    assert_instance_of(Person, person)
  end

  def test_person_has_name
    person = Person.new("Minerva", 1000)

    assert_equal("Minerva", person.name)
  end

  def test_person_has_cash
    person = Person.new("Minerva", 1000)

    assert_equal(1000, person.cash)
  end

  def test_person_can_deposit_cash
    person = Person.new("Minerva", 1000)

    assert_equal(250, person.deposit(750))
  end

  def test_person_can_withdraw_cash
    person = Person.new("Minerva", 1000)

    assert_equal(1750, person.withdraw(750))
  end
end