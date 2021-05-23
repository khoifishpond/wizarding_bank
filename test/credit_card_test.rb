require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'

class CreditCardTest < Minitest::Test
  def test_credit_card_exists
    amex = CreditCard.new("AMEX")

    assert_instance_of(CreditCard, amex)
  end
end
