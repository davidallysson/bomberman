$LOAD_PATH << '.'

require 'gosu'

class Boss
  attr_accessor :x, :y, :width, :height, :img, :radius, :damaged, :vidas

  def initialize
    @x = 126
    @y = 80

    @width = 48
		@height = 48
    @vidas = 3
    @damaged = false

    @radius = 24

    @img = Gosu::Image.new("images/boss.png")
  end

  def draw
    @img.draw_rot(@x, @y, 3, 1)
  end

end
