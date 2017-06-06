require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  attr_reader :pantry, :r, :r2
  def setup
   @pantry = Pantry.new
   @r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
   @r2 = Recipe.new("Spaghetti")
    r2.add_ingredient("Noodles", 10)
    r2.add_ingredient("Sauce", 10)
    r2.add_ingredient("Cheese", 5)
  end

  def test_add_to_shopping_list_and_shopping_list_print
    pantry.add_to_shopping_list(r)
    result1 = pantry.shopping_list
    expected1 = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected1, result1

    pantry.add_to_shopping_list(r2)
    result2 = pantry.shopping_list
    expected2 =  {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}
    assert_equal expected2, result2
  end

  def test_print_shopping_list
    pantry.add_to_shopping_list(r)
    pantry.add_to_shopping_list(r2)
    result = pantry.print_shopping_list
    expected = Hash
    assert_equal expected, result.class
  end

end
