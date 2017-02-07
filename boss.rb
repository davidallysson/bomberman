$LOAD_PATH << '.'

require 'gosu'

class Boss
  attr_accessor :x, :y, :width, :height

  def initialize
    @x = 110
    @y = 80

    @width = 48
		@height = 48

    @radius = 8

    @img = Gosu::Image.new("images/boss.png")
  end

  def draw
    @img.draw(@x - @radius, @y - @radius, 3)
  end

end
