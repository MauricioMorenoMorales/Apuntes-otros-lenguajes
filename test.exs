defmodule T do

  # def is_subsequence(s, t) do
  #   s = s |> String.graphemes |> Enum.sort
  #   t = t |> String.graphemes |> Enum.sort |> Enum.take(Enum.count(s))
  #   t == s
  # end

  def countOccurrences(_, _, count, goal) when goal == count, do: count
  def countOcurrences(_, [], count, _), do: count
  def countOcurrences([s_head|s_tail],[t_head| t_tail], count, goal) when s_head == t_head do
    countOcurrences s_tail, t_tail, count + 1, goal
  end
  def countOcurrences([s_head|s_tail]=s, [_|t_tail], count, goal) do
    if Enum.count(s) == count do
      count
    else
      countOcurrences [s_head|s_tail], t_tail, count, goal
    end
  end

  def is_subsequence(s, t) do
    s_length = s |> String.graphemes |> Enum.count
    sharedLetters = countOcurrences(String.graphemes(s), String.graphemes(t) , 0, s_length)
    sharedLetters == s_length
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
    logTest 1, true, &is_subsequence/2, ["abc", "ahbgdc"]
    logTest 1, false, &is_subsequence/2, ["ab", "baab"]
  end
end
