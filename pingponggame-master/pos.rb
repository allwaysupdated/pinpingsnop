
class Dot

    attr_reader :x, :y

    def initialize(position)
        @image = Gosu::Image.new('img/dot.bmp')
        @x_pos = 640 - 70
        @y_pos = 405
        if position == 'Down'
            @y_pos= 205

        else
            @y_pos= 275

        end

        #@y = (480 / 2) - @image.height / 2
    end

  
    def height
        return @image.height

    end

    def width
        return @image.width

    end
     
    def draw
        @image.draw(@x_pos, @y_pos, 0)

    end
    
end
