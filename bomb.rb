$LOAD_PATH << '.'

require 'gosu'

class Bomb
  attr_accessor :x, :y, :width, :height, :finished, :image_index

  def initialize
		@width = 16
		@height = 16
    @radius = 8
    @image_index = 0
    @finished = false

    @images_bomb = Gosu::Image::load_tiles('images/bomb.png', 16, 16)
    @images_explosion = Gosu::Image::load_tiles('images/explosion.png', 16, 16)

  end

  def draw
    if @image_index < @images.count
      @images[@image_index].draw(@x - @radius, @y - @radius, 2)
      @image_index += 1
    else
      @finished = true
    end
  end

end
