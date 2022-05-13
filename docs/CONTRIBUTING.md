# Vectores :card_file_box:    

## ARREGLO :speech_balloon:

Un arreglo (ARRAY) es una estructura de datos compuesta que permite acceder a cada componente por una variable índice, que da la posición de la componente dentro de la estructura de datos.

## VECTOR :  ***Arreglo de una sola dimensión***

Es una colección de elementos que se guardan consecutivamente en la memoria y se pueden referenciar a 
través de un índice.

- HOMOGENEA: Los elementos pueden son del mismo tipo .
- ESTATICA: El tamaño no cambia durante la ejecución (se calcula en el momento de compilación)
- INDEXADA: Para acceder a cada elemento de la estructura se debe utilizar una variable ‘índice’ que es de tipo ordinal.

````pascal
Program uno;
Type 
  vector = array [rango]   of   tipo;
````
> El rango debe ser de tipo ordinal. 
- Integer
- Char
- Boolean
- Subrango
> El tipo debe ser estático
- Integer
- Real
- Char
- Boolean
- Subrango
- Registro
- Vector
- Lista

## Cargar vector

- Dimensión física: Se especifica en el momento de la declaración y determina su ocupación máxima de memoria. La cantidad de memoria no variará durante la ejecución del programa.
- Dimensión lógica: Se determina cuando se cargan contenidos a los elementos del arreglo. Indica la cantidad de posiciones de memoria ocupadas con contenido real. Nunca puede  superar la dimensión física.

> dimF  ***Carga completa: Guardar un elemento en cada posicion del vector***
````pascal
begin
       for i:=1 to dimF do begin
              leerCliente(c);
              v[i]:=c;
       end;
end;
````
> dimL  ***"a lo sumo 1000 elementos.La lectura finaliza con el codigo 99"(no debe procesarse)***
````pascal
const 
  dimF=1000;
type  
  vector=array[1..dimF]of integer;

procedure cargar(var v:vector;var dimL:integer);
var c:cliente;
begin
       dimL:=0;
       leerCliente(c);
       while (c.codigo<>99)and(dimL<dimF)do begin
              dimL:=dimL+1;
              v[dimL]:=c;
              leerCliente(c);
       end;
end;
````
> Repeat until  ***La informacion de los clientes finaliza al ingresar al cliente 'Mirtha Legrand'con dni 2320718 
   (que debe procesarse)o al alcanzarse el maximo de clientes.***
````pascal
procedure cargarVector(var vc:vcliente;var dimL:integer);
var c:cliente;
begin
       dimL:=0;
       repeat
             leerCliente(c);
             dimL:=dimL+1;
             vc[dimL]:=c; 
       until (c.nombre='Mirtha Legrand')and(c.dni=2320718)or(dimL=dimF);
end;
````
> Sin ordenar  ***"Esta informacion no se encuentra ordenada por ningun criterio"
                  "Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular"***

````pascal
procedure cargarPartido(var v:vector);
var i:integer;
begin
       for i:=1 to max do begin
              leerPartido(p);
              v[p.codigo]:=p;
       end;
          
end;
````
## Muestra de valores

````pascal
procedure MostrarProducto(p:producto);
begin
  writeln(p.codigo);
  writeln(p.nombre);
  writeln(p.precio);
end;
var
  i:integer;
  v:vectorProducto;
begin
  for i := 1 to dimF do
    MostrarProducto(v[i])
end;
````
**También se puede hacer:**
````pascal
procedure mostrarProducto(v:vectorProducto);
var i:integer;
begin
  for i := 1 to dimF do begin
    writeln(v[i].codigo);
    writeln(v[i].nombre);
    writeln(v[i].precio);
  end;
end;  
````
## Recorridos
Consiste en recorrer el vector de manera total o parcial, para realizar algún proceso sobre sus elementos.
- Recorrido total: Implica analizar todos los elementos del vector, lo que lleva a recorrer completamente la 
estructura.
- Recorriodo parcial: Implica analizar  los elementos del vector, hasta encontrar aquel que cumple con lo pedido.
Puede ocurrir que se recorra todo el vector

> Realice un programa que llene un vector de 10 elementos enteros positivos y luego informe la primer posición donde aparece un múltiplos de 6. Suponga que los nros leídos son positivos.
````pascal
Function posicion (v: numeros): integer;
var
  pos:integer;  detener:boolean; 

begin
  detener:=false; pos:=1;
  while (detener = false) do   //= while (not detener)
    begin
      if ((v[pos] MOD multi) = 0) then 
       detener:= true
      else
       pos:= pos + 1;
    end;
  posicion:= pos; 
end;
````
> Realice un programa que llene un vector de 10 elementos enteros positivos y luego informe la cantidad de números múltiplos de 6. Suponga que los nros leídos son positivos.
````pascal
Function multiplos (v: numeros): integer;
var
  i,cant:integer;
begin
  cant:=0;
  for i:= 1 to tam do
    begin
      if (v[i] MOD multi = 0) then 
        cant:= cant + 1;
    end;
  múltiplos:= cant; 
end;
````
## Agregar elementos al final 
Pasos para agregar:
- Verificar si hay espacio.
- Agregar al final el elemento.
- Incrementar la cantidad de elementos.
````pascal
Procedure agregar (var a :números; var dimL:integer var pude:boolean; valor:integer);
Begin
  pude:= false;
  if ((dimL + 1) <= dimF) then begin
    pude:= true;
    dimL:= dimL + 1;
    a[dimL]:= valor;
  end; 
