Delta significa cambio, al ponerlo al lado de una variable significa cuanto ha cambiado esa variable, por ejemplo cuanto ha cambiado y, o cuanto ha cambiado y respecto x
$$ \delta y $$
$$ \frac{\delta y}{\delta x} $$
> Linea secante: Una linea secante es la linea recta que conecta dos putos de cambio, es la hipotenusa del triangulo que se hace entre $$ \frac{\delta y}{\delta x} $$

> La formula del cambio es esta, tomamos el punto mas grande y lo restamos entre el menor
> $$ \frac{\delta A}{\delta x} = \frac{A(x_2) - A(x_1)}{x_2 - x_1} $$

> Linea tangente, si vas de manera discrecional entre puntos notaras que algunos cambios son distintos, por ejemplo en un segmento entre 0-1 el crecimiento puede ser igual a 1 pero en un segmento siguiente 1-2 el crecimiento puede ser tres, entonces el punto 1 debe de tener un valor intermedio entre 1 y 3, esa linea es la linea tangente

Como el cambio solo puede medirse respecto a 2 puntos entonces no se puede medir el cambio dentro de un solo punto, ese es el problema que resuelve el calculo<<<!

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