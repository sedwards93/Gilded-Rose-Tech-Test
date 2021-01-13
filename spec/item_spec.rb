# frozen_string_literal: true

require 'item'

describe Item do
  let(:item) { Item.new('item', 7, 5) }

  describe '#Initialize' do
    it 'Instances of the item class are initialized with a name instance variable' do
      expect(item.name).to eq('item')
    end
    it 'Instances of the item class are initialized with a sell_in instance variable' do
      expect(item.sell_in).to eq(7)
    end
    it 'Instances of the item class are initialized with a sell_in instance variable' do
      expect(item.quality).to eq(5)
    end
  end

  describe '#to_s' do
    it 'returns the item\'s name, sell_in and quality as a string' do
      expect(item.to_s).to eq('item, 7, 5')
    end
  end
end
