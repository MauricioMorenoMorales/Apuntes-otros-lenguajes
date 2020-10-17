#100 !Crea un generador de promedios

def get_average(marks):
  return sum(marks) // len(marks)

# Crea un generador de saludos

def saludar(nombre):
    return f"Hello {nombre}"
print(saludar('mauricio'))

# Capitaliza un nombre

def Capitalizar(nombre):
  return nombre.capitalize()

# 106

def weather_info (temp):
    c = convertToCelsius(temp)
    if (c <= 0):
        return (str(c) + " is freezing temperature")
    else:
        return (str(c) + " is above freezing temperature")

def convertToCelsius (temperature):
  celsius = (temperature - 32) * (5.0/9.0)
  return celsius

# 127
  def repeat_str(repeat, string):
    return repeat * string

# 133
def solution(a, b):
    return a+b+a if len(a)<len(b) else b+a+b