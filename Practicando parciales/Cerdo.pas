{
Un criadero de cerdo dispone de información sobre los partos registrados.De cada parto se conoce año,código de la
madre(entre 200 y 599) y cantidad de crías paridas.Una madre puede parir más de una vez.
a)Realice un módulo que lea la información de las 400 madres y la almacene en una estructura adecuada.De cada 
madre se lee:código,año de nacimiento y raza.La información se ingresa sin orden.
b)Realice un módulo que reciba la información de partos,la información de la madre y un código de madre, y 
retorne en una estructura adecuada la información de todos los partos de dicha madre, en los que hayan parido al
menos 4 crías y en los que la madre tenía al menos 2 años al momento del parto.La estructura debe quedar ordenada
por cantidad de crías del parto.
c)Realice un módulo que reciba la información de partos generada en b) e informe el promedio de crías por parto
de dicha madre.
}
program cerdo;
const
  MAD=400;
type
  rangoMad=1..MAD;
  rangoCod=200..599;
  cadena=string[30];
  parto=record
    anio:integer;
    cod:rangoCod;
    crias:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:parto;  //se dispone
    sig:lista;   //Una madre puede parir más de una vez
  end;
  madre=record
    cod:rangoCod;
    anio:integer;
    raza:cadena;
  end;
  vector=array[rangoMad]of madre;

procedure cargarParto(var L:lista); //se dispone

procedure leerMadre(var m:madre);
begin
  readln(m.cod);
  readln(m.anio);
  readln(m.raza);
end;
procedure cargarMadre(var v:vector);
var m:madre;i:rangoMad;
begin
  for i:= 1 to MAD do begin
    leerMadre(m);
    v[m.cod]:=m;
  end;
end;
procedure insertarOrdenado(var L:lista;m:madre);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=m;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.crias<m.crias)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    L:=nue;
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure procesar(L:lista;v:vector;codMad:integer;var lista2:lista);
begin
  while(L<>nil)do begin
    if(L^.dato.crias>=4)and(v[L^.dato.cod].anio>=2)then
      insertarOrdenado(lista2,L^.dato);
    L:=L^.sig;
  end;
end;
procedure procesarL2(L:lista);
var suma,total:integer;promedio:real;
begin
  suma:=0;total:=0;
  while(L<>nil)do begin
    suma:=suma+L^.dato.crias;
    total:=total+1;
    L:=L^.sig;
  end;
  promedio:=suma/total;
  writeln('Promedio de crias por parto:',promedio:2:2);
end;
var
  L,lista2:lista;
  v:vector;
  codMad:integer;
begin
  cargarParto(L); //se dispone
  cargarMadre(v);
  procesar(L,v,codMad,lista2);
  procesarL2(lista2);
END.
