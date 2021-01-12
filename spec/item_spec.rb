require 'item'

describe Item do

  let(:pizza) {Item.new("Pizza",7, 5)}

  describe '#Initialize' do
    it 'Instances of the item class are initialized with a name instance variable' do
      expect(pizza.name).to eq("Pizza")
    end
    it 'Instances of the item class are initialized with a sell_in instance variable' do
      expect(pizza.sell_in).to eq(7)
    end
    it 'Instances of the item class are initialized with a sell_in instance variable' do
      expect(pizza.quality).to eq(5)
    end
  end

  describe '#to_s' do
    it 'returns the item\'s name, sell_in and quality as a string' do
      expect(pizza.to_s).to eq("Pizza, 7, 5")
    end
  end
end

# class Item
#   attr_accessor :name, :sell_in, :quality

#   def initialize(name, sell_in, quality)
#     @name = name
#     @sell_in = sell_in
#     @quality = quality
#   end

#   def to_s()
#     "#{@name}, #{@sell_in}, #{@quality}"
#   end
# end