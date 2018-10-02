$LOAD_PATH << '.'

require 'gosu'
require_relative 'player'
require_relative 'timer'
require_relative 'bomb'
require_relative 'boss'

class GameWindow < Gosu::Window

  # Método construtor da Classe GAME
  # Responsável por incializar todos os arquivos utilizados dentro do game e todas as variáveis utilizadas.
  def initialize
    super(256, 240, true) # Tamanho do game (256x240); fullscreen? == true
    self.caption = "Bomberman v.0.1" # Nome exibido no topo do game quando fora do modo fullscreen

    @image_index = 0
    @option = 1 # Opção inicial do menu
    @estado = :title # Estado inicial do jogo

    # Imagens utilizadas no jogo
    @background_option1 = Gosu::Image.new("images/op1.png")
    @background_option2 = Gosu::Image.new("images/op2.png")
    @background_option3 = Gosu::Image.new("images/op3.png")
    @background_battle_map = Gosu::Image.new("images/original_battle_map.png")

    @winner_screen = Gosu::Image.new("images/YouWin.jpg")
    @credits_screen = Gosu::Image.new("images/creditos.png")
    @tutorial_screen = Gosu::Image.new("images/tutorial.png")
    @gameover_screen = Gosu::Image.new("images/gameOver.png")

    # Sons utilizados no jogo
    @option_sound_effect = Gosu::Sample.new("audio/opcao_som.wav")
    @damage_sound_effect = Gosu::Sample.new("audio/bomba_som.wav")
    @battle_map_soundtrack = Gosu::Song.new("audio/battle.wav")
    @title_screen_soundtrack = Gosu::Song.new("audio/title_screen.wav")
    @gameover_screen_soundtrack = Gosu::Song.new("audio/game_over.wav")
    @winner_screen_soundtrack = Gosu::Song.new("audio/win.wav")

    # Array responsável por controlar quantidade de bombas
    @bombs = []
  end

  # Método update da Classe GAME
  # Responsável por toda a parte lógica do jogo.
  # Colisões, condições de vitória e derrota, movimentação e muito mais.
  def update
    case @estado
    when :title
      @title_screen_soundtrack.play(true)
    when :game
      @timer.relogio
      @battle_map_soundtrack.play(true)
      #Movimentação do PLAYER
      @player.move_up if button_down? (Gosu::KbUp)
      @player.move_down if button_down? (Gosu::KbDown)
      @player.move_left if button_down? (Gosu::KbLeft)
      @player.move_right if button_down? (Gosu::KbRight)

      #Movimentação do BOSS
      # @boss.move_up if button_down? (Gosu::KbW)
      # @boss.move_down if button_down? (Gosu::KbS)
      # @boss.move_left if button_down? (Gosu::KbA)
      # @boss.move_right if button_down? (Gosu::KbD)

      #Colisão PLAYER-BOSS
      # distanciaBoss = Gosu::distance(@player.x, @player.y, @boss.x, @boss.y)
      # if distanciaBoss + 15 < @player.radius + @boss.radius then
      #   @player.y += 35 if button_down? (Gosu::KbW)
      #   @player.y += 35 if button_down? (Gosu::KbDown)
      #   @player.y -= 35 if button_down? (Gosu::KbS)
      #   @player.y -= 35 if button_down? (Gosu::KbUp)
      #   @player.x += 35 if button_down? (Gosu::KbA)
      #   @player.x += 35 if button_down? (Gosu::KbRight)
      #   @player.x -= 35 if button_down? (Gosu::KbD)
      #   @player.x -= 35 if button_down? (Gosu::KbLeft)
      #   #Evitar que o player seja jogado para fora do mapa
      #   @player.y = 36 if @player.y < 36
      #   @player.y = 196 if @player.y > 196
      #   @player.x = 30 if @player.x < 30
      #   @player.x = 224 if @player.x > 224
      #   @player.vidas -= 1
      # end

      @bombs.each do |bomb|
        # Som da Bomba após explodir
        @damage_sound_effect.play if bomb.finished == true
        # Colisão BOMBA-BOSS
        @distanciaBomba = Gosu::distance(bomb.x, bomb.y, @boss.x, @boss.y)
        if @distanciaBomba - 10 < bomb.radius + @boss.radius then
          if bomb.finished == true then
            @boss.quantidade_de_vidas -= 1
            @image_index = 0 #reiniciar animação
          end
        end
      end
      #Condições que levam ao GAMEOVER
      if @player.vidas == 0 || @timer.tempo == 0 then
        @estado = :over
      end
      #Condições que levam a vitória
      if @boss.quantidade_de_vidas == 0
        @estado = :winner
      end
    when :over
      @battle_map_soundtrack.stop
      @gameover_screen_soundtrack.play(true)
    when :winner
      @battle_map_soundtrack.stop
      @winner_screen_soundtrack.play(true)
    end
  end

  # Método draw da Classe GAME
  # Responsável por toda exibição do jogo e pela troca/adição de imagens.
  def draw
    case @estado
    when :title
      @background_option1.draw(0, 0, 0) if @option == 1
      @background_option2.draw(0, 0, 0) if @option == 2
      @background_option3.draw(0, 0, 0) if @option == 3
    when :game
      @background_battle_map.draw(0, 0, 0)
      @player.draw
      # @boss.draw
      @timer.draw
      @bombs.each do |bomb|
        if bomb.finished == false
          bomb.draw
        else
          @bombs.delete(bomb)
        end
      end
    when :over
      @gameover_screen.draw(0, 0, 0)
    when :winner
      @winner_screen.draw(0, 0, 0)
    when :tutorial
      @tutorial_screen.draw(0, 0, 0)
    when :credits
      @credits_screen.draw(0, 0, 0)
    end
  end

  # Método button_down da Classe GAME
  # Responsável por identificar, através do parâmetro 'id', qual tecla está sendo pressionada.
  # De acordo com o '@estado' do jogo, teclas iguais podem possuir funções diferentes.
  def button_down(id)
    case @estado
    when :title
      case id
      when Gosu::KbW
        @option_sound_effect.play
        if @option > 1 then @option -= 1 elsif @option == 1 then @option = 3 end
      when Gosu::KbUp
        @option_sound_effect.play
        if @option > 1 then @option -= 1 elsif @option == 1 then @option = 3 end
      when Gosu::KbS
        @option_sound_effect.play
        if @option < 3 then @option += 1 elsif @option == 3 then @option = 1 end
      when Gosu::KbDown
        @option_sound_effect.play
        if @option < 3 then @option += 1 elsif @option == 3 then @option = 1 end
      when Gosu::KbReturn
        if @option == 1 then
          @title_screen_soundtrack.stop
          @option_sound_effect.play
          @estado = :game
          @bombs = []
          @timer = Timer.new
          @player = Player.new(self)
          @boss = Boss.new(self)
        end
        if @option == 2 then
          @estado = :tutorial
        end
        if @option == 3 then
          @estado = :credits
        end
      when Gosu::KbEscape
        exit
      end
    when :game
      case id
      when Gosu::KbSpace
          @bombs.push Bomb.new(@player.x, @player.y + 12) if @bombs.length < @player.bomb_limit
      when Gosu::KbEscape
          @estado = :title
      end
    when :over
      case id
      when Gosu::KbEscape
          @estado = :title
      end
    when :winner
      case id
      when Gosu::KbEscape
          @estado = :title
      end
    when :tutorial
      case id
      when Gosu::KbEscape
          @estado = :title
      end
    when :credits
      case id
      when Gosu::KbEscape
          @estado = :title
      end
    end
  end

end

window = GameWindow.new
window.show
