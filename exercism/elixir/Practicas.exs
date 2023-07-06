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
      {0} -> 1 + calc input / 2
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

#! Patter matching, describe el tipo del triangulo con base a sus lados

defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene
  @positive_rule_error {:error, "all side lengths must be positive"}
  @invalid_triangle_sizes_error {:error, "side lengths violate triangle inequality"}

  defp are_valid_triangle_sides?(a, b, c) do
    [first, second, third] = Enum.sort [a, b, c]
    first + second >= third
  end

  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: @positive_rule_error
  def kind(a, b, c) do
    valid_input = are_valid_triangle_sides? a, b, c
    different_values = Enum.frequencies([a, b, c]) |> Enum.count
    case different_values do
      _ when not valid_input -> @invalid_triangle_sizes_error
      1 -> {:ok, :equilateral}
      2 -> {:ok, :isosceles}
      3 -> {:ok, :scalene}
    end
  end
end

defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene
  @pos_rule_error {:error, "all side lengths must be positive"}
  @inequality_error {:error, "side lengths violate triangle inequality"}

  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c), do: [a, b, c] |> Enum.sort() |> measure()

  defp measure([a, _, _]) when a <= 0, do: @pos_rule_error
  defp measure([a, b, c]) when a + b <= c, do: @inequality_error
  defp measure([a, a, a]), do: {:ok, :equilateral}
  defp measure([a, b, c]) when a == b or b == c, do: {:ok, :isosceles}
  defp measure([_, _, _]), do: {:ok, :scalene}
end

#! Take only some parameters, and using maps to generate values

defmodule ResistorColorTrio do
  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000
  @color_values %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9,
  }

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([:black, :black, :black]), do: {0, :ohms}
  def label [first, second, third | _] do
    number = ((@color_values[first] * 10) + @color_values[second]) * (10 ** @color_values[third])
    cond do
      rem(number, @giga) == 0 -> {number / @giga, :gigaohms}
      rem(number, @mega) == 0 -> {number / @mega, :megaohms}
      rem(number, @kilo) == 0 -> {number / @kilo, :kiloohms}
      true                    -> {number, :ohms}
    end
  end
end

##! Determina si una lista es sublista de una u otra

defmodule Sublist do
  @spec sublist?(list(number), list(number)) :: boolean
  defp sublist?(superset, subset) do
    superset = Enum.map(superset, fn x -> "#{x}*" end) |> Enum.join("/")
    subset = Enum.map(subset, fn x -> "#{x}*" end) |> Enum.join("/")
    String.contains? superset, subset
  end

  @spec compare(list(number), list(number)) :: :equal | :sublist | :superlist | :unequal
  def compare(a, b) do
    cond do
      a == b        -> :equal
      sublist? a, b -> :superlist
      sublist? b, a -> :sublist
      true          -> :unequal
    end
  end
end

defmodule Sublist do
  @spec compare(list(number), list(number)) :: :equal | :sublist | :superlist | :unequal
  def compare(a, b) do
    cond do
      a == b              -> :equal
      is_subset_of?(a, b) -> :sublist
      is_subset_of?(b, a) -> :superlist
      true                -> :unequal
    end
  end

  defp is_subset_of?([], _), do: true
  defp is_subset_of?(a, b) do
    b
    |> Stream.chunk_every(length(a), 1, :discard)
    |> Enum.any?(&(&1 === a))
  end
end
