# Vectores y listas

## Ver sus conductas y sus diferencias

**Cargar vector**

> dimF  ***Carga completa: Guardar un elemento en cada posicion del vector***
````
begin
       for i:=1 to dimF do begin
              leerCliente(c);
              v[i]:=c;
       end;
end;
````
> dimL  ***"a lo sumo 1000 elementos.La lectura finaliza con el codigo 99"(no debe procesarse)***
````
const dimF=1000;
type  vector=array[1..dimF]of integer;

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
***La informacion de los clientes finaliza al ingresar al cliente 'Mirtha Legrand'con dni 2320718 
   (que debe procesarse)o al alcanzarse el maximo de clientes.***
````
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

````
procedure cargarPartido(var v:vector);
var i:integer;
begin
       for i:=1 to max do begin
              leerPartido(p);
              v[p.codigo]:=p;
       end;
          
end;
````
**Cargar lista**

{No debe procesarse - agragar adelante}  //"La lectura finaliza cuando se ingresa el codigo de cliente -1"

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

{debe procesarse - agragar atras}  //"debe almacenarse en el orden en que fue leida"

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

{insertarOrdenado}  //"La informacion debe quedar almacenada de manera ordenada por dni del cliente"
                    //"finaliza cuando se lee el dni -1(que no debe procesarse)

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

{vector}

{vector de un registro}

type   cadena30=string[30];
       rango=1..100;
       madre=reord
           codigo=rango;
           anio:integer;
           raza:cadena30;
       end;
       vmadre=array[rango]of madre;

{vector Contador}

type   vectorContador=array[rango]of integer;

procedure inicializar(var v:vector);
var i:integer;
begin
    for i:=1 to MAX do
       v[i]:=0;
end;

begin
    v[L^.dato.codigo]:=v[L^.dato.codigo]+1;

    v[tipo]:=v[tipo]+1;

    vc[v[i].act]:=vc[v[i].act]+1;

    v[vL[L^.dato.codLibro].codMat]:=v[vL[L^.dato.codLibro].codMat];
end;

{dos maximos}

procedure maximo(var max1,max2:integer;var cate1,cate2:integer;vc:vectorContedor);
var i:integer;
begin
    for i:= 1 to CATE do begin
        if(v[i]>max1)then begin
            max2:=max1;
            cate2:=cate1;
            max1:=v[i];
            cate1:=i;
        end
        else if(v[i]>max2)then begin
            max2:=v[i];
            cate2:=i;
        end;
    end;
end;

{un solo minimo}

procedure menorCredito(var min:integer;vt:vtipo;var minTipo:integer);
var i:rango;
begin
    for i:= 1 to TIPO do begin
        if (vt[i]<min)then begin
            min:=vt[i];
            minTipo:=i;
        end;
    end;
end;

{vector precios}

type    vprecios=array[rango]of real;

//"dispone de una tabla con informacion sobre el costo mensual de cada tipo de suscripcion"

type    vcosto=array[rango]of real;  //se dispone

{vector ganancias}

//"medios de pagos que generaron mayor monto total en ventas"

type    vModelo=array[rango]of real;
        vPago=array[rangoP]of real;
begin
    while(L<>nil)do begin
        vp[L^.dato.medioPago]:=vp[L^.dato.medioPago]+vm[L^.dato.codModelo];
        L:=L^.sig;
    end;
end;
 
{Lista de un registro}

type    rango=1..100;
        cadena50=string[50];
        cliente=record
            codigo:integer;
            nombre:cadena50;
            dni:integer;
            tipo:rango;
        end; 
        lista=^nodo;
        nodo=record
            dato:=cliente;
            sig:lista;
        end;
begin(P.P.)
    L:=nil;
end;

{Eliminar un elemento de una Lista}

procedure borrarElemento(var L:lista; nom:cadena20);
var ant,act:lista;
begin
       act:=L;
       while(act<>nil)and(act^.dato.nom<>nom)do begin
              ant:=act;
              act:=act^.sig;
       end;
       if(act<>nil)then begin
              if(act=L)then  L:=act^.sig;
                       else  ant^.sig:=act^.sig;
              dispose(act);
       end;
end;
