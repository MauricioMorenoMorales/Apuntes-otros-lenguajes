def multi_table(number)
	(1..10).map { |i| "#{i} * #{number} = #{i * number}"}.join("\n")
end

def multi_tableMine(number)
	response = []
	for i in 1..10 do
		reponse << "#{i} * #{number} = #{i * number}"
	end
	response.join("\n")
end