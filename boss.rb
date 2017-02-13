$LOAD_PATH << '.'

require 'gosu'

class Boss
  attr_accessor :x, :y, :width, :height, :img, :radius, :damaged, :vidas

  def initialize
    @x = 126
    @y = 80

    @width = 48
		@height = 48
    @vidas = 6

    @radius = 24

    @damaged = false

    @img = Gosu::Image.new("images/boss.png")
    @img_damaged = Gosu::Image.new("images/boss_damage.png")
    @numbers = Gosu::Image::load_tiles('images/tile_8x14.png', 8, 14)
  end

  def draw
    if @damaged == true
      @img_damaged.draw_rot(@x, @y, 3, 1)
    else
      @img.draw_rot(@x, @y, 3, 1)
    end
    @numbers[@vidas].draw(195, 6, 3)
  end

end
