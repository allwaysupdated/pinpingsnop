class Paddle

    attr_reader :x, :y

    def initialize(position)
        @image = Gosu::Image.new('img/paddle.bmp')
        
        if position == 'left'
            @x = 20

        else
            @x = 640 - 70

        end

        @y = (480 / 2) - @image.height / 2
      
    end

    def height
        return @image.height

    end

    def width
        return @image.width

    end

    def move_up
        @y -= 5

    end
    
    def move_down
        @y += 5

    end
    
    def draw
        @image.draw(@x, @y, 0)

    end
    
end
