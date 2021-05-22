require 'minitest/autorun'
require './lib/account'
require './lib/person'

class AccountTest < Minitest::Test
  def test_is_an_account
    person = Person.new("Minerva", 1000)
    account = Account.new(person)

    assert_instance_of(Account, account)
  end

  def test_person_has_account
    person = Person.new("Minerva", 1000)
    account = Account.new(person)

    assert_equal(person, account.person)
  end

  def test_account_starts_with_no_balance
    person = Person.new("Minerva", 1000)
    account = Account.new(person)

    assert_equal(0, account.balance)
  end
end