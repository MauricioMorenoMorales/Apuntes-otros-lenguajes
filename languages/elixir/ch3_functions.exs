# First class functions

square = fn x -> x * x end

# Para ejecutar esta funcion se hace de la siguiente forma

square.(5)

# Puedes pasar las funciones por parametro

print_element = fn x -> IO.puts x end
my_array = [1, 2, 3]

Enum.each my_array, print_element

# Tambien puedes pasarla directamente

Enum.each my_array,
  fn x -> IO.puts x end

#Tambien puedes capturar las funciones y guardarlas automaticamente en una
# Funcion anonima y pasarla

Enum.each my_array, &IO.puts/1

# Tambien puedes usar un shortcut para las funciones

lambda = fn x, y, z -> x * y * z end
lambda = &(&1 * &2 * &3)

#! Closures

outside_var = 5
my_lambda = fn -> IO.puts outside_var end
my_lambda.()

# Los rebindings no funcionan como las mutaciones en otros lenguajes

outside_var = 5
lambda = fn -> IO.puts outside_var end
outside_var = 6
lambda.() # 5


#! Hgher level types
#! Ranges

range = 1..2

2 in range # true

-1 in range #false

Enum.each 1..3, &IO.puts/1

#! Keyword list

# Simplifican la sintaxis del siguiente modo
days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
days = [monday: 1, tuesday: 2, wednesday: 3]

# Para extraer un valor se puede hacer de estas dos formas

Keyword.get days, :monday

days[:tuesday]

#! Mapset

days = MapSet.new [:monday, :tuesday, :wednesday]

MapSet.member? days, :monday #true
MapSet.member? days, :noday #false

days = MapSet.put days, :thursday # Asi se agregan nuevos valores al mapset

Enum.each days, &IO.puts/1

#! Times and dates

date = ~D[2018-01-31]
date.year # 2018
date.month # 1

time = ~T[11:59:12.00007]
time.hour # 11
time.minute # 59

#! Dinamically calling functions
apply IO, :puts, ["Dynamic function call."]
