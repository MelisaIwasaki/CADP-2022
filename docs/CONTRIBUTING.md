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
## Lectura / Escritura

````pascal
procedure LeerProducto(var p:producto);
begin
  readln(p.codigo);
  readln(P.nombre);
  readln(p.precio);
end;
procedure MostrarProducto(p:producto);
begin
  writeln(p.codigo);
  writeln(p.nombre);
  writeln(p.precio);
end;
begin
  for i := 1 to dimF do 
    LeerProducto(vec[i])
  for i := 1 to dimF do
    MostrarProducto(vec[i])
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


## LISTA

**Cargar lista**

> No debe procesarse - agragar adelante  ***"La lectura finaliza cuando se ingresa el codigo de cliente -1"***
````pascal
procedure leerNotebook(var n:notebook);
begin
       readln(n.codCliente);
       if(n.codCliente<>-1)then begin
              readln(codModelo);
              readln(n.marca);
       end;
end;

procedure agregarAdelante(var L:lista;n:notebook);
var nue:lista;
begin
       new(nue);
       nue^.dato:=n;
       nue^.sig:=L;
       L:=nue;
end;

procedure cargarLista(var L:lista);
var n:notebook;
begin
       leerNotebook(n);
       while(n.codCliente<>-1)do begin
              agregarAdelante(L,n);
              leerNotebook
       end;
end;
````
> debe procesarse - agragar atras  ***"debe almacenarse en el orden en que fue leida"***
````pascal
procedure leerNotebook(var n:notebook);
begin
       readln(n.codCliente);
       readln(codModelo);
       readln(n.marca);
end;

procedure agregarAtras(var L,ult:lista;n:notebook);
var nue:lista;
begin
       new(nue);
       nue^.dato:=n;
       nue^.sig:=nil;
       if(L=nil)then L:=nue;
                else ult^.sig:=nue;
       ult:=nue;
end;

procedure cargarLista(var L:lista);
var n:notebook;
begin
       repeat
              leerNotebook(n);
              agregarAdelante(L,ult,n)
       until (n.codCliente=100));  
end;
````
> insertarOrdenado  ***"La informacion debe quedar almacenada de manera ordenada por dni del cliente
                        finaliza cuando se lee el dni -1(que no debe procesarse)***
````pascal
procedure insertarOrdenado(var L:lista;v:venta);
var act,ant,nue:lista;
begin
    new(nue);
    nue^.dato:=v;
    ant:=L;
    act:=L;
    while (act<>nil)and(act^.dato.dni<v.dni)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(ant=act)then L:=nue;
               else ant^.sig:=nue;
    nue^.sig:=act;
end;
````
