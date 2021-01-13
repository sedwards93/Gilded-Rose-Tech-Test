# frozen_string_literal: true

require 'aged_brie'

describe AgedBrie do
  let(:aged_brie) { AgedBrie.new('Aged Brie', 10, 10) }

  describe '#Initialize' do
    it 'Instances of the AgedBrie class are initialized with a name instance variable' do
      expect(aged_brie.name).to eq('Aged Brie')
    end
    it 'Instances of the AgedBrie class are initialized with a sell_in instance variable' do
      expect(aged_brie.sell_in).to eq(10)
    end
    it 'Instances of the AgedBrie class are initialized with a sell_in instance variable' do
      expect(aged_brie.quality).to eq(10)
    end
  end

  describe '#update_item' do
    it 'lowers the value of sell_in by 1' do
      expect { aged_brie.update_item }.to change { aged_brie.sell_in }.by(-1)
    end
    it 'value of the quality increases by 2 past sell_in ' do
      10.times { aged_brie.update_item }
      expect { aged_brie.update_item }.to change { aged_brie.quality }.by(2)
    end
    it 'value of the quality increases by 1 when in date' do
      expect { aged_brie.update_item }.to change { aged_brie.quality }.by(1)
    end
    it 'value of the quality never goes past 50' do
      25.times { aged_brie.update_item }
      expect { aged_brie.update_item }.to change { aged_brie.quality }.by(0)
    end
  end
end