# Corrección y Eficiencia :memo:
> Concepto Corrección : Técnicas para medir la corrección de un programa

> Concepto de Eficiencia : Métodos para medir la eficiencia de un programa

## Calidad de un programa
- Corrección :
*El grado en que una aplicación satisface sus especificaciones y consigue los objetivos encomendados por el cliente.*

- Fiabilidad :
*El grado que se puede esperar que una aplicación lleve a cabo las operaciones especificadas y con la precisión requerida.*

- Eficiencia :
*La cantidad de recursos hardware y software que necesita una aplicación para realizar las operaciones con los tiempos de respuesta adecuados.*

- Integridad :
*El grado con que puede controlarse el acceso al software o a los datos a personal no autorizado.*

- Facilidad de uso :
*El esfuerzo requerido para aprender el manejo de una aplicación, trabajar con ella, introducir datos y conseguir resultados.*

- Facilidad de mantenimiento :
*El esfuerzo requerido para localizar y reparar errores ? Se va a vincular con la modularización y con cuestiones de legibilidad y documentación.*

- Flexibilidad :
*El esfuerzo requerido para modificar una aplicación en funcionamiento.*

- Facilidad de prueba :
*El esfuerzo requerido para probar una aplicación de forma que cumpla con lo especificado en los requisitos.*

- Portabilidad :
*El esfuerzo requerido para transferir la aplicación a otro hardware o sistema operativo.*

- Reusabilidad :
*Grado en que las partes de una aplicación pueden utilizarse en otras aplicaciones.*

- Interoperabilidad :
*El esfuerzo necesario para comunicar la aplicación con otras aplicaciones o sistemas informáticos.*

- Legibilidad (Documentación) :  *El código fuente de un programa debe ser fácil de leer y entender. Esto obliga a acompañar a las instrucciones con comentarios adecuados. Relacionado con la presentación de documentación.
Todo el proceso de análisis y diseño del problema y su solución debe estar documentado mediante texto y/o gráficos para favorecer la comprensión, la modificación y la adaptación a nuevas funciones.*

### Un programa bien documentado será fácil de leer y mantener. 
- Se aconseja la inserción de comentarios en el programa. 
- Los identificadores se deberán elegir de manera tal que sean autoexplicativos.
- Es recomendable realizar un comentario general del objetivo del programa.
- Cuando se realiza el mantenimiento de un programa no sólo se actualiza el código, sino también los comentarios del programa.
- Los comentarios intercalados en el programa (documentación on line), deben realizarse con criterio para contribuir a la claridad del programa.

## Corrección de programa 
Un programa es correcto si cumple con las especificaciones del problema a resolver. Por esta razón, es que la especificación debe ser completa, precisa y no ambigua.

Para medir la corrección de un programa, el programador cuenta con diferentes técnicas:

 :white_check_mark: TESTING
 :white_check_mark: WALKTHROUGH
 :white_check_mark: DEBUGGING

#### TESTING
La técnica de Testing es el proceso mediante el cual se proveen evidencias convincentes respecto a que el programa hace el trabajo esperado.
| | |
| :-: | :-: |
|Diseñar un plan de pruebas.|Poner atención en los casos límite.|
|Decidir cuales aspectos del programa deben ser testeados y encontrar datos de prueba para cada uno de esos aspectos.|Diseñar casos de prueba sobre la base de lo que hace el programa y no de lo que se escribió del programa.
|Determinar el resultado que se espera que el programa produzca para cada caso de prueba.|Mejor aún, diseñar casos de prueba antes de que comience la escritura del programa. (Esto asegura que las pruebas no están pensadas a favor del que escribió el programa)

Cuando se tiene el plan de pruebas y el programa, el plan debe aplicarse sistemáticamente.

Durante este proceso es importante analizar las postcondiciones en función de las precondiciones establecidas en el problema. 

:pushpin: Las precondiciones, junto con las postcondiciones, permiten describir la función que realiza un programa, sin especificar un algoritmo determinado.

