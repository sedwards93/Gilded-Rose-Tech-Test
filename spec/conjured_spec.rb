# frozen_string_literal: true

require 'conjured'

describe Conjured do
  let(:conjured) { Conjured.new('Conjured', 10, 10) }

  describe '#Initialize' do
    it 'Instances of the conjured class are initialized with a name instance variable' do
      expect(conjured.name).to eq('Conjured')
    end
    it 'Instances of the conjured class are initialized with a sell_in instance variable' do
      expect(conjured.sell_in).to eq(10)
    end
    it 'Instances of the conjured class are initialized with a sell_in instance variable' do
      expect(conjured.quality).to eq(10)
    end
  end

  describe '#update_item' do
    it 'lowers the value of sell_in by 1' do
      expect { conjured.update_item }.to change { conjured.sell_in }.by(-1)
    end
    it 'degrades in Quality twice as fast as normal items' do
      expect { conjured.update_item }.to change { conjured.quality }.by(-2)
    end
  end
end