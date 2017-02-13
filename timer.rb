$LOAD_PATH << '.'

require 'gosu'

class Timer
  attr_accessor :x, :y, :width, :height, :min, :seg1, :seg2, :tempo

  def initialize

    @x = 120
		@y = 13

		@width = 8
		@height = 14

    @minutosreais = 2
    @tempo = 3600 * @minutosreais

    @images = Gosu::Image::load_tiles('images/tile_8x14.png', 8, 14)
  end

  def draw
    @images[@min].draw(@x - @width / 2, @y - @height / 2, 2)
    @images[@seg1].draw(@x + 16 - @width / 2, @y - @height / 2, 2)
    @images[@seg2].draw(@x + 24 - @width / 2, @y - @height / 2, 2)
  end

  def relogio
    if @tempo > 0
      @tempo -= 1
    end
    @min = (@tempo / 60) / 60
    @seg = (@tempo / 60)
    while @seg >= 60
      @seg -= 60
    end
    @seg1 = @seg.to_s[0].to_i
    @seg2 = @seg.to_s[1].to_i
    if @seg < 10
      @seg1 = 0
      @seg2 = @seg.to_s[0].to_i
    end
  end

end
