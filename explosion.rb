$LOAD_PATH << '.'

require 'gosu'

class Explosion
  attr_accessor :x, :y, :z, :width, :height

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z

    @width = 16
		@height = 16
    @radius = 8

    @images_explosion = Gosu::Image::load_tiles('images/explosion.bmp', 16, 16)

  end

  def draw
    @images_explosion[0].draw(@x - @radius, @y - @radius, @z)
    @images_explosion[1].draw(@x - @radius - 15, @y - @radius, @z)
    @images_explosion[2].draw(@x - @radius, @y - @radius - 15, @z)
    @images_explosion[3].draw(@x - @radius + 15, @y - @radius, @z)
    @images_explosion[4].draw(@x - @radius, @y - @radius + 15, @z)
  end

end
