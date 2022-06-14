{
Un criadero de conejos está analizando ciclos de reproducción.El criadero cuenta con conejas reproductoras y
dispone de una estructura que contiene, para cada coneja, su código,año de nacimiento,nombre,cantidad de partos
(entre 1 y 10)y cantidad de crías que tuvo en cada parto.
a)Realice un módulo que reciba la información de las conejas y retorne en una estructura adecuada el código,el
nombre y el año de nacimiento de las conejas que tuvieron en promedio más de 5 crías por parto.
b)Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par,
nacidas antes del año 2016.
c)Realice una función que reciba la información de las conejas y un código de coneja, y retorne la cantidad
máxima de crías que tuvo la coneja con dicho código en alguno de sus partos(retornar -1 si la coneja no se 
encuentra en la estructura).
}
program conejo;
const
  dimF=10;
type
  rango=1..dimF;
  cadena=string[30];
  vcrias=array[rango]of integer;
  coneja=record
    cod:integer;
    anio:integer;
    nom:cadena;
    cantPar:integer; //dimL
    crias:vcrias; //cant de crias por parto
  end;
  lista=^nodo;
  nodo=record
    dato:coneja; //se dispone
    sig:lista;
  end;
  regConeja=record
    cod:integer;
    nom:cadena;
    anio:integer;
  end;
  listaDos=^nodoDos;
  nodoDos=record
    dato:regConeja;
    sig:listaDos;
  end;

procedure agregarAdelante(var L:lista;c:coneja);
var nue:lista;
begin
  new(nue);
  nue^.dato.cod:=c.cod;
  nue^.dato.nom:=c.nom;
  nue^.dato.anio:=c.anio;
  nue^.sig:=L;
  L:=nue;
end;
funcion promedio(v:vcrias;dimL:integer):real;
var suma,total:integer;i:rango;
begin
  suma:=0;total:=0;
  for i:= 1 to dimL do begin
    suma:=suma+v[i];
    total:=total+1;
  end;
  promedio:=suma/total;
end;
procedure moduloA(L:lista;var Ldos:listaDos);
begin
  while(L<>nil)do begin
    if((promedio(L^.dato.crias,L^.dato.cantPar))>5)then
      agregarAdelante(Ldos,L^.dato);
    L:=L^.sig;
  end;
end;

{b)Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par,
nacidas antes del año 2016.}

procedure moduloB(L:listaDos);
begin
  while(L<>nil)do begin
    if(esPar(L^.dato.cod))and(L^.dato.anio<2016)then
      writeln('Nombre de las conejas con codigo par nacidas antes de 2016:',L^.dato.nom);
    L:=L^.sig;
  end;
end;

{c)Realice una función que reciba la información de las conejas y un código de coneja, y retorne la cantidad
máxima de crías que tuvo la coneja con dicho código en alguno de sus partos(retornar -1 si la coneja no se 
encuentra en la estructura).}

function maximo(dimL:integer;vc:vcrias);
var i:rango;max:integer
begin
  max:=-1;
  for i:= 1 to dimL do begin
    if(vc[i]>max)then
      max:=vc[i];
  end;
  maximo:=max;
end;
function moduloC(L:lista;codConeja:integer):integer;
begin
  while(L<>nil)and(L^.dato.cod<>codConeja)do
    L:=L^.sig
    
  if(L<>nil)then begin 
  
    moduloC:=maximo(L^.dato.cantPar,L^.dato.crias);
  end
  else
    moduloC:=-1;
end;
var
  L:lista;
  Ldos:listaDos;
  codConeja,cantMax:integer;
begin
  cargarLista(L);  //se dispone
  moduloA(L,Ldos);
  moduloB(Ldos);
  writeln('Ingrese el codigo de coneja');
  readln(codConeja);
  cantMax:=moduloC(L,codConeja);
end.
