$LOAD_PATH << '.'

require 'gosu'

class Timer
  attr_accessor :x, :y, :width, :height, :image_index

  def initialize

    @x = 120
		@y = 13

		@width = 8
		@height = 14

    @images = Gosu::Image::load_tiles('images/tile_8x14.png', 8, 14)

  end

  def relogio
    3.downto(0) do |min|
      5.downto(0) do |seg1|
        9.downto(0) do |seg2|
          @images[min].draw(@x - @width / 2, @y - @height / 2, 2)
          @images[seg1].draw(@x + 16 - @width / 2, @y - @height / 2, 2)
          @images[seg2].draw(@x + 24 - @width / 2, @y - @height / 2, 2)
        end
      end
    end
  end
end
