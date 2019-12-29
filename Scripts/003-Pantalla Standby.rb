#===============================================================================
# ➤ Pantalla Standby (press C)
#-------------------------------------------------------------------------------
# ● Animación de la pantalla con el nombre del juego
#-------------------------------------------------------------------------------
#===============================================================================

class Pantalla_Standby
    
  def initialize
    Jess.BGM("ABT02A")
    
    @p_u = 0
    @p_u2 = 0
    
    @viewport = Viewport.new(Graphics.x,Graphics.y,Graphics.width,Graphics.height)
    @viewport.z = 99999
    
    @Fondo = Sprite.new(nil,true)
    @Fondo.z = 99999
    @Fondo.bitmap = Bmp.titles("GT03A")
    @Fondo.opacity = 0
      
    @ball = Sprite.new
    @ball.z = 99999
    @ball.bitmap = Bmp.titles("GT03E")
    @ball.x = 260
    @ball.y = 340
    @ball.src_rect.set(0,0,@ball.bitmap.width/2,@ball.bitmap.height)
    @ball.visible = false
    @ball.ox = @ball.bitmap.width/4
    @ball.oy = @ball.bitmap.height
      
    @Logo_1 = Sprite.new
    @Logo_1.z = 99999
    @Logo_1.bitmap = Bmp.titles("GT03B")
    @Logo_1.opacity =100
    @Logo_1.tone = Tone.new(0,0,0,255)
    @Logo_1.y = -90
    @Logo_1.x = 60
      
    @Logo_2 = Sprite.new
    @Logo_2.z = 99999
    @Logo_2.bitmap = Bmp.titles("GT03C")
    @Logo_2.opacity =0
    @Logo_2.y = 140
    @Logo_2.x = 132
      
    @Logo_3 = Sprite.new
    @Logo_3.z = 99999
    @Logo_3.bitmap = Bmp.titles("GT03D")
    @Logo_3.opacity =0
    @Logo_3.y = 370
    @Logo_3.x = 221
      
    @fog_v = Viewport.new(@Fondo.x,Graphics.ox,@Fondo.bitmap.width*2,Graphics.height)
    @fog_v.z=99999
    @Fog = Sprite.new(@fog_v)
    @Fog.z=99999
    @Fog.bitmap = Bmp.fogs("GFT01A")
    @Fog.visible = false
    @Fog.opacity=150
    @Fog.zoom_y = 1.2
      
    loop do
      @Logo_1.y+= 1
      @Fondo.opacity+=10 if @Fondo.opacity < 250
      @Fondo.y-=2
      Graphics.wait
      break if @Fondo.y<(Graphics.height-(@Fondo.bitmap.height)+20) || Input.press?(Input::B)
    end
      
    @Fondo.y = 0-(@Fondo.bitmap.height-20)+Graphics.height
    @viewport.tone = Tone.new(233,232,242)
    @Fondo.tone = Tone.new(233,232,242)
    @Logo_1.tone = Tone.new(233,232,242)
    @Logo_2.tone = Tone.new(233,232,242)
    @ball.tone = Tone.new(233,232,242)

    @Logo_1.opacity = 150
    @Logo_1.y = 50
    @Logo_2.opacity =255
    Graphics.wait(10)
    @Fondo.opacity = 255
    @Logo_3.opacity = 255
    @Fog.visible = true
    @ball.visible = true
    
    for i in 0..25
      @viewport.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      @Fondo.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      @Logo_1.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      @Logo_2.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      @Logo_3.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      @ball.tone = Tone.new(250-(i*10),250-(i*10),250-(i*10))
      Graphics.wait
    end
      
    loop do
      press_update
      @p_u2+=1
      @p_u+=1 if @p_u2 == 2
      @p_u2 = 0 if @p_u2== 2
      Graphics.wait
      if Input.trigger?(Input::C); j_SEselec; break; end
    end
    
    dispose
    
  end
    
  def dispose
    @ball.src_rect.set(@ball.bitmap.width/2,0,@ball.bitmap.width/2,@ball.bitmap.height)
    Graphics.wait(6)
    for i in 0..25
      @viewport.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @Fondo.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @Logo_1.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @Logo_2.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @Logo_3.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @ball.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      @fog_v.tone = Tone.new(-1*(i*10),-1*(i*10),-1*(i*10))
      Graphics.wait
    end
    
    @Logo_3.dispose
    @Logo_2.dispose
    @Logo_1.dispose
    @Fondo.dispose
    @Fog.dispose
    @ball.dispose
    @viewport.dispose
    @fog_v.dispose
    Jess.BGM("")
  end
    
  def press_update
    @Logo_1.y+=2 if @p_u == 1
    @Logo_2.y+=2 if @p_u == 11
    @Logo_1.y-=2 if @p_u == 11
    @Logo_2.y-=2 if @p_u == 1
    @Logo_3.opacity = 20*@p_u if @p_u<11
    @Logo_3.opacity = 200-(25*(@p_u/2)) if @p_u>10
    @p_u = 0 if @p_u == 21
    @Fog.opacity+=4 if @p_u<11
    @Fog.opacity-=4 if @p_u>10 && @p_u<21
    @ball.angle-=1 if @p_u<9
    @ball.angle+=1 if @p_u>8 && @p_u<18
  end
    
end


#===============================================================================
#
#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
#===============================================================================