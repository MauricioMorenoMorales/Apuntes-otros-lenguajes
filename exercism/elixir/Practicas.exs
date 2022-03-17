#Collatz Conjeture Recursion

defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input, step) when input == 1, do: step
  def calc(input, step \\ 0) when input > 0 do
    case {div(input, 2)} do
      {0} -> calc(input / 2, step + 1)
      {1} -> calc((input * 3) + 1, step + 1)
    end
  end
end

defmodule CollatzConjecture do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(input) when is_number(input) and input > 0 do
    case {input |> round |> rem(2)} do
      {0} -> 1 + calc(input / 2)
      {1} -> 1 + calc((input * 3) + 1)
    end
  end
end


defmodule CollatzConjecture do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(input) when div(input, 2) == 0, do: 1 + calc(input / 2)
  def calc(input) when div(input, 2) != 0, do: 1 + calc((input * 3) + 1)
end

defmodule CollatzConjecture do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 do
    input
    |> Stream.iterate(fn
      n when rem(n,2) == 0 -> div(n, 2)
      n -> n * 3 + 1
    end)
    |> Stream.take_while(&(&1 != 1))
    |> Enum.count()
  end
end

defmodule CollatzConjecture do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 do
    Stream.unfold(input, fn
      1 -> nil
      n when rem(n, 2) == 0 -> {n, div(n, 2)}
      n when rem(n,2) != 0 -> {n, n * 3 + 1}
    end)
    |> Enum.count()
  end
end

#! calcula el valor de dos elementos dentro de una lista enlazada
defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([]), do: 0
  def value([firstColor | [secondColor | tail]]) do
    firstColor
    |> colorValue
    |> to_string
    |> Kernel.<>(to_string(colorValue(secondColor)))
    |> String.to_integer
  end

  @spec colorValue(color :: atom) :: integer
  defp colorValue color do
    case {color} do
      {:black} -> 0
      {:brown} -> 1
      {:red} -> 2
      {:orange} -> 3
      {:yellow} -> 4
      {:green} -> 5
      {:blue} -> 6
      {:violet} -> 7
      {:grey} -> 8
      {:white} -> 9
      _ -> 0
    end
  end
end

defmodule ResistorColorDuo do
  @resistance_chart %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }
  @spec value(colors :: [atom]) :: integer
  def value colors do
    colors
    |> Enum.map(&(@resistance_chart[&1]))
    |> Enum.take(2)
    |> Integer.undigits
  end
end
defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value colors, do:
    colors
    |> Enum.take(2)
    |> Enum.map(&colorValue/1)
    |> Enum.join
    |> String.to_integer

  @spec colorValue(color :: atom) :: integer
  defp colorValue color do
    case {color} do
      {:black} -> 0
      {:brown} -> 1
      {:red} -> 2
      {:orange} -> 3
      {:yellow} -> 4
      {:green} -> 5
      {:blue} -> 6
      {:violet} -> 7
      {:grey} -> 8
      {:white} -> 9
      _ -> 0
    end
  end
end