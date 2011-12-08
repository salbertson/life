require "test/unit"
require "game"

class GameTest < Test::Unit::TestCase
  def test_initialize
    game = Game.new(2, 3)
    assert_equal [[nil, nil, nil],[nil, nil, nil]], game.board
  end

  def test_neighbor_count
    game = Game.new(3, 3)
    game.board[0][1] = 1
    game.board[1][1] = 1
    game.board[2][1] = 1

    assert_equal 2, game.neighbor_count(0, 0)
    assert_equal 1, game.neighbor_count(1, 0)
    assert_equal 2, game.neighbor_count(1, 1)
  end

  def test_play
    game = Game.new(3, 3)
    game.board[0][1] = 1
    game.board[1][1] = 1
    game.board[2][1] = 1
    game.play

    assert_equal([[nil, nil, nil],[1, 1, 1], [nil, nil, nil]], game.board)
  end
end
