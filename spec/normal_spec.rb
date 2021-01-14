# frozen_string_literal: true

require 'normal'

describe Normal do
  let(:normal) { Normal.new('normal', 10, 20) }

  describe '#Initialize' do
    it 'Instances of the normal class are initialized with a name instance variable' do
      expect(normal.name).to eq('normal')
    end
    it 'Instances of the normal class are initialized with a sell_in instance variable' do
      expect(normal.sell_in).to eq(10)
    end
    it 'Instances of the normal class are initialized with a sell_in instance variable' do
      expect(normal.quality).to eq(20)
    end
  end

  describe '#update_item' do
    it 'lowers the value of the quality by 1' do
      expect { normal.update_item }.to change { normal.quality }.by(-1)
    end
    it 'lowers the value of sell_in by 1' do
      expect { normal.update_item }.to change { normal.sell_in }.by(-1)
    end
    it 'lowers the value of the quality by 2 when sell_in date is negative' do
      10.times { normal.update_item }
      expect { normal.update_item }.to change { normal.quality }.by(-2)
    end
    it 'value of the quality never goes below 0' do
      18.times { normal.update_item }
      expect { normal.update_item }.to change { normal.quality }.by(0)
    end
  end
end
