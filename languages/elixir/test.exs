test1 = 12
test2 = 13
test3 = 14
test4 = 15

defmodule MyFunction do
  @test1 12
  @test2 13
  @test3 14
  @test4 15

  def my_function(number), do: number * number
end
