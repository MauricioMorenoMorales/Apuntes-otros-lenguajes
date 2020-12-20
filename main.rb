# !Verifica que un numero sea divisible entre otros

def divide_by(number, a, b)
	(number % a) == 0 && (number % b) == 0
end

puts divide_by(15,3,15)
puts divide_by(10,5,3)

# !Has un hello world que capitalize un imput y que tenga un valor por defecto de hola Mundo

def hello(name = 'World')
	"Hello #{name.empty? ? 'World' : name.capitalize}"
end

puts hello('MaUricio')
puts hello('')

# !Calcula la cantidad de agua necesitada para tomar por hora

def cantidad_de_agua(tiempo)
	(tiempo * 0.5).floor
end

puts cantidad_de_agua(2)

# !Retorna si alguien toca el banjo en base a si su nombre empieza con R

def playing_banjo(name)
	name[0].downcase == 'r' ? "#{name.capitalize()} plays banjo" : "#{name.capitalize()} does not play banjo"
end

puts playing_banjo('mauricio')
puts playing_banjo('Roberto')

# !Invierte el valor de los numeros de negativo a positivo e inversa

def invert_values(array)
	array.map {|n| 0 -n}
end
puts invert_values([1,2,3,4,-1,-3,0])

# !Retorna la suma de todos los numeros inferiores a un numero

def Sumador(numero)
	(1..numero).sum
end

puts Sumador(8)

# !Has una funcion que retorne el numero faltante en un array

def IdGenerator(array)
	x = 0
	while array.include?(x)
		x += 1
	end
	x
end
puts IdGenerator([0,1,3,4,5,6])

# !Verifica si la salud de un personaje es positiva

def check_alive(health)
	health.positive?
end
puts check_alive(4)

# !Verifica si un heroe tiene la cantidad de balas suficientes para matar a un dragon
# *Suponiendo que para matar un dragon se necesitan 2 balas

def hero(bullets, dragons)
	bullets >= dragons * 2
end
puts hero(10,4)

# ! ----------------------- Crea un generador de rango

def generate_range(min, max, step)
	arr = []
	start = min
	loop do
		break if start > max
		arr << start
		start += step
	end
	arr
end

def generate_rangeCLEVER(min, max, step)
	(min..max).step.to_a
end

# ! Genera un contador de horas en milisegundos

def past(h,m,s)
	((h * 3600) + (m * 60) + (s)) * 1000
end

# past(1,1,1) ->3661000

# ! Crea un generador de promedios

def get_average(marks)
	marks.sum / marks.size
end

# ! Crea una función que convierta de celcius a fahrenheit

def weather_info(temperature)
	celcius = ((temp - 32) * (5/9.0).round(5))
	if (celcius < 0)
		return celcius.to_s + " is freezing temperature"
	else
		return celcius.to_s + " is above freezing temperature"
	end
end
# ? @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# ! Crea una función que retorne area si es cuadrado o perimetro si es otra cosa

def area_or_perimeter(l, w)
	if l == w
		return l * w
	else
		return (l + w) * 2
	end
end

# ! Crea una función que repita un string determinadas veces

def repeat_str (n, s)
	s * n
end

# ! Haz un string con los parametros en forma ShortLongShort

def solution(a, b)
	a.size > b.size ? b+a+b : a+b+a
end

# ! --------------------Crea una funcion que genere binarios si un numero es mayor o menor a 5--------------------

def fake_bin(str)
	str.split('').map{ |x| x.to_i < 5 ? 0 : 1}.join
end

# ! Función que muestre si un numero es divisible entre otros 2

def is_divisible(n, x, y)
	(n % x == 0) && (n % y == 0)
end

# ! Funcion que verifique las calificaciones de 2 examenes

def check_exam(array1,array2)
	score = 0
	for i in 0..array1.size-1
		if array2[i] != ""
			if array1[i] == array2[i]
				score += 4
			else
				score -= 1
			end
		end
	end
	return (score < 1 ? 0 : score)
end

# check_Exam(["a", "a", "b", "b"], ["a", "c", "b", "d"]) → 6

# ! Calcula que parte de cuarto de año se encuentra un mes

def quarter_of(month)
	case month
	when (1..3)
		return 1
	when (4..6)
		return 2
	when (6..9)
		return 3
	when (9..12)
		return 4
	else
		"Invalid input"
	end
end

def quarter_ofCLEVER(month)
	(month / 3 ).ceil
end

## ! Holyday dutyfree

