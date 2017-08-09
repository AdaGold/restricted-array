# Simulating integer array from other, C like languages (C, C++, C#, Java)
# Native arrays in these languages have only certain methods available.
class RestrictedArray
  # creates a restricted array of default size i.e. 20 or of size passed
  def initialize(*args)
    if args.size == 0 # no size argument passed, assume 20
      @array_size = 1 + rand(20)
    elsif args.size == 1 # create array of size passed
      @array_size = args[0]
    else # more than one argument passed - throw exception
      raise ArgumentError.new("More than 1 arguments passed. Expected 0 or 1 argument.")
    end

    # Composition used instead of Inheritance. Other methods of Array class will
    # not be accessible by consumers of RestrictedArray. Encapsulation allows us
    # to change internal workings later, without impacting other consumers of
    # this class.
    @internal_array = Array.new(@array_size){ |index| index + rand(1..200)}
  end

  # Given the index 'key', returns the value at that index in the restricted array
  def [](key)
    if key >= 0 && key < @array_size
      return @internal_array[key]
    else
      return nil
    end
  end

  # Updates the value at the specified index 'key'
  def []=(key, value)
    if key >= 0 && key < @array_size
      @internal_array[key] = value
    end
  end
end
