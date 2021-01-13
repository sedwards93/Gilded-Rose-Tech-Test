# frozen_string_literal: true

require 'backstage'

describe BackStage do
  let(:backstage) { BackStage.new('Backstage passes to a TAFKAL80ETC concert', 11, 20) }

  describe '#Initialize' do
    it 'Instances of the BackStage class are initialized with a name instance variable' do
      expect(backstage.name).to eq('Backstage passes to a TAFKAL80ETC concert')
    end
    it 'Instances of the BackStage class are initialized with a sell_in instance variable' do
      expect(backstage.sell_in).to eq(11)
    end
    it 'Instances of the BackStage class are initialized with a sell_in instance variable' do
      expect(backstage.quality).to eq(20)
    end
  end

  describe '#update_item' do
    it 'lowers the value of sell_in by 1' do
      expect { backstage.update_item }.to change { backstage.sell_in }.by(-1)
    end
    it 'when sell_in is greater than 10, quality increases by 1' do
      expect { backstage.update_item }.to change { backstage.quality }.by(1)
    end
    it 'when sell_in is equal to or less than 10, and greater than or eqaul to 6, quality increases by 2' do
      backstage.update_item
      expect { backstage.update_item }.to change { backstage.quality }.by(2)
    end
    it 'when sell_in is equal to or less than 5, and greater than or eqaul to -1, quality increases by 3' do
      6.times { backstage.update_item }
      expect { backstage.update_item }.to change { backstage.quality }.by(3)
    end
    it 'Value drops to zero when sell_in is less than 0' do
      12.times { backstage.update_item }
      expect(backstage.quality).to eq(0)
    end
  end
end