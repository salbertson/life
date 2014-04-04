class Game
  # Improvements:
  # - Create classes for board (colony?), and cell
  # - Allow cells to "loop" the board by calculating neighbor count with modulus
  # - Play endlessly, dump out board each iteration, and clear previous output

  attr_accessor :board

  def initialize(rows, columns)
    @board = Array.new(rows) do
      Array.new(columns, 0)                 
    end
  end

  def neighbor_count(x, y)
    count = 0

    [-1, 0, 1].each do |y_offset|
      [-1, 0, 1].each do |x_offset|
        neighbor_y = y + y_offset
        neighbor_x = x + x_offset

        if y_offset != 0 || x_offset != 0
          count += 1 if alive?(neighbor_x, neighbor_y)
        end
      end
    end

    count
  end

  def play
    temporary_board = Marshal.load(Marshal.dump(@board))

    @board.length.times do |row|
      @board.first.length.times do |column|
        neighbors = neighbor_count(column, row)

        if neighbors < 2 || neighbors > 3
          temporary_board[row][column] = 0
        elsif neighbors == 3
          temporary_board[row][column] = 1
        end
      end
    end

    @board = temporary_board
  end

  def print
    @board.length.times do |row|
      puts @board[row].map {|cell| cell == 1 ? "." : " "}.join
    end
  end


  private

  def alive?(x, y)
    cell = nil

    if x >= 0 && y >= 0 && @board[y] && @board[y][x]
      cell = @board[y][x]
    end

    return cell == 1 ? true : false
  end
end
