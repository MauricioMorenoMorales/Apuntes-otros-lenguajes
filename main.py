#! 100 !Crea un generador de promedios

def get_average(marks):
	return sum(marks) // len(marks)

#! Crea un generador de saludos

def saludar(nombre):
		return f"Hello {nombre}"
print(saludar('mauricio'))

#! Capitaliza un nombre

def Capitalizar(nombre):
	return nombre.capitalize()


# ! Genera un contador de horas en milisegundos

def past(h, m, s):
		return (3600*h + 60*m + s) * 1000

# past(1,1,1) ->3661000

#! 

def weather_info (temp):
		c = convertToCelsius(temp)
		if (c <= 0):
				return (str(c) + " is freezing temperature")
		else:
				return (str(c) + " is above freezing temperature")

def convertToCelsius (temperature):
	celsius = (temperature - 32) * (5.0/9.0)
	return celsius

#! 
	def repeat_str(repeat, string):
		return repeat * string

#! 
def solution(a, b):
		return a+b+a if len(a)<len(b) else b+a+b

#  Funcion que verifique las calificaciones de 2 examenes

def check_exam(arr1, arr2):
		return max(0, sum(4 if a == b else -1 for a, b in zip(arr1, arr2) if b))

def check_exam2(arr1,arr2):
		score = 0
		for i in range(0,4):
				if arr1[i] == arr2[i]:
						score += 4
				elif arr1[i] == "" or arr2[i] == "":
						score += 0
				else:
						score -= 1
		return score if score >= 0  else 0

# check_Exam(["a", "a", "b", "b"], ["a", "c", "b", "d"]) → 6

# ! Suma dos arrays

def array_plus_array(arr1,arr2):
		return sum(arr1+arr2)

# ! Retorna la suma de cada numero en un array a su segunda potencia

def square_sum(numbers):
		return sum(x ** 2 for x in numbers)

# square_sum([0, 3, 4, 5]) -> 50

# ! retorna el primer numero que no se a consecutivo

def first_non_consecutive(arr):
		if not arr: return 0
		for i, x in enumerate(arr[:-1]):
				if x + 1 != arr[i + 1]:
						return arr[i + 1]

def first_non_consecutive2(a):
		i = a[0]
		for e in a:
				if e != i:
						return e
				i += 1
		return None

# ! Retorna un saludo interpolado

def greet(name):
		return "Hello, {} how are you doing today?".format(name)

def greet2(name):
		return f'Hello, {name} how are you doing today'


# ! Llena un array

def arrFiller(n=0):
		return list(range(n))

def arr(n = 0):
		return [i for i in range(n)]

#! Determina si tu estas tocando el banjo

def areYouPlayingBanjo(name):
	return name + (' plays' if name[0].lower() == 'r' else ' does not play') + " banjo";

def areYouPlayingBanjo2(name):
	if name[0].lower() == 'r':
			return name + ' plays banjo'
	else:
			return name + ' does not play banjo'

#? (areYouPlayingBanjo("martin"), "martin does not play banjo");
#? (areYouPlayingBanjo("Rikke"), "Rikke plays banjo");

#! Invierte los valores

def invert(lst):
		return [-x for x in lst]

def invert(lst):
	return list(map(lambda x: -x, lst));

#?([1,2,3,4,5]),[-1,-2,-3,-4,-5])
#?([1,-2,3,-4,5]), [-1,2,-3,4,-5])

#! Suma los elementos dentro de un numero

def summation(num):
	return sum(range(num + 1))

def summation(num):
	return (1+num) * num / 2

#?(1), 1)
#?(8), 36)
#?(22), 253)

#! Determina si un heroe lleva la cantidad suficiente de munición para matar al dragon

def hero(bullets, dragons):
	return bullets >= dragons * 2

def hero(bullets, dragons):
	return dragons <= bullets / 2

#?(10, 5), True)
#?(7, 4), False)
#?(4, 5), False)

#! Retorna si podemos dividir algo

def is_divide_by(number, a, b):
	return number % a == 0 and number % b == 0