:pushpin: Las precondiciones describen los aspectos que se consideran verdaderos antes que el programa comience a ejecutarse, por ejemplo: entradas de datos disponibles. 

:pushpin: Las postcondiciones describen los aspectos que deben cumplirse cuando el programa terminó.

#### DEBUGGING
La técnica de Debugging  es el  proceso mediante el cual se pueden identificar y corregir errores.

Puede involucrar:

- el diseño y aplicación de pruebas adicionales para ubicar y conocer la naturaleza del error.
- el agregado de sentencias adicionales en el programa para poder monitorear su comportamiento más cercana.

Los errores pueden provenir de varios caminos, por ejemplo:

- el diseño del programa puede ser defectuoso.
- el programa puede usar un algoritmo defectuoso.

#### WALKTHROUGH
La técnica de Walkthroughs consiste en recorrer el programa ante una audiencia.

:green_heart: La lectura de un programa a alguna otra persona provee un buen medio para detectar errores.

:green_heart: Esta persona no comparte preconceptos y está predispuesta a descubrir errores u omisiones.

:green_heart: A menudo, cuando no se puede detectar un error, el programador trata de probar que no existe, pero mientras lo hace, puede detectar el error, o bien puede que el otro lo encuentre. 

## Eficiencia de Programas
Se define la eficiencia como una métrica de calidad de los algoritmos, asociada con una utilización óptima de los recursos del sistema de cómputo donde se ejecutará el programa, principalmente la memoria utilizada y el tiempo de ejecución empleado.
### Tiempo de Ejecución y Memoria utilizada
Para cada problema se pueden tener varias soluciones algorítmicas correctas,
Sin embargo el uso de recursos (tiempo, memoria) de cada una de esas soluciones puede ser muy diferente.

> Medición de la Memoria utilizada en un programa

- Se puede calcular únicamente la cantidad de memoria estática que utiliza el programa.
- Se analizan las variables declaradas y el tipo correspondiente.

> Medición del Tiempo de ejecución de un programa

- Los datos de entrada al programa
   - Tamaño 
   - Contenido
- La calidad del código generado por el compilador utilizado 
- La naturaleza y rapidez de las instrucciones de máquina empleadas en la ejecución del programa
- El tiempo del algoritmo base.

El tiempo de ejecución de un programa debe definirse como una función de la cantidad de datos de entrada.

Para algunos programas, el tiempo de ejecución se refiere al tiempo de ejecución del “peor” caso.  En estos casos, se obtiene una cota superior del tiempo de ejecución para cualquier entrada.

Ejemplos: Problema de búsqueda secuencial en vectores y listas.

El tiempo de ejecución de un programa puede calcularse de dos maneras:

:white_check_mark: Análisis Empírico
:white_check_mark: Análisis Teórico

#### Análisis Empírico :test_tube:
Para realizar un análisis empírico, es necesario ejecutar el programa y medir el tiempo empleado en la ejecución 

Inconveniente: este análisis tiene varias limitaciones porque puede dar una información pobre de los recursos consumidos: 

- Obtiene valores exactos para una máquina y unos datos determinados.
- Es completamente dependiente de la máquina donde se ejecuta.
- Requiere implementar el algoritmo y ejecutarlo repetidas veces.

#### Análisis Teórico :test_tube:  
Para realizar un análisis teórico, es necesario establecer una medida intrínseca de la cantidad de trabajo realizado por el algoritmo. Esto nos permite comparar algoritmos y  seleccionar la mejor implementación.

Ventajas

- Obtiene valores aproximados.
- Es aplicable en la etapa de diseño de los algoritmos, uno de los aspectos fundamentales a tener en cuenta. Se puede aplicar sin necesidad de implementar el algoritmo. 
- Independiente de la máquina donde se ejecute.
- Permite analizar el comportamiento.

Consideraciones generales para tener en cuenta al hacer el cálculo teórico:

:triangular_flag_on_post: Considerar el número de operaciones elementales que emplea el algoritmo.

