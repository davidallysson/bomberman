$LOAD_PATH << '.'

require 'gosu'
require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super(256, 240, true)
    self.caption = "BomberBraulio v.0.1"

    #Opções do Menu
    @option = 1
    #Estado Inicial do Game
    @estado = "titleScreen"
    #Backgrounds
    @bg_option1 = Gosu::Image.new("images/op1.png")
    @bg_option2 = Gosu::Image.new("images/op2.png")
    @bg_option3 = Gosu::Image.new("images/op3.png")
    @bg_battle = Gosu::Image.new("images/battle_map.png")
    #SoundTracks
    @titleScreenOst = Gosu::Song.new("audio/TitleScreen.wav")
    @battleOst = Gosu::Song.new("audio/Battle.wav")
    #Objetos
    @player = Player.new(self)
  end

  def update
    if @estado == "titleScreen" then
      update_title_scene
    elsif @estado == "jogando" then
      update_jogando
    end
  end

  def update_title_scene
    @titleScreenOst.play(true)
  end

  def update_jogando
    @battleOst.play(true)
  end

  def draw
    if @estado == "titleScreen" then
      draw_title_scene
    elsif @estado == "jogando" then
      draw_jogando
    end
  end

  def draw_title_scene
    if @option == 1  then
      @bg_option1.draw(0, 0, 0)
    elsif @option == 2 then
      @bg_option2.draw(0, 0, 0)
    elsif @option == 3 then
      @bg_option3.draw(0, 0, 0)
    end
  end

  def draw_jogando
    @bg_battle.draw(0, 0, 0)
    @player.draw
  end

  def button_down(id)
    #TITLESCREEN
    if @estado == "titleScreen" then
      #Troca as opções
      if id == Gosu::KbUp && @option > 1 then
        @option -= 1
      elsif id == Gosu::KbUp && @option == 1 then
        @option = 3
      end
      if id == Gosu::KbDown && @option < 3 then
        @option += 1
      elsif id == Gosu::KbDown && @option == 3 then
        @option = 1
      end
      #Troca de tela
      if button_down?(Gosu::KbReturn) && @option == 1 then
        @titleScreenOst.stop
        @estado = "jogando"
      end
    end
    #PLAYING
    if @estado == "jogando" then
      if id == Gosu::KbUp then
        @player.move_up
      end
      if id == Gosu::KbDown then
        @player.move_down
      end
      if id == Gosu::KbLeft then
        @player.move_left
      end
      if id == Gosu::KbRight then
        @player.move_right
      end
    end
  end

end

window = GameWindow.new
window.show
