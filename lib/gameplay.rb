require_relative 'gameboard'

module Gameplay
  EXIT_CONDITION = 'e'.freeze

  def play
    gameboard = Gameboard.new
    current_player = :red

    while true
      gameboard.print_board
      input = get_user_input

      if input == EXIT_CONDITION
        puts 'Exiting the game. Goodbye!'
        break
      end

      column = input.to_i - 1
      if gameboard.insert_into_col(column, current_player)
        winner = gameboard.winner?

        if winner
          gameboard.print_board
          puts "#{winner.capitalize} wins!"
          break
        elsif gameboard.full?
          gameboard.print_board
          puts "It's a draw! The board is full."
          break
        end

        current_player = current_player == :red ? :blue : :red
      else
        puts "\nColumn is full, please try again."
      end
    end
  end

  def get_user_input
    print "\nPlease enter the column you wish to select to play this turn [1-7] or type '#{EXIT_CONDITION}' to quit: "
    while true
      input = gets.chomp

      return input if input.match?(/\A[-+]?\d+\z/) && input.to_i.between?(1, 7)
      return input if input.downcase == EXIT_CONDITION

      print "Invalid choice, please enter a number [1-7] or type 'exit' to quit: "
    end
  end
end
