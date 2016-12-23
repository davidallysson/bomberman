$LOAD_PATH << '.'

require 'gosu'

class Player
	attr_reader :x, :y, :radius, :angle, :image_index

	#Velocidade de movimento do personagem
	VELOCITY = 4 #Valor fixo; calculado com base no tamanho do tile.

  def initialize(window)
		@x = 119
		@y = 110
		#Indice referente a imagem inicial para o personagem
		@image_index = 6
		#Divide o sprite em várias imagens diferentes
		@images = Gosu::Image::load_tiles('images/sprite_16x26.png', 16, 26)
  end

	def draw
		@images[@image_index].draw(@x, @y, 1)
	end

  def move_up
    @y -= VELOCITY
		if @image_index != 0 && @image_index != 1 && @image_index != 2 then #Verifica se é a primeira vez que o player aperta para cima
			@image_index = 0
		elsif @image_index < 2 then #Verifica se já chegou na última imagem
			@image_index += 1
		elsif @image_index == 2 then #Verifica se está na última imagem
			@image_index = 0
		end
  end

  def move_down
    @y += VELOCITY
		if @image_index != 6 && @image_index != 7 && @image_index != 8 then #Verifica se é a primeira vez que o player aperta para baixo
			@image_index = 6
		elsif @image_index < 8 then #Verifica se já chegou na última imagem
			@image_index += 1
		elsif @image_index == 8 then #Verifica se está na última imagem
			@image_index = 6
		end
  end

  def move_left
    @x -= VELOCITY
		if @image_index != 9 && @image_index != 10 && @image_index != 11 then #Verifica se é a primeira vez que o player aperta para a esquerda
			@image_index = 9
		elsif @image_index < 11 then #Verifica se já chegou na última imagem
			@image_index += 1
		elsif @image_index == 11 then #Verifica se está na última imagem
			@image_index = 9
		end
  end

  def move_right
    @x += VELOCITY
		if @image_index != 3 && @image_index != 4 && @image_index != 5 then #Verifica se é a primeira vez que o player aperta para a direita
			@image_index = 3
		elsif @image_index < 5 then #Verifica se já chegou na última imagem
			@image_index += 1
		elsif @image_index == 5 then #Verifica se está na última imagem
			@image_index = 3
		end
  end

end
