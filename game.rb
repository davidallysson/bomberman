$LOAD_PATH << '.'

#Classes Importadas
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
    @optionOst = Gosu::Sample.new("audio/opçãoSom.wav")
    #Objetos
    @player = Player.new(self)
  end

  #Método Update principal.
  #Executa os métodos Updates secundários de acordo com o estado do jogo
  def update
    if @estado == "titleScreen" then
      update_title_scene
    elsif @estado == "jogando" then
      update_jogando
    end
  end

  #Executa a música específica para a titleScreen
  def update_title_scene
    @titleScreenOst.play(true)
  end

  #Executa a música de batalha e executa os movimentos do player.
  def update_jogando
    @battleOst.play(true)
    if Gosu::button_down? Gosu::KbUp then
      @player.move_up
    end
    if Gosu::button_down? Gosu::KbDown then
      @player.move_down
    end
    if Gosu::button_down? Gosu::KbLeft then
      @player.move_left
    end
    if Gosu::button_down? Gosu::KbRight  then
      @player.move_right
    end
  end

  #Método Draw principal.
  #Executa os métodos Draws secundários de acordo com o estado do jogo
  def draw
    if @estado == "titleScreen" then
      draw_title_scene
    elsif @estado == "jogando" then
      draw_jogando
    end
  end

  #Alterna entre as imagens de acordo com o valor do atributo @option
  def draw_title_scene
    if @option == 1  then
      @bg_option1.draw(0, 0, 0)
    elsif @option == 2 then
      @bg_option2.draw(0, 0, 0)
    elsif @option == 3 then
      @bg_option3.draw(0, 0, 0)
    end
  end

  #Exibe o Background e o personagem na tela
  def draw_jogando
    @bg_battle.draw(0, 0, 0)
    @player.draw
  end

  def button_down(id)
    #TITLESCREEN
    if @estado == "titleScreen" then
      #Altera o valor do atributo de acordo com a tecla pressionada.
      if id == Gosu::KbUp && @option > 1 then
        @option -= 1
        @optionOst.play
      elsif id == Gosu::KbUp && @option == 1 then
        @option = 3
        @optionOst.play
      end
      if id == Gosu::KbDown && @option < 3 then
        @option += 1
        @optionOst.play
      elsif id == Gosu::KbDown && @option == 3 then
        @option = 1
        @optionOst.play
      end
      #Troca o estado do jogo caso a opção "Start" seja selecionada e a tecla Enter seja pressionada
      if id == Gosu::KbReturn && @option == 1 then
        @titleScreenOst.stop
        @estado = "jogando"
      end
    end
  end

end

window = GameWindow.new
window.show
