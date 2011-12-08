class Game
  attr_accessor :board

  def initialize(rows, columns)
    @board = Array.new(rows) do
      Array.new(columns)
    end
  end
end
