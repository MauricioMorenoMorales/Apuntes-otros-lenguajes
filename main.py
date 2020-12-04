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

# ! Funcion que verifique las calificaciones de 2 examenes

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

def square_sum(numbers):
		return sum(x * x for x in numbers) 

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

def arr(n=0):
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
    return sum(xrange(num + 1))

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

#! Retorna una palbra capitalizada

def capitalizeWord(s):
    return s.title()

capitalizeWord = str.capitalize

#! Retorna area o perimetro dependiendo los tamaños

def area_or_perimeter(l, w):
    return l * w if l == w else (l + w) * 2

area_or_perimeter = lambda a, b : a * b if a == b else 2 * (a + b)
#?(4, 4), 16)
#?(6, 10), 32)