# Numbers can be integers or floats and they work mostly as you'd expect

3
0xFF # 255
3.14
1.0e-2 #0.01


# Divisiones, si quieres un float o un integer redondeado al suelo usa esto

4/2 # 2.0
div(5,2) # 2
rem(5,2) # 1

# Puedes usar sugar synthax en los numeros

10_000_000

# Atoms

:an_atom
:another_atom
:"an atom with spaces"

## Con esto puedes acceder a una alias
:"Elixir.AnAtom":
AnAtom == :"Elixir.AnAtom"

# Booleans
# Los booleanos en elixir no son mas que atomos :true :false

true == :true # true

:nil == nil

## False y nil son valores falsy todo lo demas será un valor truthy

##! Corto circuitos
## || Retorna la primera expresion verdadera

nil || false || 5 || true

# && Retornara la expresion siguiente a una verdadera

true && 5 # 5
false && 5 # false
read_cached || read_from_disk || read_from_database

## && puede ser utilizado como en react como una especie de if statement

database_value = connection_established && read_data

#! Tuples, son arrays

person = {"Bob", 25}
# para extraer el elemento usa Kernel.elem

age = elem person, 1
age = elem(person, 1)

## Para modificar puedes usar Kernel.put_elem()
put_elem person, 1, 26

## Lo anterior no modifica la tupla anterior, si no puedes poner en el prompt >> person y todo estara bien

older_person = put_elem person, 1, 26

#! Lists

prime_numbers = [2, 3, 5, 7]

length prime_numbers

Enum.at prime_numbers, 3

##? chca si existe un valor en una lista

5 in prime_numbers

new_primes = List.replace_at prime_numbers, 0, 11

## Para agregar al final de una lista puedes hacerlo del siguiente modo

List.replace_at prime_numbers, -1, 11

## Puedes mergear listas del siguiente modo

[1, 2, 3] ++ [4, 5]

## LAs listas son listas enlazadas
a_list = [head | tail]

[1 | [2 | []]] # esto es igual a [1, 2]

## Para obtener los valores de una lista puedes usar hd o tl

hd [1, 2, 3, 4]
tl [1, 2, 3, 4]

## Puedes agregar elementos a una lista enlazada del siguiente modo

a_list = [5, :value, true]

new_list = [:new_element, | a_list]

#! Maps

empty_map %{}

squares = %{1 => 2, 2 => 4, 3 => 9}
squares = Map.new [{1, 2}, {2, 4}, {3, 9}]

# Extraer la data de los maps

squares[2]
squares[4]

Map.get squares, 2, :not_found

# Puedes generar una excepcion de este modo si no encuentras un valor

Map.fetch!, squares, 2

squares = Map.put squares, 4, 16 # Agregar valores a un map

bob = %{name: "Bob", age: 25, works_at: "Initech"}

#Aceder a un valor en el map
bob[:works_at]
bob.works_at

# Para cambiar un valor puedes usar la siguiente sintaxis

next_years_bob = %{bob | age: 26, works_at: "Initrode"}

#! Bitwise

# Puedes crear binarios cerrandolos en pico parentesis

<<1, 2, 3>>

# Si sobrepasan el 255 se le aplicara un modulo 255

<<256>># <<0>>
<<257>># <<1>>
<<512>># <<0>>

#! Strings

"This is a string"

"Interpolation expression: #{3 + 0.14}"

"Scape string \r \n \" \\""

"""
Los strings no tienen
que terminar en la misma linea
"""

~s(This is also an string)
~s("With this approach you can use double strings")

~S(Este string no interpola #{3 + 0.14})

"String" <> " " <> "concatenation"

#! Character Lists

'ABC' == [65, 66, 67]

'Interpolation: #{3 + 0.1416}'

~c(Character list sigil)

~C(Unescaped sigil #{3 + 0.1416})

'
La mayoria de las operaciones de
String no funcionan con este tipo de string
'
