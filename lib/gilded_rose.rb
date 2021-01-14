# frozen_string_literal: true

require_relative 'item'
require_relative 'aged_brie'
require_relative 'backstage'
require_relative 'normal'
require_relative 'sulfuras'
require_relative 'conjured'

class GildedRose
  attr_reader :items, :aged_brie, :backstage, :sulfuras, :conjured, :normal

  def initialize(items, aged_brie = AgedBrie, backstage = BackStage, sulfuras = Sulfuras, conjured = Conjured, normal = Normal)
    @items = items
    @aged_brie = aged_brie
    @backstage = backstage
    @sulfuras = sulfuras
    @conjured = conjured
    @normal = normal
  end

  def update_quality
    @items.each_with_index do |item, index|
      name, sell_in, quality = item.name, item.sell_in, item.quality
      case name
      when 'Aged Brie'
        @items[index] = aged_brie.new(sell_in, quality)
        @items[index].update_item
      when 'Backstage passes to a TAFKAL80ETC concert'
        @items[index] = backstage.new(sell_in, quality)
        @items[index].update_item
      when 'Sulfuras, Hand of Ragnaros'
        @items[index] = sulfuras.new(sell_in, quality)
      when 'Conjured'
        @items[index] = conjured.new(sell_in, quality)
        @items[index].update_item
      else
        @items[index] = normal.new(name, sell_in, quality) 
        @items[index].update_item
      end
    end
  end
end