def duty_free(price, discount, holyday_cost)
	saving = price * discount * 0.01
	bottles = (holyday_cost) / saving
	bottles.floor
end

# ! Retorna cuantas veces cabe un numero con un array

def find_multiples(integer, limit)
	(integer..limit).step(integer).to_a
end

# ! Retorna un saludo dependiendo de el idioma por parametro

def greet(language)
	database = {
		"english" => "Welcome",
		"czech" => "Vitejte",
		"danish" => "Velkomst",
		"dutch" => "Welkom",
		"estonian" => "Tere tulemast",
		"finnish" => "Tervetuloa",
		"flemish" => "Welgekomen",
		"french" => "Bienvenue",
		"german" => "Willkommen",
		"irish" => "Failte",
		"italian" => "Benvenuto",
		"latvian" => "Gaidits",
		"lithuanian" => "Laukiamas",
		"polish" => "Witamy",
		"spanish" => "Bienvenido",
		"swedish" => "Valkommen",
		"welsh" => "Croeso",
	}
	database.each do |key, value|
		if key == language
			return value
		end
	end
	"Welcome"
end

# ! Un ejemplo de como es un switch

def get_planet_name(id)
	# This doesn't work; Fix it!
	name = ''
	case id
		when 1
			name = "Mercury"
		when 2
			name = "Venus"
		when 3
			name = "Earth"
		when 4
			name = "Mars"
		when 5
			name = "Jupiter"
		when 6
			name = "Saturn"
		when 7
			name = "Uranus"
		when 8
			name = "Neptune"
	end

def derive(coefficient, exponent)
	"#{coefficient * exponent}x^$#{exponent - 1}"
end

# ! Haz una funcion que retorne el maximo de todas las combinaciones posibles de varias operaciones

def expression_matter(a, b, c)
	[
		a * (b + c),
		a * b * c,
		a + b * c,
		(a + b) * c,
		a + b + c
	].max
end

# ! Abrevia el nombre de alguien

def abbrev_name(name)
	name.split.map { |s| s[0]}.join('.').upcase
end

# ! Suma dos arrays

def array_plus_array(arr1, arr2)
	(arr1 + arr2).reduce(:+)
end

def array_plus_arrayCLEVER(arr1, arr2)
	(arr1 + arr2).sum
end

# ! Verifica si dos numeros son negativos

def paperwork(n, m)
	if (n < 0) && (m < 0)
		n * m
	else
		0
	end
end

puts paperwork(5,5)

# ! Funcion que retorne si se encuentra cierto numero en un array

def check(arr, element)
	arr.include?(element)
end

def checkAlternative(arr, element)
	arr.any?(element)
end

# ! Funcion que retorne la suma de los numeros positivos de un array

def positive_sum(arr)
	arr.select{ |x| x > 0 }.reduce(0, :+)
end

# ! Invierte las mayusculas y minusculas

class String
	def to_alternating_case
		self.swapcase
	end
end
puts 'proBANDO'.to_alternating_case()

# ! Retorna true o false si todo el string esta en uppercase

class String
	def is_upcase?
		self == upcase
	end
end

#  ! Funcion que adapte el alfabeto polaco a el alfabeto inglés

def correct_polish_letters(s)
	s.tr("ąćęłńóśźż", "acelnoszz") #? Esto retorna el mismo String pero con las letras remplazadas
end

# ! Cuenta la cantidad de veces que se repite una letra en un string

def strCount(word, letter)
	word.count(letter)
end

# ! Prueba si un numero es par o impar

def is_even(n)
	(n % 2 == 0)
end

# ! Retorna el mayor numero de un array el menor y su diferencia

def difference_in_ages(ages)
	[ages.min, ages.max, ages.max - ages.min]
end

# ! Retorna la suma de cada numero en un array a su segunda potencia

def square_sum(numbers)
	response = []
	for i in numbers do
		response << i * i
	end
	response.sum
end

def squareSumCLEVER(numbers)
	numbers.map { |n| n*n }.reduce(:+)
end

# square_sum([0, 3, 4, 5]) -> 50

# ! Elimina los elementos pares dentro de un array

def remove_every_other(arr)
	arr.map.reject.with_index { |_,i| i.odd? }
end

# ! obtiene el codigo ascii de un imput

def getASCII(c)
	c.ord
ends

# ! obtiene true si el input es un par mayor que 2

def triple_trouble(one, two, three)
	result = ""
	i = 0
	while i < one.length
		result << one[i]
		result << two[i]
		result << three[i]
		i += 1
	end
	result
end

