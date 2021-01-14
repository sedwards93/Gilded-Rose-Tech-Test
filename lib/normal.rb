# frozen_string_literal: true
require_relative 'item'
class Normal < Item
  
  def update_item
    update_sell_in
    update_quality
  end

  private

  def update_quality
    return if @quality.negative?

    @quality -= 1
    @quality -= 1 if @sell_in < 1
  end

  def update_sell_in
    @sell_in -= 1
  end
end
