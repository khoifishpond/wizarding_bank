require 'minitest/autorun'
require './lib/person'

class PersonTest < Minitest::Test
  def test_is_a_person
    person_1 = Person.new("Minerva", 1000)

    assert_instance_of(Person, person_1)
  end

  def test_person_has_name
    person_1 = Person.new("Minerva", 1000)

    assert_equal("Minerva", person_1.name)
  end

  def test_person_has_cash
    person_1 = Person.new("Minerva", 1000)

    assert_equal(1000, person_1.cash)
  end
end