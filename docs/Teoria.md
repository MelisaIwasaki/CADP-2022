## Conceptos de Algoritmos Datos y Programas

> Análisis de problemas

> Definiciones Fundamentales

> Modelos + Datos = programa

> Tipos de datos

> Operaciones de lectura escritura

> Estructuras de control

**Informática:** Es la ciencia que estudia el análisis y resolución de problemas utilizando computadoras.

**Ciencia:** Se relaciona con una metodología fundamentada y racional para el estudio y resolución de los problemas. 
En este sentido la Informática se vincula especialmente con la Matemática y la Ingeniería

**Resolución:** Se puede utilizar las herramientas informáticas en aplicaciones de áreas muy diferentes tales como  biología, comercio, control industrial, administración, robótica, educación, arquitectura, etc.

**Computadora:** Máquina digital y sincrónica, con cierta capacidad de cálculo numérico y lógico controlado por un programa almacenado y con probabilidad de comunicación con el mundo exterior. Ayuda al hombre a realizar tareas repetitivas en menor tiempo y con mayor exactitud. No razona ni crea soluciones, sino que ejecuta una serie de órdenes que le proporciona el ser humano

### Paradigmas:   Imperativo - procedural     
- Funcional
- Imperativo
- Lógico
- Orientados a objetos

### 1. Poseer un problema

### 2. Modelizar el problema
El modelo define los mecanismos de interacción y sus condiciones. Establece el efecto sobre la máquina y el usuario. Indica los Informes necesarios.

### 3. Modularizar la solución
La descomposición funcional de todas las acciones que propone el modelo nos ayudará a reducir la complejidad, a distribuir el trabajo y en el futuro a reutilizar los módulos.

### 4. Realizar el programa
Una vez que se tiene la descomposición en funciones / procesos o módulos, debemos diseñar su implementación: esto requiere escribir el programa y elegir los datos a representar.

**Programa: Algoritmo + Datos**

**Algoritmo:** Las instrucciones (que también se han denominado acciones) representan las  operaciones que ejecutará la computadora al interpretar el programa. Un conjunto de instrucciones forma un algoritmo.

**Algoritmo:** Especificación rigurosa de la secuencia de pasos (instrucciones) a realizar sobre un autómata para alcanzar un resultado deseado en un tiempo finito. 

**Alcanzar el resultado en tiempo finito:** suponemos que un algoritmo comienza y termina. Está implícito que el número de instrucciones debe ser también finito.

**Especificación rigurosa:** que debemos expresar un algoritmo en forma clara y unívoca.

Si el autómata es una computadora, tendremos que escribir el algoritmo en un lenguaje “entendible” y ejecutable por la máquina.

**Datos:** Los datos son los valores de información de los que se necesita disponer y en ocasiones transformar para ejecutar la función del programa. 
Es una representación de un objeto del mundo real mediante la cual podemos modelizar aspectos del problema que se quiere resolver con un programa sobre una computadora. Puede ser constante o variable.

### Para el desarrollador:
**Operatividad:** El programa debe realizar la función para la que fué concebido.

**Legibilidad:** El código fuente de un programa debe ser fácil de leer y entender.Esto obliga a acompañar a las instrucciones con comentarios adecuados.

**Organización:** El código de un programa debe estar descompuesto en módulos que cumplan las subfunciones del sistema.

**Documentados:** Todo el proceso de análisis y diseño del problema y su solución debe estar documentado mediante texto y/o gráficos para favorecer la comprensión, la modificación y la adaptación a nuevas funciones.

### Para la computadora:
- Debe contener instrucciones válidas.
- Deben terminar.
- No deben utilizar recursos inexistentes.

**Utilizar la computadora**
La computadora es una máquina capaz de aceptar datos de entrada, ejecutar con ellos cálculos aritméticos y lógicos y dar información de salida (resultados), bajo control de un programa previamente almacenado en su memoria. 

### Tipo de datos
Un tipo de dato es una clase de objetos de datos ligados a un conjunto de operaciones para crearlos y manipularlos.
- Tienen un rango de valores posibles
- Tienen un conjunto de operaciones permitidas
- Tienen una representación interna


**SIMPLE:** aquellos que toman un único valor, en un momento determinado, de todos los permitidos para ese tipo.

**COMPUESTO:** pueden tomar varios valores a la vez que guardan alguna relación lógica entre ellos, bajo un único nombre.

**Definidos por el lenguaje:** Son provistos por el lenguaje y tanto la representación como sus operaciones y valores son reservadas al mismo.

**Definidos por el programador:** Permiten definir nuevos tipos de datos a partir de los tipos simples. 

