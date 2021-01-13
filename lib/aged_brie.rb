class AgedBrie

  attr_reader :name, :sell_in, :quality

  def initialize(name = "Aged Brie", sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_item
    decrease_sell_in
    increase_quality
  end

  private

  def increase_quality
    @quality += 1 if @sell_in < 1 && @quality < 50
    @quality += 1 if @quality < 50
  end

  def decrease_sell_in
    @sell_in -= 1 
  end

end