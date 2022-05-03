# Vectores y listas :card_file_box:    

## ARREGLO :speech_balloon:

Un arreglo (ARRAY) es una estructura de datos compuesta que permite acceder a cada componente por una variable índice, que da la posición de la componente dentro de la estructura de datos.

## VECTOR :  ***Arreglo de una sola dimensión***

Es una colección de elementos que se guardan consecutivamente en la memoria y se pueden referenciar a 
través de un índice.

- HOMOGENEA:Los elementos pueden son del mismo tipo .
- ESTATICA:El tamaño no cambia durante la ejecución (se calcula en el momento de compilación)
- INDEXADA:Para acceder a cada elemento de la estructura se debe utilizar una variable ‘índice’ que es de tipo ordinal.

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
> dimL  ***otra forma***
````pascal
const
  dimF=5;
type
  vNumeros=array[1..dimF]of integer;
  
procedure cargarVector(var a:vNumeros;var dimL:integer);
var
  i,num:integer;
begin
  i:=1;
  readln(num);
  while(i<=dimF)and(num<>-1)do begin
    a[i]:=num;
    i:=i+1;
    readln(num);
  end;
  dimL:=i-1;
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
## Agregar elementos al final 
## Insertar elementos 
## Borrar elementos 
## Búsqueda de un elemento
## Ordenación de los elementos


![Tipo de dato](https://user-images.githubusercontent.com/92184167/166445860-badb668d-a697-4e37-aed8-f49f43cbc9e9.png)

