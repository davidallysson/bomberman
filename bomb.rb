$LOAD_PATH << '.'

require 'gosu'

class Bomb
  attr_accessor :x, :y, :width, :height, :radius, :image_index, :bombtimer, :finished

  # Método construtor da Classe BOMB
  # Recebe as coordenadas X e Y como parâmetro e inicializa todos atributos de Bomb.
  def initialize(x, y)
    @x = x
    @y = y

    @width = 16
		@height = 16

    @radius = 8
    @bombtimer = 0
    @finished = false

    @image_index = 0
    @images_bomb = Gosu::Image::load_tiles('images/bomb.bmp', 16, 16)
    @images_explosion = Gosu::Image::load_tiles('images/explosion.bmp', 16, 16)

  end

  # Método draw da Classe BOMB
  def draw
    if @bombtimer < 3 then
      if @image_index < @images_bomb.count
        @images_bomb[@image_index].draw(@x - @radius, @y - @radius, 2)
        @image_index += 1
      else
        @image_index = 0
        @bombtimer += 1
      end
    elsif @bombtimer < 13
      @images_explosion[0].draw(@x - @radius, @y - @radius, 2)
      @images_explosion[3].draw(@x - @radius - 15, @y - @radius, 2)
      @images_explosion[6].draw(@x - @radius, @y - @radius - 15, 2)
      @images_explosion[9].draw(@x - @radius + 15, @y - @radius, 2)
      @images_explosion[12].draw(@x - @radius, @y - @radius + 15, 2)
      @bombtimer += 1
    else
      @finished = true
    end
  end

end
