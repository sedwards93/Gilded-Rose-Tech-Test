# frozen_string_literal: true

require_relative 'item'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item(item)
    end
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_qaulity(item)
    item.quality -= 1 if item.quality.positive?
  end

  def update_item(item)
    if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
      decrease_qaulity(item) if (item.name != 'Sulfuras, Hand of Ragnaros')
    elsif item.quality < 50
      item.quality += 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6 
      end
    end
    item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    if item.sell_in.negative?
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          decrease_qaulity(item) if (item.name != 'Sulfuras, Hand of Ragnaros')
        else
          item.quality -= item.quality
        end
      elsif item.quality < 50
        item.quality += 1
      end
    end
  end
end
