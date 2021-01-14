# frozen_string_literal: true
# # frozen_string_literal: true

# require 'gilded_rose'

# describe GildedRose do
#   let(:items) {double :Items }
#   let(:aged_brie) {double :AgedBrie}
#   let(:backstage) {double :BackStage}
#   let(:sulfuras) {double :Sulfuras}
#   let(:conjured) {double :Conjured}
#   let(:normal) {double :Normal}
#   let(:subject) {GildedRose.new(items, aged_brie, backstage, sulfuras, conjured, normal)}

#   describe '#initialize' do
#     it 'Instances of GildedRose are initialized with @items variable' do
#       expect(subject).to respond_to(:items)
#     end
#   end

#   describe '#update_quality' do
#     let(:items) {double :items, name: 'Aged Brie', sell_in: 10, quality: 10 }
#     let(:subject) { GildedRose.new([items], aged_brie, backstage, sulfuras, conjured, normal)}
#     it 'It calls the update_item method on each item' do
#       allow(aged_brie).to receive(:update_item)
#       expect(aged_brie).to receive(:new)
#       subject.update_quality
#     end
#   end
# end