#?(-12, 2, -6)  ->  true
#?(-12, 2, -5)  ->  false
#?(45, 1, 6)    ->  false
#?(45, 5, 15)   ->  true

#! Retorna un saludo

def hello(name=''):
	return f"Hello, {name.title() or 'World'}!"

def hello(name=""):
	return f"Hello, {name.capitalize() if name else 'World'}!"

#! Retorna el numero faltante más pequeño dentro de un array

def next_id(arr):
	t = 0
	while t in arr:
		t +=1
	return t

def next_id(arr):
	for i in range(len(arr)+1):
		if i not in arr:
			return i

#?([0,1,2,3,4,5,6,7,8,9,10]), 11)
#?([5,4,3,2,1]), 0)
#?([0,1,2,3,5]), 4)

#! Toma la velocidad en km/s y lo convierte redondeado abajo a cm/s

def cockroach_speed(s):
	return s // 0.036

def cockroach_speed(s):
	cm_per_km = 100000
	sec_per_hour = 3600
	return int(s * cm_per_km / sec_per_hour)

#! Retorna una palbra capitalizadam

def capitalizeWord(s):
	return s.title()

capitalizeWord = str.capitalize

#! Retorna area o perimetro dependiendo los tamaños

def area_or_perimeter(l, w):
	return l * w if l == w else (l + w) * 2

area_or_perimeter = lambda a, b : a * b if a == b else 2 * (a + b)
#?(4, 4), 16)
#?(6, 10), 32)

#! Repite un string determinada cantidad de veces

def repeat_str(repeat, string):
	return repeat * string

def repeat_str(repeat, string):
	solution = ""
	for i in range(repeat):
		solution += string
	return solution

#?(4, 'a'), 'aaaa')
#?(3, 'hello '), 'hello hello hello ')

#! Retorna un falso binario

def fake_bin(x):
	return ''.join('0' if c < '5' else '1' for c in x)

def fake_bin(x):
	result = ""
	for num in x:
		if int(num) < 5:
			result = result + "0"
		else:
			result = result + "1"
	return result

#?["01011110001100111", "45385593107843568"],
#?["101000111101101", "509321967506747"],
#?["011011110000101010000011011", "366058562030849490134388085"],

#! Retorna determinado patron

def solution(a, b):
	return a+b+a if len(a)<len(b) else b+a+b

def solution(a, b):
	return '{0}{1}{0}'.format(*sorted((a, b), key=len))

#?(('45', '1'), '1451'),
#?(('13', '200'), '1320013'),
#?(('Soon', 'Me'), 'MeSoonMe'),
#?(('U', 'False'), 'UFalseU')

#! Retorna si un numero es divisible entre otros dos

def is_divisible(n,x,y):
	return n % x == 0 and n % y == 0

def is_divisible(n, x, y):
	return n % x == n % y == 0


#?(3,3,4),False)
#?(12,3,4),True)
#?(8,3,4),False)

#! Determina a que cuarto de año pertenece cierto mes

def quarter_of(month):
	# your code here
	if month in range(1, 4):
		return 1
	elif month in range(4, 7):
		return 2
	elif month in range(7, 10):
		return 3
	elif month in range(10, 13):
		return 4

from math import ceil
def quarter_of(month):
	return ceil(month / 3)

#?(3), 1)
#?(8), 3)
#?(11), 4)

#! Obtiene un planeta por su numero en el sistema solar

def get_planet_name(id):
	return {
		1: "Mercury",
		2: "Venus",
		3: "Earth",
		4: "Mars",
		5: "Jupiter",
		6: "Saturn",
		7: "Uranus",
		8: "Neptune",
	}.get(id, None)

def get_planet_name(id):
	return ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune"][id-1]

#! Devuelve la derivada

def derive(coefficient, exponent):
	return f'{coefficient * exponent}x^{exponent - 1}'

def derive(coefficient, exponent): 
	return("{}x^{}".format(coefficient*exponent, exponent-1))

#?(7,8), "56x^7")
#?(5,9), "45x^8")

