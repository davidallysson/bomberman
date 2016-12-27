$LOAD_PATH << '.'

require 'gosu'

class Solid
	attr_reader :x, :y, :radius, :image_index

  WIDTH = 16
  HEIGHT = 16

  def initialize(window)
		@x = 7
		@y = 24
    @radius = 8
		@images = Gosu::Image::load_tiles('images/tile_16x16.png', 16, 16)
    @image_index = 1
  end

  def draw
    @images[@image_index].draw(@x, @y, 1)
  end

end
