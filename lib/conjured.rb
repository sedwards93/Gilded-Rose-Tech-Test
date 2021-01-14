# frozen_string_literal: true
require_relative 'item'
class Conjured < Item

  def update_item
    update_sell_in
    update_quality
  end

  private

  def update_quality
    return if @quality.negative?

    @quality -= 2
  end

  def update_sell_in
    @sell_in -= 1
  end
end
