$LOAD_PATH << '.'

require 'gosu'

class Player
	attr_reader :x, :y, :radius, :angle, :image_index, :velocity

	WIDTH = 16
	HEIGHT = 26

  def initialize(window)
		@x = 119
		@y = 110
		@radius = 16
		@velocity = 4
		#Indice referente a imagem inicial para o personagem
		@image_index = 6
		#Divide o sprite em várias imagens diferentes
		@images = Gosu::Image::load_tiles('images/sprite_16x26.png', 16, 26)
		#Transformar o objeto window em atributo
		@window = window
  end

	#Draw principal de Player.
	#Exibe o personagem sobre o background e nas coordenadas @x e @y
	def draw
		@images[@image_index].draw(@x, @y, 2)
	end

	#Move o personagem para cima e realiza a troca dos seus sprites.
  def move_up
    @y -= @velocity
		@y = 30 if @y < 30 #Limitador do movimento para cima
		changeSprite([0, 1, 2])
  end

	#Move o personagem para baixo e realiza a troca dos seus sprites.
  def move_down
		@y += @velocity
		@y = (@window.height - @radius - 36) if @y > @window.height - @radius - 36 #Limitador do movimento para baixo
		changeSprite([6, 7, 8])
  end

	#Move o personagem para a esquerda e realiza a troca dos seus sprites.
  def move_left
		@x -= @velocity
		@x = 23 if @x < 23 #Limitador do movimento para a esquerda
		changeSprite([9, 10, 11])
  end

	#Move o personagem para a direita e realiza a troca dos seus sprites.
  def move_right
		@x += @velocity
		@x = (@window.width - @radius - 25) if @x > @window.width - @radius - 25 #Limitador do movimento para a direita
		changeSprite([3, 4, 5])
  end

	def changeSprite(indexes)
		#Verifica se é a primeira vez que o player aperta para uma determinada direção a partir do sprite atual.
		# Se sim, setar o primeiro sprite da direção selecionada.
		if @image_index != indexes[0] && @image_index != indexes[1] && @image_index != indexes[2] then @image_index = indexes[0]
		#Verifica se já está na última imagem. Enquanto não estiver, ele trocará de sprite.
		elsif @image_index < indexes[2] then @image_index += 1
		#Verifica se está na última imagem.
		# Se sim, retorna para a primeira imagem.
		elsif @image_index == indexes[2] then @image_index = indexes[0] end
		sleep 0.1 #Deixar a troca de sprite mais lenta
	end

end