#! Abrevia un nombre

def abbrevName(name):
	return '.'.join(w[0] for w in name.split()).upper()

def abbrevName(name):
	first, last = name.upper().split(' ')
	return first[0] + '.' + last[0]

#?Sam Harris => S.H
#?Patrick Feeney => P.F

##! Alterna las mayusculas con las minusculas

def to_alternating_case(string):
	return string.swapcase()

def to_alternating_case(string):
	return ''.join([c.upper() if c.islower() else c.lower() for c in string])

#?Mauricio => mAURICIO

#! Muestra si un string está en uppercase

def is_uppercase(inp):
	return inp.isupper()

def is_uppercase(inp):
	return inp.upper()==inp

#?is_uppercase("hello I AM DONALD") == False
#?is_uppercase("HELLO I AM DONALD") == True
#?is_uppercase("ACSKLDFJSgSKLDFJSKLDFJ") == False

#! Traduce las letras en polaco

def correct_polish_letters(s):
	return s.translate(str.maketrans("ąćęłńóśźż", "acelnoszz"))

def correct_polish_letters(st):
	l = "ąćęłńóśźż"
	lt = "acelnoszz"
	for i in range(len(l)):
		st = st.replace(l[i], lt[i])
	return st

#?("Jędrzej Błądziński"),"Jedrzej Bladzinski"

#! Calcula si tienes el suficiente combustible para llegar a cierto lugar

def zeroFuel(distance_to_pump, mpg, fuel_left):
	return distance_to_pump <= mpg * fuel_left

zeroFuel = lambda distance, mpg, gallons: mpg * gallons >= distance

#?(50, 25, 2), True)
#?(100, 50, 1), False)

#! Encuentra la diferencia de edades entre el más viejo y el mas joven

def difference_in_ages(ages):
	# your code here
	return (min(ages) , max(ages) , max(ages) - min(ages))

def difference_in_ages(ages):
	age = sorted(ages)
	return (age[0], age[-1], (age[-1]-age[0]))

#?([16, 22, 31, 44, 3, 38, 27, 41, 88]), (3, 88, 85))
#?([5, 8, 72, 98, 41, 16, 55]), (5, 98, 93))
#?([57, 99, 14, 32]), (14, 99, 85))

#! Remueve el numero par de cada array

#?(['Hello', 'Goodbye', 'Hello Again']),['Hello', 'Hello Again'])
#?([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),[1, 3, 5, 7, 9])
#?([['Goodbye'], {'Great': 'Job'}]),[['Goodbye']])

#! Retorna un int como texto

def switch_it_up(n):
	return ['Zero','One','Two','Three','Four','Five','Six','Seven','Eight','Nine'][n]

def switch_it_up(number):
	dict = {
	1: "One",
	2: "Two",
	3: "Three",
	4: "Four",
	5: "Five",
	6: "Six",
	7: "Seven",
	8: "Eight",
	9: "Nine",
	0: "Zero"}
	return dict.get(number)

def switch_it_up(number):
	if number is 0: return "Zero"
	if number is 1: return "One"
	if number is 2: return "Two"
	if number is 3: return "Three"
	if number is 4: return "Four"
	if number is 5: return "Five"
	if number is 6: return "Six"
	if number is 7: return "Seven"
	if number is 8: return "Eight"
	if number is 9: return "Nine"

#! Llena un array de forma (n..1)

def reverseseq(n):
	return list(range(n, 0, -1))

def reverseseq(n):
	return range(n, 0, -1)

#! retorna si un autobus tiene la cantidad necesaria de pasajeros si es asi retorna 0 si no retorna cuantos espacios faltan

def enough(cap, on, wait):
	return max(0, wait - (cap - on))

def enough(cap, on, wait):
	return wait + on - cap if wait + on > cap else 0

#! Retorna esta tabla

def multi_table(number):
		return '\n'.join(f'{i} * {number} = {i * number}' for i in range(1, 11))

def multi_table(number):
		st = str()
		for x in range(1,11):
				z = number * x
				st += '{} * {} = {}\n'.format(x,number,z)
		sti = st.strip('\n')
		return sti

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

