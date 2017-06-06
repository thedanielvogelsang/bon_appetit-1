class Pantry

  def initialize
    @stock = {}
  end

  def stock
    @stock
  end

  def stock_check(food_item)
    count = @stock[food_item]
    if count == nil
      count = 0
    end
    count
  end

  def restock(food_item, quantity)
    if @stock.has_key?(food_item)
      @stock[food_item] = @stock[food_item] + quantity
    elsif food_item.class != String
      nil
    else
      @stock[food_item] = quantity
    end
  end

  def centi_units(quantity)
    quantity/100
  end

  def milli_units(quantity)
    quantity*1000
  end

  def convert_units(recipe)
    ingredients = recipe.ingredients
    recipe_keys = recipe.ingredients.keys
    converted_units_array = []
    ingredient_units = recipe_keys.map do |ingredient|
        ingredients[ingredient].to_f
      end
    ingredient_units.each do |unit|
      converted_units_hash = {}
      if unit > 100
        converted_units_hash[:quantity] = centi_units(unit)
        converted_units_hash[:units] = "Centi-Units"
      elsif unit < 1
        converted_units_hash[:quantity] = milli_units(unit)
        converted_units_hash[:units] = "Milli-Units"
      else
        converted_units_hash[:quantity] = unit
        converted_units_hash[:units] = "Universal Units"
      end
      converted_units_array << converted_units_hash
    end
      recipe_keys.zip(converted_units_array).to_h
  end

end
