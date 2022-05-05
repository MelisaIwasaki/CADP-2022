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
  aux:= 1; //USO AUXILIAR PARA RECORRER
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
