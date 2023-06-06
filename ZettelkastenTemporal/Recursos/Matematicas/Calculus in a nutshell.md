Delta significa cambio, al ponerlo al lado de una variable significa cuanto ha cambiado esa variable, por ejemplo cuanto ha cambiado y, o cuanto ha cambiado y respecto x
$$ \delta y $$
$$ \frac{\delta y}{\delta x} $$
> Linea secante: Una linea secante es la linea recta que conecta dos putos de cambio, es la hipotenusa del triangulo que se hace entre $$ \frac{\delta y}{\delta x} $$

> La formula del cambio es esta, tomamos el punto mas grande y lo restamos entre el menor
> $$ \frac{\delta A}{\delta x} = \frac{A(x_2) - A(x_1)}{x_2 - x_1} $$

> Linea tangente, si vas de manera discrecional entre puntos notaras que algunos cambios son distintos, por ejemplo en un segmento entre 0-1 el crecimiento puede ser igual a 1 pero en un segmento siguiente 1-2 el crecimiento puede ser tres, entonces el punto 1 debe de tener un valor intermedio entre 1 y 3, esa linea es la linea tangente

Como el cambio solo puede medirse respecto a 2 puntos entonces no se puede medir el cambio dentro de un solo punto, ese es el problema que resuelve el calculo

Para resolver este punto seguiremos tomando dos puntos de referencia solo que seran infinitamente pequeños

## Derivadas
∂x representa un cambio finito en el valor de x, mientras dx representa un cambio infinitamente pequeño en el valor de x.

> Prueba:, supongamos tienes un cuadro, con los lados x + ∂x, esto te dara un grid de cuatro areas, las cuales seran
> $$ x^2 + ∂x*x+∂x*x+(∂x)^2 $$
> $$ x^2+2(∂x*x)+(∂x)^2 $$
> Si haces pruebas veremos que (∂x)^2 crece de una forma muy minuscula comparada con 2(∂x*x) por lo que se elimina y nos enfocamos solo en este ultimo termino

> ∂a representa el total del area aumentada del cuadrado y aveces se escribe como -> dA
> ∂x representa el valor de cambio de x y a veces se escribe como -> dx
> Considerando el punto anterior tenemos que
> $$dA = 2x*dx $$
> $$ \frac{dA}{dx} = 2x $$

La derivada de A(x)
La derivada de A(x) = x^2 es escrita tanto como
$$ \frac{dA}{dx} = 2x $$
$$A'(x) = 2x$$
_The derivative tells us that for any point x on A(x) = x^2 the slope of the line tangent of the curve will be 2x_

> Usando el metodo anterior de calcular las areas generadas por el cambio de un cuadrado con areas x+∂x, podemos calcular el crecimiento de un cubo con areas x+∂x teniendo un total de 7 areas extras en las que cambio el valor
> $$ 3x^2∂x + 3x(∂x)^2 + (∂x)^3 $$
> Ya que los 2 terminos finales representan un cambio sumamente pequeño podemos quedarnos solamente con
> $$ 3x^2∂x $$
> entonces el area total de cambio ∂A seria
> $$ \frac{∂A}{∂x} = 3x^2 $$

## Pendientes y optimizacion
> Para calcular maximos y minimos tienes que verificar que haya un/a cima/fondo que es cuando la derivada vale 0, pero para saber si es cima o fondo tenemos que checar si antes de llegar a ese punto la pendiente era positiva o era negativa
> - si la pendiente anterior es positiva entonces es maximo
> - Sila pendiente anterior es negativa entonces es minimo

>  *Obtener derivada*
> tenemos esta funcion 'p(16-p)' y vamos a calcular los puntos [p, p + ∂p]
> Primero reescribimos la funcion
> $$ R = 16p - p^2 $$
> Despues probaremos el punto ∂p
> $$ R + ∂R = 16(p + ∂p) - (p + ∂p)^2 $$
> 
> $$R + ∂R = 16p + 16∂p - p^2 - 2p∂p - ∂p^2$$
> Si te fijas en el resultado se encuentra la funcion original, aqui la pondremos al principio
> > $$R + ∂R = 16p - p^2 + 16∂p - 2p∂p - ∂p^2$$
> Ya que tenemos la funcion original odemos quitarla a ambos lados
> $$∂R = 16∂p - 2p∂p - ∂p^2$$
> Ya que ∂p^2 es sumamente pequeño lo podemos eliminar
> $$∂R = 16∂p - 2p∂p$$
> Podemos despejar la ∂p de los dos terminos
> $$\frac{∂R}{∂p} = 16 - 2p $$

> *Calcular los maximos o minimos*
> Tomando la funcion del ejemplo anterior buscaremos primero que valor equivale a cero
> $$ 0 = 16 - 2p \therefore p = 8 $$
> Una vez obtenido el valor maximo podemos tomar uno antes para saber si es pendiente ascendente o descendente
> $$16-2(7) = 2$$
> Al ser pendiente ascendente sabemos que 8 es un maximo

## Que es una derivativa <<<2

## Para que son las derivativas<<< 

### Linear approximation
In calculus, linear approximation is a method used to estimate the value of a function near a particular point by using the tangent line at that point as an approximation. It is also known as the tangent line approximation or the first-order approximation.

The basic idea behind linear approximation is that if you zoom in closely enough to a smooth curve, it will appear to be a straight line. By using the slope of the tangent line at a given point on the curve, you can approximate the behavior of the function near that point.

Mathematically, the linear approximation of a function f(x) at a point x=a can be expressed as:

L(x) = f(a) + f'(a)(x - a),

where L(x) represents the linear approximation of f(x), f(a) is the value of the function at x=a, f'(a) is the derivative of the function evaluated at x=a, and (x - a) represents the distance from the point of approximation.

## The second derivative
La segunda derivada nos ayuda a conocer minimos locales y maximos locales.
The second derivative of f measures the rate of change of the first derivative, so if c is a LOCAL max then f''(c) < 0 or viseverse

_saddle point_: cuando una grafica llega a un maximo pero regresa a un minimo pero vuelve a subir

### Higher-order Derivatives
Hay distintos niveles de derivadas a estas se les llaman ordenes
$$f^n(x) $$
Donde la n es el numero de niveles
$$ f^3(x) = f'''(3) $$
$$ f^0(x) = f(x) $$
Tambien se puede escribir
$$ \frac{d^nf}{dx^n} $$
### Para que nos sirven este tipo de derivadas<<<
Imagina que la funcion x(t) describe la posicion de un objeto en cierto tiempo t
entonces v(t) := x'(t) describe la velocidad, entonces x''(t) decribiria la aceleracion

