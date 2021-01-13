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
    item.quality -= 1 unless item.quality.negative? || item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def update_item(item)
    if (item.name == 'Aged Brie') || (item.name == 'Backstage passes to a TAFKAL80ETC concert')
      increase_quality(item)
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6
      end
    else
      decrease_qaulity(item)
    end
    decrease_sell_in(item)
    return unless item.sell_in.negative?

    case item.name
    when 'Aged Brie'
      increase_quality(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.quality -= item.quality
    else
      decrease_qaulity(item)
    end
  end
end