end;
````
## Insertar elementos 
Pasos para insertar:
- Verificar si hay espacio.
- Verificar que la posición sea válida.
- Hacer lugar para poder insertar el elemento.
- Incrementar la cantidad de elementos.
````pascal
Procedure insertar(var a :números; var dimL:integer;valor:integer;pos:integer;var pude:boolean);
Var
 i:integer;  
Begin
  pude:= false;
  if (((dimL + 1)<=dimF) and (pos<=dimL) and (pos>=1))then    
    begin
      for i:= dimL down to pos do
        a[i+1]:= a[i];  
      pude:= true;
      a[pos]:= valor;
      dimL:= dimL + 1;
    end; 
end;
````
## Borrar elementos 
Pasos para eliminar:
- Verificar que la posición sea válida.
- Hacer el corrimiento.
- Decrementar la cantidad de elementos.
````pascal
Procedure borrar (var a :números; var dimL:integer;pos:integer;var pude:boolean);
Begin
  pude:= false;
  if ((pos>=1)and (pos<=dimL))then begin
  
    for i:= pos to (dimL-1) do
      a[i]:= a[i+1];  
    pude:= true;
    dimL:= dimL - 1;
  end; 
end;
````
## Búsqueda de un elemento
Vector desordenado: Se debe recorrer todo el vertor (en el peor de los casos), y detener la búsqueda en el momento que se encuentra el dato buscado o que se terminó el vector.
Vector ordenado: Se debe aprovechar el orden, existen al menos dos formas: búsqueda mejorada y búsqueda dicotómica.
````pascal
function buscar (a:números; dimL:integer, num:integer): boolean;
Var
  pos:integer;
  esta:boolean;
Begin
  esta:= false;
  pos:=1;
  while ( (pos <= dimL) and (not esta) ) do
     begin
       if (a[pos]=num) then 
          esta:=true
       else
          pos:= pos + 1;
     end; 
   buscar:= esta; 
end.
````
Búsqueda mejorada: Cuando el vector se encuentra ordenado debemos aprovechar esa condición para la búsqueda.
````pascal
function buscar (a:números; dim:integer, num:integer): boolean;
Var
  pos:integer;
Begin
  pos:=1;
  while ( (pos <= dim) and (a[pos]<num)) do
     begin
       pos:= pos + 1;
     end; 
  if ( (pos <= dim) and (a[pos]= num)) then buscar:=true
  else buscar:= false; 
end.
````
Búsqueda dicotómica o binaria: Se aplican cuando los elementos en la estructura tienen un orden.
````pascal
Procedure  BusquedaBinaria ( Var vec: numeros, dimL: integer, bus: integer; var ok : boolean);
Var 
    pri, ult, medio : integer;
Begin
    ok:= false;
    pri:= 1 ;  ult:= dimL;  medio := (pri + ult ) div 2 ;

    While  ( pri < = ult ) and ( bus <> vec[medio]) do 
     begin
        if ( bus < vec[medio] ) then 
          ult:= medio -1 ;
        else 
          pri:= medio+1 ;
        medio := ( pri + ult ) div 2 ;
     end;
    if (pri <=ult) and (bus = vec[medio]) then ok:=true; 
end;
````
## Ordenación de los elementos
El proceso por el cual, un grupo de elementos puede ser ordenado se conoce como algoritmo de ordenación. 
Algoritmo de ordenación:
- Selección
- Intercambio
- Inserción

Selección: Es un algoritmo de dimL pasadas.Para cada pasada i, Se elige el mínimo en el vector a partir de la 
posición (i+1) hasta el final.Si el mínimo de vector es más chico que lo que está almacenado en la posición 
i del vector se intercambia.
````pascal
Procedure Ordenar ( var v: numeros; dimLog: integer);
var i, j, p, item: integer;	
begin
  for i:=1 to dimLog-1 do begin 
    p := i;
    for j := i+1 to dimLog do
      if v[ j ] < v[ p ] then p:=j;
    item := v[ p ];   {intercambia v[i] y v[p] }
    v[ p ] := v[ i ];   
    v[ i ] := item;
  end;
end;
````
> Insertar Ordenado
````pascal
procedure insertar (var v:vector;var dimL:integer;a:alumno;var ok:boolean);
var
  i,pos:integer;
begin
  ok:=false;
  if(dimL + 1 <= dimF)then
    ok:=true;
    pos:=1;
    while(pos <= dimL)and(v[pos].nro < a.nro)do
      pos:= pos + 1;
    for i:= dimL downto pos do
      v[i + 1]:= v[i];
    v[pos]:= a;
    dimL:= dimL + 1;
end;
````
> Dado un arreglo de números enteros (150 elementos como máximo) realice un programa que genere otro arreglo 
sólo con los números pares.
````pascal
Procedure procesar (a1:números; dim1:integer;var a2:números; var dim2:integer);
var
 i: integer;
begin
 dim2:=0; 
 for i:= 1 to dim1 do
   begin
     if (esPar(a1[i])) then
      begin
        dim2:= dim2 + 1;  
        a2[dim2]:= a1[i];
        dim2:= dim2 + 1;        
      end;
 end;
````
![TIPO](https://user-images.githubusercontent.com/92184167/167033564-564d284a-5da6-44e8-a30f-5b42664551f2.png)


