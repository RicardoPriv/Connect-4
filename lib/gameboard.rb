class Gameboard
  MAX_COLUMNS = 7
  MAX_ROWS = 6
  CONNECT = 4

  def initialize
    gameboard = Array.new
    MAX_ROWS.times do 
      new_row = Array.new(MAX_COLUMNS, nil)
      gameboard.push(new_row)
    end

    set_board(gameboard)
  end

  def get_board
    return @board
  end

  def set_board(board)
    @board = board
  end

  def winner?
    board = get_board.reverse
    won = false
      
    #iterates through the board and checks if there is a win where possible
    board.each_with_index do |row, row_index|
      row.each_with_index do |player, col_index|
        next if player.nil?
        
        #Checks for a horizontal match until it is no longer possible to match a win
        if col_index < (MAX_COLUMNS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless row[col_index + j] == row[col_index + j + 1]
            return player if j >= 2
          end
        end

        #Checks for a vertical match until it is no longer possible to match a win
        if row_index < (MAX_ROWS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless board[row_index + j][col_index] == board[row_index + j + 1][col_index]
            return player if j >= 2
          end
        end

        #Checks for a right diagonal match until it is no longer possible to match a win
        if col_index < (MAX_COLUMNS - CONNECT + 1) and row_index < (MAX_ROWS - CONNECT + 1) 
          (CONNECT - 1).times do |j|
            break unless board[row_index + j][col_index + j] == board[row_index + j + 1][col_index + j + 1]
            return player if j >= 2
          end
        end

        #Checks for a left diagonal match until it is no longer possible to match a win
        if  row_index < (MAX_ROWS - CONNECT + 1)
          (CONNECT - 1).times do |j|
            break unless board[row_index + j][col_index - j] == board[row_index + j + 1][col_index - j - 1]
            return player if j >= 2
          end
        end

      end
    end

    return nil
  end

  def full?
    top_row = get_board[0]
    top_row.each { |cell| return false if cell.nil? }
    return true
  end

  def insert_into_col(column, player)
    return false if column > MAX_COLUMNS

    board = get_board

    board.reverse_each do |row|
      if (row[column].nil?)
        row[column] = player
        return true
      end
    end

    return false
  end

  def print_board
    board = get_board
    board.each do |row|
      p row
    end
  end
end