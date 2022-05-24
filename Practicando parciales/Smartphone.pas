{
Parcial 2015 14/11

Desarrollar un programa, destinado a la gestión de inscripciones de alumnos de la Facultad de Informática a una
capacitación sobre aplicaciones para Smartphones. Para ello, se debe:
a)Leer y almacenar la información de los alumnos interesados. De cada alumno se lee y almacena: DNI, apellido, 
nombre, año de ingreso, código de la carrera en la que se encuentra inscripto(1- APU, 2- LS, 3- LI, 4- IC) y 
analítico. El analítico contiene el nombre y la nota de las materias aprobadas, a lo sumo 32. La lectura de los 
alumnos interesados finaliza cuando llega el DNI 0 (cero), y la lectura de las materias para cada alumno 
finaliza cuando se lee el nombre de la materia “ZZZ”.
Una vez leída y almacenada la información, se pide:
b)Informar los dos códigos de carrera con menos alumnos inscriptos.
c)Informar el DNI,nombre y apellido de los alumnos cuyo DNI poseen a lo sumo 3 dígitos impares.
d)Informar el nombre, apellido y año de ingreso del alumno inscripto con mejor promedio entre todas las carreras.
Nota: Un alumno se encuentra inscripto a una única carrera.
}
program Smartphones;
const
  dimF=32;
  carrera=4;
type
  rango=1..dimF;
  rangoC=1..carrera;
  cadena=string[50];
  aprobada=record
    materia:cadena;
    nota:rango;
  end;
  vector=array[rango]of aprobada;
  alumno=record
    dni:integer;
    ape:cadena;
    nom:cadena;
    anio:integer;
    cod:rangoC;
    analitico:vector;
    dimL:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:alumno;
    sig:lista;
  end;
  vcont=array[rangoC]of integer;
  
procedure LeerAnalitico(var ana:analitico);
begin
  writeln('Ingrese la materia');
  readln(ana.materia);
  if(ana.materia='ZZZ')then begin
    writeln('Ingrese la nota');
    readln(ana.nota);
  end;
end;
procedure cargarAnalitico(var v:vector;var dimL:integer);
var ana:analitico;
begin
  dimL:=0;
  LeerAnalitico(ana);
  while(dimL<dimF)and(ana.materia='ZZZ')do begin
    dimL:=dimL+1;
    v[dimL]:=ana;
    LeerAnalitico(ana);
  end;
end;
procedure leerAlumno(var a:alumno);
begin
  writeln('Ingrese el dni');
  readln(a.dni);
  if(a.dni<>0)then begin
    writeln('Ingrese el apellido');
    readln(a.ape);
    writeln('Ingrese el nombre');
    readln(a.nom);
    writeln('Ingrese el anio de ingreso');
    readln(a.anio);
    writeln('Ingrese el codigo de carrera');
    readln(a.cod);
    writeln('Ingrese el analitico');
    cargarAnalitico(a.analitico,a.dimL);  //le cargo directamente y le paso los dos campos
  end;
end;
procedure agregarAdelante(var L:lista;a:alumno);
var nue:lista;
begin
  new(nue);
  nue^.dato:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var a:alumno;
begin
  leerAlumno(a);
  while(a.dni<>0)do begin
    agregarAdelante(L,a);
    leerAlumno(a);
  end;
end;
procedure minimo(var min1,min2:integer;var cod1,cod2:integer;vc:vcont);
var i:rangoC;
begin
  for i:=1 to carrera do begin
    if(vc[i]<min1)then begin
      min2:=min1;
      min1:=vc[i];
      cod2:=cod1;
      cod1:=i;
    end
    else if(vc[i]<min2)then begin
           min2:=vc[i];
           cod2:=i;
    end;
  end;
end;
function tresImpares(dni:integer):boolean;
var dig,impar:integer;
begin
  impar:=0;
  while(dni<>0)and(impar<3)do begin
    dig:=dni mod 10;
    if(dig mod 2 = 1)then  impar:=impar+1;
    dni:=dni div 10;
  end;
  if(impar<=3)then
    tresImpares:=true
  else
    tresImpares:=false;
end;
function promedio(v:vector):real;
var i:rango;
    suma:real;total:integer;
begin
  suma:=0;total:=0;
  for i:=1 to dimF do begin
    suma:=suma + v[i].nota;
    total:=total + 1;
  end;
  promedio:=suma/total;
end;
procedure maximo(var max:real;var nomMax,apeMax:cadena;var anioMax:integer;prom:real;nom,ape:cadena;anio:integer);
begin
  if(prom>max)then begin
    max:=prom;
    nomMax:=nom;
    apeMax:=ape;
    anioMax:=anio;
  end;
end;
procedure recorrer(L:lista);
var vc:vcont;v:vector;
    min1,min2,cod1,cod2,anioMax:integer;
    nomMax,apeMax:cadena;  prom:real;
begin
  min1:=9999;cod1:=0;max:=-1;
  while(L<>nil)do begin
    vc[L^.dato.cod]:=vc[L^.dato.cod] + 1;
    if(tresImpares(L^.dato.dni))then
      writeln(L^.dato.dni,L^.dato.nom,L^.dato.ape);
    prom:=promedio(v);
    maximo(max,nomMax,apeMax,anioMax,prom,L^.dato.nom,L^.dato.ape,L^.dato.anio);
    L:=L^.sig;
  end;
  minimo(min1,min2,cod1,cod2,vc);
  writeln('Los dos códigos de carrera con menos alumnos inscriptos',cod1,' y ',cod2);
  writeln('Alumno con mejor promedio:',nomMax,apeMax,anioMax);
end;
var 
  L:lista;
begin
  L:=nil;
  cargarLista(L);
  recorrer(L);
end.
