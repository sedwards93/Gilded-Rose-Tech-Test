require 'gilded_rose'

describe "Features" do
  let(:items) {[Item.new("Normal_Item",10, 20), 
                Item.new("Aged Brie", 10, 10),
                Item.new("Sulfuras, Hand of Ragnaros", 10, 80),
                Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20)
              ]}
  let(:gilded_rose) {GildedRose.new(items)}

  describe 'Update Quality' do

    context 'Standard item' do
      it 'lowers the value of the quality by 1' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[0].quality }.by(-1)
      end
      it 'lowers the value of sell_in by 1' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[0].sell_in }.by(-1)
      end
    end

    context 'Negative Sell_in date' do
      it 'lowers the value of the quality by 2' do
        10.times { gilded_rose.update_quality }
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[0].quality }.by(-2)
      end
      it 'lowers the value of sell_in by 1' do
        10.times { gilded_rose.update_quality }
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[0].sell_in }.by(-1)
      end
    end

    context 'Quality Zero' do
      it 'value of the quality stays at 0' do
        18.times { gilded_rose.update_quality }
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[0].quality }.by(0)
      end
    end

    context 'Aged Brie' do
      it 'value of the quality increases by 2 past sell_in ' do
        10.times { gilded_rose.update_quality }
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[1].quality }.by(2)
      end
      it 'value of the quality increases by 1 when in date' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[1].quality }.by(1)
      end
      it 'value of the quality never goes past 50' do
        25.times { gilded_rose.update_quality }
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[1].quality }.by(0)
      end
    end

    context 'Sulfuras' do
      it 'value of the quality never decreases' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[2].quality }.by(0)
      end
      it 'value of the sell_in never decreases' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[2].sell_in }.by(0)
      end
    end

    context 'Backstage Passes' do
      it 'when sell_in is greater than 10, quality increases by 1' do
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[3].quality }.by(1)
      end
      it 'when sell_in is equal to or less than 10, and greater than or eqaul to 6, quality increases by 2' do
        gilded_rose.update_quality
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[3].quality }.by(2)
      end
      it 'when sell_in is equal to or less than 5, and greater than or eqaul to -1, quality increases by 3' do
        6.times {gilded_rose.update_quality}
        expect{ gilded_rose.update_quality }.to change {gilded_rose.items[3].quality }.by(3)
      end
      it 'Value drops to zero when sell_in is less than 0' do
       12.times {gilded_rose.update_quality}
        expect(gilded_rose.items[3].quality).to eq(0)
      end
    end

  end
end