def triple_trouble(one, two, three)
	[one, two, three].map(&:chars).transpose.join
end

def triple_trouble_loop(one,two,three)
	(0..one.size - 1).map { |n| one[n] + two[n] + three[n]}.join
end

def triple_trouble_zip(one,two,three)
	one.chars.zip(two.chars, three.chars).join
end

puts triple_trouble('aa','bb','cc') # -> abcabc


# ! Obtiene la media de calificacion y retorna calificacion inglesa

def get_grade(s1,s2,s3)
	average = (s1 + s2 + s3) / 3
	case average
	when 90..100 then 'A'
	when 80..90 then 'B'
	when 70..80 then 'C'
	when 60..70 then 'D'
	else	'F'
	end
end

# ! Elimina los numeros cero al final de un input

def no_boring_zeros(num)
	return num if num.zero?
	while num % 10 == 0
		num = num / 10
	end
	num
end
puts no_boring_zeros(1450)

# ! retorna el primer numero que no se a consecutivo

def first_non_consecutive(arr)
	arr.each_index do |i|
		return arr[i + 1] if arr[i].next != arr[i + 1]
	end
end

def first_non_consecutive(arr)
	arr.each_cons(2) { |a, b| return b if b - a > 1 }
end

#! Retorna un int como texto

def switch_it_up(number)
	case number
	when 1 'One'
	when 2 'Two'
	when 3 'Three'
	when 4 'Four'
	when 5 'Five'
	when 6 'Six'
	when 7 'Seven'
	when 8 'Eight'
	when 9 'Nine'
	when 0 'Zero'
	end
end

def switch_it_upCLEVER(number)
  %w(Zero One Two Three Four Five Six Seven Eight Nine)[number]
end

#! Llena un array de forma (n..1)

def reverse_seq(n)
	n.downto(1).to_a
end

def reverse_seq(n)
	Array(1..n).reverse
end

def reverse_seq(n)
	(1..n).map { |a| a }.reverse
	end

def reverse_seq(n)
	(1..n).sort.reverse
end

#! retorna si un autobus tiene la cantidad necesaria de pasajeros si es asi retorna 0 si no retorna cuantos espacios faltan

def enough_space(cap, on, wait)
	if cap > on + wait
		0
	else
		-(cap -(on + wait))
	end
end

def enough_spaceClever(cap, on, wait)
  [on + wait - cap, 0].max
end

#(enough(10, 5, 5), 0);
#(enough(100, 60, 50), 10);
#(enough(20, 5, 5), 0);

#! Retorna esta tabla

def multi_table(number)
	(1..10).map { |i| "#{i} * #{number} = #{i * number}"}.join("\n")
end

def multi_tableMine(number)
	response = []
	for i in 1..10 do
		reponse << "#{i} * #{number} = #{i * number}"
	end
	response.join("\n")
end

# 1 * 5 = 5
# 2 * 5 = 10
# 3 * 5 = 15
# 4 * 5 = 20
# 5 * 5 = 25
# 6 * 5 = 30
# 7 * 5 = 35
# 8 * 5 = 40
# 9 * 5 = 45
# 10 * 5 = 50

#! Invierte las palabras dentro de una sentencia

def reversed(str)
	puts str.split(' ').reverse().join(' ')
end

# (reverseWords("hello world!"), "world! hello")
# (reverseWords("yoda doesn't speak like this" ),  "this like speak doesn't yoda")
# (reverseWords("foobar"                       ),  "foobar")
# (reverseWords("kata editor"                  ),  "editor kata")

#! Retorna una simple formula

def quadratic(x1, x2)
	[1, -(x1 + x2), (x1 * x2)]
end

#! Accede a cierta posicion reduciendo el numero

