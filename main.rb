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