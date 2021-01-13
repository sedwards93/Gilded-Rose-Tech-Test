# frozen_string_literal: true

require_relative 'item'
require_relative 'aged_brie'
require_relative 'backstage'
require_relative 'normal'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each_with_index do |item, index|
      update_item(item, index)
    end
  end

  def update_item(item, index)
    case item.name
    when 'Aged Brie'
     @items[index] = AgedBrie.new(item.sell_in, item.quality)
     @items[index].update_item
    when 'Backstage passes to a TAFKAL80ETC concert'
     @items[index] = BackStage.new(item.sell_in, item.quality)
     @items[index].update_item
    else
      @items[index] = Normal.new(item.name, item.sell_in, item.quality)
      @items[index].update_item
    end
  end

  private

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_qaulity(item)
    item.quality -= 1 unless item.quality.negative? || item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

end
