require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  attr_reader :pantry, :r
  def setup
   @pantry = Pantry.new
   @r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
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

  def test_centi_unit_conversion
    result = pantry.centi_units(200)
    assert_equal 2, result
  end

  def test_milli_units
    result = pantry.milli_units(1)
    result2 = pantry.milli_units(0.5)
    result3 = pantry.milli_units(1/3.to_f)
    assert_equal 1000, result
    assert_equal 500, result2
    assert_equal 333.33, result3.round(2)
  end

  def test_conversion_of_units
    result = pantry.convert_units(r)
    expected = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
      "Cheese" => {quantity: 75, units: "Universal Units"},
      "Flour"  => {quantity: 5, units: "Centi-Units"}}
    assert_equal expected, result
  end

  def test_

end
