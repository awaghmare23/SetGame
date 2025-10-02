<<<<<<< HEAD
require_relative 'game_process'
require_relative 'players'
require_relative 'timer'
require_relative 'prompt'
require_relative 'management'
require_relative 'existence_pair_check'

def game_process
	#single player or multiplayer
	mode_number = mode
    
	#initialize
	numbers = [1, 2, 3]
	shades = ["solid", "striped", "open"]
	colors = ["red", "green", "purple"]
	shapes = ["diamond", "squiggle", "oval"]

	cards=numbers.product(shades).product(colors).product(shapes).shuffle
	cards.each {|card| card.flatten!}
	active=[]

	#block to display instructions for single player or multiplayer and to get player information from multiplayer
	if mode_number == 1
		instructions?(2)
		system "clear" 
		level = difficulty_level
		scoresArray = Array.new(2, 0)
        
	elsif mode_number == 2
		instructions?(3)
		system "clear"
		print "Enter the number of players: "
		num = gets.chomp().to_i
		userIDArray = multiPlayer num
		scoresArray = Array.new(num, 0)
		system "clear"
	end

	#Play until no more sets available
	until countSets(active) == 0
		card1 = card2 = card3 = -1
		#If single player, play computer mode
	    	if mode_number == 1	
			puts "\nComputer's turn to try a set:\n\n"
			#Display 12 cards
			12.times do |i|
				active << cards.pop
				puts "#{i}) " + active[i].join(" ")
			end 
			random_number = rand(10)
    
			#Computer will give an answer based on the difficulty level selected
			if level.include? random_number
				ans = computerFindAnswer active
				sleep 2
				puts "\nComputer's choice: #{ans[0].join(" ")}"
				sleep 1
				puts "          	   #{ans[1].join(" ")}"
				sleep 1
				puts "          	   #{ans[2].join(" ")}"
				sleep 1
				
				#Check if the computer found a set
				if set? ans[0],ans[1],ans[2]
					active = active - ans
					3.times do |i|
						active << cards.pop
					end        
					puts "It's a set!\nComputer gets 1 point."
					scoresArray[0] += 1
					scores(scoresArray, nil, mode_number)
				else
					puts "It's not a set!\nComputer gets no points.\n\n."
					scores(scoresArray, nil, mode_number)
				end
			else 
				sleep 2
				puts "..."
				sleep 1
				puts "Computer can't find a set!"
				sleep 1
				scores(scoresArray, nil, mode_number)
			end
		end      
		
		#User turn
		puts "Your turn!\n\n"
		12.times do |i|
			if mode_number == 2
				active << cards.pop
			end
	   		puts "#{i})" + active[i].join(" ")
		end
		puts ""
		timer
		puts ""
		
		#Display hints for single player
		if mode_number == 1
			if level.length == 4
				puts "\n\nYou have 3 hints available. To use one, enter h for your card."
				x = 3
			elsif level.length == 7
				puts "\n\nYou have 2 hints available. To use one, enter h for your card."
				x = 2
			elsif level.length == 10
				puts "\n\nYou have 1 hint available. To use one, enter h for your card."
				x = 1
			end
		#Enter ID of user who found a set
		elsif mode_number == 2
			puts "\nEnter the userID of the player who finds a set:"		
			user = gets.chomp()
			while !userIDArray.include? user
				puts "\nEnter a valid userID:"
				user = gets.chomp()
			end
		end
		
		#Get input from user for each card
		flag = true
	    	print "First card: "
	    	card1 = gets.chomp()
            	while flag = raise_exception(card1)
			if flag == "h" and mode_number == 1 and x >= 1
				hint_function = hint(active, 1)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "First card: "
	    		card1 = gets.chomp()
		end
	    	a = active[card1.to_i]

		flag = true
		print "Second card: "
	    	card2 = gets.chomp()
	    	while flag = raise_exception(card2)
			if flag == "h" and mode_number == 1 and x >= 1
				hint_function = hint(active, 2)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "Second card: "
	    		card2 = gets.chomp()
		end	
	    	b = active[card2.to_i]

		flag = true
	    	print "Third card: "
	    	card3 = gets.chomp()
	    	while flag = raise_exception(card3)
			if flag == "h" and mode_number == 1  and x >= 1
				hint_function = hint(active, 3)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "Third card: "
	    		card3 = gets.chomp()
		end	
	    	c = active[card3.to_i]
	    
	    	#Prevent user choosing same card for three times
	    	d = (a==b) || (a==c) || (b==c)
	 
		  #Check if cards make a set
	    	if set?(a,b,c) and !d
			active = active - [a,b,c]

			3.times do |i|
				active << cards.pop
			end 
    
			if mode_number == 1
				puts "\nIt's a set!\nYou get 1 point!"
				scoresArray[1]+=1
				scores(scoresArray, nil, mode_number)
			elsif mode_number == 2
				puts "\nIt's a set! Good job #{user}!"
				scoresArray[userIDArray.index(user)] += 1
				scores(scoresArray, userIDArray, mode_number)
			end
    
                else
			puts "\nSorry, not a set. Try again."
			if mode_number == 1
				scores(scoresArray, nil, mode_number)
			elsif mode_number == 2
				scores(scoresArray, userIDArray, mode_number)
			end
		end
	end 
end
    


