# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do

  let(:subject) {GildedRose.new(['item','item'])}

  describe '#initialize' do
    it 'Instances of GildedRose are initialized with @items variable' do
      expect(subject).to respond_to(:items)
    end
  end

  describe '#update_quality' do
    it 'It calls teh update_item method on each item' do
      expect(subject).to receive(:update_item).exactly(2).times
      subject.update_quality
    end
  end
end
