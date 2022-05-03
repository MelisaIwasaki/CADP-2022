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
