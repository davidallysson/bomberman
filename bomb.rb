$LOAD_PATH << '.'

require 'gosu'

class Bomb
  attr_accessor :x, :y, :width, :height, :finished, :image_index

  def initialize(x, y)
    @x = x
    @y = y

    @width = 16
		@height = 16

    @radius = 8

    @image_index = 0
    @finished = false

    @images_bomb = Gosu::Image::load_tiles('images/bomb.bmp', 16, 16)
    @images_explosion = Gosu::Image::load_tiles('images/explosion.bmp', 16, 16)

  end

  def draw
    if @image_index < @images_bomb.count
      @images_bomb[@image_index].draw(@x - @radius, @y - @radius, 2)
      @image_index += 1
    else
      @image_index = 0
    end
  end

end