def reverseWords(str):
		return " ".join(str.split(" ")[::-1])

def reverseWords(str):
		return ' '.join(reversed(str.split(' ')))

# (reverseWords("hello world!"), "world! hello")
# (reverseWords("yoda doesn't speak like this" ),  "this like speak doesn't yoda")
# (reverseWords("foobar"                       ),  "foobar")
# (reverseWords("kata editor"                  ),  "editor kata")

#! Retorna una simple formula

def quadratic(x1, x2):
		return (1,-x1-x2,x1*x2)

#! Retorna un saludo con orientacion a objetos

class Solution:
	@staticmethod
	def main(self, *args):
			print("Hello World!")

class Solution:
		#your code here
		def main(self):
				print('Hello World!')


#! Retorna la suma de todos los elementos de un array sin importar que sea un string

def sum_mix(arr):
		return sum(map(int, arr))

def sum_mix(arr):
		return sum(int(n) for n in arr)

def sum_mix(arr):
		result = 0
		for a in arr:
				try:
						result += a
				except TypeError:
						result += int(a)
		return result

#! Elimina la primera y ultima letra de un string

def remove_char(s):
    return s[1 : -1]

def remove_char(s):
    s = list(s)
    s.pop()
    s.pop(0)
    return ''.join(s)

#! Retorna la suma de un array

def sum_array(a):
	return sum(a)

# ! Toma cierta cantidad de elementos de un array

def take(arr,n):
	return arr[:n]

#! Recibe un numero y cuenta a partir de el

def monkey_count(n):
    return range(1, n+1)

# (5), [1, 2, 3, 4, 5])
# (3), [1, 2, 3])
# (9), [1, 2, 3, 4, 5, 6, 7, 8, 9])

#! Devuelve el array recibido multiplicado por 2

def maps(a):
    return [2 * x for x in a]

def maps(a):
    return map(lambda x:2*x, a)

# ! Imprime una escalera

def draw_stairs(n):
    return '\n'.join(' '*i+'I' for i in range(n))

# ! Retorna dependiendo la cantidad de 'Goods ' en un array si una idea es buena o mala

def well(x):
    c = x.count('good')
    return 'I smell a series!' if c > 2 else 'Publish!' if c else 'Fail!'

#! Recibe un array con varias palabras, las ordena alfabeticamente
#! despues elige la primera y divide las palabras con asteriscos
def two_sort(lst):
    return '***'.join(min(lst))

def two_sort(array):
    return '***'.join(min(array))

# (two_sort(["bitcoin", "take", "over", "the", "world", "maybe", "who", "knows", "perhaps"]), 'b***i***t***c***o***i***n' )
# (["turns", "out", "random", "test", "cases", "are", "easier", "than", "writing", "out", "basic", "ones"]), 'a***r***e')

#! Si un un booleano pasado es true se llama a alguna funcion

def _if(bool, func1, func2):
  func1() if bool else func2()

def _if(bool, func1, func2):
  if bool:
      func1()
  else:
      func2()

#! Conversión simple

def apple(x):
    if int(x) ** 2 > 1000:
        return "It's hotter than the sun!!"
    else:
        return "Help yourself to a honeycomb Yorkie for the glovebox."

def apple(x):
  return "It's hotter than the sun!!" if int(x) ** 2 > 1000 else  "Help yourself to a honeycomb Yorkie for the glovebox."

#! Escapa la variable! si el bonus es true se retorna un salario * 10

def bonus_time(salary, bonus):
    return "${}".format(salary * (10 if bonus else 1))

def bonus_time(salary, bonus):
    #your code here
    if bonus :
        return "$" + str(salary * 10)
    else:
        return "$" + str(salary)

#! Implementa una expresión regular 

import re

def is_digit(n):
    return bool(re.match("\d\Z", n))

import re
def is_digit(n):
    return bool(re.fullmatch(r'\d', n))

probando = 'xd xd'