### Tipo de datos numérico
Un tipo de dato numérico representa el conjunto de números que se pueden necesitar. Estos números pueden ser enteros o reales.

> Tipo de datos entero:

- Es un tipo de dato simple, ordinal
- Los valores son de la forma:  -10 , 200, -3000, 2560 
- Al tener una representación interna, tienen un número mínimo y uno máximo

<table>
<tr>
<td>Operadores matemáticos</td><td>Operadores lógicos</td><td>Operadores enteros</td>
</tr>
<tr>
<td>    
+  ,  -  ,  *  ,  /      
</td>
<td> 
< , > , = , <= , >=     
</td>
<td>    
MOD DIV     
</td>
</tr>
</table>

> Tipo de datos real:

- Es un tipo de dato simple, permiten representar números con decimales
- Los valores son de la forma: -10 , 200, -3000, 2560, 11.5,  -22.89 
- Al tener una representación interna, tienen un número mínimo y uno máximo

Las expresiones que tienen dos o más operandos requieren reglas matemáticas que permitan determinar el orden de las operaciones.  

El orden de precedencia para la resolución, ya conocido, es:
1. Operadores *, /
2. Operadores +, - 
3. Operadores div y mod.
En caso que el orden de precedencia natural deba ser alterado, es posible la utilización de paréntesis dentro de la expresión.

### Tipo de datos lógico
Un tipo de dato lógico permite representar datos que pueden tomar dos valores verdadero o falso.

- Es un tipo de dato simple, ordinal.
- Los valores son de la forma
  
          verdadero = true
  
          falso = false
  
Operadores lógicos  
<table>
<tr>
<td>Disyunción</td><td>Conjunción</td><td>Negación</td>
</tr>
<tr>
<td>or</td>
<td>and</td>
<td>not</td>
</tr>
</table>


 Conjunción 

| V | V | V |
| - | - | - |  
| F | F | F |
| V | F | F |
| F | V | F |
 
Disyunción
  
| V	| V |	V |
| - | - | - |   
| F	| F	| F |
| V	| F	| V |
| F	| V	| V |

Negación
  
| V	| F |
| - | - |
| F	| V |

### Tipo de datos caracter
El tipo de dato carácter representa un conjunto finito y ordenado de caracteres que la computadora reconoce.  Un dato de tipo caracter contiene solo un caracter.

- Es un tipo de dato simple, ordinal.
- Los valores son de la forma  ‘á‘    ‘!’    ‘Z’   ‘3’

Operadores relacionales
  
| = , < , > , <= , >= , <> |
| :-: |

La Tabla ASCII contiene todos los caracteres y el orden entre los mismos. http://ascii.cl/es/

**Variable:** Es una zona de memoria cuyo contenido va a ser alguno de los tipos mencionados anteriormente. La dirección inicial de esta zona se asocia con el nombre de la variable.
Puede cambiar su valor durante el programa.
  
**Constante:** Es una zona de memoria cuyo contenido va a ser alguno de los tipos mencionados anteriormente. La dirección inicial de esta zona se asocia con el nombre de la variable. NO puede cambiar su valor durante el programa.

Los diferentes tipos de datos deben especificarse y a esta especificación dentro de un programa se la conoce como declaración.

Una vez declarado un tipo podemos asociar al mismo variables, es decir nombres simbólicos que pueden tomar los valores característicos del tipo.

> Algunos lenguajes exigen que se especifique a qué tipo pertenece cada una de las variables. Verifican que el tipo de los datos asignados a esa variable se correspondan con su definición. Esta clase de lenguajes se denomina fuertemente tipados (strongly typed).

> Otra clase de lenguajes, que verifica el tipo de las variables según su nombre, se denomina auto tipados (self typed).

> Existe una tercera clase de lenguajes que permiten que una variable tome valores de distinto tipo durante la ejecución de un programa. Esta se denomina dinámicamente tipados (dynamically typed).

### READ
Es una operación que contiene la mayoría de los lenguajes de programación. Se usa para tomar datos desde un dispositivo de entrada (por defecto desde teclado) y asignarlos a las variables correspondientes.
El usuario ingresa un valor, y ese valor se guarda en la variable asociada a la operación read.

### WRITE
Es una operación que contiene la mayoría de los lenguajes de programación. Se usa para mostrar el contenido de una variable, por defecto en pantalla. 
El valor almacenado en la variable asociada a la operación write, se muestra en pantalla.

## Estructura de control
Todos los lenguajes de programación tienen un conjunto mínimo de instrucciones que permiten especificar el control del algoritmo que se quiere implementar.  Como mínimo deben contener: secuencia, decisión e iteración.

