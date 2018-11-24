
# class for an imaginary number
class Imaginary

    # make sure the user can access object's property variables
    attr_accessor :real, :i

    # init function
    def initialize (real, i)
        # assign property variables
        @real = real
        @i = i
    end

    # constant for imaginary unit 'i'
    def self.I
        Imaginary.new(0.0, 1.0)
    end
    # set constant for real unit 1, output an imaginary number object
    def self.ONE
        Imaginary.new(1.0, 0.0)
    end

    # alternative method for getting real value
    def re
        @real
    end
    # alternative method for setting real value
    def re=(val)
        @real = val
    end

    # alternative method for getting imaginary value
    def im
        @i
    end
    # alternative method for setting imaginary value
    def im=(val)
        @i = val
    end

    # add something to imaginary object
    def + (other)
        # check if added number is class other imaginary number
        if other.is_a?(Imaginary)
            # add both imaginary and real parts
            Imaginary.new(@real + other.real, @i + other.i)
        else
            # add other number as if it was a natural number
            Imaginary.new(@real + other, @i)
        end
    end

    # subtract something from imaginary object
    def - (other)
        # check if subtracted number is class other imaginary number
        if other.is_a?(Imaginary)
            # subtract both imaginary and real parts
            Imaginary.new(@real - other.real, @i - other.i)
        else
            # subtract other number as if it was a natural number
            Imaginary.new(@real - other, @i)
        end
    end

    # multiply something with imaginary object
    def * (other)
        # check if other number is also imaginary object
        if other.is_a?(Imaginary)
            # calculate new imaginary object's properties
            real = @real * other.real - @i * other.i
            i = @real * other.i + @i * other.real
            Imaginary.new(real, i)
        else
            # multiply other number as if it was a natural number
            Imaginary.new(@real * other, @i * other)
        end
    end

    # divide something with imaginary object
    def / (other)
        # check if other number is also imaginary object
        if other.is_a?(Imaginary)
            # calculate new imaginary object's properties
            under_line = other.real ** 2 + other.i ** 2
            before_real = @real * other.real + @i * other.i
            before_i = @i * other.real - @real * other.i
            real = before_real / under_line
            i = before_i / under_line
            Imaginary.new(real, i)
        else
            # divide other number as if it was a natural number
            Imaginary.new(@real / other, @i / other)
        end
    end

    # get the radius of polar coordinates
    def radius
        # use pythagorian theorem to solve
        (@real ** 2 + @i ** 2) ** 0.5
    end

    # tries to convert number to real number
    def to_num
        # check if there is an imaginary part
        # if there is, return nil
        if @i != 0
            nil
        else
            @real
        end
    end

    # set output when displaying info about object
    def to_s
        if @real == 0 && @i == 0
            "0"
        elsif @real == 0
            @i.to_s + "i"
        elsif @i == 0
            @real.to_s
        else
            if @i < 0
                @real.to_s + " - " + (@i * -1).to_s + "i"
            else
                @real.to_s + " + " + @i.to_s + "i"
            end
        end
    end

end
