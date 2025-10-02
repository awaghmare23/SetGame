require_relative 'game_process'
require_relative 'timer'
require_relative 'prompt'
require_relative 'management'

#Choose how smart the computer will be
def difficulty_level
	puts "\nChoose Difficulty:"
	puts "(1)Easy"
	puts "(2)Medium"
	puts "(3)Hard"
	print "Choose: "
	case gets.chomp()		
		when "1"
			n = 3
		when "2"
			n = 6
		when "3"
			n = 9
		else
			puts "Invalid input"
			n = 9
	end
        return (0..n).to_a
end

#Keeps track of scores for each player for both computer and multiplayers Mode
def scores(scoresArray, userIDArray, mode)
	if mode == 1
		puts "\nScoreboard:"
		puts "Computer: #{scoresArray[0]}"
		puts "You: #{scoresArray[1]}"
		sleep 3
		system "clear"
	elsif mode == 2
		puts "\nScoreboard:"
		x = 0
		while x < userIDArray.length do
			puts "#{userIDArray.fetch(x)}: #{scoresArray.fetch(x)}"
			x += 1
		end
		sleep 3
		system "clear"
	end
end


#Multiplayer, store playerIDs into an array 
def multiPlayer num
	i = 0
	userIDArray = Array.new num
	while i < num
		puts "Enter an ID for user #{i+1}:"
		currentPlayer = gets.chomp()
        
        #userID
		if currentPlayer.length == 0 || userIDArray.include?(currentPlayer)
			puts "ID has been used. Enter a valid ID!"
		else
			userIDArray[i] = currentPlayer
			i += 1
		end
	end
	return userIDArray
end