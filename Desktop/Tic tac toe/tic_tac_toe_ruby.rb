{
  "eslint.enable": false
}


class Players
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Board 
  attr_reader :matrix

  GRID_SIZE = 3

  def initialize
    @matrix = Array.new(GRID_SIZE) { Array.new(GRID_SIZE) }
  end

  def display
    @matrix.each do | row |
     puts row.map { |cell|   cell.nil? ? " " :  cell }. join(" | ")
    end 
  end


  def no_space 
  @matrix.flatten.all? {|x| !x.nil? }
end


  def place_symbol(row, column, symbol)
    @matrix[row][column] = symbol
  end 

  def cell_empty?(row, column)  
  @matrix[row][column].nil?
  end 


def lines
  [[[0, 0], [1, 1], [2, 2]], 
  [[0, 2], [1, 1], [2, 0]],
  [[0, 0], [0, 1], [0, 2]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],
  [[0, 0], [1, 0], [2, 0]], 
  [[0, 1], [1, 1], [2, 1]],
  [[0, 2], [1, 2], [2, 2]]]

end

def three_in_a_row?
  lines.any? do |line|
  line = line.map { |pos| @matrix[pos[0]][pos[1]] }
   line.uniq.length == 1  &&  !line[0].nil?
  end 
end

end


class Game 
  def initialize (board, player1, player2)
    @board = board
    @players = [player1, player2]
  end


  def play
turn = 0 
  while !end_of_the_game?
  @board.display
  current_player = @players[turn % 2]
  puts current_player.symbol
  puts "which row ?"
  row = gets.chomp.to_i
  puts "which column ?"
  column = gets.chomp.to_i

  while !(0..2).include?(row) || !(0..2).include?(column) || !@board.cell_empty?(row, column)
    puts "Try again."
    puts "which row ?"
    row = gets.chomp.to_i
    puts "which column ?"
    column = gets.chomp.to_i
  end 

  @board.place_symbol(row, column, current_player.symbol)
   turn += 1 
  end 

  if @board.three_in_a_row? 
    puts "Well done #{current_player.symbol}, you won the game !" 

  else 
    puts "Game over, please try again ! "
  end 

end 


def end_of_the_game?
  @board.no_space || @board.three_in_a_row?
end 

end

Party1 = Board.new()
Alice = Players.new('Alice', 'X')
Bob = Players.new('Bob', 'O')
my_game = Game.new(Party1, Alice, Bob) 
my_game.play

