def no_boring_zeros(num)
	return num if num.zero?
	while num % 10 == 0
		num = num / 10
	end
	num
end

puts no_boring_zeros(1450)