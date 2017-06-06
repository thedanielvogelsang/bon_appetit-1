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

end
