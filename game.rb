class Game
  attr_accessor :board

  def initialize(rows, columns)
    @board = Array.new(rows) do
      Array.new(columns)
    end
  end

  def print
    @board.length.times do |row|
      puts @board[row].inspect
    end
  end

  def neighbor_count(x, y)
    count = 0

    [-1, 0, 1].each do |y_offset|
      [-1, 0, 1].each do |x_offset|
        neighbor_y = y + y_offset
        neighbor_x = x + x_offset

        if neighbor_x >= 0 && neighbor_y >= 0 && @board[neighbor_y] && @board[neighbor_y][neighbor_x]
          #puts "(#{neighbor_x}, #{neighbor_y})"
          if y_offset != 0 || x_offset != 0
            count += 1 if @board[neighbor_y][neighbor_x]
          end
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
        #puts "(#{column}, #{row}): #{neighbors}"

        # < 2 die
        # 2, 3 live
        # > 3 die
        # 3 rebord
        if neighbors < 2 || neighbors > 3
          temporary_board[row][column] = nil
        elsif neighbors == 3
          temporary_board[row][column] = 1
        end
      end
    end

    @board = temporary_board
  end
end
