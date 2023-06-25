# Puedes sobreescribir variables

monthly_salary = 10000
monthly_salary = 11000 # Sobreescribira la variable

#! Modulos

# Elixir contiene ciertos modulos por ejemplo IO

IO.puts("Hola mundo") # Hola mundo, :ok

defmodule Geometry do
  def rectangle_area(a, b), do: a * b
end

# Esto lo ejecutarias Geometry.rectangle_area(1, 2)

## Puedes nestear modulos

defmodule Geometry do
  defmodule Rectangle do
    #########
  end
end

# Si una funcion no tiene parametros puedes omitir el parentesis

def run do
  #
end

# Puedes guardar el resultado de una funcion en una variable

area = Geometry.rectangle_area 1, 2

# El operador de pipeline pone el resultado de la funcion llamada previamente como primer parametro
# de la funcion siguiente

-5 |> abs |> Integer.to_string |> IO.puts

# Dos funciones con distinta aridad son tratadas como funciones distintas

defmodule Rectangle do
  def area, do: area(1, 1)
  def area(a), do: area(a, a)

  def area(a, b), do: a * b
end

## Puedes usar las diferentes aridades para generar valores por defecto

defmodule Calcualtor do
  def sum(a), do: sum(a, 0)
  def sum(a, b), do: a + b
end

## Una forma de automaticamente generar el codigo anterior es el siguiente

defmodule Calculator do
  def sum(a, b \\ 0), do: a + b
end


## Tambien puedes usar funciones privadas

defmodule TestPrivate do
  def double(a),  do: sum a, a
  defp sum(a, b), do: a + b
end

## Para no estar usando IO.puts puedes importar IO de este modo

defmodule MyModule do
  import IO

  def my_function, do: puts "Calling imported funcion."
end

## Tambien puedes asignar aliases a tus imports

defmodule MyModule do
  alias IO, as: MyIO

  def my_function, do: MyIO.puts("Calling imported function.")
end

## O puedes nombrar otros modulos

defmodule MyModule do
  alias Geometry.Rectangle, as: Rectangle

  def my_function, do: ###
end

## Tambien puedes referenciar el ultimo elemento del import

defmodule MyModule do
  alias IO.puts

  def my_function, do: puts "Testing this"
end

## Puedes agregar constantes en tus modulos

defmodule Circle do
  @pi 3.14159

  def area(r), do: r*r*@pi
  def circunference(r), do: 2*r*@pi
end

## Puedes escribir docs a las funciones

defmodule Cricle do
  @moduledoc "Implements basic circle functions"
  @pi 3.15159

  @doc "Computes the area of a circle"
  def calcualte_area(r), do: r*r*@pi

  @doc "Computes the circumference of a circle"
  def calculate_circumference(r), do: 2*r*@pi

end

#? PAra obtener la documentacion puedes usar Code.get_docs(Circle, :moduledoc)

## Tambien puedes especificar los tipos recibidos de una funcion

defmodule Circle do
  @pi 3.14159

  @spec area(number) :: number
  def area(r), do: r*r*@pi

  @spec circumference(number) :: number
  def circumference(r), do: 2*r*@pi
end

