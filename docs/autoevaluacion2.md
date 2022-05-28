<h1 align = "center">:hamster:AUTOEVALUACION:100:</h1>

## Autoevaluación Seis

1- Dado un vector 'v' de 200 números reales, ordenado de menor a mayor. La siguiente función debería buscar el valor PI (3,14) dentro de dicho vector:
````pascal
type
   vector = array[1..200] of real;

function tienePi(v : vector) : boolean;
var
   i : integer;
   esta : boolean;
begin
   for i:= 1 to 200 do
       if (v[i] = 3.14) then
          esta := true;
   tienePi := esta;
end;
````
Marque a continuación todas las opciones correctas:
- [x] La función es ineficiente, ya que no aprovecha el criterio de orden del vector.
- [ ] La función es incorrecta, ya que se comparan las posiciones del vector con un número real.
- [ ] La función es incorrecta: no se indicó la dimensión lógica del vector.
- [ ] La función es correcta.
- [x] La función es incorrecta, ya que podría retornar basura

2- Marque las proposiciones verdaderas:
- [ ] La búsqueda dicotómica  se puede aplicar tanto a vectores ordenados como a vectores sin orden.
- [ ] En una búsqueda secuencial optimizada, si el elemento a buscar no se encuentra en el vector, se recorrerá siempre el vector hasta su dimensión lógica. 	
- [x] En una búsqueda secuencial, si el elemento a buscar no se encuentra en el vector, se recorrerá siempre el vector hasta su dimensión lógica.

3- Teniendo en cuenta el siguiente modulo que agrega un elemento de un arreglo que se encuentra en un posición pasada por parámetro:
````pascal
type
       enteros = array [1..200] of integer; 
...

Procedure agregar(var a: enteros; var dimL: integer; var ok: boolean;  valor: integer);
Begin    
    if ((dimL + 1) < 200) then  
    begin
       ok:= true;
       a[dimL]:= valor;
       dimL:= dimL + 1;
    end
    else
       ok:= false; 
end;
````
Marque a continuación todas las opciones correctas:

- [ ] El código es correcto.
- [ ] El código es incorrecto, primero se debe actualizar el parámetro ok en false.
- [x] El código es incorrecto, la condición del if es incorrecta.
- [x] El código es incorrecto, esta almacenando el nuevo elemento en una posición incorrecta.
- [ ] Si ok retorna en “true” aumenta el tamaño de la memoria ocupada por el vector a.

4- ¿Cuál es el orden correcto de los pasos necesarios para eliminar un elemento de un vector?
- [ ] Decrementar cantidad de elementos, hacer el corrimiento de elementos y verificar que la posición a eliminar sea válida.
- [x] Verificar que la posición a eliminar sea válida, hacer el corrimiento de elementos y decrementar cantidad de elementos.
- [ ] Hacer el corrimiento de elementos, verificar que la posición a eliminar sea válida y decrementar cantidad de elementos.

5- Teniendo en cuenta el siguiente modulo que borra un elemento de un arreglo que se encuentra en una posición pasada por parámetro:
````pascal
type
enteros = array [1..200] of integer; 
...
Procedure borrar (var a: enteros; var dimL: integer;  var ok: boolean; pos: integer;);  
Begin
    ok = ((pos>=1) and (pos<=dimL));
    if (ok) then begin    
        for i:= pos to (dimL) do
                 a[i]:= a[i+1];          
    end;
    dimL:= dimL - 1; 
end;
````
Marque a continuación todas las opciones correctas:
- [ ] El código es correcto.
- [x] El código es incorrecto, el for realiza un corrimiento de más.
- [x] El código es incorrecto, la actualización del parámetro dimL debe realizarse dentro del if.
- [ ] El código es incorrecto, falta actualizar el parámetro “ok” dentro del if.
- [ ] El código es incorrecto, el parámetro dimL debe pasarse por valor.

------------------

## Autoevaluación Siete

1- Teniendo en cuenta el siguiente código:
````pascal
Program uno;
type
   puntero=^integer;
var
   p:puntero;
begin
   {cuerpo del programa}
end.
````
En el cuerpo del programa se puede ejecutar en algún momento la instrucción ….

Seleccione la respuesta correcta:
- [ ] new(p^).
- [ ] read(p).
- [ ] read(p), pero no write(p).
- [x] new(p).
- [ ] Ninguna de las opciones anteriores es correcta.

