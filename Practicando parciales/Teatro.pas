{
Parcial 2021 Segunda Fecha

Un teatro dispone de una estructura de datos con información de todos los tickets vendidos durante los años 1990 
a 1999 para las 420 obras de teatro realizadas entre dichos años.De cada tickets se conoce el DNI del espectador,
el número de asiento, el nombre de la sala, el código de obra(entre 1 y 420) y el valor del ticket. La 
información se encuentra ordenada por código de obra.
a)Realizar un módulo que retorne en una estructura de datos la información de las obras de teatro.De cada obra 
se conoce su código(entre 1 y 420), título, duración en minutos y nombre del director.La información se ingresa 
por teclado sin ningún orden en particular.
b)Realizar un módulo que reciba la información de todos los tickets vendidos, la información de las obras y el 
código de una obra(que podría no existir),y retorne una estructura de datos con título de la obra, duración,
monto total de todos los tickets vendidos, y asiento, sala y valor de cada ticket vendido para dicha obra.
Esta información debe estar ordenada por el valor de cada ticket. 
Nota:Incluir el P.P. donde se invoquen los módulos implementados.
}
program Teatro;
const
  OBRA=420;
type
  rango=1..OBRA;
  cadena=string[30];
  ticket=record  
    dni:integer;
    asiento:integer;
    sala:cadena;
    codigo:rango;
    valor:real;
  end;
  lista=^nodo; //se dispone
  nodo=record  //se encuentra ordenada por código de obra.
    dato:ticket;
    sig:lista;
  end;
  obra=record
    codigo:rango;
    titulo:cadena;
    duracion:integer;
    director:cadena;
  end;
  vObras=array[rango]of obra; //se ingresa por teclado sin ningún orden en particular.
  
  regObra=record //los campos son de vectores
    titulo:cadena;
    duracion:integer;
    montoTotal:real;
    detalle:listaDet;//dentro del registro va la lista
  end;
  detalleObra=record //los campos son de lista
    asiento:integer;
    sala:cadena;
    valor:real;
  end;
  listaDet=^nodoDet;//otra lista nueva porque tienen diferentes campos que el registro ticket
  nodoDet=record    //ordenada por el valor de cada ticket.
    dato:detalleObra;
    sig:listaDet;
  end;

procedure cargarTicket(var L:lista);//se dispone

procedure leerObra(var o:obra);
begin
  readln(o.codigo);
  readln(o.titulo);
  readln(o.duracion);
  readln(o.director);
end;
procedure cargarObra(var v:vObras);
var o:obra;
begin
  for i:= 1 to OBRA do begin
    leerObra(o);
    v[o.codigo]:=o;
  end;
end;
{b)Realizar un módulo que reciba la información de todos los tickets vendidos, la información de las obras y el 
código de una obra(que podría no existir),y retorne una estructura de datos con título de la obra, duración,
monto total de todos los tickets vendidos, y asiento, sala y valor de cada ticket vendido para dicha obra.
Esta información debe estar ordenada por el valor de cada ticket.}

procedure incisoB(L:lista;v:vObras;codObra:integer;var reg:regObra);
var  var detObra:detalleObra;
begin
  while(L<>nil)and(L^.dato.codigo<>codObra)do //recorro la lista si no encuentro el codigo sigo recorriendo
    L:=L^.sig;                                //si lo encuentro salgo del while,puede que no exista
  
  if(L<>nil)then begin  //si no se termino la lista
    reg.titulo:= v[L^.dato.codigo].titulo;
    reg.duracion:= v[L^.dato.codigo].duracion;
    reg.montoTotal:= 0; //antes de cargarlo hay que inicializar
    reg.detalle:= nil; //inicializar la lista
    while(L<>nil)and(L^.dato.codigo=codObra)do begin //si se encontro el valor 
      reg.montoTotal:=reg.montoTotal+L^.dato.valor;
      detObra.asiento:= L^.dato.asiento;
      detObra.sala:= L^.dato.sala;
      detObra.valor:= L^.dato.valor;
      agregarOrdenado(reg.datalle,detObra);
    end;
  end;
end;
procedure agregarOrdenado(var L:lista;detObra:detalleObra);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=detObra;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.valor<detObra.valor)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    L:=nue;
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;
var 
  L:lista;
  v:vObras;
  codObra:integer;
  reg:regObra 
begin
  L:=nil; //se dispone
  cargarTicket(L);//se dispone
  cargarObra(v);
  incisoB(L,v,codObra,reg);
end.
