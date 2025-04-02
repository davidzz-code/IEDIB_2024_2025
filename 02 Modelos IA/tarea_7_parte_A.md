# Modelos de IA - Tarea 7

PARTE A: Modelos extensos de lenguaje

Sobre un chatbot basado en LLM de vuestra elección (ChatGPT, Gemini, Claude, DeepSeek), escribid un libro de un mínimo de doce páginas siguiendo el siguiente esquema.	 
 ### 1.	Escribid un prompt inicial lo suficientemente largo, explicando el texto que queréis producir, el título de vuestra obra, la audiencia, el estilo, la longitud de cada capítulo y solicitad una propuesta de índice de doce capítulos. El texto puede ser de cualquier estilo que queráis: ficción, ensayo, técnico…  
En mi caso he elegido ChatGPT para realizar el ejercicio y este es el prompt que le he propuesto:

```
Quiero crear un libro de ficción titulado “El Susurro del Pueblo”, un thriller de misterio con elementos de terror psicológico.

Especificaciones
	•	Género: Misterio, suspense, terror psicológico.
	•	Audiencia: Jóvenes y adultos interesados en historias de misterio.
	•	Estilo: Narración en tercera persona, con una atmósfera inquietante.
	•	Extensión: Un total de doce capítulos. Cada capítulo debe tener aproximadamente dos páginas de extensión.
	•	Tono: La historia debe comenzar con una sensación de normalidad y perfección, pero poco a poco debe ir revelando detalles inquietantes que hagan que el lector sospeche de lo que realmente sucede. La tensión y el misterio se deben construir de forma sutil y gradual, sin revelar demasiado al principio.

Contexto del Mundo:
La historia se desarrolla en un pequeño pueblo llamado Valdeazul, un lugar aparentemente aislado y tranquilo, rodeado de bosques y montañas. Valdeazul es un sitio que parece estar suspendido en el tiempo, donde todo parece funcionar a la perfección: el clima es siempre agradable, la gente es extremadamente amable y la vida transcurre sin problemas. Las casas son pintorescas, las calles siempre limpias y las personas siempre sonrientes, sin importar la hora o el día. Los habitantes del pueblo parecen no tener problemas, no hay rumores ni conflictos, y los visitantes a menudo comentan que se siente como si hubieran llegado a un lugar ideal, como un paraíso apartado de las complicaciones del mundo. Sin embargo, pronto Daniel, el protagonista, comenzará a notar detalles extraños y desestabilizadores: la gente actúa de manera repetitiva, parece que el tiempo no avanza y algo inquietante está ocurriendo durante las noches. El pueblo guarda un misterio que solo se revela poco a poco.

Personajes principales:
	1.	Daniel Aguirre – Protagonista. Fotógrafo independiente, curioso y escéptico. Se niega a aceptar lo sobrenatural hasta que la evidencia es abrumadora. Investiga Valdeazul.
	2.	Isabel Olmedo – Dueña de la posada del pueblo. Es amable, maternal y siempre parece saber lo que Daniel necesita antes de que lo pida. Nunca responde preguntas directas sobre su pasado.
	3.	Pablo y Teresa Mendoza – Matrimonio mayor, siempre sonrientes, siempre juntos. Nunca discuten ni muestran una sola emoción negativa, son extrañamente perfectos.
	4.	Martín, el niño sin sombra – Un niño que parece saber más de lo que debería. Siempre está jugando con una peonza y, cuando Daniel le pregunta algo, responde con acertijos o frases inquietantes.
	5.	El Hombre del Sombrero Gris – La única persona que no sonríe en el pueblo.

Aspectos a Incluir:
	•	El tiempo parece no avanzar en Valdeazul. Los días y las estaciones se sienten congelados.
	•	Los recuerdos de los habitantes parecen estar alterados o fragmentados. Algunos se olvidan de eventos recientes, mientras que otros recuerdan con una claridad extraña momentos específicos del pasado sin ningún motivo aparente.
	•	La gente del pueblo repite las mismas rutinas y conversaciones constantemente, sin que parezca haber variaciones.
	•	Las noches son especialmente inquietantes: algunos habitantes de Valdeazul susurran cosas en la oscuridad y una música relajante suena a las 3:33 am una noche a la semana.
	•	La presencia de Martín, el niño sin sombra, es clave para entender lo que realmente está ocurriendo en Valdeazul.
	•	El Hombre del Sombrero Gris es el único que no encaja en el cuadro perfecto del pueblo. Su falta de sonrisa y su actitud enigmática deberían llamar la atención de Daniel.

Genera un índice de doce capítulos con una breve sinopsis que estructuren la historia de forma progresiva y me permitan comenzar con el libro.
```

 ### 2.	Con prompts sucesivos breves, extraed los capítulos consecutivos de vuestra obra. Podéis insertar correcciones si el resultado obtenido no se ajusta a vuestra idea. 
 ### 3.	Obtened la URL de la conversación y añadidla al cuaderno de Colab que entregaréis en esta tarea.  
  Respondiendo al punto 2 y 3 aquí adjunto [el enlace a la conversación](https://chatgpt.com/share/67ec55e5-c6e4-8005-91dd-b661c85fdc96) con ChatGPT.
  Una vez ha generado el índice le he pedido que genere el libro por capítulos con algunos detalles de mejora después de cada capítulo.

  Únicamente he generado 3 debido a que al ser una versión gratuita de ChatGPT pierde el contexto fácilmente por la cantidad de tokens. Esto no significa que genere un mal resultado pero sí que limita a la hora de querer generar un libro de 12 capítulos con una cohesión lógica.
  Por lo tanto con estos 3 primeros capítulos he podido comprobar la calidad de la generación para esta situación.

 
### 4.	Evaluad el resultado obtenido. ¿Hasta qué punto sirve como producto final? ¿Necesita mucho más trabajo? ¿El resultado es mejor o peor de lo que esperabais?  
El resultado no está nada mal teniendo en cuenta el esfuerzo y trabajo por mi parte que ha podido suponer. En el caso de preguntarnos si sirve como producto final diría que no.

La razón es que a pesar de ser un resultado aceptable no tiene la delicadeza que podría tener un escritor o escritora en el sentido de pensar hacia donde queremos llevar a los personajes y la historia.

La verdad que la manera de escribir me ha sorprendido mucho; las decripciones de lugares o los momentos de crear misterio me consiguen transportar realmente al mundo que se plantea, sin embargo, se puede notar que está improvisando lo que ocurre sin tener un plan estructurado para la historia.

Sobre si necesita más trabajo, depende mucho para qué contexto estemos hablando. Es muy posible que crear un cuento para niños sea completamente accesible sin necesidad de mucho trabajo extra. Pero si hablamos de un libro enfocado a gente más adulta y con una historia más compleja, entonces sí creo que le falte trabajo.

En conclusión podría decir que el resultado es mejor de lo que me esperaba en la manera de escribir pero un poco peor en los detalles para guiar al espectador a través de un camino predefinido por un escritor, o en este caso, por una IA.