2- Teniendo en cuenta el siguiente código, el cual intercambia los valores a los que apuntan p1 y p2:      
````pascal  
program dos;
type
   puntero = ^char;
procedure intercambiar(p1, p2: puntero);
var
  aux: char;
begin    
  aux:= p1^;
  p1^:= p2^;
  p2^:= aux;
end.
````
Seleccione la respuesta correcta:
- [ ] El procedure es incorrecto. No se pueden pasar punteros como parámetro por valor.
- [ ] El procedure es incorrecto. No se pueden asignar a p2^ el valor de aux.
- [ ] El procedure es incorrecto. La variable aux no puede tomar el valor apuntado por p1.
- [ ] El procedure es incorrecto. No intercambia porque los punteros fueron pasados por valor.
- [x] El procedure es correcto.
- [ ] El procedure es incorrecto. Falta la instrucción new(aux);

3- Teniendo en cuenta el siguiente programa:
````pascal
Program tres;
type
  descripcion = string[50];
  automovil = record
    marca:  descripcion;
    modelo: descripcion;
  end;
  puntero = ^automovil;

var
  p1, p2: puntero; 
begin
  new(p1);
  p1^.marca:= 'Fiat';
  p1^.modelo:='Toro';     
  p2:= p1;
  new(p1);
  p1^.marca := 'Chevrolet';
  writeln(p1^.modelo);   (1)    
  writeln(p2^.marca);    (2)
end.
````
Seleccione las respuestas válidas:
- [ ] En la línea (2) Imprime "Chevrolet".
- [ ] Genera error porque no se puede asignar punteros.
- [ ] Genera error porque no se puede ejecutar 2 veces new de un mismo puntero.
- [x] En la línea (2) Imprime "Fiat".
- [ ] Genera error porque no se hizo new sobre p2.
- [x] En la línea (1) imprime un valor considerado basura.

4- Teniendo en cuenta el siguiente código:
````pascal
program cuatro;
type
   puntero=^char;
var
  p1, p2: puntero;
begin
  new(p1);
  p1^:='a';
  p2:=p1;
  dispose(p1);
  write(p2^);
end.
````
Seleccione la respuesta válida:
- [ ] El programa siempre imprime ‘a’ y p1 queda apuntando a una posición liberada.
- [ ] El programa siempre imprime ‘a’ y p1 queda en nil.
- [x] El programa es inválido pues p2 apunta a una posición de memoria que fue liberada. El valor que imprime es basura.
- [ ] El programa es Incorrecto. Falta la instrucción new(p2).

5- Teniendo en cuenta el siguiente programa que tiene como objetivo comparar los valores apuntados por dos variables dinámicas (p1 y p2) e informar si son iguales.  
````pascal
Program punteros;
Type
  puntero = ^char;
Var
 p1,p2:puntero;

Begin
  new(p1);
  new(p2);
  p1^:='a';
  p2^:='a'; 
  if (p1 = p2) then
    write('Los punteros tienen el mismo contenido');
end.
````
Indique la respuesta válida.
- [ ] El código es correcto. Se imprime el cartel ‘Los punteros tienen el mismo contenido’.
- [ ] El código es incorrecto, no se puede declarar un puntero que apunte a un dato de tipo char.
- [ ] El código es incorrecto, antes del if (p1 = p2) se debe chequear que p sea distinto a nil.
- [ ] El código es incorrecto, no se pueden comparar punteros, sólo se pueden comparar sus valores apuntados.
- [x] El código es incorrecto, para comparar contenido la condición debe ser p1^ = p2^.

---------------

## Autoevaluación Ocho

1- Teniendo en cuenta el siguiente módulo con el cual se pretende duplicar todos los valores almacenados en una lista:
````pascal
program uno;
type
  lista = ^nodo;
  nodo = record;
    nro:integer;
    sig:lista;
  end;

Procedure duplicarValores(l: lista);
begin
  while (l <> nil) do begin
    l^.nro := l^.nro * 2 ;
    l:= l^.sig;
  end;
end;
````
Seleccione la opción verdadera:
- [x] El módulo es correcto.
- [ ] El módulo es incorrecto, los valores no se modifican porque la lista fue pasada por valor.
- [ ] El módulo es incorrecto, al avanzar con l, se pierde la lista en el programa principal.
- [ ] El módulo es incorrecto. La condición del while debe ser: (l^.sig<>nil).
- [ ] El módulo es incorrecto, se debería pasar como parámetro la cantidad de elementos de la lista.

