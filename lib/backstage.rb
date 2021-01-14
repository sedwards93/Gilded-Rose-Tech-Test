# frozen_string_literal: true
require_relative 'item'
class BackStage < Item
 
  def update_item
    update_sell_in
    update_quality
  end

  private

  def update_quality
    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality += 1 if @sell_in < 6
    @quality -= @quality if @sell_in < 1
  end

  def update_sell_in
    @sell_in -= 1
  end
end
