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

  def test_restock_stocks_hash_and_stock_check_is_updated
    pantry.restock("Cheese", 10)
    result = pantry.stock_check("Cheese")
    assert_equal 10, result
  end

  def test_additional_restock_adds_to_previous
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)
    result = pantry.stock_check("Cheese")
    result2 = pantry.restock(67, 10)
    result3 = pantry.restock(nil, 30)
    assert_equal 30, result
    assert_nil result2
    assert_nil result3
  end
end
