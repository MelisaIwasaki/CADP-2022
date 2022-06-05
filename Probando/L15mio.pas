{
15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos 
los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir 
un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando los 
siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}
program catedraCADP;
const
  dimF=5;
type
  rango=1..dimF;
  rangoNota=1..10;
  cadena=string[30];
  alumno=record
    dni:integer;
    ape:cadena;
    nom:cadena;
    nota:rangoNota;
  end;
  lista=^nodo;  //se dispone
  nodo=record
    dato:alumno;
    sig:lista;
  end;
  vTurno=array[rango]of lista; //para ir cargando por turno
  vcont=array[rango]of integer; //para ir contando cuantos alumnos hay en cada turno

procedure leerAlu(var a:alumno); //se dispone
begin
  writeln('Ingrese el dni');
  readln(a.dni);
  writeln('Ingrese el apellido');
  readln(a.ape);
  writeln('Ingrese el nombre');
  readln(a.nom);
  writeln('Ingrese la nota');
  readln(a.nota);
end;
procedure agregarAdelante(var L:lista;a:alumno); //se dispone
var nue:lista;
begin
  new(nue);
  nue^.dato:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista); //se dispone
var  a:alumno;
begin
  repeat
    leerAlu(a);
    agregarAdelante(L,a);
  until(a.dni=0);
end;
procedure inicializarVC(var v:vcont);
var  i:rango;
begin
  for i:=1 to dimF do
    v[i]:=0;
end;
procedure inicializarLista(var v:vTurno); //iniciar vector de lista donde voy cargando por turnos
var  i:rango;
begin
  for i:=1 to dimF do
    v[i]:=nil;
end;
function Turno14(v:vcont):integer;
begin
  if(v[1] < v[4])then  Turno14:=1
                 else  Turno14:=4;
end;
function Turno235(v:vcont):integer;
begin
  if(v[2] < v[3])then  Turno235:=2
  else if (v[3] < v[5])then  Turno235:=3
                       else  Turno235:=5;
end;
procedure distribuir(L:lista;var v:vTurno);
var  vc:vcont;
     turno:rango;
begin
  inicializarVC(vc);
  inicializarLista(v);
  while(L<>nil)do begin
    if(L^.dato.nota>=8)then
      turno:=Turno14(vc)
    else if(L^.dato.nota>=5)and(L^.dato.nota<8)then
      turno:=Turno235(vc)
    else
      writeln('Alumno:',L^.dato.nom,'No se le asignara un turno');
    agregarAdelante(v[turno],L^.dato);
    vc[turno]:=vc[turno]+1;
    L:=L^.sig;
  end;
end;
procedure imprimir(L:lista;v:vTurno);  //v[i]=puntero al primero de la lista
var i:rango;
begin
  for i:= 1 to dimF do begin
    writeln('Turno:',i);
    L:=v[i]; 
    while(L<>nil)do begin
      writeln('DNI:',L^.dato.dni,'Apellido:',L^.dato.ape,'Nombre:',L^.dato.nom,'Nota:',L^.dato.nota);
      L:=L^.sig;
    end;
  end;
end;
var
  L:lista;
  v:vTurno;
begin
  L:=nil;//se dispone
  cargarLista(L);//se dispone
  distribuir(L,v);
  imprimir(L,v);
end.
