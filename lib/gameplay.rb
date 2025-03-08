require_relative "gameboard.rb"

module Gameplay
  def play
    gameboard = Gameboard.new



    get_user_input

  end

  def get_user_input
    while true
      print "Please enter the column you wish to select to play this turn [1-7]:"
      input = gets.chomp

      return input if input.match?(/\A[-+]?\d+\z/) and input.to_i.between?(1, 7)
      print "\nInvalid choice\n"
    end
  end
end