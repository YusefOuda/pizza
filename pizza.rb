class Pizza
  attr_accessor :toppings, :delivery_time

  def initialize(toppings=[Topping.new('cheese')])
    @toppings = toppings
  end

  def vegetarian?
    @toppings.all? { |top| top.vegetarian }
  end

  def add_topping(topping)
    @toppings.push(topping)
  end

  def deliver!
    @delivery_time = Time.now + 30*60
  end

  def late?
    current_time = Time.now
    if current_time > @delivery_time
      return true
    else
      return false
    end
  end
end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end
