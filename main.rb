# Verifica que un numero sea divisible entre otros
def is_divide_by(number, a, b)
    number % a == 0 && number % b == 0
end

puts is_divide_by(15,3,15)
puts is_divide_by(10,5,3)

# Has un hello world que capitalize un imput y que tenga un valor por defecto de hola Mundo

def hello(name = 'World')
    "Hello #{name.empty? ? 'World' : name.capitalize}"
end

puts hello('MaUricio')
puts hello()
puts hello('')
