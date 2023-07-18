defmodule T do

  def is_subsequence(s, t), do: check(s |> String.to_charlist, t |> String.to_charlist)

  def check([], _t), do: true
  def check(_s, []), do: false
  def check([s_h|s_h], [t_h|t_t]) when s_h == t_h, do: check s_t, t_t
  def check(s, [_|t_t]) do: check s, t_t

  #? Better solution

  @spec length_of_last_word(s :: String.t) :: integer
  def length_of_last_word s do
    s
    |> String.split(" ")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.reverse
    |> Enum.take(1)
    |> Enum.join
    |> String.graphemes
    |> Enum.count
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

    logTest 1, 5, &length_of_last_word/1, ["Hello World"]
    logTest 2, 4, &length_of_last_word/1, ["   fly me to   the moon       "]
    logTest 3, 6, &length_of_last_word/1, ["luffy is still joyboy"]
  end
end
