# Soluciones más eficientes a los problemas :basecampy:

## Problema 1 :electron:

**Se dispone de un vector con 100 números enteros.** :octocat:

**posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.**

*Entonces, recorrí todo el vector y por cada uno le pregunté si el contenido era igual al número x. Luego me iba guardando la posición si se encontraba el numero x
o guardaba -1 si no se encontraba.*
````
function posicion(v:vector; numx:integer):integer;
var i:integer;
begin
  for i:= 1 to dimF do begin
    if(v[i] = numx)then
      posicion:= i
    else
      posicion:= -1;
  end;
end;
````
*Está MAL porque cada vez que va incrementando el FOR va pisando los valores de la posición. Está mal el uso de FOR.* :basecamp:

*La solución es que en vez de usar un FOR uso un WHILE. Recorro todo el vector preguntando si el contenido es distinto al número x. Mientras sea distinto, sigo preguntando.Y CORTA cuando me recorrí todo el vector y no encontré el número x o cuando encuentro el número x en el vector. Luego, al salir del while pregunto 
si el contenido es igual al número x. Si es igual, retorno la posición sino retorno -1.*

````pascal
function posicion(v:vector; numx:integer):integer;
var i:integer;
begin
  i:= 1;
  while(i <= dimF)and(v[i] <> x)do
    i:= i + 1;
  if(v[i] = numx)then
    posicion:= i
  else
    posicion:= -1;
end;
````
![camel](https://user-images.githubusercontent.com/92184167/173698662-5f34d2bb-8350-4c87-8262-ab328747c9d5.png)


## Problema 2 🉑

**Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.**
````
procedure incrementar(var L:lista; x:integer); 
begin
  while(L <> nil)do begin    
    L^.num:= L^.num + dato;                   
    L:= L^.sig;
  end;
end;
````
*El problema es que no anda el módulo. No me modifica el contenido de la lista.*

*Entonces la profesora de la práctica nos dió estos ejemplos :*
````pascal
//MODIFICA VALORES DE LA LISTA MANDANDOLA POR REFERENCIA
procedure incrementar(var L:lista; x:integer);
var  aux:lista;
begin
  aux:= L; //USO AUXILIAR PARA RECORRER
  while(aux <> nil)do begin    
    aux^.num:= aux^.num + x;                   
    aux:= aux^.sig;
  end;
end;
//MODIFICA LOS VALORES DE LA LISTA MANDANDOLA POR VALOR - SIN AUXILIAR
procedure incrementar(L:lista; x:integer); 
begin
  while(L<>nil)do begin    
    L^.num:= L^.num + x;                    
    L:=L^.sig;
  end;
end;
````
*La solución es mandarlo por valor no por referencia. En vectores si se pasaba por referencia.*

## Problema 3

A mí el pos me mareaba, no sé si le pasan lo mismo. Asi que cambié **pos** por **i** , y voilà !!

> Usando POS  
````  
function buscar(v:vector;dimL,n:integer):boolean;  
var
  pos:integer;esta:boolean;
begin
  pos:=1;
  esta:false;
  while(pos <= dimL)and(not esta)do begin
    if(v[pos] = n)then
      esta:=true;
    else
      pos:=pos + 1;
  end;
  buscar:=esta;
end;
````
> Usando i  
````pascal 
function buscar(v:vector;dimL,n:integer):boolean;
var
  i:integer;esta:boolean;
begin
  i:=1;
  esta:false;
  while(i <= dimL)and(not esta)do begin
    if(v[i] = n)then
      esta:=true;
    else
      i:=i + 1;
  end;
  buscar:=esta;
end;
````
> Usando POS
````
function buscar(v:vector;dimL,n:integer):boolean;
var
  pos:integer;
begin
  pos:=1;
  while(pos <= dimL)and(v[pos] < n)do begin
    pos:=pos + 1;
    if(pos <= dimL)and(v[pos] = n)do begin
      buscar:=true
    else
      buscar:=false;
    end;
  end;
end;
````
>Usando i
````pascal
function buscar(v:vector;dimL,n:integer):boolean;
var
  i:integer;
begin
  i:=1;
  while(i <= dimL)and(v[i] < n)do begin
    i:=i + 1;
    if(i <= dimL)and(v[i] = n)do begin
      buscar:=true
    else
      buscar:=false;
    end;
  end;
end;
````
![cf40550af928a2d019c25d714df88f0c](https://user-images.githubusercontent.com/92184167/173698713-35e4215d-eae0-4005-9b7c-e9e98fa3abda.jpg)
