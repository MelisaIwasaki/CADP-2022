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

program cadp; {Lo hizo la profe}
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

******************************************************************************
{Tratando de entender el programa}

program cadp;
const
  dimF = 5;//turno
type cadena15 = string [15];
     subrango = 1..10; //nota 
     alumno = record
                dni: integer;
                nom: cadena15;
                ape: cadena15;
                nota: subrango;
              end;
     lista = ^nodo;           //se dispone
     nodo = record
                datos: lista; //datos:alumno; seria
                sig: lista;
            end;
     vector = array [1..dimF] of lista;  //vector de alumno por turno
     vectorCant = array [1..dimF] of integer; //vector contador de turno

procedure Distribuir (l: lista; var v: vector);
  procedure InicializarListas (var v: vector);
  var i: integer;
  begin
    For i:= 1 to dimF do
      v[i]:= nil
  end;
  Procedure Turnos14 (var v:vector; vC: vectorCant; a: alumno); //turno 1 o 4, al menos 8(como minimo)
  var num: integer;                                             //incluye al 8. Nota 8,9,10
  begin
    if (vC[1] < vC [4]) then num:= 1   //v[1]<v[4] retorna 1
                        else num:= 4;  //retorna 4
    AgregarAdelante (v[num], a);       //le pasa vector de listas[1 o 4]y registro alumno
    vc[num]:= vC[num] + 1;             //v[1]o v[2]sumo uno
  end;

  Procedure Turnos235 (var v:vector; vC: vectorCant; a: alumno); //turno 2 o 3 o 5,si tiene la nota 5,6,7
    function Minimo (n1,n2,n5): integer; //parametros: vector cont(vC[2], vC [3], vC [5])
    begin
      if (n1 < n2 and n1 < n5  )       //if v[2]<v[3] and v[2]<v[5]
      then  Minimo:= 1                 //retorna 1
      else if  (n2 < n1 and n2 < n5  ) //if v[3]<v[2] and v[3]<v[5]
           then Minimo:= 2             //retorna 2
           else Minimo:= 5             //retorna 5 
     end;
  var num: integer;
  begin
    num:= Minimo (vC[2], vC [3], vC [5]); //num:1,2 o 5
    AgregarAdelante (v[num], a);          //le paso el vector de listas y el registro alumno
    vc[num]:= vC[num] + 1;                //contenido de vc:1,2 o 5, le sumo uno
  end;

var vC: vectorCant;
begin
  InicializarListas (v);  //vector de listas en nil
  InicializarVector (vC); //vector contador en cero
  while l <> nil do       //recorrer la lista de alumno
  begin
    case l^.datos.nota of   //si la nota es
      5,6,7: Turnos235 (v,vC, l^.datos); //le paso los dos vectores y la lista de alumno
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
    writeln ('Lista del turno: ', i); //turno 1 a 5
    ImprimirLista (v[i]) //contenido del turno 1 a 5
end;


var lA: lista; v: vector;
begin
  CargarListaAlumnos (lA);   {se dispone}
  Distribuir (lA, v);
  Imprimir (v);
end;

******************************************************************************
{Tratando de probar que el programa ande...
anda pero se carga solo el vector de turno 4 y 5.
Le cambie algunas cosas}

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
Procedure Turnos14 (var v:vector; vC: vectorCant; a: alumno);
var num: integer;
begin
    if (vC[1] < vC [4]) then num:= 1
                        else num:= 4;
    AgregarAdelante (v[num], a);
    vc[num]:= vC[num] + 1;
end;
function Minimo (n1,n2,n5:integer): integer; //n1:vc[2],n2:vc[3],n3:vc[5] nota entre 5 y 8
begin
  if (n1 < n2 )and (n1 < n5) then begin //0<0y0<0?/0<0y0<1?/
         Minimo:= 2;  //le cambie por 2
  end
  else if  (n2 < n1) and (n2 < n5)then 
             Minimo:= 3  //le cambie por 3
           else
             Minimo:= 5;    //retorna 5 la primera vez
end;
Procedure Turnos235 (var v:vector; vC: vectorCant; a: alumno);
var num: integer;
begin
    num:= Minimo (vC[2], vC [3], vC [5]); //num5
    AgregarAdelante (v[num], a);          //v[5]
    vc[num]:= vC[num] + 1;                //vc[5]+1
end;
procedure Distribuir (l: lista; var v: vector);
var vC: vectorCant;
begin
  InicializarListas (v);
  InicializarVector (vC);
  while l <> nil do begin
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
