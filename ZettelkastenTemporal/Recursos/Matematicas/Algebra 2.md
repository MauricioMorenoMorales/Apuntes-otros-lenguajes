# Funciones

## Transformaciones
Puedes modificar pendiente o posicion de una grafica
#### Horizontalmente
le aumentas el valor al parametro ejemplo (x - 2)^2
> El movimiento es invertido, si es negativo el numero se movera a la derecha, si es positivo se movera a la izquierda
#### Verticalmente
Le aumentas el valor al resultado final por ejemplo x^2 + 2
### Inclinacion, Anchura, Dirección
Multiplicas el parametro por ejemplo 2x^2

## Vertex
EL vertex de una parabola es (h, k), en una parabola de la forma siguiente
$$ y = a(x -h)^2 + k $$
k = punto y del vertex
h = punto x del vertex
a = inclinacion, para calcular la inclinacion tienes que seleccionar un punto y remplazarlo y despejar por ejemplo tenemos el punto (0, -1)
$$ y = a(x-1)^2+3$$
$$ -1 = a(0-1)^2 + 3 $$
$$-1= a + 3 \therefore a = -4$$


## Domain and range
El dominio de una funcion es el set de todos los inputs validos que puede recibir, ya sea por
- Ua raiz negativa
- Una division entre cero

## Composicion de funciones
Puedes hacer una composicion de funciones con dos tipos de notacion
$$ h(g(x)) $$
$$ (h\circ g)(x) $$
Si te fijas el orden es como un pipeline inverso primero se aplica g y luego h lo que es desagradable jaja
> Ejemplo, una persona vende limonadas a 2 dolares, pero tiene que pagar impuestos
> f(x) calcula la ganancia y g(x) la ganancia despues de los impuestos
> $$ (g \circ f)(x) $$



# Factorizacion cuadratica

### Factorizar cuando existe A
> Usa esta cuando existe A en el primer termino
Primero multiplicaremos a por c en este caso 6 * -12
$$ 6x^2 + x - 12$$

$$ 6 * (-12) = -72 $$ 

Despues factorizamos el resultado, en este caso 72 y sus multiplos deben de sumar b en este caso 1

$$ 72 = 2^3 * 3^2 \therefore -8 +9 = 1$$

Despues escribimos la misma ecuacion pero remplazamos b por la factorizacion anterior

$$ 6x^2 + 9x - 8x -12$$

Despues obtenemos factores comunes buscando el gcd

$$ 3x(2x + 3) -4(2x + 3) \therefore (3x -4)(2x +3) $$

### Completar el cuadrado

> Si B es divisible entre dos y c es negativa podemos realizar esta tecnica

$$f(x) = x^2 + 8x -14 $$

$$0 = x^2 + 8x -14 $$

$$ 14 = x^2 + 8x $$

_Tomamos la mitad del valor de 8 y generamos b a ambos lados_

$$ 16 +14 = x^2 + 8x + 16 $$

$$ 30 = x^2 + 8x + 16 $$

$$ 30 = (x+4)^2$$

$$ \sqrt 30 = x+4$$

$$ -4\pm\sqrt 30 = x$$


### Pasos para obtener la formula general
La formula general se obtiene de seguir los pasos de el metodo de completar el cuadrado

$$ ax^2 + bx + c = 0 $$

$$ x^2 + \frac{b}{a}x + \frac{c}{a} = 0 $$

$$ x^2 + \frac{b}{a}x  = -\frac{c}{a} $$

la mitad de $\frac{b}{a} es \frac{b}{2a}$

$$ x^2 + \frac{b}{a}x + \frac{b^2}{4a^2} = -\frac{c}{a} $$

$$ \left( x + \frac{b}{2a} \right)^2 = -\frac{c}{a} +\frac{b^2}{4a^2}$$

$$ \left( x + \frac{b}{2a} \right)^2 = \frac{b^2-4ac}{4a^2} $$

$$ x + \frac{b}{2a}= \sqrt\frac{b^2-4ac}{2a^2} $$

$$ x + = \sqrt\frac{b^2-4ac}{2a^2} - \frac{b}{2a}$$

$$ x + = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$$

## Polinomials

> ? Si un polinomio exixte en la forma de $x^3+4x^2+x-6$ sus fatores podrian ser tres tipo (x+2)(x-1)(x+3)

### Factorizar agrupando



$$x^3 - 3x^2 - 4x + 12$$

$$(x^3 - 3x^2) (- 4x + 12)$$

$$x^2(x -3) -4(x -3)$$

$$(x^2 -4)(x -3)$$

And this can be factored more

