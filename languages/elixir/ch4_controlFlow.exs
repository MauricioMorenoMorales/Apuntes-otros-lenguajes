
#! Pattern matching

person = {"Bob", 25}
# ESto es como una destructuracion
{name, age} = person

{date, time} = :calendar.local_time()

{year, month, day} = date
{hour, minute, second} = time

#! MAtching constants
# Algunas funciones retornan un vaor ok, como en golng

{:ok, contents} = File.read("my_app.config")

# Ignorar valor
{_, time} = :calendar.local_time()
{_date, time} = :calendar.local_time()
{_date, {hour, _, _}} = :calendar.local_time()

# Puedes referenciar varias veces a una misma variable
{amount, amount, amount} = [127, 127, 127]

# Puedes hacer pattern matching de este modo igual mente
expected_name = "Bob"
{^expected_name, _age} = {"Bob", 25}
{^expected_name, _age} = {"Alice", 25}# Error

# Tambien funciona con listas
[first, second, third] = [1, 2, 3]

[1, second, third]      = [1, 2, 3]
[first, first, first]   = [1, 2, 3]
[first, second, _third] = [1, 2, 3]
[^first, second, _]     = [1, 2, 3]

# Puedes tambien destructurar listas enlazadas

[head | tail] = [1, 2, 3]
[min| tail] Enum.sort [1,2,3,4]

# Match maps

%{name: "name", age: "age"} = %{ name: "bob", age: 25 }

# Match bitstrings or binaries

<<b1, b2, b3>> = <<1, 2, 3>>
<<b1, rest :: binary>> = <<1, 2, 3>>

<<b1, b2, b3>> = "ABC"
b1 # 65
b2 # 66
b3 # 67

# Puedes matchear algunos strings como urls

command = "ping www.example.com"
"ping " <> url = command
url # www.example.com

# Las expresiones se pueden ir asignando conforme a los valores retornados por cada expresion

a = (b = 1 + 3)
a = b = 1 + 3

# Puedes usar el pattern matching para destructurar parametros

defmodule Rectangle do
  def area ({a, b}), do: a * b
end

# Puedes usar este metodo para ejecutar multiples funciones

defmodule Geometry do
  def area ({:rectangle, a, b}), do: a * b
  def area ({:square, a}), do: a * a
  def area ({:circle, r}), do: r * r * 3.1416
  def area(unknown), do: {:error, {:unknown_shape, unknown}}
end

# de este modo puedes usar una sola funcion con una sola aridad en una variable

fun = &Geometry.area/1

fun.({:circle, 4})
fun.({:square, 6})

#! Guards

defmodule TestNum do
  def test(x) when is_number x and x < 0 do
    :negative
  end
  def test(0), do: :zero
  def test(x) when is_number x and x > 0 do
    :positive
  end
end
# Pueden ser usadas para capturar errores

defmodule ListHelper do
  def smallest(list) when (length list) > 0 do
    Enum.min list
  end

  def smallest(_), do: {:error, :invalid_argument}
end

# Multicase lambdas

test_num = fn
  x when is_number(x) and x < 0 -> :negative
  0 -> :zero
  x when is_number(x) and x > 0 -> :positive
end

defmodule TestList do
  def empty?([]), do: true
  def empty
end

# Conditionals

if 5 < 3, do: :one, else: :two

if 5 < 3 do
  :one
else
  :two
end

# Case

def max(a, b) do
  case a >= b do
    true -> a
    false -> b
  end
end

#! With
# Esta expresion te sirve cuando quieres mostrar un error

%{
  "login" => "alice",
  "email" => "some_email",
  "password" => "password",
  "other_field" => "asdkfj",
  "yet_another_field" => "...",
}

# Tu tarea es extraer el login email y password
# Si no encuentras cierta llave tienes que mostrar un error para cada caso

defp extract_login(%{"login" => login}), do: {:ok, login}
defp extract_login(_), do: {:error, "login missing"}

defp extract_email(%{"email" => email}), do: {:ok, email}
defp extract_email(_), do: {:error, "email missing"}

defp extract_password(%{"password" => password}), do: {:ok, password}
defp extract_password(_), do: {:error, "password missing"}

# Aqui extraerias los valores

def extract_user user do
  case extract_login(user) do
    {:error, reason} -> {:error, reason}
    {:ok, login} ->
      case extract_email(user) do
        {:error, reason} -> {:error, reason}
        {:ok, email} ->
          case extract_password(user) do
            {:error, reason} -> {:error, reason}
            {:ok, password} ->
              %{login: login, email: email, password: password}
          end
      end
  end
end

# Esta es la sintaxis del with
with {:ok, login} <- {:ok, "alice"},
     {:ok, email} <- {:ok, "some_email"} do
  %{login: login, email: email}
end

def extract_user user do
  with {:ok, login} <- extract_login(user),
       {:ok, email} <- extract_email(user),
       {:ok, password} <- extract_password(user) do
    {:ok, %{login: login, email: email, password: password}}
  end
end

#! Loops

defmodule NaturalNums do
  import IO
  def print(1), do: IO.puts(1)
  def print n do
    print(n - 1)
    IO.puts(n)
  end
end

#NaturalNums.print 3 -> 1 2 3

defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]) do
    head + sum(tail)
  end
end

#! Tail call optimization