:triangular_flag_on_post: Considerar que una operación elemental utiliza un tiempo constante para su ejecución, independientemente del tipo de dato con el que trabaje.

:triangular_flag_on_post: Suponer que cada operación elemental se ejecutará en una unidad de tiempo (dejando de lado la magnitud).

:triangular_flag_on_post: Suponer que una operación elemental es una asignación, una comparación o una operación aritmética simple.

Reglas Generales para el cálculo del tiempo de ejecución:

- Regla 1: Sentencias consecutivas
- Regla 2: For  / For anidados
- Regla 3: While / Repeat…Until
- Regla 4: If / else

IMPORTANTE: Los comentarios, declaraciones y operaciones de entrada/salida (Read / Write), no se consideran al realizar el cálculo

### Regla 1 Sentencias consecutivas :mate:
<sup>Supongamos que se desea conocer el valor en grados centígrados de una temperatura  medida en grados Fahrenheit. Se tiene la siguiente función que recibe un valor expresado en F y lo devuelve en C.</sup>
````pascal
Function convertirFaC (tem:real): real;
begin	
  convertirFaC := (tem-32) * 5 /9;
end.
````
Recordar que una operación elemental :arrow_right: una unidad de tiempo

### Regla 2  For  / For anidados :mate:
<sup>Se tiene el siguiente programa que lee las temperaturas registradas durante el mes de mayo de 2019 en una ciudad de la Pcia de Bs. As y calcula la temperatura promedio. ¿Cuántas operaciones elementales realiza el programa?</sup>
````pascal
Program temperaturas;

Var valor, total: real;|
Begin
 total:= 0; 
 for i:= 1 to 30 do begin
   read (valor);
   total:= total + valor;
 end; 
 prom:= total div 30;
 write(´Temperatura Promedio:´, prom);
end;
````
Se debe calcular la cantidad de operaciones elementales que se ejecutan dentro del FOR y multiplicarla por la cantidad de veces que se ejecuta la instrucción FOR.

Además, la instrucción FOR realiza:
- asignación inicial i:=1 (1)
- testeo de i <=30 (31)
- incrementos de i:= i+1  (30*2 )  entonces 1+ 31 + 60 = 92 op
En general : 3*n+2, siendo n la cantidad de repeticiones

Total-> (2*30) + (3*30+2) + 3 = 155 op. elem.

<sup>Supongamos ahora que se cuenta con la función Contar que recibe un vector de temperaturas y devuelve la cantidad de veces que aparece la temperatura con valor 10 en el vector. ¿Cuánta memoria y cuántas unidades de tiempo emplea el módulo?</sup>
````pascal
Type temperaturas = array [1..30] of real; 

Function contar ( tem:temperaturas): integer;
Var i: 1..30; can10 : integer;
begin	
  can10 := 0;
  {recorrido total del vector}
  For  i  := 1  to  30 do  
    If  (tem [i] = 10 ) then  can10 := can10 + 1;   
  contar := can10;
end.
````
- La línea {1} -> 1 unidad de tiempo
- La línea {2} -> 3n + 2 = 92 unidades de tiempo 
- La línea {3} evalúa una condición -> 1 unidad de tiempo
- La línea {4} -> 2 unidades de tiempo.
- Por la tanto, dentro del FOR se cuentan 3 unidades  3 * 30 
- La línea {5} -> 1 unidad

Total de operaciones = 2 + 90 + 92 (como máximo!!!)  ¿Por qué?

Cantidad de unidades de tiempo = 184 (como máximo!!!)

<sup>Aplicando la Regla del FOR, analicemos ahora el tiempo de ejecución del siguiente programa:</sup>
````pascal
Program FA;
Var
  valor,i,j,suma :integer;
Begin
 suma:=0; {1}
 for j:= 1 to 300 do   {2}
  for i:= 1 to 200 do  {3}
    suma:= suma + I;   {4}
