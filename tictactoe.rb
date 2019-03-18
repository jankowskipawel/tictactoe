class Area
	attr_accessor :symbol

	def initialize(symbol)
		@symbol = symbol
	end

	private

	def self.display_board(board)
		puts "-------------"
		puts "| #{board[0].symbol} | #{board[1].symbol} | #{board[2].symbol} |"
		puts "-------------"
		puts "| #{board[3].symbol} | #{board[4].symbol} | #{board[5].symbol} |"
		puts "-------------"
		puts "| #{board[6].symbol} | #{board[7].symbol} | #{board[8].symbol} |"
		puts "-------------"
	end

end

def choose(player, board)
	is_chosen = false
	while !is_chosen
		Area.display_board(board)
		puts "Player #{player} choice: "
		choice = gets.chomp.to_i
		if !choice.between?(1,9) || board[choice-1].symbol == "o" || board[choice-1].symbol == "x"
			puts "Incorrect input. Try again"
			redo
		else
			player == "1" ? board[choice-1].symbol = "x" : board[choice-1].symbol = "o"
			is_chosen = true
		end
	end
end

def all_equal?(arr)
	arr.uniq.size <= 1
end

def game_won?(board, i)
	a1 = [[board[0].symbol, board[1].symbol, board[2].symbol],
				[board[3].symbol, board[4].symbol, board[5].symbol],
				[board[6].symbol, board[7].symbol, board[8].symbol],
				[board[0].symbol, board[3].symbol, board[6].symbol],
				[board[1].symbol, board[4].symbol, board[7].symbol],
				[board[2].symbol, board[5].symbol, board[8].symbol],
				[board[0].symbol, board[4].symbol, board[8].symbol],
				[board[2].symbol, board[4].symbol, board[6].symbol]]
	if i == 9
		Area.display_board(board)
		puts "DRAW!"
		return true
	end   																	#357196482
	a1.each do |x|
		if all_equal?(x)
			Area.display_board(board)
			puts "#{x[0]} WINS!"
			return true
		end
	end
	return false
end

board = [Area.new("1"), Area.new("2"), Area.new("3"), 
				 Area.new("4"), Area.new("5"), Area.new("6"), 
				 Area.new("7"), Area.new("8"), Area.new("9")]

puts "\n			TIC TAC TOE"
puts "2 players. Type number where you want to put your symbol."

i = 0

while true
	choose("1", board)
	i += 1
	game_won?(board, i) ? break : true

	choose("2", board)
	i+= 1
	game_won?(board, i) ? break : true
end