> Secuencia
 
<sup>La estructura de control más simple, está representada por una sucesión de operaciones (por ej. asignaciones), en la que el orden de ejecución coincide con el orden físico de aparición de las instrucciones.</sup>

> Decisión(if)
 
<sup>En un algoritmo representativo de un problema real es necesario tomar decisiones en función de los datos del problema. {Si la condición es verdadera o falsa, cambia la acción.}</sup>

> Iteración
 
<sup>Puede ocurrir que se desee ejecutar un bloque de instrucciones desconociendo el número exacto de veces que se ejecutan. 
Para estos casos existen en la mayoría de los lenguajes de programación estructurada las estructuras de control iterativas condicionales. 
Como su nombre lo indica las acciones se ejecutan dependiendo de la evaluación de la condición. 
 Estas estructuras se clasifican en pre-condicionales y post-condicionales.,</sup>

<sup>**Iteración pre condicionales(while):** Evalúa la condición y en caso de ser verdadera, ejecuta las acciones.Se repite mientras la condición es verdadera.Puede ejecutarse 0, 1 o más veces.
Importante: el valor inicial de la condición debe ser conocido o evaluable antes de la evaluación de la condición.</sup>
 
<sup>**Iteración post condicionales(repeat until):** Ejecuta las acciones y luego evalúa la condición. Se repite mientras la condición es falsa. Puede ejecutarse  1 o más veces.</sup>

> Repetición(for)
 
<sup>Es una extensión natural de la secuencia. Consiste en  repetir N veces un bloque de acciones. Este número de veces que se deben ejecutar las acciones es fijo y conocido de antemano.</sup>

<sup>**For i := 1 to 10 do**
- La variable índice debe ser de tipo ordinal 
- La variable índice no puede modificarse dentro del lazo
- La variable índice se incrementa y decrementa automáticamente
- Cuando el for termina la variable índice no tiene valor definido.</sup>

> Selección(case)
 
<sup>Permite realizar distintas acciones dependiendo del valor de una variable de tipo ordinal.
 Las opciones deben ser disjuntas.</sup>

## Máximos y Mínimos
- Utilizar una variable que representará al máximo o al mínimo.
- Inicializar la variable antes de comenzar la lectura de los datos. El máximo en un valor bajo y el mínimo en un valor alto.
- Actualizar la variable máximo o mínimo cuando corresponda.

## Tipo de dato definido por el usuario
Un tipo de dato definido por el usuario es aquel que no existe en la definición del lenguaje, y el programador es el encargado de su especificación.

````pascal
Type
    identificador = tipo;
````
 
Ventajas de la utilización de los tipos de datos definidos por el usuario:
 
**Flexibilidad:** en el caso de ser necesario modificar la forma en que se representa el dato, sólo se debe modificar una declaración en lugar de un conjunto de declaraciones de variables.
 
**Documentación:** se pueden usar como identificador de los tipos, nombres autoexplicativos, facilitando de esta manera el entendimiento y lectura del programa.

**Seguridad:** se reducen los errores por uso de operaciones inadecuadas del dato a manejar, y se pueden obtener programas más confiables.

###### SUBRANGO
Es un tipo ordinal que consiste de una sucesión de valores de un tipo ordinal (predefinido o definido por el usuario) tomado como base.
 
Es simple y ordinal.Existe en la mayoría de los lenguajes.

Operaciones permitidas: 
- Asignación
- Comparación
- Todas las operaciones permitidas para el tipo base

Operaciones no permitidas:
- Depende del tipo de base

## Modularización
Significa dividir un problema en partes funcionalmente independientes, que encapsulan operaciones y datos.
 
No se trata simplemente de subdividir el código de un sistema de software en bloques con un número de instrucciones dado.
 
Separar en funciones lógicas con datos propios y datos de comunicación perfectamente especificados.
 
- Cada subproblema está en un mismo nivel de detalle.
- Cada subproblema puede resolverse independientemente.
- Las soluciones de los subproblemas puede combinarse para resolver el problema original.
 
### Modularización - Módulo
Tarea específica bien definida se comunican entre sí adecuadamente y cooperan para conseguir un objetivo común.
 
Encapsula acciones tareas o funciones.
 
En ellos se pueden representar los objetivos relevantes del problema a resolver.

**Metodología TOP-DOWN**
 
## Modularización:
 
> Mayor productividad
 
<sup>Al dividir un sistema de software en módulos funcionalmente independientes, un equipo de desarrollo puede trabajar simultáneamente en varios módulos, incrementando la productividad (es decir reduciendo el tiempo de desarrollo global del sistema).</sup> 