#! Retorna el usuario más rico dentro de un conjunto de varios arrays

def array_sum(arr):
	return max(sum(element) for element in arr)

# print(array_sum([[1,1,1],[5,5,5],[2,2,2]]))

#! Retorna un string con el ascii y recibe un numero

def get_char(c):
	return chr(c)

#! Condiverte numeros a estring los suma y los devuelve como string

def sum_str(a, b):
	return str(int(a or 0) + int(b or 0))

def sum_str(a, b):
	print(a, b)
	if a == "" or a == None: a = "0"
	if b == "" or b == None: b = "0"
	return str(int(a)+int(b))

# sumSTr('9', '') -> 0
# sumSTr('10', '10') -> 20

#! Recibe un string y en base a lo que se le pase retorna otro string

def get_drink_by_profession(param):
	return {
		"jabroni": "Patron Tequila",
		"school counselor": "Anything with Alcohol",
		"programmer": "Hipster Craft Beer",
		"bike gang member": "Moonshine",
		"politician": "Your tax dollars",
		"rapper": "Cristal"
	}.get(param.lower(), "Beer")

#! Convierte un numero a binario

def to_binary(n):
    return int(f'{n:b}')

def to_binary(n):
  return int(bin(n)[2:])

#! Escapa de un tiburon, llega a el potoon para salvarte

def shark(pontoon_distance, shark_distance, you_speed, shark_speed, dolphin):
	if(pontoon_distance / you_speed < shark_distance / (shark_speed / 2 if dolphin else shark_speed)):
		return "Alive!"
	else:
		return "Shark Bait!"

def shark(pontoon_distance, shark_distance, you_speed, shark_speed, dolphin):
	if dolphin:
			shark_speed = shark_speed / 2

	shark_eat_time = shark_distance / shark_speed
	you_safe_time = pontoon_distance / you_speed

	return "Shark Bait!" if you_safe_time > shark_eat_time else "Alive!"

#! Selecciona un elemento en el index "n" de un array y luego multiplicalo a la n potencia

def index(array, n):
	try:
		return array[n] ** 2
	except:
		return -1

def index(array, n):
	return array[n]**n if n < len(array) else -1

#! Alerta a una oveja de ser comida por un lobo

def warn_the_sheep(queue):
	n = len(queue) - queue.index('wolf') - 1
	return f'Oi! Sheep number {n}! You are about to be eaten by a wolf!' if n else 'Pls go away and stop eating my sheep'

def warn_the_sheep(queue):
	i = queue[::-1].index('wolf')
	if i == 0:
			return 'Pls go away and stop eating my sheep'
	return f'Oi! Sheep number {i}! You are about to be eaten by a wolf!'

#! Retorna un numero como parse float y si no se puede convertir retorna none

def parse_float(string):
	try:
			return float(string)
	except:
			return None

#! Retorna booleano, recibe 2 arrays, cada elemento lo multiplicas por dos y sumas y comparas las respuestas

def array_madnes(a,b):
	return sum(i ** 2 for i in a) > sum(i ** 3 for i in b)

#! Ejemplos para formatear texto

def integrate(coef, exp):
    exp = exp + 1
    coef = coef / exp if coef % exp else coef // exp
    return f"{coef}x^{exp}"

