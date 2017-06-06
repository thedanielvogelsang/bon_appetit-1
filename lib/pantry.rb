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
    else
      @stock[food_item] = quantity
    end
  end

end