End.
````
Cantidad de operaciones (unidades de tiempo)
- La línea {1} -> 1 
- La línea {2} -> 3n + 2 = 3*300 +2 = 902 
- La línea {3} -> 3n + 2 = 3*200 +2 = 602
- La línea {4} -> 2 

(((2 * 200 + 602) * 300) + 902) + 1= 301.503 ut

{4} * 200 + {3}

{4} * 200 + {3} * 300

{4} * 200 + {3} * 300 + {2}

{4} * 200 + {3} * 300 + {2} + {1}

### Regla 3 While / Repeat…Until :mate:
<sup>Supongamos que el siguiente programa calcula la nota promedio de un alumno de Informática a partir de las notas obtenidas en sus exámenes finales. ¿Cuál es el tiempo de ejecución de la solución propuesta?</sup>
````pascal
Program W;
Var
  nota,i,suma, prom :integer;
Begin
 suma:=0;  {1}
 total:= 0; {2}
 read (nota);
 while (nota<>-1) do begin {3}
   total:= total+1; {4}
   suma_N:= suma_N + nota; {5}
   read (nota);
 end;
 prom:= suma_N / total; {6}
 writeln (`Promedio: ´, prom)
End.
````
Cantidad de operaciones (unidades de tiempo)
- La línea {1} -> 1 
- La línea {2} -> 1 
- La línea {3} -> n
- La línea {4} -> 2 
- La línea {5} -> 2 
- La línea {6} -> 2 
((4 * n) + n+1) + 4 = (5n + 5) ut

Se debe calcular la cantidad de operaciones elementales que se ejecutan dentro del WHILE y multiplicarla por la cantidad de veces que se ejecuta el WHILE. Como no se conoce esa cantidad se considera el PEOR CASO. Por ejemplo, se supone una cantidad de notas n…

### Regla 4 If / else :mate:
<sup>Calcular la cantidad de operaciones elementales del siguiente programa</sup>
````pascal
Program uno;
Var
  valor, i, j, suma :integer;
 Begin
  read (valor);
  if (valor >8) then begin
                  suma:=0;
                  for i:= 1 to 3000 do
                      suma:= suma + I;
                 end
                 else begin
                   suma:=0;
                   for j:= 1 to 300 do
                      for i:= 1 to 200 do
                         suma:= suma + I;
                 end;
   end;
End.
````
for i :arrow_right: ((2*3000)+9002) + 1= 15.003 ut

for j :arrow_right: (((2 * 200 + 602) * 300) + 902) + 1= 301.503 ut

Total de operaciones = 1 + 301.503= 301.504 (como máximo!!!) ¿Por qué?

## Eficiencia en soluciones modularizadas
- Si se tiene un programa con módulos, es posible calcular el tiempo de ejecución de los distintos procesos, uno a la vez, partiendo de aquellos que no llaman a otros. Debe haber al menos un módulo con esa característica. 
- Después puede evaluarse el tiempo de ejecución de los procesos que llamaron a los módulos anteriores y así sucesivamente.

## Eficiencia – Tiempo de ejecución- Conclusiones
Algunas condiciones en las cuales el tiempo de ejecución de un programa se puede ignorar en favor de otros factores:

- Si un programa se va a utilizar algunas veces, el costo de su escritura y depuración es el dominante.
- Si un programa se va a ejecutar sólo con entradas “pequeñas”, la velocidad de crecimiento puede ser menos importante.
- Un algoritmo eficiente pero complicado puede no ser apropiado para el mantenimiento por parte de un tercero.  

## ¿Los siguientes conceptos influyen o no sobre el tiempo de ejecución de un programa?

:octocat: Cantidad de datos de entrada
:octocat: Cantidad de líneas de código
:octocat: Orden en que se ingresan o aparecen los datos
:octocat: Cantidad de iteraciones presentes en el programa
:octocat: Uso de variables globales
:octocat: Uso de variables locales
:octocat: Uso de parámetros

<!--faltaria algunos ejemplos de la teoria nueva-->

