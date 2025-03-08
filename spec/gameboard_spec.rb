# spec/gameboard_spec.rb

require "./lib/gameboard.rb"

describe Gameboard do
  describe "#board_changes" do
    it "Creates a blank board" do
      gameboard = Gameboard.new
      expected_board = Array.new(6) { Array.new(7, nil) }
      expect(gameboard.get_board).to eql(expected_board)
    end

    it "Makes one move for each player" do
      gameboard = Gameboard.new
      gameboard.insert_into_col(5, :red)
      gameboard.insert_into_col(4, :blue)

      expected_board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, :blue, :red, nil]
      ]

      expect(gameboard.get_board).to eql(expected_board)
    end

    it "Detects a vertical win" do
      gameboard = Gameboard.new
      4.times { gameboard.insert_into_col(3, :red) }
      expect(gameboard.winner?).to eql(:red)
    end

    it "Detects a horizontal win" do
      gameboard = Gameboard.new
      4.times { |col| gameboard.insert_into_col(col, :red) }
      expect(gameboard.winner?).to eql(:red)
    end

    it "Detects a diagonal win (bottom-left to top-right)" do
      gameboard = Gameboard.new
      gameboard.insert_into_col(0, :red)
      gameboard.insert_into_col(1, :blue)
      gameboard.insert_into_col(1, :red)
      gameboard.insert_into_col(2, :blue)
      gameboard.insert_into_col(2, :blue)
      gameboard.insert_into_col(2, :red)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :red)

      expect(gameboard.winner?).to eql(:red)
    end

    it "Detects a diagonal win (bottom-right to top-left)" do
      gameboard = Gameboard.new
      gameboard.insert_into_col(6, :red)
      gameboard.insert_into_col(5, :blue)
      gameboard.insert_into_col(5, :red)
      gameboard.insert_into_col(4, :blue)
      gameboard.insert_into_col(4, :blue)
      gameboard.insert_into_col(4, :red)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :blue)
      gameboard.insert_into_col(3, :red)


      gameboard.print_board
      p "---"
      expect(gameboard.winner?).to eql(:red)
    end

    it "Detects a draw when the board is full" do
      gameboard = Gameboard.new
      (0..6).each { |col| 3.times { gameboard.insert_into_col(col, :red) } }
      (0..6).each { |col| 3.times { gameboard.insert_into_col(col, :blue) } }
      
      gameboard.print_board
      p "---"
      expect(gameboard.full?).to eql(true)
    end

    it "Prevents inserting into a full column" do
      gameboard = Gameboard.new
      6.times { gameboard.insert_into_col(3, :red) }

      expect(gameboard.insert_into_col(3, :blue)).to eql(false)
    end
  end
end
