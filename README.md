# Connect 4

This is a simple command-line Connect 4 game written in Ruby. Two players take turns dropping pieces into columns on a grid. The objective is to be the first to connect four pieces vertically, horizontally, or diagonally.

## Features

- Two players alternate turns.
- Players drop their pieces into one of seven columns.
- The game detects wins (vertical, horizontal, or diagonal).
- The game detects when the board is full and ends in a draw.
- The game board is visually represented with colored "o" characters.
- Players can exit the game at any time by entering "e" during a prompt.

## Requirements

You need Ruby installed on your system. Check your Ruby version with:

```bash
ruby -v
```

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/RicardoPriv/Connect-4.git
   cd Connect-4
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Run the game:

   ```bash
   ruby ./main.rb
   ```

## Example

```
Note: console adds color
```

```
-------------
| | | | | | | 
-------------
| | | | | | | 
-------------
| | | | | | | 
-------------
| | | | | | | 
-------------
|o| | | | | | 
-------------
|o|o| | | | | 
-------------

Please enter the column you wish to select to play this turn [1-7] or type 'e' to quit: 
```

## Game Flow

1. The game starts by displaying a blank board.
2. Players are prompted to enter a column (1-7) or type "e" to exit.
3. The selected column is used to drop the player's piece into the lowest available slot.
4. The board is reprinted after every move.
5. After each move, the game checks for a win or a draw.
6. The game ends when a player wins or the board is full.

## Exit Condition

Type "e" at any input prompt to exit the game.

## Files

- **main.rb**: The entry point of the game.
- **lib/gameplay.rb**: Contains the main game logic.
- **lib/gameboard.rb**: Manages the game board, including inserting pieces and detecting wins.
- **Gemfile**: Specifies the project dependencies.
- **spec/**: Contains the RSpec tests for the project.

## Testing

The project includes automated tests using RSpec. To run the tests, execute:

```bash
bundle exec rspec
```