- Las graficas de disco son buenas para comparar datos respecto al total, las graficas de barras son buenas para compara los valores entre si
- Los histogramas son graficas en las que cada valor se refiere a un rango no a un valor, estos rangos tienen que ser proporcionales unos de otros
- Middle half: Un rango en el que se encuentran el 50% de las ocurrencias, se ubica normalmente entre el 25% y el 75%
- Las graficas de lineas son optimas para comparar distintas graficas a la vez
- Puedes usar escalas logaritmicas tanto para eje x como eje y para obervar valores que estan muy saturados en un solo lado de la grafica
- La escala linear se obtiene sumando valores, la escala algoritmica se obtiene multiplicando valores
- con una linea recta vertical puedes buscar valores cuando busques relaciones o tendencias, si ocurre muchas veces que la linea corresponde con dos valores puede que esta grafica no contenga relaciones
- The number of times an outcome appears in our dataset directly relates to how likely it is to happen again in the future.
# Probabilidad
- Probability lets us estimate the likelihood of an event based on the information available to us.
- Si tienes informacion que te dice que hay una mayor probabilidad pase, no importa que todo el mundo crea lo contrario, tu tienes informacion util y tu estimado es mejor que el de los demás
- A medida que vamos ganando mas informacion el estimado debe de ir cambiando debido, en un partido de futbol si un equipo mete un gol la probabilidad de este de ganar va a aumentar
- Formatos para anotar probabilidades
- $$ \frac{163}{380} = 43\% = 0.43 $$
- La probabilidad de un evento puede cambiar a lo largo del tiempo, en ese caso se puede sacar una media, por ejemplo la probabilidad de que un equipo de futbol gane si es local, varia entre un 44% y 49% en algunos años por lo que para calcular la probabilidad del año actual se sacaria una media de todos los años
- Si tienes valores distintos, por ejemplo en el 2003-2005 una probabilidad de 30% y en el 2020-2022 una probabilidad de 50% tienes que tomar como valor de referencia los valores mas cercanos al presente
- Probabilidad de que en un partido un equipo meta 0 o 1 gol  $$ P(A||B) = A+B$$
- Probabilidad de que en un partido uno de los equipos termine con un cero $$ P(A)+P(B)-P(A\&B)$$
- 2 4 8 16 32 64 128 256 512
- Cuando tienes dos eventos con probabilidades distintas A = 0.5 y B = 0.2, SOLO si estos eventos pueden pasar no a la vez, se pueden sumar al calcularlos, si no se solapan
## Correlaciones
Una correlacion es fuerte si dependiendo un input da un rango cerrado de output, y se mide entre 1 y -1 siendo 1 una fuerte correlacion positiva y -1 una fuerte correlacion negativa uwu

# Obtener suma de probabilidades
Si tienes 5 dias con 20% de probabilidad de llover cada uno, la forma de obtener la posibilidad se hace con los iguientes pasos
- Obtiene el complemento de cada dia en este caso 80%
- Multiplica cada una de las posibilidades en este caso 4/5 * 4/5  * 4/5  * 4/5  * 4/5
- Al resta  -1024/3125 a el numero 1, y esa sera la posibilidad 2101/3125

# Cursos Platzi
- Estadistica descriptiva: Recopila, organiza presenta y describe un conjunto de datos con el proposito de facilitar la interpretacion generalmente con el apoyo de tablas, medidas o gráficas
- Estadistica Inferencial: Recopila informacion de una parte pequeña de la poblacion y por induccion dtermina el comportamiento de la población
