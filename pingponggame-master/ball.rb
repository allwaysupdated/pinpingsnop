class Ball

    attr_reader :x, :y

    def initialize(image_path, player)
        @player = player
        @image = Gosu::Image.new(image_path)
        #@val = 1
        #@speed = 2
        @vel_x = set_initial_speed #@speed
        @vel_y = set_initial_speed
        @x = (640 / 2) - @image.width / 2
        @y = (480 / 2) - @image.height / 2
       # @xy = xy
    end

    # def val_set
    #     @val +=1
    #     @speed +=0.5
    #     @vel_x = @val
    # end



    def set_initial_speed
        speed = 3#@val # rand(-3..3)
        if speed == 0
            set_initial_speed
        else
            return speed
            
        end
        
    end

    

    def bounce_x
         @vel_x *= -1
       # val_set
    end

    def bounce_y
         @vel_y *= -1
        # val_set
    end

    def update
        @x += @vel_x
        @y += @vel_y
        
        if @x <= 0
            @x = 0
            @vel_x *= -1

        elsif @y <= 0
            @y = 0
            @vel_y *= -1

        elsif @x >= 640# - @image.width
            @x = 640 - @image.width
            @vel_x *= -1
            
        elsif @y >=480 #- @image.height
            @y = 480 - @image.height
            @vel_y *= -1

        end
        set_initial_speed
        #@speed = @val
       # p @speed
        #p "yes " +@vel_x.to_s
    end

    def draw
        @image.draw_rot(@x, @y, 0,@x)

    end

end
