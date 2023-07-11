defmodule T do

  def replaceElements arr do
    arr |> Enum.reverse |> reduce([], -1)
  end

  defp reduce([], res, _), do: res
  defp reduce([head|tail], res, previous_max) do
    reduce tail, [previous_max|res], max(previous_max, head)
  end

#!######################################################################
  defp logTest(id, correct, function, parameters) do
    result = apply function, parameters
    IO.inspect id
    if result !== correct do
      IO.puts "---------------------------------------------"
      IO.inspect parameters
      IO.inspect result
      IO.puts "Received ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      IO.puts "Correct vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
      IO.inspect correct
      IO.puts "--------------------------------------------  "
    else
      IO.puts "√√√"
    end
  end
  def t do
    logTest 1, [18,6,6,6,1,-1], &replaceElements/1, [[17,18,5,4,6,1]]
  end
end
