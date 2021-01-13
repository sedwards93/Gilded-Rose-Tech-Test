# frozen_string_literal: true

class Conjured
  attr_reader :name, :sell_in, :quality

  def initialize(name = 'Conjured', sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

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
