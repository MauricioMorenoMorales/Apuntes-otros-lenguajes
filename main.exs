# Realiza un simple map

defmodule Maps do
	def maps(x) do
		Enum.map(x, fn element -> element * 2 end)
	end
end

defmodule MapsClever do
	def maps(x) do
		Enum.map(x, &(&1 * 2))
	end
end

# Retorna el siglo de un numero recibido

defmodule Century do
	def century(year) do
		trunc(Float.ceil(year / 100))
	end
end

defmodule CenturyClever do
	def century(year) do
		ceil(year / 100)
	end
end

# Convierte un string de numeros a binario dependiendo si es mayor o menor a 5

defmodule FakeBinary do
  def generate(str) do
    str |> String.replace(~r/[0-4]/, "0") |> String.replace(~r/[5-9]/, "1")
  end
end

defmodule FakeBinary do
  def generate(str) do
    for <<c <- str>>, into: "", do: if c < ?5, do: "0", else: "1"
  end
end
# ?Pattern matching
defmodule FakeBinary do
  def generate(str) do
    below = ["0", "1", "2", "3", "4"]
    above = ["5", "6", "7", "8", "9"]
    str |> String.replace(below, "0") |> String.replace(above, "1")
  end
end

# Calcula la madia de calificaciones dadas en un array

defmodule Calculator do
  def get_average(marks) do
    trunc(Enum.sum(marks) / length(marks))
  end
end

defmodule Calculator do
  def get_average(marks) do
    div(Enum.sum(marks), Enum.count(marks))
  end
end

# Mata un dragon, tienes que usar 2 balas por cada uno

defmodule Hero do
  def survive(bullets, dragons) do
    dragons * 2 <= bullets
  end
end

defmodule Hero do
  def survive(bullets, dragons) when 2 * dragons <= bullets, do: true
  def survive(_bullets, _dragons), do: false
end

#TODO 1 1333

defmodule Dna do
  def dna_strand(dna_str) do
    for <<c <- dna_str>>, into: "" do
      case c do
        ?A -> "T"
        ?T -> "A"
        ?C -> "G"
        ?G -> "C"
      end
    end
  end
end

defmodule Dna do
  def dna_strand (dna_str) do
    dna_str
    |> String.graphemes()
    |> Enum.map_join(fn
      "A" -> "T"
      "C" -> "G"
      "G" -> "C"
      "T" -> "A"
    end)
  end
end
