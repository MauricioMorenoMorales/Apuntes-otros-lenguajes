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