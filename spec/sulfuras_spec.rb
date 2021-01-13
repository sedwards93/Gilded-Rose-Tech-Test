# frozen_string_literal: true

require 'sulfuras'

describe Sulfuras do
  let(:sulfuras) { Sulfuras.new('Sulfuras, Hand of Ragnaros', 10, 80) }

  describe '#Initialize' do
    it 'Instances of the Sulfuras class are initialized with a name instance variable' do
      expect(sulfuras.name).to eq('Sulfuras, Hand of Ragnaros')
    end
    it 'Instances of the Sulfuras class are initialized with a sell_in instance variable' do
      expect(sulfuras.sell_in).to eq(10)
    end
    it 'Instances of the Sulfuras class are initialized with a sell_in instance variable' do
      expect(sulfuras.quality).to eq(80)
    end
  end
end