=======
require_relative 'game_process'
require_relative 'players'
require_relative 'timer'
require_relative 'prompt'
require_relative 'management'
require_relative 'existence_pair_check'

def game_process
	#single player or multiplayer
	mode_number = mode
    
	#initialize
	numbers = [1, 2, 3]
	shades = ["solid", "striped", "open"]
	colors = ["red", "green", "purple"]
	shapes = ["diamond", "squiggle", "oval"]

	cards=numbers.product(shades).product(colors).product(shapes).shuffle
	cards.each {|card| card.flatten!}
	active=[]

	#block to display instructions for single player or multiplayer and to get player information from multiplayer
	if mode_number == 1
		instructions?(2)
		system "clear" 
		level = difficulty_level
		scoresArray = Array.new(2, 0)
        
	elsif mode_number == 2
		instructions?(3)
		system "clear"
		print "Enter the number of players: "
		num = gets.chomp().to_i
		userIDArray = multiPlayer num
		scoresArray = Array.new(num, 0)
		system "clear"
	end

	#Play until no more sets available
	until countSets(active) == 0
		card1 = card2 = card3 = -1
		#If single player, play computer mode
	    	if mode_number == 1	
			puts "\nComputer's turn to try a set:\n\n"
			#Display 12 cards
			12.times do |i|
				active << cards.pop
				puts "#{i}) " + active[i].join(" ")
			end 
			random_number = rand(10)
    
			#Computer will give an answer based on the difficulty level selected
			if level.include? random_number
				ans = computerFindAnswer active
				sleep 2
				puts "\nComputer's choice: #{ans[0].join(" ")}"
				sleep 1
				puts "          	   #{ans[1].join(" ")}"
				sleep 1
				puts "          	   #{ans[2].join(" ")}"
				sleep 1
				
				#Check if the computer found a set
				if set? ans[0],ans[1],ans[2]
					active = active - ans
					3.times do |i|
						active << cards.pop
					end        
					puts "It's a set!\nComputer gets 1 point."
					scoresArray[0] += 1
					scores(scoresArray, nil, mode_number)
				else
					puts "It's not a set!\nComputer gets no points.\n\n."
					scores(scoresArray, nil, mode_number)
				end
			else 
				sleep 2
				puts "..."
				sleep 1
				puts "Computer can't find a set!"
				sleep 1
				scores(scoresArray, nil, mode_number)
			end
		end      
		
		#User turn
		puts "Your turn!\n\n"
		12.times do |i|
			if mode_number == 2
				active << cards.pop
			end
	   		puts "#{i})" + active[i].join(" ")
		end
		puts ""
		timer
		puts ""
		
		#Display hints for single player
		if mode_number == 1
			if level.length == 4
				puts "\n\nYou have 3 hints available. To use one, enter h for your card."
				x = 3
			elsif level.length == 7
				puts "\n\nYou have 2 hints available. To use one, enter h for your card."
				x = 2
			elsif level.length == 10
				puts "\n\nYou have 1 hint available. To use one, enter h for your card."
				x = 1
			end
		#Enter ID of user who found a set
		elsif mode_number == 2
			puts "\nEnter the userID of the player who finds a set:"		
			user = gets.chomp()
			while !userIDArray.include? user
				puts "\nEnter a valid userID:"
				user = gets.chomp()
			end
		end
		
		#Get input from user for each card
		flag = true
	    	print "First card: "
	    	card1 = gets.chomp()
            	while flag = raise_exception(card1)
			if flag == "h" and mode_number == 1 and x >= 1
				hint_function = hint(active, 1)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "First card: "
	    		card1 = gets.chomp()
		end
	    	a = active[card1.to_i]

		flag = true
		print "Second card: "
	    	card2 = gets.chomp()
	    	while flag = raise_exception(card2)
			if flag == "h" and mode_number == 1 and x >= 1
				hint_function = hint(active, 2)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "Second card: "
	    		card2 = gets.chomp()
		end	
	    	b = active[card2.to_i]

		flag = true
	    	print "Third card: "
	    	card3 = gets.chomp()
	    	while flag = raise_exception(card3)
			if flag == "h" and mode_number == 1  and x >= 1
				hint_function = hint(active, 3)
				x-=1
			elsif flag == "h" and mode_number == 1 and x < 1
				puts "You no longer have any hints available"
			end
			print "Third card: "
	    		card3 = gets.chomp()
		end	
	    	c = active[card3.to_i]
	    
	    	#Prevent user choosing same card for three times
	    	d = (a==b) || (a==c) || (b==c)
	 
		  #Check if cards make a set
	    	if set?(a,b,c) and !d
			active = active - [a,b,c]

			3.times do |i|
				active << cards.pop
			end 
    
			if mode_number == 1
				puts "\nIt's a set!\nYou get 1 point!"
				scoresArray[1]+=1
				scores(scoresArray, nil, mode_number)
			elsif mode_number == 2
				puts "\nIt's a set! Good job #{user}!"
				scoresArray[userIDArray.index(user)] += 1
				scores(scoresArray, userIDArray, mode_number)
			end
    
                else
			puts "\nSorry, not a set. Try again."
			if mode_number == 1
				scores(scoresArray, nil, mode_number)
			elsif mode_number == 2
				scores(scoresArray, userIDArray, mode_number)
			end
		end
	end 
end
    


>>>>>>> f87423c34abdfa82158dc270025a22413842dcc7
	