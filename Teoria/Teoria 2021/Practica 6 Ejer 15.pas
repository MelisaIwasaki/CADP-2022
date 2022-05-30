{15. La catedra de CADP esta organizando la cursada para el año 2019.
Para ello, dispone de una lista con todos los alumnos que cursaron EPA. 
De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. 
Escribir un programa que procese la información de alumnos disponible y 
los distribuya en turnos utilizando los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberan ir a los turnos 1 o 4.
- Los alumnos que obtuvieron entre 5 y 8 deberan ir a los turnos 2, 3 o 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignara turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribucion de alumnos debe ser lo mas equitativa posible.}

program cadp;
dimF = 5;
type cadena15 = string [15];
     subrango = 1..10;
     alumno = record
                dni: integer;
                nom: cadena15;
                ape: cadena15;
                nota: subrango;
              end;
     lista = ^nodo;
     nodo = record
                datos: lista;
                sig: lista;
            end;
     vector = array [1..dimF] of lista;
     vectorCant = array [1..dimF] of integer;

procedure Distribuir (l: lista; var v: vector);
  procedure InicializarListas (var v: vector);
  var i: integer;
  begin
    For i:= 1 to dimF do
      v[i]:= nil
  end;
  Procedure Turnos14 (var v:vector; vC: vectorCant; a: alumno);
  var num: integer;
  begin
    if (vC[1] < vC [4]) then num:= 1
                        else num:= 4;
    AgregarAdelante (v[num], a);
    vc[num]:= vC[num] + 1;
  end;

  Procedure Turnos235 (var v:vector; vC: vectorCant; a: alumno);
    function Minimo (n1,n2,n5): integer;
    begin
      if (n1 < n2 and n1 < n5  )
      then  Minimo:= 1
      else if  (n2 < n1 and n2 < n5  )
           then Minimo:= 2
           else Minimo:= 5
     end;
  var num: integer;
  begin
    num:= Minimo (vC[2], vC [3], vC [5]);
    AgregarAdelante (v[num], a);
    vc[num]:= vC[num] + 1;
  end;

var vC: vectorCant;
begin
  InicializarListas (v);
  InicializarVector (vC);
  while l <> nil do
  begin
    case l^.datos.nota of
      5,6,7: Turnos235 (v,vC, l^.datos);
      8,9,10: Turnos14 (v,vC, l^.datos);
    else write ('No se le asigna turno')
    end;
    l:= l^.sig;
end;

procedure Imprimir (v: vector);
  procedure ImprimirLista (l: lista);
  begin
    while (l <> nil) do
    begin
      writeln (l^.datos.nom, l^.datos.ape);
      l:= l^.sig
    end;
  end;

var i: integer;
begin
  For i:= 1 to dimF
    writeln ('Lista del turno: ', i);
    ImprimirLista (v[i])
end;


var lA: lista; v: vector;
begin
  CargarListaAlumnos (lA);   {se dispone}
  Distribuir (lA, v);
  Imprimir (v);
end;


{COMPLETO}

program cadp;
const dimF = 5;             
type cadena15 = string [15];
     subrango = 1..10;
     alumno = record
                dni: integer;
                nom: cadena15;
                ape: cadena15;
                nota: subrango;
              end;
     lista = ^nodo;
     nodo = record
                datos: alumno;
                sig: lista;
            end;
     vector = array [1..dimF] of lista;
     vectorCant = array [1..dimF] of integer;

procedure leerAlu(var a:alumno);
begin
  writeln('Ingrese dni');
  readln(a.dni);
  writeln('Ingrese el nombre');
  readln(a.nom);
  writeln('Ingrese el apellido');
  readln(a.ape);
  writeln('Ingrese la nota');
  readln(a.nota);
end;
procedure AgregarAdelante(var L:lista;a:alumno);
var nue:lista;
begin
  new(nue);
  nue^.datos:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista); //se dispone
var a:alumno;
begin
  leerAlu(a);
  while(a.dni<>0)do begin
    AgregarAdelante(L,a);
    leerAlu(a);
  end;
end;
procedure InicializarVector(var vc:vectorCant); 
var i:integer;
begin
  for i:=1 to dimF do
    vc[i]:=0;
end;
procedure InicializarListas (var v: vector);
var i: integer;
begin
    For i:= 1 to dimF do
      v[i]:= nil
end;
Procedure Turnos14 (var v:vector; vC: vectorCant; a: alumno);
var num: integer;
begin
    if (vC[1] < vC [4]) then num:= 1 
                        else num:= 4; 
    AgregarAdelante (v[num], a);
    vc[num]:= vC[num] + 1;
end;
function Minimo (n1,n2,n5:integer):integer;
begin
      if (n1 < n2) and (n1 < n5  )then  Minimo:= 1  
      else if  (n2 < n1 )and( n2 < n5  )            
           then Minimo:= 2
           else Minimo:= 5;
end;
Procedure Turnos235 (var v:vector; vC: vectorCant; a: alumno);
var num: integer;
begin
    num:= Minimo (vC[2], vC [3], vC [5]);  
    AgregarAdelante (v[num], a);   
    vc[num]:= vC[num] + 1;         
end;
procedure Distribuir (var v: vector;L:lista);
var vC: vectorCant;
begin
  InicializarVector (vC);
  while l <> nil do begin  
    case l^.datos.nota of
      5,6,7: Turnos235 (v,vC, l^.datos);
      8,9,10: Turnos14 (v,vC, l^.datos);
    else write ('No se le asigna turno')
    end;
  end;
  l:= l^.sig;
end;
procedure ImprimirLista (l: lista);
begin
    while (l <> nil) do begin
      writeln (l^.datos.nom, l^.datos.ape);
      l:= l^.sig
    end;
end;
procedure Imprimir (v: vector);
var i: integer;
begin
  For i:= 1 to dimF do begin
    writeln ('Lista del turno: ', i);
    ImprimirLista (v[i]);
  end;
end;


var  v: vector;
     L:lista;
begin
  L:=nil;
  InicializarListas (v);
  cargarLista(L);  //se dispone
  Distribuir (v,L);
  Imprimir (v);
end.
