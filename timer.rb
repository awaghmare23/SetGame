def timer

	i = 30

	while i > -1

		sleep  1
		print "\b" * 70
		printf "You have %02s seconds to find a set.", i

		i -= 1

	end

end