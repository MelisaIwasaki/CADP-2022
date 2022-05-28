<h1 align = "center">:alembic:AUTOEVALUACION:test_tube:</h1>

## Autoevaluación :one:
1- Si el programa tiene la expresión:     
````pascal
if (num MOD 2 <> 0) then
    writeln('ok');
````
El programa imprimirá 'ok' cuando la variable num sea par. V o F?
- [ ] A-vedadero
- [ ] B-Falso

[Respuesta](#Autoevaluación-1)

2- Teniendo en cuenta el siguiente programa:
````pascal
program ejercicio;
var
   y : integer;
   z : real;
begin
   read(z);
   y := z;
   z := z * 10;
end. 
````
indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-No se puede leer un número real por teclado.	
- [ ] B-No se puede asignar la variable z a la variable y.	
- [ ] C-No se puede multiplicar la variable real z por el valor entero 10.	
- [ ] D-Falta inicializar la variable y.
- [ ] E-Ninguna de las anteriores es correcta.

[Respuesta](#Autoevaluación-1)

3- Teniendo en cuenta el siguiente programa:
````pascal
program ejercicio;
var
    a,x,c:char;
    cant:integer;
begin
    readln(a);
    readln(x);
    readln(c);
    cant:=0;
    while((c>a) and (c<x)) do
    begin
        cant:=cant+1;
        readln(c);
    end;
    writeln(cant);        
end. 
````
indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-Imprime la cantidad de caracteres leídos en la variable c, que son mayores que el caracter ‘a’ y menor que el caracter ‘x’.
- [ ] B-El programa no funciona porque no se puede preguntar si un carácter es mayor/menor que otro.	
- [ ] C-Imprime la cantidad de caracteres leídos en la variable c, que son mayores que el caracter leído en la variable a y menor que el caracter leído en la variable x.	
- [ ] D-Nunca sale del while.
- [ ] E-Siempre imprime un valor mayor a 0.

[Respuesta](#Autoevaluación-1)

4- Teniendo en cuenta el siguiente programa:
````pascal
program divisiones;
var
  num: integer;
  suma: real;  
begin
  readln(num);
  suma := 0;
  while (num <> 0) do
    begin
        if ((num mod 2) = 0) then        
             suma:= suma + (num MOD 10)            
        else
            suma:= suma + 1;
        num:= num DIV 10;    
    end;
  writeln(suma:1:2);
end.
````
Indique el resultado del programa si se ingresa el valor: 12345
- [ ] A-Imprime 6.
- [ ] B-Imprime 6.00.
- [ ] C-Imprime 9.
- [ ] D-Imprime 9.00.
- [ ] E-Imprime 11.	
- [ ] F-Imprime 11:00.
 
[Respuesta](#Autoevaluación-1)

5- Indique que calcula el siguiente programa:
````pascal
program promedio_porcentaje;
var
    num, cant :integer;    
    total: real;
begin
    read(num);
    cant:=0;
    total:=0;
    while (num > 20) do        
    begin
        if (num>40) then
        begin    
            total:=total+num;
            cant:=cant+1;
        end;
        read(num);
    end;
    writeln ((total / cant):2:0);
end.
````
- [ ] A-El porcentaje de todos los numero leídos.	
- [ ] B-El promedio de todos los números leídos.
- [ ] C-El promedio de los numero leídos que fueron mayores a 20.
- [ ] D-El promedio de los numero leídos que fueron mayores a 40.	
- [ ] E-El porcentaje de los numero leídos que fueron mayores a 40.

[Respuesta](#Autoevaluación-1)

------------------------
## Autoevaluación :two:
1- Teniendo en cuenta el siguiente programa:
````pascal
program ejercicio_1;
var
  i,num : integer;
  total : real;
begin
    total:=0;
    for i:= 1 to 500 do 
    begin
       readln(num);
       if (num <> 500) then
           total := total + num;
    end;
    writeln ((total * 100)/500);
end. 
````
indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-Lee números hasta el número 500, e informa el promedio.
- [ ] B-Calcula que porcentaje de números leídos fue distinto de 500.
- [ ] C-No funciona porque falta incrementar la variable índice i.
- [ ] D-Lee 500 números e informa el promedio de los números leídos.

[Respuesta](#Autoevaluación-2)

2- Teniendo en cuenta el siguiente programa:
````pascal 
program ejercicio_2;
var
  cant, num : integer;
begin
   cant := 0;
   repeat               
       readln(num)               
       if (num mod 2 = 0) then
            cant := cant + 1;
   until (num = 20);    
   writeln(cant);
end.
```` 
indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-Se leen 20 números e imprime la cantidad de números positivos.	
- [ ] B-Se leen 20 números e imprime la cantidad de números pares.	
- [ ] C-Se leen números hasta que se ingresa el número 20 (el cual no se procesa) e imprime la cantidad de número pares leídos.	
- [ ] D-Se leen números hasta que se ingresa el número 20 (el cual se procesa) e imprime la cantidad de número pares leídos.

[Respuesta](#Autoevaluación-2)

3- Marque las opciones correctas:

- [ ] A-Dentro del cuerpo de una función no se puede invocar a un proceso.
- [ ] B-Dentro del cuerpo de un proceso se puede invocar a una función.
- [ ] C-Dentro del cuerpo de una función se puede invocar a otra función.
- [ ] D-Los procesos siempre retornan al menos 1 valor.
- [ ] E-Dentro del cuerpo de un proceso se puede invocar a otro proceso.
- [ ] F-Una función solo retorna un único valor.

[Respuesta](#Autoevaluación-2)

4- Teniendo en cuenta el siguiente programa:
````pascal
program impares;
var
   cant,a,i: integer;

procedure impar;
var
   a: integer;        
begin
   read (a);
   if((a mod 2) <> 0)then
     write('Es impar');           
end;

begin
   cant:=0;
   for i:= 1 to 10 do 
      if (impar) then
         cant:=cant+1             

end.
````
indique cuál de las siguientes afirmaciones es verdadera: 
- [ ] A-Lee 10 números y cuenta la cantidad de números impares leidos.
- [ ] B-El proceso impar no puede realizar un read sobre la variable a.
- [ ] C-No se puede realizar un write en un proceso.
- [ ] D-El programa no funciona, se soluciona solamente definiendo al proceso impar como una función.
- [ ] E-El programa no funciona porque está invocando al proceso como una función.

[Respuesta](#Autoevaluación-2)

5- Teniendo en cuenta el siguiente programa:
````pascal
program alcance;
var a,b: integer;

procedure ab;
var
     b: integer;
begin
     b:= (3 * 5) + 1;           
end;

begin
  a:= 5;
  b:= 18;
  ab;
  writeln(b,' ',a);
end.
````
Indicar cuál de las siguientes proposiciones es verdadera: 
- [ ] A-Da error porque no se puede concatenar enteros con caracteres.	
- [ ] B-Imprime 16  5.
- [ ] C-Imprime 18  5.
- [ ] D-Da error porque no se puede definir una variable (dentro de un proceso) que tenga el mismo nombre que una variable del programa principal.

[Respuesta](#Autoevaluación-2)

------------------------

## Autoevaluación :three:
1- Teniendo en cuenta el siguiente código:
````pascal
program ejercicio_1;
function diferencia(b,a:integer):integer;
begin            
  if (a>b) then
    diferencia:=(a-b)
  else
    diferencia:=(b-a);                   
end;

var
   a,b: integer;
begin
  a := 5;
  b := 5;
  b := diferencia(a+5,b);
  writeln(b);
end.
````
Indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-Imprime 10.
- [ ] B-Imprime 5.
- [ ] C-Imprime 0.	
- [ ] D-Error: el primer parámetro real, no puede ser una operación.
- [ ] E-Error: la función no puede recibir dos parámetros.
- [ ] F-Error: la función está asignando 2 veces el resultado.

[Respuesta](#Autoevaluación-3)

2- Seleccione en cuáles aspectos se diferencian los módulos Procedure y Function:
- [ ] A-Posibilidad de declarar tipos de datos locales.
- [ ] B-Encabezamiento.
- [ ] C-Cantidad máxima de parámetros de entrada que recibe.
- [ ] D-Invocación.
- [ ] E-Punto de retorno.
- [ ] F-Cantidad de datos que devuelven.
- [ ] G-Tipos de parámetros que puede recibir.

[Respuesta](#Autoevaluación-3)

3- Teniendo en cuenta el siguiente código.
````pascal
Program ejercicio;
function restar(a:integer; b:integer):integer;
begin
  restar:= a-b;
end; 
var
  c,d:integer;
begin
  c:=8;
  d:=9;
  write (restar(restar(c,d), restar(d,c)));
end.
````
Indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-Imprime -2.
- [ ] B-Imprime 0.	
- [ ] C-Imprime 2.
- [ ] D-No se puede puede utilizar como parámetro real la invocación a la misma función.
- [ ] E-No se puede imprimir el resultado de una función.

[Respuesta](#Autoevaluación-3)

4- Teniendo en cuenta el siguiente código: 
````pascal
Program Ejercicio_4; 
procedure incrementar(var a:integer; b:integer);
begin
    if (a>0) then
       b:=a+b;
end;
 
var
   a,b:integer;
begin 
   a:=100;
   b:= 50;
   incrementar(b,a);
   write (a,' ',b);
end.
```` 
Indique cuál de las siguientes afirmaciones es verdadera:
- [ ] A-El programa imprime 50 150.	
- [ ] B-El programa imprime 50 100.
- [ ] C-El programa imprime 150 50.
- [ ] D-El programa imprime 100 50.
- [ ] E-Ninguna de las anteriores es correcta.

[Respuesta](#Autoevaluación-3)

5- El número y tipo de los argumentos utilizados en la invocación a un módulo puede no coincidir con el número y tipo de parámetros del encabezamiento del módulo.
- [ ] A-Verdadero
- [ ] B-Falso

[Respuesta](#Autoevaluación-3)

------------------------

## Autoevaluación :four:
1- Que un registro sea una estructura de datos heterogénea significa:
- [ ] A-Que puede contener cualquier cantidad de campos y de cualquier nombre.
- [ ] B-Que puede utilizarse para declarar variables, y también puede pasarse como parámetro por valor y por referencia.
- [ ] C-Que el programador puede declarar tantos tipos de datos registro como necesite.
- [ ] D-Que los campos que contiene pueden ser de cualquier tipo.

[Respuesta](#Autoevaluación-4)

2- Dado el siguiente programa, seleccione la opción correcta para completar  el encabezado y el cuerpo del módulo leerFecha.
````pascal
program registros;
type
    TFecha = record
       dia : integer;
       mes : integer;
       año : integer;
    end;
    TPersona = record
       dni : string;
       nacimiento : TFecha;
    end;

procedure leerFecha (1)............
begin
      writeln('Ingrese el dia); readln((2)........);
      writeln('Ingrese el mes); readln((3)........);
      writeln('Ingrese el año); readln((4)........);
end;

procedure leerPersona (var persona: TPersona);
begin
      writeln(‘Ingrese dni); readln(persona.dni);
      writeln(‘Ingrese fecha de nacimiento); 
      leerFecha(persona.nacimiento)
end;
     var
     persona: TPersona
begin
    leerPersona(persona);
end.
````
- [ ] A-(1) (fe: TFecha)    (2) fe.dia      (3) fe.mes       (4) fe.año
- [ ] B-(1)(var fe: TFecha)      (2) fe.dia      (3) fe.mes       (4) fe.año 
- [ ] C-(1)(var per: TPersona)  (2) per.nacimiento.dia  (3) per.nacimiento.mes    (4) per.nacimiento.año
- [ ] D-(1)(per: TPersona)  (2) per.nacimiento.dia  (3) per.nacimiento.mes    (4) per.nacimiento.año
- [ ] E-(1)(var per.nacimiento: TFecha)  (2) per.nacimiento.dia  (3) per.nacimiento.mes    (4) per.nacimiento.año
- [ ] F-(1)(per.nacimiento: TFecha)  (2) per.nacimiento.dia  (3) per.nacimiento.mes    (4) per.nacimiento.año

[Respuesta](#Autoevaluación-4)

3- Dado el siguiente programa:
````pascal
program lectura;
type
    TDireccion = record
        calle : integer;
        numero : integer;
    end;

procedure leerDireccion( dir : TDireccion);
var
   auxcalle: integer;
begin
    writeln(‘Ingrese la calle’);
    readln(auxcalle);
    dir.calle := auxcalle;
    writeln(‘Ingrese el número’);
    readln(dir.numero);
end;

var
     direccion : TDireccion;
begin
    leerDireccion(direccion);
    writeln(‘La calle es ‘,direccion.calle,’ y el número es ‘,direccion.numero);
end.
````
Si el usuario ingresa los valores 7 y 776 en ese orden, indique el resultado del programa de acuerdo a los conceptos vistos en la teoría.
- [ ] El programa imprime “La calle es 7 y el número es 776”.
- [ ] El programa imprime “La calle es BASURA y el número es 776”.
- [ ] El programa imprime “La calle es 7 y el número es BASURA”.
- [ ] El programa imprime “La calle es BASURA y el número es BASURA”.
- [ ] El programa imprime “La calle es 0 y el número es BASURA”.
- [ ] El programa no compila: el módulo leerDirección está mal invocado.
- [ ] El programa no compila: no se puede leer un registro en el módulo leerDirección.

[Respuesta](#Autoevaluación-4)

4- Dado el siguiente programa:
````pascal
program registrosYFunciones;
type
   TDireccion = record
      calle : integer;
      numero : integer;
   end;

function evaluarDireccion(dir:TDireccion):boolean
var
   dir2, dir3 : TDireccion;
begin
   dir2.calle := 7;
   dir2.numero := 776;
   dir3 := dir2;
   evaluarDireccion := (dir = dir2);
end;
var
    direccion:TDireccion;
begin
    direccion.calle := 7;
    direccion.numero := 776;
    if ( evaluarDireccion(direccion) ) then
        writeln(‘Bienvenidos a la UNLP’)
    else
        writeln(‘No es la UNLP’);
end.
````
Marque todas las opciones correctas:
- [ ] A-El programa imprime “Bienvenidos a la UNLP”.
- [ ] B-El programa imprime “No es la UNLP”.
- [ ] C-Error: no se puede pasar un registro como parámetro a una función.
- [ ] D-Error: no se puede declarar un registro como variable de una función.
- [ ] E-Error: no se pueden comparar registros directamente.
- [ ] F-Error: no se pueden asignar registros directamente.

[Respuesta](#Autoevaluación-4)

5- Dado el siguiente programa:
````pascal
program registrosYFunciones;
type
  TDireccion = record
     calle : integer;
     numero : integer;
  end;
  TAlumno = record
     nombre : string;
     legajo : string;
     direccion : TDireccion;
  end;

procedure imprimirAlumno(alu : TAlumno);
begin
  writeln(alu.nombre,’ Legajo: ‘,alu.legajo, ‘ . Dir. ‘ alu.direccion.calle,’  nro. ’, alu.direccion.numero);
end;

procedure cargarDireccion(var d : Tdireccion);
begin
    d.calle := 7;
    d.numero := 776;
end;

procedure cargarAlumno (alu : TAlumno);
begin
    alu.nombre := ‘Armando’;
    alu.legajo := ‘00001’;
    cargarDireccion(alu.direccion);
    imprimirAlumno(alu);
end;
var
   alumno : Talumno;
begin
    cargarAlumno(alumno);
    imprimirAlumno(alumno);
end.
````
Marque la opción correcta:
- [ ] A-El programa sólo imprime “Armando  Legajo: 00001  Dir: 7 nro. 776”.
- [ ] B-El programa sólo imprime "BASURA Legajo: BASURA  Dir: BASURA nro. BASURA”
- [ ] C-El programa imprime dos veces el texto  “Armando  Legajo: 00001  Dir: 7 nro. 776”.
- [ ] D-El programa imprime “BASURA  Legajo: BASURA  Dir: BASURA nro. BASURA” y luego imprime “Armando Legajo: 00001  Dir: 7 nro. 776”.
- [ ] E-El programa imprime “Armando Legajo 00001 . Dir. 7 nro 776” y luego imprime “BASURA  Legajo: BASURA  Dir: BASURA nro. BASURA”.
- [ ] F-Error: un registro no puede contener otro registro dentro.
- [ ] G-Error: la invocación al módulo cargarDireccion es incorrecta.
- [ ] H-Error: El módulo imprimirAlumno no tiene acceso a los campos calle y numero.

[Respuesta](#Autoevaluación-4)

------------------------

## Autoevaluación :five:
1- Teniendo en cuenta el siguiente código:
````pascal
program arreglos;
type
   arreglo=array['a'..'x']of integer;
var
   v1,v2:arreglo;
   z:char;
   d:integer;
begin
   z := 'b';
   d:= 1;
   cargarArreglo(v1); {carga todo el vector v1}
   if (v1['z'] > d) then
        v2 := v1;
end.
````
Seleccione la opción correcta: 
- [ ] A-Está mal definido el vector ya que no se pueden utilizar caracteres como índice de un vector.
- [ ] B-Hay un error en la asignación v2:=v1; ya que la asignación de vectores se debe realizar posición por posición.
- [ ] C-Hay un error en la condición del if ya que se está comparando elementos de distinto tipo.
- [ ] D-Hay un error en la condición del if ya que se está accediendo a una posición inválida del vector.

[Respuesta](#Autoevaluación-5)

2- Teniendo en cuenta el siguiente código:
````pascal
program vectores;
type
   arreglo=array[1 ..10] of integer;
var
   v1,v2:arreglo;
begin
   cargarVector(v1); {carga todo el vector v1 completo}
   v1:=v2;
   if (v1 = v2) then
        write ('los vectores son iguales')
   else
        write ('los vectores son distintos');
end.
````
Seleccione la opción correcta:
- [ ] A-El código funciona e imprime ‘los vectores son iguales’.
- [ ] B-Hay un error en el código, no se pueden comparar en forma directa los valores de dos vectores, se debe realizar analizando el contenido de cada una de sus posiciones.
- [ ] C-El módulo cargarVector debería ser una función.
- [ ] D-Hay un error ya que no se maneja la dimensión lógica del arreglo.

[Respuesta](#Autoevaluación-5)

3- Teniendo en cuenta la siguiente función que calcula el máximo número par almacenado en un arreglo:
````pascal
program ejercicio;
type
   vector=array[1..10] of integer;
function maximoPar(v:vector):integer;
var
   i, max,posmax:integer;
begin
   posmax:=1;
   for i:=1 to 10 do begin
     if ((v[i] mod 2) = 0) and (v[i] > v[posmax)) then
     begin
        posmax:=i;
     end;
   end;
   maximoPar:=v[posmax];      
end;
````
Seleccione la opción correcta:
- [ ] A-El código es correcto.
- [ ] B-El código es incorrecto ya que no se puede pasar un vector como parámetro.
- [ ] C-El código es incorrecto ya que la función está retornando un valor de tipo vector.
- [ ] D-El código es incorrecto ya que puede retornar un valor impar.

[Respuesta](#Autoevaluación-5)

4- Teniendo en cuenta el siguiente código que contabiliza la cantidad de repeticiones de cada letra minúscula almacenada en el arreglo v2:
````pascal
program repeticiones;
type
  vector1=array['a'..'z'] of integer; 
  vector2=array[1..500] of char; 
procedure cargarVector(var v:vector2; var dimL:integer);
begin
{ carga el vector v y retorna su dimensión lógica dimL } 
end;

var
   v1:vector1;
   v2:vector2;
   dimL,i:integer;
begin
    cargarVector(v2,dimL);
    for i:=1 to 500 do
       v2[v1[i]]:= v2[v1[i]]+1;  {1}
    end;
    for a:='a' to 'z' do
    begin
      Writeln('se encontraron ',v1[a],' repeticiones de la letra ', a );  {2}
    end;
end.
````
Seleccione todas las respuestas correctas:
- [ ] A-El programa no funciona porque no se está inicializando la variable v2.
- [ ] B-Para inicializar la variable v1 es necesario utilizar el procedure cargarVector.
- [ ] C-El programa no funciona ya que la asignación {1} está intentando sumar un caracter con un entero.
- [ ] D-EL programa no funciona porque el primer for no tiene en cuenta la dimensión lógica de v2.
- [ ] E-El programa no funciona porque no se está inicializando la variable v1.
- [ ] F-El programa no funciona,  se debe reemplazar la asignación {1} por v1[v2[i]]:= v1[v2[i]]+1; .
- [ ] G-Está mal declarado el tipo vector2, no es necesario que sea de char, debe ser solo de caracteres entre la ‘a' y la 'z'.
- [ ] H-La línea {2} no es correcta.

[Respuesta](#Autoevaluación-5)

5- Teniendo en cuenta el siguiente código, una empresa pretende averiguar cuál es el empleado en el cual invirtió más dinero en su perfeccionamiento. La empresa posee 200 empleados, y cada empleado a lo sumo puede hacer 12 cursos.
````pascal
program empleados;
type 
    sub=1..12;
    arreglo=array[sub] of real;
    empleado = record
        apellido:string;
        nombre:string;
        cursos:arreglo; {costo de cada curso realizado}
        cantCursosRealizados:sub; {cantidad de cursos realizados}        
    end;
    empleados=array[1..200] of empleado

function consultarMontoInvertido(e:empleado):real; 
var
    i:integer;
    total:real;
begin
    total:=0;    
    for i:=1 to 12 do  
    begin
      total:=total+ e.cursos[i];
    end;
    consultarMontoInvertido:=total;
end;


var
    v:empleados;
    i:integer;
    monto,max:real;    
begin
    for i:=1 to 200 do
    begin
        monto:=consultarMontoInvertido(v[i]);
        if (monto>max) then
           max:=i;                           {1}
    end;
    writeln(v[max.apellido], v[max.nombre]); {2}
end;
````
Seleccione todas las respuestas correctas:
- [ ] A-El código es correcto.
- [ ] B-El modulo consultarMontoInvertido debería recorrer el arreglo de cursos con un for i:=1 to e.cantCursosRealizados.
- [ ] C-En la linea {1} está mal asignado max, debería guardarse el monto y además en otra variable el índice para después poder imprimir el apellido y nombre.
- [ ] D-El módulo consultarMontoInvertido debería recibir solo el arreglo de cursos de un empleado.
- [ ] E-Hay un error en la forma de acceder al apellido y nombre del empleado en la línea {2}.

[Respuesta](#Autoevaluación-5)

------------------------

## Autoevaluación :six:

------------------------
## Respuestas :see_no_evil:
#### Autoevaluación 1
- 1.B
- 2.B
- 3.C
- 4.D
- 5.D
#### Autoevaluación 2
- 1.B
- 2.D
- 3.B,C,E,F
- 4.E
- 5.C
#### Autoevaluación 3
- 1.B
- 2.B,D,E,F,G
- 3.A
- 4.D
- 5.B
#### Autoevaluación 4
- 1.D
- 2.B
- 3.D
- 4.E
- 5.E
#### Autoevaluación 5
- 1.D
- 2.B
- 3.D
- 4.C,D,E,F,G
- 5.B,C,E
#### Autoevaluación 6
- 1.
- 2.
- 3.
- 4.
- 5.

