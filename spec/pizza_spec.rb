require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '#initialize' do
    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only if no ingredients are passed in' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe '#vegetarian?' do
    it 'returns true if all of the toppings on the pizza are vegetarian' do
      toppings_false = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      toppings_true = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('peppers', vegetarian: true)
      ]
      pizza_false = Pizza.new(toppings_false)
      pizza_true = Pizza.new(toppings_true)

      expect(pizza_true.vegetarian?).to eq(true)
      expect(pizza_false.vegetarian?).to eq(false)
    end
  end

  describe '#add_topping' do
    it 'adds another topping to the toppings array' do
      pizza = Pizza.new
      topping = Topping.new('chicken')
      pizza.add_topping(topping)

      expect(pizza.toppings.include?(topping)).to eq(true)
    end
  end

  describe '#deliver!' do
    pizza = Pizza.new
    pizza.deliver!
    it 'marks a @delivery_time attribute which is a Time object' do
      expect(pizza.delivery_time.class).to eq(Time)
    end
    it 'returns a delivery time which is greater than what the current time is' do
      expect(pizza.delivery_time).to be > (Time.now)
    end
  end
end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '#initialize' do
    it 'sets the name of the topping' do
      topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the pizza is vegetarian' do
      topping = Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end
  end
end
