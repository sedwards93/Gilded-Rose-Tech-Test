# frozen_string_literal: true
require_relative 'item'
class AgedBrie < Item

  def update_item
    update_sell_in
    update_quality
  end

  private

  def update_quality
    @quality += 1 if @sell_in < 1 && @quality < 50
    @quality += 1 if @quality < 50
  end

  def update_sell_in
    @sell_in -= 1
  end
end