def integrate(coefficient, exponent):
    return (str(coefficient // (exponent + 1)) + 'x^' + str(exponent + 1))

def get_size(w, h, d):
    area = 2*(w*h + h*d + w*d)
    volume = w*h*d
    return [area, volume]

#! Retrona cuantas veces aparece un elemento en un array

def count_sheeps(arrayOfSheeps):
  return arrayOfSheeps.count(True)

#! Convierte un numero en entero

string_to_number = int

#! Filtra si un elemento de una lista se encuentra dentro de otra

geese = {"African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"}

def goose_filter(birds):
    return [bird for bird in birds if bird not in geese]

geese2 = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]
def goose_filter2(birds):
    return list(filter(lambda x: x not in geese, birds))

#! Retorna el minimo y maximo de un array

def min(arr):
    low = arr[0]
    for i in arr[1:]:
        if i < low:
            low = i
    return low

def max(arr):
    high = arr[0]
    for i in arr[1:]:
        if i > high:
            high = i
    return high

#! Cuenta ovejas dependiendo de el numero que se le pase

def count_sheep(number):
    response = ""
    for i in range(number):
        response += f'{i + 1} sheeps...'
    return response

def count_sheep(n):
    return ''.join(f"{i} sheep..." for i in range(1,n+1))

# ! Ejemplo de subclases

def God():
    return [Man(), Woman()]

class Human(object):
    pass

class Man(Human):
    pass

class Woman(Human):
    pass

#! Retorna si una palabra se encuentra dentro de un string

def sp_eng(sentence): 
    return 'english' in sentence.lower()

sp_eng=lambda _:'english'in _.lower()

#! Recibe un array y hace un rango entre el numero menor y el mayor de el array

def pipe_fix(l):
    return [x for x in range(min(l), max(l)+1)]

def pipe_fix(num):
    return range(min(num), max(num)+1)

#! Mejor forma de interpolar

def greet(name):
    if(name == "Johnny"):
        return "Hello, my Love"
    else:
        return "Hello {name}".format(name=name)

#! Remplaza las letras "T" por "U"

def DNAtoRNA(dna):
    return dna.replace('T', 'U')

def DNAtoRNA(dna):
    return "".join(["U" if c=="T" else c for c in dna])

DNAtoRNA = lambda d: d.replace("T", "U")

#! Recibe un input numero y retorna un string de "01010" de el tamaño de el numbero

def stringy(size):
    return "10" * (size / 2) + "1" * (size % 2)

def stringy(size):
    return ('10' * size)[:size]

def stringy(size):
    return "".join([str(i % 2) for i in range(1, size + 1)])

#! Retorna un booleano si cada string que recibe inicia y termina con la misma letra

def feast(beast, dish):
    return beast[0]==dish[0] and dish[-1]==beast[-1]

def feast(beast, dish):
    return beast.startswith(dish[0]) and beast.endswith(dish[-1])

#! Convierte un numero en un string

def number_to_string(num):
	return str(num)

number_to_string = str

#! Recibe 2 Array<string> Array<number> con la informacion de los equipos y retorna un string
#! Que felicite al ganador

def uefa_euro_2016(teams, scores):
    return f"At match {teams[0]} - {teams[1]}, {'teams played draw.' if scores[0] == scores[1] else teams[scores.index(max(scores))] + ' won!'}"

#! Retorna 2 respuestas si el nombre es mayor que 2 el nombre y las dos primeras letras
# String -> Array<string>

who_is_paying = lambda n: [n, n[:2]] if len(n)>2 else [n]

def who_is_paying(name):
    return [name,name[0:2]] if len(name)>2 else [name]


#! Cuenta la cantidad de letras que tiene una palbra
# :string -> {key: string}
from collections import Counter

def char_freq(message):
    return Counter(message)

#* Clever
from collections import Counter as char_freq

def char_freq(message):
    result = {}
    for letter in message:
        result[letter] = result.get(letter, 0) + 1
    return result

#! REtorna un saludo
# name: Array<string> city: string, state: string

def say_hello(name, city, state):
  return "Hello, {}! Welcome to {}, {}!".format(" ".join(name), city, state)

#! Repite un string determinada cantidad de veces
# string: string, n: number

def repeat_it(string,n):
    return string * n if isinstance(string,str) else 'Not a string'

#! Cuenta si un array tiene determinada cantidad de "/" y retorna respuesta
# string: string -> Array<string>

def bald(string):
    hair_names = {
        0: "Clean!",
        1: "Unicorn!",
        2: "Homer!",
        3: "Careless!",
        4: "Careless!",
        5: "Careless!",
    }
    return [string.replace("/", "-"), "Hobo!"] if string.count("/") > 5 else [string.replace("/", "-"), hair_names[string.count("/")]]

#TODO 1238 si el input tiene más de 3 puntos entre los dos elementos retorna respuesta
def cat_mouse(x):
    return 'Escaped!' if x.count('.') > 3 else "Caught!"

#TODO Cuenta los baches dentro de una carretera

def bumps(road):
    return "Woohoo!" if road.count("n") <= 15 else "Car Dead"

#TODO 1246

def maskify(cc):
    return "#"*(len(cc)-4) + cc[-4:]

def maskify(cc):
    return '{message:#>{fill}}'.format(message=cc[-4:], fill=len(cc))

def maskify(cc):
    l = len(cc)
    if l <= 4: return cc
    return (l - 4) * '#' + cc[-4:]


#TODO 1260

def tap_code_translation(text):
    dots = {'a':'. .',
	'b':'. ..',
	'c':'. ...',
	'd':'. ....',
	'e':'. .....',
	'f':'.. .',
	'g':'.. ..',
	'h':'.. ...',
	'i':'.. ....',
	'j':'.. .....',
	'k':'. ...',
	'l':'... .',
	'm':'... ..',
	'n':'... ...',
	'o':'... ....',
	'p':'... .....',
	'q':'.... .',
	'r':'.... ..',
	's':'.... ...',
	't':'.... ....',
	'u':'.... .....',
	'v':'..... .',
	'w':'..... ..',
	'x':'..... ...',
	'y':'..... ....',
	'z':'..... .....'}
    return ' '.join([dots[i] for i in text])

from string import ascii_lowercase as low

memo = {c:f"{'.'*(i//5+1)} {'.'*(i%5+1)}" for i,c in enumerate(low[:10]+low[11:])}
memo['k'] = memo['c']

def tap_code_translation(text):
    return ' '.join(map(memo.get, text))

#TODO 1 1333

import string
def DNA_strand(dna):
    return dna.translate(string.maketrans("ATCG","TAGC"))

pairs = {'A':'T','T':'A','C':'G','G':'C'}
def DNA_strand(dna):
    return ''.join([pairs[x] for x in dna])

def gordon(a):
    return '!!!! '.join(a.upper().split()).translate(str.maketrans('AEIOU', '@****'))+'!!!!'

# TODO 1 1483

def count_languages(lst):
    language = [el['language'] for el in lst]
    return {i: language.count(i) for i in language}

def count_languages(D):
    R = {}
    for d in D:
        l = d['language']
        if l in R: R[l]+=1
        else : R[l]=1
    return R

from collections import Counter
def count_languages(lst):
    return Counter([d['language'] for d in lst])

# TODO 1 1502

def is_ruby_coming(lst):
    return any(x["language"] == "Ruby" for x in lst)

def is_ruby_coming(lst):
    for human in lst:
        if human['language'] == 'Ruby':
            return True
    return False

# TODO 1 1510 Ordena una lista con inputs tipo '100G' '200T' '1kg' etc

def arrange(arr):
    def normalized(weight):
        if weight.endswith("T"): return int(weight[:-1]) * 10 ** 6
        if weight.endswith("KG"): return int(weight[:-2]) * 10 ** 3
        if weight.endswith("G"): return int(weight[:-1])
    return sorted(arr, key=normalized)

def flatten(a):
    return int(a.replace('G', '').replace('K', '000').replace('T', '000000'))

def arrange(arr):
    return sorted(arr, key = flatten)

# TODO 1523 Cuenta cuantas palabras estan compuestas exclusivamente de unas letras ademas de no repetirse

def shifter(st):
    return sum(all(elem in "HIMNOSWXZ" for elem in x) for x in set(st.split()))

import re

def shifter(st):
    cnt = 0
    str = set(st.split())
    for x in str:
        if re.findall("^[WMHINOSXZ]+$", x, flags=re.IGNORECASE):
            cnt = cnt + 1
    return cnt

# TODO 1 1547 Cuenta elementos en un array y retorna respuesta dependiendo el conteo

from collections import Counter
from itertools import chain

def crap(garden, bags, cap):
    c = Counter(chain(*garden))
    return 'Dog!!' if c['D'] else ('Clean','Cr@p')[c['@'] > bags*cap]

def crap(garden, bags, cap):
    cap *= bags
    for turf in garden:
        if 'D' in turf: return 'Dog!!'
        cap -= turf.count('@')
    return 'Cr@p' if cap < 0 else 'Clean'

def crap(garden, bags, cap):
    # Flatten list including only cr@p and dogs
    flat = [e for line in garden for e in line if e in 'D@']
    return 'Dog!!' if 'D' in flat else 'Clean' if len(flat) <= bags * cap else 'Cr@p'

# TODO 1 1593 Ordena las palabras alfabeticamente por su letra final

def last(s):
    return sorted(s.split(), key=lambda x: x[-1])

from operator import itemgetter

def last(s):
    return sorted(s.split(), key=itemgetter(-1))

# TODO 1 1603 Remplaza las primeras letras de dos palabras "node_modules" -> "mode_nodules"

def spoonerize(words):
    a, b = words.split()
    return '{}{} {}{}'.format(b[0], a[1:], a[0], b[1:])

def spoonerize(words):
    a, b = words.split()
    return f"{b[0]}{a[1:]} {a[0]}{b[1:]}"

# TODO 1 1616  Remplaza las vocales por su posicion dentro de el string

def vowel_2_index(string):
    vowels = 'aeiouAEIOU'
    return ''.join(x if x not in vowels else str(n + 1) for n,x in enumerate(string))

import re

def vowel_2_index(string):
    return re.sub("[aeiou]",lambda m:str(m.end()),string,0,re.I)

#TODO 1 1628 Introduce una letra enmedio de un string

def middle_me(N, X, Y):
    if N % 2 == 1:
        return X
    else:
        return Y * (N//2) + X + Y * (N//2)

middle_me=lambda N,X,Y:(X.center(N+1,Y),X)[N%2]

# TODO 1 1655 Retorna la suma de los numeros de un cumpleaños, cada numero debe ser menor a 10

def life_path_number(s):
    return int(s.replace("-", "")) % 9 or 9

def sumDigits(n):
    s = sum([int(n) for n in str(n)]) 
    if s >= 10:
        return sumDigits(s)
    return s

def life_path_number(birthdate):
    return sumDigits(sum([sumDigits(n) for n in birthdate.split("-")]))

def life_path_number(birthdate):
    
    return int(birthdate.replace('-','')) % 9 or 9

#! 1 1699 Cuenta la cantidad de letras dentro de un array y determina que lado gana

def alphabet_war(fight):
    d = {'w':4,'p':3,'b':2,'s':1,
        'm':-4,'q':-3,'d':-2,'z':-1}
    r = sum(d[c] for c in fight if c in d)
 
    return {r==0:"Let's fight again!",
            r>0:"Left side wins!",
            r<0:"Right side wins!"
            }[True]

def alphabet_war(fight):
    result = sum("zdqm".find(c) - "sbpw".find(c) for c in fight)
    return "{} side wins!".format("Left" if result < 0 else "Right") if result else "Let's fight again!"

def alphabet_war(fight):
    #your code here
    sum = 0
    for i in fight:
      if i == "w":
          sum = sum + 4
      elif i == "p":
           sum = sum + 3
      elif i == "b":
           sum = sum + 2
      elif i == "s":
           sum = sum + 1
      elif i == "m":
           sum = sum - 4
      elif i == "q":
           sum = sum - 3
      elif i == "d":
           sum = sum - 2
      elif i == "z":
           sum = sum - 1
      
             
    if sum > 0:
        return  "Left side wins!"
    elif sum == 0:
        return "Let's fight again!"
    else:
        return "Right side wins!"

POWER = {
    # left side
    'w': -4, 'p': -3, 'b': -2, 's': -1,
    # right side
    'm': 4, 'q': 3, 'd': 2, 'z': 1 }

def alphabet_war(fight):
    result = sum( POWER.get(c, 0) for c in fight )
    return "Let's fight again!" if not result else \
          ["Left", "Right"][result > 0] + " side wins!"

		  