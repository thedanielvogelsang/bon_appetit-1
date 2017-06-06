require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  attr_reader :pantry
  def setup
   @pantry = Pantry.new
  end
# => <Pantry...>
  def test_stock_prints_stock_as_hash
    result = pantry.stock
    expected = {}
    assert_instance_of Hash, result
    assert_equal expected, result
  end

  def test_stock_check_prints_zero
    result = pantry.stock_check("Cheese")
    assert_equal 0, result
  end
end
