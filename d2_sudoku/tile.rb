require 'colorize'
require 'colorized_string'


class Tile

  attr_reader :value

  def initialize(value, given = "0")
    @value = value
    @given = given
  end

  def colorize_tile(given)
    if given != "0"
      @value.colorize(:blue)
    end
  end

end
