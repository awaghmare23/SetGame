require_relative 'game_process'
require_relative 'timer'
require_relative 'prompt'

choice = welcome
flag = true

while flag

	play = true

	case choice 
		when 1
        #Start
			game_process
			flag = false
		when 2
			play = instructions?(1)
			system "clear"
			choice = 1
		when 3  
        #End
			puts "Thanks for playing!"
			flag = false
		else 
        #End
			puts "Invalid input! Exiting game..."
			flag = false
	end 
end






    
    

    
    
    