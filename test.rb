def well x
	counter = x.select { |e| e  == 'good' }
	p counter.size
end

well(well(['good', 'bad', 'bad', 'bad', 'bad', 'good', 'bad', 'bad', 'good']))