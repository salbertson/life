require "test/unit"
require "game"

class GameTest < Test::Unit::TestCase
  def test_board_initialization
    game = Game.new(2, 3)
    assert_equal [[nil, nil, nil],[nil, nil, nil]], game.board
  end
end
