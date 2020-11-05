def square_sum(numbers)
  response = []
  for i in numbers do
    response << i * i
  end
  response.sum
end