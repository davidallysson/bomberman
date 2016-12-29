$LOAD_PATH << '.'

require 'gosu'

class Solid
	attr_accessor :radius, :width, :height, :image_index, :x, :y

  def initialize(window)
		@x = 16
		@y = 32

		@width = 16
		@height = 16

    @radius = 12

		@images = Gosu::Image::load_tiles('images/tile_16x16.png', 16, 16)
    @image_index = 5
  end

  def draw
    @images[@image_index].draw(@x - @width / 2, @y - @height / 2, 1)
  end

end
