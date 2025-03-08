require 'colorize'

class Gameboard
  MAX_COLUMNS = 7
  MAX_ROWS = 6
  CONNECT = 4

  def initialize
    gameboard = []
    MAX_ROWS.times do
      new_row = Array.new(MAX_COLUMNS, nil)
      gameboard.push(new_row)
    end

    set_board(gameboard)
  end

  def get_board
    @board
  end

  def set_board(board)
    @board = board
  end

  def winner?
    board = get_board.reverse

    # iterates through the board and checks if there is a win where possible
    board.each_with_index do |row, row_index|
      row.each_with_index do |player, col_index|
        next if player.nil?

        # Checks for a horizontal match until it is no longer possible to match a win
        if col_index < (MAX_COLUMNS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless row[col_index + j] == row[col_index + j + 1]
            return player if j >= 2
          end
        end

        # Checks for a vertical match until it is no longer possible to match a win
        if row_index < (MAX_ROWS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless board[row_index + j][col_index] == board[row_index + j + 1][col_index]
            return player if j >= 2
          end
        end

        # Checks for a right diagonal match until it is no longer possible to match a win
        if col_index < (MAX_COLUMNS - CONNECT + 1) and row_index < (MAX_ROWS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless board[row_index + j][col_index + j] == board[row_index + j + 1][col_index + j + 1]
            return player if j >= 2
          end
        end

        # Checks for a left diagonal match until it is no longer possible to match a win
        next unless row_index < (MAX_ROWS - CONNECT + 1)

        (CONNECT - 1).times do |j|
          break unless board[row_index + j][col_index - j] == board[row_index + j + 1][col_index - j - 1]
          return player if j >= 2
        end
      end
    end

    nil
  end

  def full?
    top_row = get_board[0]
    top_row.each { |cell| return false if cell.nil? }
    true
  end

  def insert_into_col(column, player)
    return false if column > MAX_COLUMNS

    board = get_board

    board.reverse_each do |row|
      if row[column].nil?
        row[column] = player
        return true
      end
    end

    false
  end

  def print_board
    board = get_board
    board.each do |row|
      print "\n-------------\n"
      row.each do |element|
        print '|'
        if element.nil?
          print ' '.colorize(color: :light_black) # Empty spaces
        else
          color = element == :red ? :red : :blue
          print 'o'.colorize(color) # Red or Blue move
        end
      end
    end

    print "\n-------------\n"
  end
end
