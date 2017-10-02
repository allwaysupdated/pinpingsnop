#@player_2.width @player_2.height
require 'gosu' #require is for gems.
require_relative 'ball.rb' #require_relative is for files.
require_relative 'paddle.rb'
require_relative 'pos.rb'
class PingPong < Gosu::Window

    def initialize()
        super(640,480)
        setup
        
    end

    def setup
        @player_1 = Paddle.new('left')
        @player_2 = Paddle.new('right')
        @ball = Ball.new('img/ball.bmp', @player_1)
        @pos_1 = Dot.new('Down')
        @pos_2 = Dot.new('Up')
    end
    
    def update
        #sleep(0.1)
        collide
        @ball.update
        # p @player_1.xy
        # p @player_2.xy
        # p @balls[0].xy
        if button_down?(Gosu::KbS)
            @player_1.move_down

        elsif button_down?(Gosu::KbW)
            @player_1.move_up

        end
        
        if button_down?(Gosu::KbDown)
            @player_2.move_down

        elsif button_down?(Gosu::KbUp)
            @player_2.move_up
            
        end
      #  score
     #   p "player Y: " + (@player_2.y).to_s
      #  p "Ball Y:" + (@ball.y).to_s #+ 30
        #p @player_2.y 
        #p @player_2.y+70
        
    end

    # def scorer_1
    #     @score_1 =+1

    # end

    # def scorer_2
    #     @score_2 =+1

    # end

    def collide
        if @ball.x+10 >= @player_2.x-36 &&  @ball.x >= @player_2.x && @ball.y >= @player_2.y-30 && @ball.y <= @player_2.y+70

           @ball.bounce_x
           @ball.bounce_y
           p "yes"
           #scorer_2
        elsif @ball.x <= @player_1.x && @ball.x <= @player_1.x + @player_1.width && @ball.y >= @player_1.y && @ball.y <= @player_1.y + @player_1.height
            
            @ball.bounce_x
            @ball.bounce_y
            p "neat"
            #scorer_1
        end

    end
    
    def draw
        @ball.draw
        @player_1.draw
        @player_2.draw
        @pos_1.draw
        @pos_2.draw
       # @image.draw( "yes", 55, options ={} )
       
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close

        else
            super

        end

  end

end

c = PingPong.new
c.show
