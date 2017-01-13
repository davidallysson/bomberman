$LOAD_PATH << '.'

require 'gosu'
require_relative 'player'
require_relative 'solid'

class GameWindow < Gosu::Window
  def initialize
    super(256, 240, true)
    self.caption = "BomberBraulio v.0.1"

    @option = 1
    @estado = :title
    @font = Gosu::Font.new(12)
    @distancia = nil

    @bg_option1 = Gosu::Image.new("images/op1.png")
    @bg_option2 = Gosu::Image.new("images/op2.png")
    @bg_option3 = Gosu::Image.new("images/op3.png")
    @bg_battle = Gosu::Image.new("images/battle_map_void.png")

    @titleScreenOst = Gosu::Song.new("audio/TitleScreen.wav")
    @battleOst = Gosu::Song.new("audio/Battle.wav")
    @optionOst = Gosu::Sample.new("audio/opçãoSom.wav")

    @player = Player.new(self)
    @solidos = Array.new(5) { Array.new(6) }

    criar_mapa
  end

  def update
    case @estado
    when :title
      @titleScreenOst.play(true)
    when :game
      @battleOst.play(true)
      if verificar_obstaculo? == false
        @player.move_up if button_down? (Gosu::KbUp)
        @player.move_down if button_down? (Gosu::KbDown)
        @player.move_left if button_down? (Gosu::KbLeft)
        @player.move_right if button_down? (Gosu::KbRight)
      end
    end
  end

  def draw
    case @estado
    when :title
      @bg_option1.draw(0, 0, 0) if @option == 1
      @bg_option2.draw(0, 0, 0) if @option == 2
      @bg_option3.draw(0, 0, 0) if @option == 3
    when :game
      @bg_battle.draw(0, 0, 0)
      @solidos.each do |solid|
        solid.each do |s|
          s.draw
        end
      end
      @player.draw
    end
  end

  def button_down(id)
    case @estado
    when :title
      case id
      when Gosu::KbUp
        @optionOst.play
        if @option > 1 then @option -= 1 elsif @option == 1 then @option = 3 end
      when Gosu::KbDown
        @optionOst.play
        if @option < 3 then @option += 1 elsif @option == 3 then @option = 1 end
      when Gosu::KbReturn
        if @option == 1 then
          @titleScreenOst.stop
          @optionOst.play
          @estado = :game
        end
      end
    end
  end

  def criar_mapa
    for i in 0..4 do
      for j in 0..5 do
        @solidos[i][j] = Solid.new(self)
        @solidos[i][j].x += (32 * (j + 1))
        @solidos[i][j].y += (32 * (i + 1))
      end
    end
  end

  #Método em construção ...
  def verificar_obstaculo?
    @solidos.dup.each do |solid|
      solid.dup.each do |s|
        @distancia = Gosu::distance(@player.x, @player.y, s.x, s.y)
        if @distancia < @player.radius + s.radius
          true
        end
      end
    end
    false
  end

end

window = GameWindow.new
window.show
