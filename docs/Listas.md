# LISTA

Colección de elementos homogéneos, con una relación lineal que los vincula, es decir que cada elemento tiene un único predecesor (excepto el primero), y un único sucesor (excepto el último).
Los elementos que la componen pueden no ocupar posiciones contiguas de memoria. Es decir pueden aparecer dispersos en la memoria, pero mantienen un orden lógico interno.
1. Está compuesta por NODOS.
2. Los nodos se conectan por medio de enlaces o punteros.
3. Cuando se necesita espacio adicional, nuevos nodos pueden ser alocados y agregados a la estructura (NEW).
4. Cuando existen nodos que ya no se necesitan, pueden ser borrados, liberando memoria (DISPOSE).
````pascal
Program uno;
Type 
     lista = ^nodo;
     nodo = Record
       elementos: integer;
       sig: lista;
     end;

Var 
     PriEnteros: lista; {Memoria estática reservada}
````
## Crear una lista vacía
````pascal
var       (Programa Principal)
     L: lista;
begin
     L:= nil;
end.
````
## Cargar lista

> Agragar adelante - No debe procesarse ***"La lectura finaliza cuando se ingresa el codigo de cliente -1"***
````pascal
procedure leerNotebook(var n: notebook);
begin
       readln(n.codCliente);
       if(n.codCliente <> -1)then begin
              readln(codModelo);
              readln(n.marca);
       end;
end;

procedure agregarAdelante(var L: lista; n: notebook);
var   nue: lista;
begin
       new(nue);
       nue^.dato:= n;
       nue^.sig:= L;
       L:= nue;
end;

procedure cargarLista(var L: lista);
var   n: notebook;
begin
       leerNotebook(n);
       while(n.codCliente <> -1)do begin
              agregarAdelante(L,n);
              leerNotebook
       end;
end;
````
> Agragar atrás - Debe procesarse ***"debe almacenarse en el orden en que fue leida"***
````pascal
procedure leerNotebook(var n: notebook);
begin
       readln(n.codCliente);
       readln(codModelo);
       readln(n.marca);
end;

procedure agregarAtras(var L: lista; n: notebook);
var   nue,act: lista;
begin
       new(nue);
       nue^.dato:= n;
       nue^.sig:= nil;
       if(L <> nil)then begin
          act:=L;
          while(act^.sig <> nil)do
               act:= act^.sig;
          act^.sig:= nue;
       end
       else
          L:= nue;
end;

procedure cargarLista(var L: lista);
var   n: notebook;
begin
       repeat
              leerNotebook(n);
              agregarAdelante(L,ult,n)
       until (n.codCliente = 100));  
end;
````
> Agregar atrás 2 (Con puntero al último nodo)
````pascal
procedure agregarAtras(var L,ult:lista; n:notebook);
var   nue: lista;
begin
       new(nue);
       nue^.dato:= n;
       nue^.sig:= nil;
       if(L = nil)then L:= nue
                else ult^.sig:= nue;
       ult:= nue;
end;
````
> InsertarOrdenado  ***"La informacion debe quedar almacenada de manera ordenada por dni del cliente
                        finaliza cuando se lee el dni -1(que no debe procesarse)***
````pascal
procedure insertarOrdenado(var L:lista; v:venta);
var  act,ant,nue:lista;
begin
     new(nue);
     nue^.dato:= v;
     ant:= L;
     act:= L;
     while (act <> nil)and(act^.dato.dni < v.dni)do begin
          ant:= act;
          act:= act^.sig;
     end;
     if(ant = act)then L:= nue
                  else ant^.sig:= nue;
     nue^.sig:= act;
end;
````
## Recorrer lista
Significa poder avanzar por cada uno de los elementos de la lista.
````pascal
procedure imprimir(L:lista);
begin
     while( L <> nil )do begin
          writeln( L^.elementos );
          L:= L^.sig;
     end;
end;
````
## Borrar un elemento de la lista
````pascal
procedure borrar(var L:lista; nom:cadena; var exito:boolean);
var  ant,act:lista;
begin
     exito:= false;
     act:= L;
     while(act <> nil)and(act^.datos.nom <> nom )do begin
          ant:= act;
          act:= act^.sig;
     end;
     if(act <> nil)then begin
          exito:= true;
          if(act = L)then   L:= act^.sig
                     else   ant^.sig:= act^.sig;
          dispose(act);
     end;
end;          
````
## Insertar un elemento en la lista
````pascal
procedure insertar(var L:lista; per:persona);
var   nue,ant,act:lista;
begin
     new(nue);
     nue^.datos:= per;
     ant:= L;
     act:= L;
     while(act <> nil)and(act^.dato.nom < per.nom)do begin
          ant:= act;
          act:= act^.sig;
     end;
     if(ant = act)then   L:= nue
                  else   ant^.sig:= nue;
     nue^.sig:= act;
end;
````