$$(x^2 -4)(x -3)$$

$$(x +2)(x -2)(x -3)$$


### Agrupando por uno

$$ 2x^3 -4x^2 +x -2$$

$$ 2x^2(x -2) +x -2$$

$$ 2x^2(x -2) +1(x -2)$$

$$ (2x^2 +1)(x -2)$$

## Rational root

Esta forma tienes que hacer factorizacion prima el primer elemento y el ultimo
despues generas todos los numeros posibles de la factorizacion y divides el ultimo
numero por el primero de este modo

$$2x^3 -12x^2 +22x -12$$

Aqui tomarias el numero 2 y 12

$$Q = 2 = 2 | 1$$

$$P = 12 = 1 | 2 | 3 | 4 | 6 | 12$$

Asi que dividrias p entre q $ \frac{p}{q}$


$$P = 12 = 1 | 2 | 3 | 4 | 6 | 12$$

$$Q = 2 = 2 | 1$$

$$ \frac{1}{2} \frac{1}{1} \frac{2}{2} \frac{2}{1} \frac{3}{2} \frac{3}{1} etc...$$

### Simetria

las ecuaciones son simetricas solo si todos sus factores
son pares o impares

Estas dos son simetricas

$$ 3x^4 +2x^2 +2$$

$$ -3x^5 +4x^3 $$

Estas dos no

$$ 3x^4 +2x^2 + 5x + 2 $$

$$ -3x^5 + 7x^3 +1 $$

> Cuando una grafica es solo impar forma como una S, cuando
sus exponentes son pares forma una U

####  The fundamental theorem of algebra<<< Investigar

### multiplicity<<<

$$ \frac{12}{1231} $$
# Rational Functions

## Direct and inverse variation

> Direct variation:
> The ratio of variables stays constant
> If a variable increases the other increases
> $$ k = \frac{y}{x}$$

> Inverse variation
> The product of variables stays constant
> If one increases the other decreases
> $$ k = xy $$

In 4 days 4 painters can paint 12 rooms, how many days does it take for 4 painters to paint 3 rooms? <<<
$$ \frac{12}{4}p*d = rooms $$


In 1 day 4 painters can paint 3 rooms  how loint 36 rooms

$$ \frac{3}{4}p*d = rooms$$

#### Exponential variation
Cuando hay varaciones e incluyen exponenciaciones x seria el valor que se multiplicaria
$$ k=\frac{x}{x^p} \bigcirc k = x^py $$

## Rational functions and domains

Una asymptota vertical es creada cuando se trata de dividir por zero o la ecuacion resulta en una divicion entre cero, en este caso a será la asynptota
$$f(x) = \frac{1}{x-a}$$
Due this there will be missing domains in this example a
A rational function is a ratio of two polynomials
$$ y = \frac{4}{x^3} \bigcirc y= \frac{3x^2-4}{x+5} $$
Algunas funciones tienen multiples asymptotas otras no por ejemplo este primer polinomio tiene multiples asymptotas y el segundo no
$$y = \frac{1}{(x-7)(x+5)} $$
$$ y = \frac{x -2}{(x-2)(x+3)} \therefore y= \frac{1}{(x+3)} $$

## End behavior<<<
A horizontal asymptote is a line $y = h$. A function has a orizontal asymptote at $y = h$ if the functions get closer and closer to h as x become either very large positive or very large negative

> When the numerator has a smaller degree thant the denominator a rational function will have a horizontal asymptote at $y = 0$

> when the numerator and denominator of a rational function have the same degree, the graph has a horizontal asymptote
> This asymptote is at $y = h$, where h is the ratio of the leading coeficents

> A horizontal asymptote is found when the numerator's degree is less than or equal to the denominator's degree
> A slant asymptote is found when the numerator's degree is exactly one greater than the denomintaro's degree

## Valores absolutos
En una funcion del tipo
$$ f(x) = a|x+c|+d $$
el valor de d va a mover la grafica hacia arriba o abajo, como en una ecuacion cuadratica
c va a cambiar la posicion de izquierda a derecha, y a va a determinar la inclinacion de la parabola recta, es similar a una ecuacion cuadratica

## Piecewise function
Is defined by multiple functions, each applying to a dsifferent interval of the picewise function's domain
Por ejemplo esta funcion es de impuestos, si ganas 110.000 a los primeros 100.000 se les aplicara un impuesto del 15% pero a lo restante se le aplicara uno de 25%

## Floor
La funcion para rendondear hacia abajo un numero es la siguiente
$$ f(x) = \{ n \therefore n <= x < n + 1 $$
