# frozen_string_literal: true

require_relative 'item'
require_relative 'aged_brie'
require_relative 'backstage'
require_relative 'normal'
require_relative 'sulfuras'
require_relative 'conjured'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each_with_index do |item, index|
      name, sell_in, quality = item.name, item.sell_in, item.quality
      case name
      when 'Aged Brie'
        @items[index] = AgedBrie.new(sell_in, quality)
        @items[index].update_item
      when 'Backstage passes to a TAFKAL80ETC concert'
        @items[index] = BackStage.new(sell_in, quality)
        @items[index].update_item
      when 'Sulfuras, Hand of Ragnaros'
        @items[index] = Sulfuras.new(sell_in, quality)
      when 'Conjured'
        @items[index] = Conjured.new(sell_in, quality)
        @items[index].update_item
      else
        @items[index] = Normal.new(name, sell_in, quality) 
        @items[index].update_item
      end
    end
  end
end