2- Teniendo el cuento el siguiente código
````pascal
program agregar;
type
    lista = ^nodo
    nodo = record;
        nro:integer;
        sig:lista;
    end.

procedure agregarAtras(var ult:lista; l:lista; x:integer);
var
   aux:lista;
begin
   new(aux);
   aux^.nro:=x;
   aux^.sig:=nil;
   if (l <> nil) then
       ult^.sig:=aux 
   else
       l:=aux;
   ult:=aux;    
end;
var 
    x:integer;
    l,ult:lista;
begin
    read(x);
    l:=nil;
    while (x<>-1) do begin
        agregarAtras(ult,l,x);
        read(x);
    end;
end.
````
Seleccione la opción verdadera:
- [x] El módulo no funciona porque el parámetro l está pasado por valor.
- [ ] El módulo agrega correctamente un elemento al final de la lista.
- [ ] El módulo no funciona porque para agregar al final debería recorrer toda la lista.
- [ ] El módulo no funciona, porque se está haciendo new sobre la variable local aux, que se eliminará al finalizar la ejecución del procedure agregar.
- [ ] El módulo no funciona, porque nunca hizo new(ult).

3- Teniendo en cuenta el siguiente módulo, con el cual se pretende imprimir los autos a la venta de la agencia que recibe como parámetro:
````pascal
Program agencia;
type
   auto = record
     marca:string;
     color:string;
     modelo:integer;
   end;

   lista = ^nodo;
   nodo = record;
     dato:auto;
     sig:lista;
   end;

Procedure publicarAutosALaVenta(agencia: lista);
begin
    while (agencia <> nil) do begin 
       writeln(agencia^.auto.marca, ' - ', agencia^.auto.color,' - ',agencia^.auto.modelo);
       agencia:=agencia^.sig;
    end;
end;
````
Seleccione la opción verdadera:
- [ ] El módulo es  correcto.
- [ ] El módulo es incorrecto. La condición del while debe chequear (agencia^.sig <> nil).
- [ ] El módulo es incorrecto. La lista debe pasarse por referencia.
- [ ] El módulo es incorrecto. Avanza en forma innecesaria sobre la lista.
- [x] El módulo publicarAutosALaVenta no es correcto. Al realizar el writeln, se está accediendo en forma errónea a los campos de un auto de la lista.

4- Teniendo el cuenta el siguiente módulo, el cual pretende retornar true si un número se encuentra en un lista pasada por parámetro y false en caso contrario:
````pascal
Program cuatro;
type
    lista = ^nodo
    nodo = record;
      dato:integer;
      sig:lista;
    end;

function buscar(l:lista; x:integer):boolean;
begin
    while (l <> nil) and (l^.dato <> x) do
        l:=l^.sig;
    buscar:=(l = nil);
end;
````
Seleccione la opción verdadera:
- [ ] El módulo da error cuando x no está en la lista l.
- [ ] El módulo es correcto.
- [ ] El módulo podría arrojar un error porque el while debe tener las condiciones en orden intercambiadas.
- [x] El módulo es incorrecto, retorna false si el número x está en la lista l, o true en caso contrario.
- [ ] El módulo arroja un error porque se está comparando l con nil.
- [ ] El módulo funciona, pero luego de su ejecución se pierde la referencia al inicio de la lista.

5- Teniendo en cuenta el siguiente módulo, con el cual se pretende insertar ordenado un elemento en una lista:
````pascal
Program cinco;
type
   lista = ^nodo
   nodo = record;
      dato:integer;
      sig:lista;
   end;

procedure insertar(var l:lista; nro: integer);
var
  nue:lista;
  act, ant:lista;
begin
  new(nue);
  nue^.dato:=nro;
  act:=l;   ant:=l;
  while ((act <> nil) and (nro < act^.dato)) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act = ant) then
    l:=nue
  else
    ant^.sig:=nue;
end;
````
Seleccione la opción verdadera:
- [ ] El módulo agrega un elemento siempre al final de la lista.
- [ ] El módulo inserta un elemento correctamente ordenado.
- [x] El módulo es incorrecto porque falta asignar el campo nue^.sig.
- [ ] El módulo es incorrecto porque se deben pasar el inicio y el final de la lista para poder insertar un elemento de forma ordenada.
- [ ] EL módulo es incorrecto, se está pasando la lista por referencia y no hace falta.




