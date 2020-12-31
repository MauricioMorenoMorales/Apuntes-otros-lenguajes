def swapper string
	string
		.split('')
		.map { |e| e == e.low ? e.upper : e.low }
		.join('')
end

p swapper('miRaSAoeO')