require "game"

describe Game do
  describe "#board" do
    before(:each) do
      @game = Game.new(2, 3)
    end

    describe "without cells" do
      it "should return empty board" do
        @game.board.should == [[nil, nil, nil],[nil, nil, nil]]
      end
    end

    describe "with cells" do
      before(:each) do
        @game.board[0][0] = 1
        @game.board[1][2] = 1
      end

      it "should return board with expected cells" do
        @game.board.should == [[1, nil, nil],[nil, nil, 1]]
      end
    end
  end

  describe "#neighbor_count" do
    before(:each) do
      @game = Game.new(3, 3)
    end

    describe "with a blinker pattern" do
      before(:each) do
        # http://en.wikipedia.org/wiki/File:Game_of_life_blinker.gif
        @game.board[0][1] = 1
        @game.board[1][1] = 1
        @game.board[2][1] = 1
      end

      it "should return expected neighbor counts" do
        @game.neighbor_count(0, 0).should == 2
        @game.neighbor_count(1, 0).should == 1
        @game.neighbor_count(1, 1).should == 2
      end
    end
  end

  describe "#play" do
    before(:each) do
      @game = Game.new(3, 3)
    end

    describe "with blinker pattern" do
      before(:each) do
        @game.board[0][1] = 1
        @game.board[1][1] = 1
        @game.board[2][1] = 1
      end

      describe "with one iteration" do
        before(:each) do
          @game.play
        end

        it "should swap blinker from vertical to horizontal" do
          @game.board.should == [[nil, nil, nil],[1, 1, 1], [nil, nil, nil]]
        end
      end

      describe "with two iterations" do
        before(:each) do
          @game.play
          @game.play
        end

        it "should return to starting position" do
          @game.board.should == [[nil, 1, nil],[nil, 1, nil], [nil, 1, nil]]
        end
      end
    end
  end
end
