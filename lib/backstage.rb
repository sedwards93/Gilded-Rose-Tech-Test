class BackStage

  attr_reader :name, :sell_in, :quality

  def initialize(name = "Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
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
     @quality += 1
     @quality += 1 if @sell_in < 10
     @quality += 1 if @sell_in < 6
    @quality -= @quality if @sell_in < 1
  end

  def decrease_sell_in
    @sell_in -= 1 
  end

end