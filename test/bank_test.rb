require 'minitest/autorun'
require './lib/bank'
require './lib/account'
require './lib/person'

class BankTest < Minitest::Test
  def test_bank_exists
    wells_fargo = Bank.new("Wells Fargo")

    assert_instance_of(Bank, wells_fargo)
  end

  def test_bank_has_name
    wells_fargo = Bank.new("Wells Fargo")

    assert_equal("Wells Fargo", wells_fargo.name)
  end

  def test_bank_opens_account_for_person
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 1000)

    assert_instance_of(Account, wells_fargo.open_account(person))
    assert_equal(person, wells_fargo.account.person)
  end

  def test_bank_can_deposit_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)

    wells_fargo.deposit(person, 750)
    assert_equal(750, wells_fargo.account.balance)
  end

  def test_bank_cannot_deposit_cash_with_insufficient_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)

    assert_equal("Insufficient cash!", wells_fargo.deposit(person, 2000))
  end

  def test_bank_can_withdraw_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 1000)

    wells_fargo.withdraw(person, 750)

    assert_equal(250, wells_fargo.account.balance)
  end

  def test_bank_cannot_withdraw_cash_with_insufficient_funds
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 1000)

    assert_equal("Insufficient funds!", wells_fargo.withdraw(person, 2000))
  end

  def test_bank_can_transfer_funds_to_another_bank
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 500)
    chase.open_account(person)

    wells_fargo.transfer(person, chase, 250)

    assert_equal(250, chase.account.balance)
  end

  def test_bank_cannot_transfer_funds_to_another_bank_with_no_account
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 500)

    assert_equal(
      "Minerva does not have an account with JP Morgan Chase.",
      wells_fargo.transfer(person, chase, 250)
    )
  end
end
