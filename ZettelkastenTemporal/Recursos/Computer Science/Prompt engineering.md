> Puedes pedir que te inserte imagenes si pides como resultado de output un archivo markdown

**Mejorar resultados iterando:**  
ㅤ  
La mejora de resultados a través de iteraciones, consiste en generar respuestas iniciales que se van refinando y mejorando a través de una serie de iteraciones. En cada iteración, se toma como punto de partida la respuesta anterior y se le hace una serie de ajustes, adiciones o eliminaciones para mejorar su calidad, dando un feedback al modelo sobre qué se debe mantener y qué se debe cambiar.  
ㅤ  
Este proceso de refinamiento continuo permite que las respuestas generadas sean cada vez más precisas, relevantes y satisfactorias según nuestras necesidades, y se logra a través de la retroalimentación constante y el ajuste incremental. Esta técnica puede ser útil en diferentes casos:  
ㅤ

-   Mejorar una misma respuesta hasta lograr el resultado deseado, dándole feedback a ChatGPT sobre qué debe cambiar en cada respuesta.
-   Generar un elemento complejo o de varias etapas, dividiéndolo en varias subtareas. Por ejemplo.
-   🧑‍💻 Generar código en diferentes lenguajes de programación, añadiendo elementos o funciones sobre cada respuesta generada.
> Puedes darle instrucciones para que actue de cierto modo de ese modo haces mas humano a chatgtp y puedes darle roles tipo, se una terminal linux, se un critico de cine, se un personaje de ficcion, etc

> Puedes dar la instruccion "en tono editorial", para meorar el output de chat gtp

> Puedes ir modificando la informacion con distintas tecnicas similar a un functor
> (-> Genera puntos de informacion
> 	Expresalos de manera editorial
> 	Agrega cierta informacion necesaria
> 	modifica el tono
> 	Integra informacion
> 	etc...)

## Hiper parametros
Los [hiperparámetros](https://learn.microsoft.com/en-us/connectors/openaigpt4ip/#edit-prompt) son opciones que puedes configurar al utilizar un modelo de lenguaje como GPT-3.5 o GPT-4. Aquí te explico de manera sencilla en qué consisten dos de los hiperparámetros más comunes:

- **Temperature**: se refiere a la cantidad de “ruido” o aleatoriedad que se introduce en las respuestas generadas por el modelo. Cuando la temperatura es baja, las respuestas tienden a ser más predecibles y coherentes, mientras que cuando la temperatura es alta, las respuestas pueden ser más sorprendentes e impredecibles. Por ejemplo, si utilizas un modelo de lenguaje para generar texto creativo, puede ser útil aumentar la temperatura para obtener respuestas más inesperadas y novedosas.
- **Top_p**: este hiperparámetro determina la cantidad máxima de probabilidad acumulada que se utiliza para generar una respuesta. En otras palabras, el modelo seleccionará solo las opciones con las probabilidades más altas hasta que la probabilidad total alcance el valor de top_p. Por ejemplo, si top_p se establece en 0,8, el modelo solo considerará las opciones que sumen hasta el 80% de probabilidad total. Esto puede ser útil para limitar la variedad de respuestas generadas y asegurar que sean coherentes y relevantes.
- • **n**: número de respuestas o outputs que se espera en la respuesta.
Se agregan al final por ejemlo
"a random query": temperature=1

## Crear contenido extenso
Para crear contenido extenso tienes que ir iterando un proceso yendo desde lo general a lo particular

(-> genera puntos clave
	(-> por cada punto clave (especifica mas informacion)))