> Reusabilidad
 
<sup>Un objetivo fundamental de la Ingeniería de Software es la reusabilidad, es decir la posibilidad de utilizar repetidamente el producto de software desarrollado. Naturalmente la descomposición funcional que ofrece la modularización favorece el reuso.</sup>

> Facilidad de mantenimiento
 
> Facilidad de crecimiento
 
<sup>Los sistemas de software reales crecen (es decir aparecen con el tiempo nuevos requerimientos del usuario). La modularización permite disminuir los riesgos y costos de incorporar nuevas prestaciones a un sistema en funcionamiento.</sup> 

> Legibilidad
 
<sup>Un efecto de la modularización es una mayor claridad para leer y comprender el código fuente. El ser humano maneja y comprende con mayor facilidad un número limitado de instrucciones directamente relacionadas.</sup> 

## Procedure
Conjunto de instrucciones que realizan una tarea específica y retorna 0, 1 ó más valores.

## Function
Conjunto de instrucciones que realizan una tarea específica y retorna un único valor de tipo simple.

## Alcance de las variables:
 
**Variables globales:** Pueden ser usadas en todo el programa(incluyendo módulos)
 
**Variables locales al programa:** Pueden ser usadas sólo en el cuerpo del programa.
 
**Variables locales al proceso:** Pueden ser usadas sólo en el proceso que están declaradas.

Si es una variable utilizada en un proceso:
 
1. Se busca si es variable local
 
2. Se busca si es un parámetro
 
3. Se busca si es variable global al programa
 
Si es una variable usada en un programa:
 
1. Se busca si es variable local al programa
 
2. Se busca si es variable global al programa

### Variables globales
- Demasiados identificadores
- No se especifica la comunicación entre los módulos
- Conflictos de nombres de identificadores utilizados por diferentes programadores.
- Posibilidad de perder integridad de los datos, al modificar involuntariamente en un módulo datos de alguna variable que luego deberá utilizar otro módulo.

### Parámetros
- La solución a estos problemas ocasionados por el uso de variables globales es una combinación de ocultamiento de datos (Data Hiding ) y uso de parámetros.
- El ocultamiento de datos significa que los datos exclusivos de un módulo NO deben ser "visibles" o utilizables por los demás módulos.
- El uso de parámetros significa que los datos compartidos se deben especificar como parámetros que se transmiten entre módulos.

Se analiza para cada módulo entonces: ¿cuáles son los datos propios? y ¿cuáles son los datos compartidos?
- Los datos propios se declararan locales al módulo.
- Los datos compartidos se declararán como parámetros.

En teoría cada módulo lo podemos pensar como una caja negra con una función lógica bien definida (QUÉ) que puede ser implementada internamente de muchos modos (CÓMO).

La comunicación externa de un módulo con el resto del sistema (puede no existir) se produce a través de datos de entrada y datos de salida.

## Tipo de parámetros 
 
- Por valor 
- Por referencia

### Parámetros por valor
Un dato de entrada por valor es llamado parámetro IN y significa que el módulo recibe (sobre una variable local) un valor proveniente de otro módulo (o del programa principal).
 
Con él puede realizar operaciones y/o cálculos, pero no producirá ningún cambio ni tampoco tendrá incidencia fuera del módulo.

### Parámetros por referencia
La comunicación por referencia (OUT, INOUT) significa que el módulo recibe el nombre de una variable (referencia a una dirección) conocida en otros módulos del sistema. 
 
Puede operar con ella y su valor original dentro del módulo, y las modificaciones que se produzcan se reflejan en los demás módulos que conocen la variable.

### Parámetros características
El número y tipo de los argumentos utilizados en la invocación a un Procedimiento deben coincidir con el número y tipo de parámetros del encabezamiento del módulo.

Un parámetro por valor debiera ser tratado como una variable de la cuál el Procedimiento hace una copia y la utiliza localmente. Algunos lenguajes permiten la modificación local de un parámetro por valor, pero toda modificación realizada queda en el módulo en el cual el parámetro es utilizado.
 
Los parámetros por referencia operan directamente sobre la dirección de la variable original, en el contexto del módulo que llama. Esto significa que no requiere memoria local.

## Tipos de Datos – Datos Estructurados
Permite al programador definir un tipo al que se asocian diferentes datos que tienen  valores lógicamente relacionados y asociados bajo un nombre único.

> Elementos
 
**Heterogénea:** Los elementos que la componen pueden ser de distinto tipo.
 
**Homogénea:** Los elementos que la componen son del mismo tipo.

