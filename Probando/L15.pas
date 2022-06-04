program cadp;
const 
  dimF = 5;
type 
  cadena15 = string [15];
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

procedure leerAlu(var a:alumno); //se dispone, no hay que implementar.Lo hago para probar.
begin
  writeln('Ingrese el dni');
  readln(a.dni);
  writeln('Ingrese el nombre');
  readln(a.nom);
  writeln('Ingrese el apellido');
  readln(a.ape);
  writeln('Ingrese la nota[1-10]');
  readln(a.nota);
end;
procedure AgregarAdelante(var L:lista;a:alumno); //se dispone
var nue:lista;
begin
  new(nue);
  nue^.datos:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure CargarListaAlumnos(var L:lista); //se dispone
var a:alumno;
begin
  repeat
    leerAlu(a);
    AgregarAdelante(L,a);
  until(a.dni=0);
end;
procedure InicializarVector(var vc:vectorCant);
var i:integer;
begin
    for i:= 1 to 5 do
       vc[i]:=0;
end;
procedure InicializarListas (var v: vector);
var i: integer;
begin
    For i:= 1 to dimF do
      v[i]:= nil;
end;
Procedure Turnos14 (var v:vector;var vC: vectorCant; a: alumno); //vc por referencia porque lo saque del anidado
var num: integer;
begin
    if (vC[1] < vC[4]) then num:= 1   //0<0/0<1/1<1/1<2
                       else num:= 4;
    AgregarAdelante (v[num], a);      //vc4:0/1/2
    vc[num]:= vC[num] + 1;            //vc1:0/1/2
end;

function Minimo (n2,n3,n5:integer): integer; //Aca le cambie casi todo
begin
  if(n2 < n3)then 
        Minimo:= 2
  else if(n3 < n5)then                 
        Minimo:= 3 
       else                         
        Minimo:= 5; 
end;
Procedure Turnos235 (var v:vector;var vC: vectorCant; a: alumno);//tambien por referencia
var num: integer;
begin
    num:= Minimo (vC[2], vC [3], vC [5]); 
    AgregarAdelante (v[num], a);          
    vc[num]:= vC[num] + 1;                
end;
procedure Distribuir (l: lista; var v: vector);
var vC: vectorCant;
begin
  InicializarListas (v);
  InicializarVector (vC);
  while (l <> nil) do begin
    case l^.datos.nota of
      5,6,7: Turnos235 (v,vC, l^.datos); //L^.datos=registro alumno
      8,9,10: Turnos14 (v,vC, l^.datos)
    else write ('No se le asigna turno');
    end;
    l:= l^.sig;
  end;
end;
procedure Imprimir (v: vector);
  procedure ImprimirLista (l: lista);
  begin
    while (l <> nil) do
    begin
      writeln (l^.datos.nom,' ',l^.datos.ape,' ',l^.datos.dni,' ',l^.datos.nota);
      l:= l^.sig;
    end;
  end;

var i: integer;
begin
  For i:= 1 to dimF do begin
    writeln ('Lista del turno: ', i);
    ImprimirLista (v[i]);
  end;
end;
var lA: lista; v: vector;
begin
  CargarListaAlumnos (lA);   {se dispone}
  Distribuir (lA, v);
  Imprimir (v);
end.