$fruits = {
	1=>'kiwi',2=>'pear',3=>'kiwi',4=>'banana',5=>'melon',6=>'banana',7=>'melon',8=>'pineapple',9=>'apple',10=>'pineapple',
	11=>'cucumber',12=>'pineapple',13=>'cucumber',14=>'orange',15=>'grape',16=>'orange',17=>'grape',18=>'apple',19=>'grape',20=>'cherry',
	21=>'pear',22=>'cherry',23=>'pear',24=>'kiwi',25=>'banana',26=>'kiwi',27=>'apple',28=>'melon',29=>'banana',30=>'melon',
	31=>'pineapple',32=>'melon',33=>'pineapple',34=>'cucumber',35=>'orange',36=>'apple',37=>'orange',38=>'grape',39=>'orange',40=>'grape',
	41=>'cherry',42=>'pear',43=>'cherry',44=>'pear',45=>'apple',46=>'pear',47=>'kiwi',48=>'banana',49=>'kiwi',50=>'banana',
	51=>'melon',52=>'pineapple',53=>'melon',54=>'apple',55=>'cucumber',56=>'pineapple',57=>'cucumber',58=>'orange',59=>'cucumber',60=>'orange',
	61=>'grape',62=>'cherry',63=>'apple',64=>'cherry',65=>'pear',66=>'cherry',67=>'pear',68=>'kiwi',69=>'pear',70=>'kiwi',
	71=>'banana',72=>'apple',73=>'banana',74=>'melon',75=>'pineapple',76=>'melon',77=>'pineapple',78=>'cucumber',79=>'pineapple',80=>'cucumber',
	81=>'apple',82=>'grape',83=>'orange',84=>'grape',85=>'cherry',86=>'grape',87=>'cherry',88=>'pear',89=>'cherry',90=>'apple',
	91=>'kiwi',92=>'banana',93=>'kiwi',94=>'banana',95=>'melon',96=>'banana',97=>'melon',98=>'pineapple',99=>'apple',100=>'pineapple'
};

def subtract_sum(u)
  begin
  u = u .- u.to_s.chars.map(&:to_i).reduce:+
  end until $fruits[u]
  $fruits[u].chomp
end

#! Retorna un saludo con orientacion a objetos

class Solution
  def self.main(*args)
    puts "Hello World!"
  end
end

#! Recibe un año y retorna a que siglo pertenece

def century(year)
  (year.to_f / 100).ceil
end

#! Retorna la suma de todos los elementos de un array sin importar que sea un string

def sum_mix(x)
	x.map { |x| x.to_i }.sum
end

#! Elimina la primera y ultima letra de un string

def remove_char(s)
  s[1...-1]
end

def remove_char(s)
  s[1..-2]
end

def remove_char(s)
  #your code here
  word = s.split('')
  word.pop
  word.shift
  word.join
end

#! Recibe un numero y cuenta a partir de el

def monkey_count(n) (0..n).to_a.map { |e| e} end

def monkey_count(n) (1..n).to_a end
	def monkey_count(n)
		[*1..n]
	end
# (5), [1, 2, 3, 4, 5])
# (3), [1, 2, 3])
# (9), [1, 2, 3, 4, 5, 6, 7, 8, 9])

# ! Toma cierta cantidad de elementos de un array

def take list, n
  list.take(n)
end

def take(list, n) list[0,n] end

# ! Suma los elementos de un array

def sum(numbers)
  numbers.inject(0, :+)
end

def sum(n) n.sum end

# ! Retorna si un numero es primo

def primo(n)
	contador = (2..n).to_a.map { |e| n % e == 0 }.select { |e| e == true}
	if contador.length > 1
		false
	else
		true
	end
end

def primo(n)
	for i in (2..n - 1) do
		if n % i == 0
			return true
		end
		return false
	end
end

# ! Imprime una escalera

def draw_stairs n
	(0..n).to_a.map { |e| "#{' ' * e}I" }.join("\n")
end

puts draw_stairs(1)

#! Calcula la propina que vas a dar

def calculate_tip(amount, rating)
	case rating.downcase
		when "terrible" then 0
		when "poor" then (amount * 0.05).ceil
		when "good" then (amount * 0.1).ceil
		when "great" then (amount * 0.15).ceil
		when "excellent" then (amount * 0.2).ceil
		else "Rating not recognised"; 
		end
end

def calculate_tip(amount, rating)
	rate = %w(terrible poor good great excellent).index(rating.downcase)
	return 'Rating not recognised' unless rate

	(amount * rate * 0.05).ceil
end

# ! Retorna dependiendo la cantidad de 'Goods ' en un array si una idea es buena o mala

def well(x)
  case x.count('good')
  when 0
    'Fail!'
  when (1..2)
    'Publish!'
  else
    'I smell a series!'
  end
end

def well(x)
  goods = x.count('good')
  goods > 2 ? 'I smell a series!' : goods > 0 ? 'Publish!' : 'Fail!'
end

# ! Elimina los espacios dentro de un string

def no_space(x)
  x.delete(' ')
end

#! Si un un booleano pasado es true se llama a alguna funcion

def _if(bool, ifTrue, ifFalse)
  bool ? ifTrue.call : ifFalse.call
end

def _if(bool, ifTrue, ifFalse)
  (bool ? ifTrue : ifFalse).call
end