> Tamaño
 
**Estática:** El tamaño de la estructura no varía durante la ejecución del programa.
 
**Dinámica:** La cantidad de elementos puede variar, por lo tanto, puede variar la memoria ocupada en tiempo de ejecución.

> Acceso
 
**Secuencial:** Para acceder a un elemento particular se debe respetar un orden predeterminado, por ejemplo, pasando por todos los elementos que le preceden, por ese orden.
 
**Directo:** Se puede acceder a un elemento particular, directamente, sin necesidad de pasar por los anteriores a él, por ejemplo, referenciando una posición.

> Linealidad
 
**Lineal:** Está formada por ninguno, uno o varios  elementos que guardan una relación de adyacencia ordenada donde a cada elemento le sigue uno y le precede uno, solamente.
 
**No lineal:** Para un elemento dado pueden existir 0, 1 ó más elementos que le suceden y 0, 1 ó más elementos que le preceden.

## Estructuras de Datos - Registro
Es uno de los tipos de datos estructurados, que permiten agrupar diferentes clases de datos en una estructura única bajo un sólo nombre.

**Heterogénea:** Los elementos pueden ser de distinto tipo (puede haber registros con todos elementos del mismo tipo)
 
**Estática:** El tamaño no cambia durante la ejecución (se calcula en el momento de compilación)
 
**Campos:** Representan cada uno de los datos que forman el registro.
 
## Punteros
 
### Variables estáticas
La rigidez, ya que no permite que las estructuras varíen su dimensión.
Las variables y tipos reservan memoria en su declaración y se mantienen durante todo el programa. El lenguaje puede validar previo a la ejecución.(Capacidad limitada)

|Integer: | 4 bytes |
|:-:|:-:| 
|Char:    | 1 byte |
|Real:    | 8 bytes |
|Boolean: | 1 byte |
|Registro:| la suma de los campos |
|Arreglos:| dimFisica *  tipo elemento |
|Puntero: | 4 bytes |


### Variables dinámicas
Permite modificar en ejecución la memoria utilizada.

### Puntero
Un puntero es un tipo de variable usada para almacenar la dirección en memoria de otra variable, en lugar de un dato convencional. Es un tipo de datos simple.

Mediante la variable de tipo puntero se accede a una dirección, y en dicha dirección de memoria se encuentra realmente el valor almacenado. 

 ### Características:
- Es un tipo de dato simple que contiene la dirección donde se encuentra almacenado el dato real.
- Pueden apuntar solamente a direcciones almacenadas en memoria dinámica (heap).
- Cada variable de tipo puntero puede apuntar a un único tipo de dato.
- Una variable de tipo puntero se indica con ^ y ocupa 4 bytes de memoria (stack) para su representación interna en Pascal.
 
````pascal
TYPE 
    identificador= ^TipoVariableApuntada;
````
 
**^TipoVariableApuntada;** ->Puede ser cualquiera de los tipos de datos que hemos visto hasta el momento

Una **variable de tipo puntero** ocupa una cantidad de memoria fija, independiente del tipo de dato al que apunta.

Una **variable de tipo puntero** puede reservar y liberar memoria durante la ejecución del programa.

Un **dato referenciado o apuntado**, como los ejemplos vistos, no tienen memoria asignada, o lo que es lo mismo no existe inicialmente espacio reservado en memoria para este dato

> Creación de una variable puntero.   **new(nue);**

> Destrucción de una variable puntero.   **dispose(act);**
 
- Libera la conexión que existe entre la variable y la posición de memoria.
- Libera la posición de memoria.
- La memoria liberada puede utilizarse en otro momento del programa.

> Eliminación de una variable puntero      **p:=nil;**
 
- Libera la conexión que existe entre la variable y la posición de memoria.
- La memoria sigue ocupada.
- La memoria no se puede referenciar ni utilizar.

> Asignación entre variables puntero.    **ant:=L;**

> Asignación de un valor al contenido de una variable puntero.   **L^.dato.num:=num;**
 
> Comparación de una variable puntero 

1. if (p = nil) then, compara si el puntero p no tiene dirección asignada.
2. if (p = q) then, compara si los punteros p y q apuntan a la misma dirección de memoria.
3. if (p^ = q^) then, compara si los punteros p y q tienen el mismo contenido.

- No se puede hacer read (p), si p es una variable de tipo puntero.
- No se puede hacer write (p), si p es una variable de tipo puntero.
- No se puede asignar una dirección a un puntero de manera manual (p:= ABCD).
- No se pueden realizar operaciones de mayor o menor entre las direcciones de los punteros (p>q)

