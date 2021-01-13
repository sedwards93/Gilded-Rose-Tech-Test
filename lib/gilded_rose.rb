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

  def update_item(item)
    decrease_sell_in(item)
    case item.name
    when 'Aged Brie'
      increase_quality(item)
      increase_quality(item) if item.sell_in < 1
    when 'Backstage passes to a TAFKAL80ETC concert'
      increase_quality(item)
      increase_quality(item) if item.sell_in < 10
      increase_quality(item) if item.sell_in < 6
      item.quality -= item.quality if item.sell_in < 1
    else
      decrease_qaulity(item)
      decrease_qaulity(item) if item.sell_in < 1
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
