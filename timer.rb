$LOAD_PATH << '.'

require 'gosu'

class Timer
  attr_accessor :x, :y, :width, :height, :min, :seg1, :seg2

  def initialize

    @x = 120
		@y = 13

		@width = 8
		@height = 14

    @min = 0
    @seg1 = 0
    @seg2 = 0

    @images = Gosu::Image::load_tiles('images/tile_8x14.png', 8, 14)

  end

  def draw
    @images[min].draw(@x - @width / 2, @y - @height / 2, 2)
    @images[seg1].draw(@x + 16 - @width / 2, @y - @height / 2, 2)
    @images[seg2].draw(@x + 24 - @width / 2, @y - @height / 2, 2)
  end

end
