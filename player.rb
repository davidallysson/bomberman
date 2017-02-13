$LOAD_PATH << '.'

require 'gosu'

class Player
	attr_accessor :x, :y, :width, :height, :radius, :image_index, :velocity, :vidas, :bomb_limit

  def initialize(window)
		@x = 127
		@y = 118

		@width = 16
		@height = 14

		@radius = 8 #valor fixo
		@velocity = 4

		#Indice referente a imagem inicial para o personagem
		@image_index = 6
		#Divide o sprite em várias imagens diferentes
		@images = Gosu::Image::load_tiles('images/sprite_16x26v1.png', 16, 26)
		#Transformar o objeto window em atributo
		@window = window

		@vidas = 3
		@bomb_limit = 1
		@numbers = Gosu::Image::load_tiles('images/tile_8x14.png', 8, 14)
  end

	#Draw principal de Player.
	#Exibe o personagem sobre o background e nas coordenadas @x e @y
	def draw
		@images[@image_index].draw(@x - @width / 2, @y - @height / 2, 3)
		@numbers[@vidas].draw(51, 6, 3)
	end

	#Move o personagem para cima e realiza a troca dos seus sprites.
  def move_up
    @y -= @velocity
		@y = 29 + @radius if @y < 29 + @radius #Limitador do movimento para cima

		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 35 and @x <= 59 #Limitação do movimento para cima - 1ª Linha 1° bloco
		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 67 and @x <= 91 #Limitação do movimento para cima - 1ª Linha 2° bloco
		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 99 and @x <= 123 #Limitação do movimento para cima - 1ª Linha 3° bloco
		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 131 and @x <= 155 #Limitação do movimento para cima - 1ª Linha 4° bloco
		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 163 and @x <= 187 #Limitação do movimento para cima - 1ª Linha 5° bloco
		@y += @velocity if @y >= 56 and @y <= 71 and @x >= 195 and @x <= 219 #Limitação do movimento para cima - 1ª Linha 6° bloco

		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 35 and @x <= 59 #Limitação do movimento para cima - 2ª Linha 1° bloco
		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 67 and @x <= 91 #Limitação do movimento para cima - 2ª Linha 2° bloco
		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 99 and @x <= 123 #Limitação do movimento para cima - 2ª Linha 3° bloco
		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 131 and @x <= 155 #Limitação do movimento para cima - 2ª Linha 4° bloco
		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 163 and @x <= 187 #Limitação do movimento para cima - 2ª Linha 5° bloco
		@y += @velocity if @y >= 88 and @y <= 103 and @x >= 195 and @x <= 219 #Limitação do movimento para cima - 2ª Linha 6° bloco

		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 35 and @x <= 59 #Limitação do movimento para cima - 3ª Linha 1° bloco
		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 67 and @x <= 91 #Limitação do movimento para cima - 3ª Linha 2° bloco
		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 99 and @x <= 123 #Limitação do movimento para cima - 3ª Linha 3° bloco
		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 131 and @x <= 155 #Limitação do movimento para cima - 3ª Linha 4° bloco
		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 163 and @x <= 187 #Limitação do movimento para cima - 3ª Linha 5° bloco
		@y += @velocity if @y >= 110 and @y <= 135 and @x >= 195 and @x <= 219 #Limitação do movimento para cima - 3ª Linha 6° bloco

		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 35 and @x <= 59 #Limitação do movimento para cima - 4ª Linha 1° bloco
		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 67 and @x <= 91 #Limitação do movimento para cima - 4ª Linha 2° bloco
		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 99 and @x <= 123 #Limitação do movimento para cima - 4ª Linha 3° bloco
		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 131 and @x <= 155 #Limitação do movimento para cima - 4ª Linha 4° bloco
		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 163 and @x <= 187 #Limitação do movimento para cima - 4ª Linha 5° bloco
		@y += @velocity if @y >= 142 and @y <= 167 and @x >= 195 and @x <= 219 #Limitação do movimento para cima - 4ª Linha 6° bloco

		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 35 and @x <= 59 #Limitação do movimento para cima - 5ª Linha 1° bloco
		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 67 and @x <= 91 #Limitação do movimento para cima - 5ª Linha 2° bloco
		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 99 and @x <= 123 #Limitação do movimento para cima - 5ª Linha 3° bloco
		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 131 and @x <= 155 #Limitação do movimento para cima - 5ª Linha 4° bloco
		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 163 and @x <= 187 #Limitação do movimento para cima - 5ª Linha 5° bloco
		@y += @velocity if @y >= 174 and @y <= 199 and @x >= 195 and @x <= 219 #Limitação do movimento para cima - 5ª Linha 6° bloco

		changeSprite([0, 1, 2])
  end

	#Move o personagem para baixo e realiza a troca dos seus sprites.
  def move_down
		@y += @velocity
		@y = (@window.height - @radius - 35) if @y > @window.height - @radius - 35 #Limitador do movimento para baixo

		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 35 and @x <= 59 #Limitação do movimento para baixo - 1ª Linha 1° bloco
		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 67 and @x <= 91 #Limitação do movimento para baixo - 1ª Linha 2° bloco
		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 99 and @x <= 123 #Limitação do movimento para baixo - 1ª Linha 3° bloco
		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 131 and @x <= 155 #Limitação do movimento para baixo - 1ª Linha 4° bloco
		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 163 and @x <= 187 #Limitação do movimento para baixo - 1ª Linha 5° bloco
		@y -= @velocity if @y >= 40 and @y <= 56 and @x >= 195 and @x <= 219 #Limitação do movimento para baixo - 1ª Linha 6° bloco

		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 35 and @x <= 59 #Limitação do movimento para baixo - 2ª Linha 1° bloco
		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 67 and @x <= 91 #Limitação do movimento para baixo - 2ª Linha 2° bloco
		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 99 and @x <= 123 #Limitação do movimento para baixo - 2ª Linha 3° bloco
		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 131 and @x <= 155 #Limitação do movimento para baixo - 2ª Linha 4° bloco
		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 163 and @x <= 187 #Limitação do movimento para baixo - 2ª Linha 5° bloco
		@y -= @velocity if @y >= 72 and @y <= 88 and @x >= 195 and @x <= 219 #Limitação do movimento para baixo - 2ª Linha 6° bloco

		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 35 and @x <= 59 #Limitação do movimento para baixo - 3ª Linha 1° bloco
		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 67 and @x <= 91 #Limitação do movimento para baixo - 3ª Linha 2° bloco
		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 99 and @x <= 123 #Limitação do movimento para baixo - 3ª Linha 3° bloco
		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 131 and @x <= 155 #Limitação do movimento para baixo - 3ª Linha 4° bloco
		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 163 and @x <= 187 #Limitação do movimento para baixo - 3ª Linha 5° bloco
		@y -= @velocity if @y >= 104 and @y <= 120 and @x >= 195 and @x <= 219 #Limitação do movimento para baixo - 3ª Linha 6° bloco

		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 35 and @x <= 59 #Limitação do movimento para baixo - 4ª Linha 1° bloco
		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 67 and @x <= 91 #Limitação do movimento para baixo - 4ª Linha 2° bloco
		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 99 and @x <= 123 #Limitação do movimento para baixo - 4ª Linha 3° bloco
		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 131 and @x <= 155 #Limitação do movimento para baixo - 4ª Linha 4° bloco
		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 163 and @x <= 187 #Limitação do movimento para baixo - 4ª Linha 5° bloco
		@y -= @velocity if @y >= 136 and @y <= 152 and @x >= 195 and @x <= 219 #Limitação do movimento para baixo - 4ª Linha 6° bloco

		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 35 and @x <= 59 #Limitação do movimento para baixo - 5ª Linha 1° bloco
		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 67 and @x <= 91 #Limitação do movimento para baixo - 5ª Linha 2° bloco
		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 99 and @x <= 123 #Limitação do movimento para baixo - 5ª Linha 3° bloco
		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 131 and @x <= 155 #Limitação do movimento para baixo - 5ª Linha 4° bloco
		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 163 and @x <= 187 #Limitação do movimento para baixo - 5ª Linha 5° bloco
		@y -= @velocity if @y >= 168 and @y <= 184 and @x >= 195 and @x <= 219 #Limitação do movimento para baixo - 5ª Linha 6° bloco

		changeSprite([6, 7, 8])
  end

	#Move o personagem para a esquerda e realiza a troca dos seus sprites.
  def move_left
		@x -= @velocity
		@x = 23 + @radius if @x < 23 + @radius #Limitador do movimento para a esquerda

		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 35 and @x <= 59 #Limitação do movimento para a esquerda - 1ª Linha 1° bloco
		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 67 and @x <= 91 #Limitação do movimento para a esquerda - 1ª Linha 2° bloco
		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 99 and @x <= 123 #Limitação do movimento para a esquerda - 1ª Linha 3° bloco
		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 131 and @x <= 155 #Limitação do movimento para a esquerda - 1ª Linha 4° bloco
		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 163 and @x <= 187 #Limitação do movimento para a esquerda - 1ª Linha 5° bloco
		@x += @velocity if @y >= 40 and @y <= 62 and @x >= 195 and @x <= 219 #Limitação do movimento para a esquerda - 1ª Linha 6° bloco

		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 35 and @x <= 59 #Limitação do movimento para a esquerda - 2ª Linha 1° bloco
		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 67 and @x <= 91 #Limitação do movimento para a esquerda - 2ª Linha 2° bloco
		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 99 and @x <= 123 #Limitação do movimento para a esquerda - 2ª Linha 3° bloco
		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 131 and @x <= 155 #Limitação do movimento para a esquerda - 2ª Linha 4° bloco
		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 163 and @x <= 187 #Limitação do movimento para a esquerda - 2ª Linha 5° bloco
		@x += @velocity if @y >= 72 and @y <= 94 and @x >= 195 and @x <= 219 #Limitação do movimento para a esquerda - 2ª Linha 6° bloco

		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 35 and @x <= 59 #Limitação do movimento para a esquerda - 3ª Linha 1° bloco
		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 67 and @x <= 91 #Limitação do movimento para a esquerda - 3ª Linha 2° bloco
		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 99 and @x <= 123 #Limitação do movimento para a esquerda - 3ª Linha 3° bloco
		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 131 and @x <= 155 #Limitação do movimento para a esquerda - 3ª Linha 4° bloco
		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 163 and @x <= 187 #Limitação do movimento para a esquerda - 3ª Linha 5° bloco
		@x += @velocity if @y >= 104 and @y <= 126 and @x >= 195 and @x <= 219 #Limitação do movimento para a esquerda - 3ª Linha 6° bloco

		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 35 and @x <= 59 #Limitação do movimento para a esquerda - 4ª Linha 1° bloco
		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 67 and @x <= 91 #Limitação do movimento para a esquerda - 4ª Linha 2° bloco
		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 99 and @x <= 123 #Limitação do movimento para a esquerda - 4ª Linha 3° bloco
		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 131 and @x <= 155 #Limitação do movimento para a esquerda - 4ª Linha 4° bloco
		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 163 and @x <= 187 #Limitação do movimento para a esquerda - 4ª Linha 5° bloco
		@x += @velocity if @y >= 136 and @y <= 158 and @x >= 195 and @x <= 219 #Limitação do movimento para a esquerda - 4ª Linha 6° bloco

		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 35 and @x <= 59 #Limitação do movimento para a esquerda - 5ª Linha 1° bloco
		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 67 and @x <= 91 #Limitação do movimento para a esquerda - 5ª Linha 2° bloco
		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 99 and @x <= 123 #Limitação do movimento para a esquerda - 5ª Linha 3° bloco
		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 131 and @x <= 155 #Limitação do movimento para a esquerda - 5ª Linha 4° bloco
		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 163 and @x <= 187 #Limitação do movimento para a esquerda - 5ª Linha 5° bloco
		@x += @velocity if @y >= 168 and @y <= 190 and @x >= 195 and @x <= 219 #Limitação do movimento para a esquerda - 5ª Linha 6° bloco

		changeSprite([9, 10, 11])
  end

	#Move o personagem para a direita e realiza a troca dos seus sprites.
  def move_right
		@x += @velocity
		@x = (@window.width - @radius - 25) if @x > @window.width - @radius - 25 #Limitador do movimento para a direita

		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 35 and @x <= 59 #Limitação do movimento para a direita - 1ª Linha 1° bloco
		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 67 and @x <= 91 #Limitação do movimento para a direita - 1ª Linha 2° bloco
		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 99 and @x <= 123 #Limitação do movimento para a direita - 1ª Linha 3° bloco
		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 131 and @x <= 155 #Limitação do movimento para a direita - 1ª Linha 4° bloco
		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 163 and @x <= 187 #Limitação do movimento para a direita - 1ª Linha 5° bloco
		@x -= @velocity if @y >= 40 and @y <= 62 and @x >= 195 and @x <= 219 #Limitação do movimento para a direita - 1ª Linha 6° bloco

		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 35 and @x <= 59 #Limitação do movimento para a direita - 2ª Linha 1° bloco
		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 67 and @x <= 91 #Limitação do movimento para a direita - 2ª Linha 2° bloco
		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 99 and @x <= 123 #Limitação do movimento para a direita - 2ª Linha 3° bloco
		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 131 and @x <= 155 #Limitação do movimento para a direita - 2ª Linha 4° bloco
		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 163 and @x <= 187 #Limitação do movimento para a direita - 2ª Linha 5° bloco
		@x -= @velocity if @y >= 72 and @y <= 94 and @x >= 195 and @x <= 219 #Limitação do movimento para a direita - 2ª Linha 6° bloco

		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 35 and @x <= 59 #Limitação do movimento para a direita - 3ª Linha 1° bloco
		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 67 and @x <= 91 #Limitação do movimento para a direita - 3ª Linha 2° bloco
		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 99 and @x <= 123 #Limitação do movimento para a direita - 3ª Linha 3° bloco
		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 131 and @x <= 155 #Limitação do movimento para a direita - 3ª Linha 4° bloco
		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 163 and @x <= 187 #Limitação do movimento para a direita - 3ª Linha 5° bloco
		@x -= @velocity if @y >= 104 and @y <= 126 and @x >= 195 and @x <= 219 #Limitação do movimento para a direita - 3ª Linha 6° bloco

		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 35 and @x <= 59 #Limitação do movimento para a direita - 4ª Linha 1° bloco
		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 67 and @x <= 91 #Limitação do movimento para a direita - 4ª Linha 2° bloco
		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 99 and @x <= 123 #Limitação do movimento para a direita - 4ª Linha 3° bloco
		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 131 and @x <= 155 #Limitação do movimento para a direita - 4ª Linha 4° bloco
		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 163 and @x <= 187 #Limitação do movimento para a direita - 4ª Linha 5° bloco
		@x -= @velocity if @y >= 136 and @y <= 158 and @x >= 195 and @x <= 219 #Limitação do movimento para a direita - 4ª Linha 6° bloco

		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 35 and @x <= 59 #Limitação do movimento para a direita - 5ª Linha 1° bloco
		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 67 and @x <= 91 #Limitação do movimento para a direita - 5ª Linha 2° bloco
		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 99 and @x <= 123 #Limitação do movimento para a direita - 5ª Linha 3° bloco
		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 131 and @x <= 155 #Limitação do movimento para a direita - 5ª Linha 4° bloco
		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 163 and @x <= 187 #Limitação do movimento para a direita - 5ª Linha 5° bloco
		@x -= @velocity if @y >= 168 and @y <= 190 and @x >= 195 and @x <= 219 #Limitação do movimento para a direita - 5ª Linha 6° bloco

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
