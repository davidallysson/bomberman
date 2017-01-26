$LOAD_PATH << '.'

require 'gosu'
require_relative 'player'
require_relative 'timer'

class GameWindow < Gosu::Window
  def initialize
    super(256, 240, true)
    self.caption = "BomberBraulio v.0.1"

    @option = 1
    @estado = :title
    @font = Gosu::Font.new(12)

    @bg_option1 = Gosu::Image.new("images/op1.png")
    @bg_option2 = Gosu::Image.new("images/op2.png")
    @bg_option3 = Gosu::Image.new("images/op3.png")
    @bg_battle = Gosu::Image.new("images/battle_map.png")

    @titleScreenOst = Gosu::Song.new("audio/TitleScreen.wav")
    @battleOst = Gosu::Song.new("audio/Battle.wav")
    @optionOst = Gosu::Sample.new("audio/opçãoSom.wav")

    @timer = Timer.new
    @player = Player.new(self)
  end

  def update
    case @estado
    when :title
      @titleScreenOst.play(true)
    when :game
      @timer.relogio
      @battleOst.play(true)
      @player.move_up if button_down? (Gosu::KbUp)
      @player.move_down if button_down? (Gosu::KbDown)
      @player.move_left if button_down? (Gosu::KbLeft)
      @player.move_right if button_down? (Gosu::KbRight)
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
      @player.draw

      @timer.draw
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

end

window = GameWindow.new
window.show
