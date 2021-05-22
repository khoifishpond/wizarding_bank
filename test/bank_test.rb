require 'minitest/autorun'
require './lib/bank'

class BankTest < Minitest::Test
  def test_bank_exists
    wells_fargo = Bank.new("Wells Fargo")

    assert_instance_of(Bank, wells_fargo)
  end

  def test_bank_has_name
    wells_fargo = Bank.new("Wells Fargo")

    assert_equal("Wells Fargo", wells_fargo.name)
  end
end