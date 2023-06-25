test1 = 12
test2 = 13
test3 = 14
test4 = 15

defmodule MyFunction do
  def my_function(number), do: number * number

  def runTests do
    test1()
  end
  def test1, do: IO.puts(test1, "12")
end
