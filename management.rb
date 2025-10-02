<<<<<<< HEAD
#Check if two sets of attributes are all the same or all different
def attributes_compatible?(a,b,c)
	(a==b && b==c) || (a!=b && a!=c && b!=c)
end

#Check whether a potential set is really a set
def set?(c1,c2,c3)
	return false unless attributes_compatible? c1[0],c2[0],c3[0]
	return false unless attributes_compatible? c1[1],c2[1],c3[1]
	return false unless attributes_compatible? c1[2],c2[2],c3[2]
	return false unless attributes_compatible? c1[3],c2[3],c3[3]
	return true
end

#Helper method written to find a pair of set in the game
def hint(active, num_hint)
    
	#All combination for user's choice
	hint = (0...11).to_a
	hint_set = hint.product(hint).product(hint)

	for i in hint_set
		choice = i.join("_").split "_"
        
		# evalutaion will be jumped over if two cards chosen by user are the same 
		if choice[0]!=choice[1] and choice[0]!=choice[2] and choice[1]!=choice[2]
            
			if num_hint == 1 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i]) 

				puts "Chose #{choice[0]} as your first card"
				break    
			
			end
			if num_hint == 2 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i])
			
				puts "Choose #{choice[1]} as your second card" 
				break
			
			end
			if num_hint == 3 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i])
			
				puts "Choose #{choice[2]} as your third card" 
				break
			
			end
		end
	end
=======
#Check if two sets of attributes are all the same or all different
def attributes_compatible?(a,b,c)
	(a==b && b==c) || (a!=b && a!=c && b!=c)
end

#Check whether a potential set is really a set
def set?(c1,c2,c3)
	return false unless attributes_compatible? c1[0],c2[0],c3[0]
	return false unless attributes_compatible? c1[1],c2[1],c3[1]
	return false unless attributes_compatible? c1[2],c2[2],c3[2]
	return false unless attributes_compatible? c1[3],c2[3],c3[3]
	return true
end

#Helper method written to find a pair of set in the game
def hint(active, num_hint)
    
	#All combination for user's choice
	hint = (0...11).to_a
	hint_set = hint.product(hint).product(hint)

	for i in hint_set
		choice = i.join("_").split "_"
        
		# evalutaion will be jumped over if two cards chosen by user are the same 
		if choice[0]!=choice[1] and choice[0]!=choice[2] and choice[1]!=choice[2]
            
			if num_hint == 1 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i]) 

				puts "Chose #{choice[0]} as your first card"
				break    
			
			end
			if num_hint == 2 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i])
			
				puts "Choose #{choice[1]} as your second card" 
				break
			
			end
			if num_hint == 3 and set?(active[choice[0].to_i], active[choice[1].to_i], active[choice[2].to_i])
			
				puts "Choose #{choice[2]} as your third card" 
				break
			
			end
		end
	end
>>>>>>> f87423c34abdfa82158dc270025a22413842dcc7
end 