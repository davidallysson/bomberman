$LOAD_PATH << '.'

require 'gosu'

class Bomb
  attr_accessor :x, :y, :width, :height, :finished, :image_index, :bombtimer

  def initialize(x, y)
    @x = x
    @y = y

    @width = 16
		@height = 16

    @radius = 8
    @bombtimer = 0

    @image_index = 0
    @finished = false

    @images_bomb = Gosu::Image::load_tiles('images/bomb.bmp', 16, 16)

  end

  def draw
    if @bombtimer < 3 then
      if @image_index < @images_bomb.count
        @images_bomb[@image_index].draw(@x - @radius, @y - @radius, 2)
        @image_index += 1
      else
        @image_index = 0
        @bombtimer += 1
      end
    else
      @finished = true
    end
  end

end
