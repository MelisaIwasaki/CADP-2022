{
Parcial 2015 13/6
 
Se va a desarrollar un concurso de docentes universitarios que se dedican a la investigación y se debe realizar 
un programa para administrar dicho concurso. Para ello se lee desde teclado información de docentes. De cada 
docente se lee: DNI, apellido, nombre, código de la facultad a la que pertenece(1 .. 17), código de categoría de 
docente(1 .. 5), área de investigación y cantidad de años en investigación. La lectura finaliza cuando llega el 
docente con DNI 0.
Además, para desarrollar el programa se dispone de una tabla que indica para cada categoría de docente el 
puntaje básico que se otorga por año de investigación.
Una vez que ha leída y almacenada la información de los docentes, se pide:
a)Informar para cada docente el DNI, apellido, nombre y puntaje total otorgado según sus años de investigación 
y su categoría de docente. El puntaje total se calcula como: año de investigación del docente multiplicado por 
el valor que indique la tabla para su categoría de docente.
b)Calcular e informar el código de facultad con mayor cantidad de docentes universitarios categoría 2.
c)Informar cuántos docentes categoría 5 se desempeñan en el área de “Ingeniería de software”.
d)Informar el DNI, apellido y nombre de aquellos docentes cuyo DNI contenga igual cantidad de dígitos pares que 
impares.
}


program Hello;
type
  rangoFacu=1..17;
  rangoCate=1..5;
  docente=record
    dni:integer;
    ape:cadena;
    nom:cadena;
    codFacu:rangoFacu;
    cate:rangoCate;
    invest:cadena;
    cantAnios:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:docente;
    sig:lista;
  end;
  tabla=array[rangoCate]of real; //se dispone
  vcont=array[rangoFacu]of integer;
  
procedure leerDoc(var d:docente);
begin
  writeln('Ingrese el dni');
  readln(d.dni);
  if(d.dni<>0)then begin
    writeln('Ingrese el apellido');
    readln(d.ape);
    writeln('Ingrese el nombre');
    readln(d.nom);
    writeln('Ingrese el codigo de la facultad');
    readln(d.codFacu);
    writeln('Ingrese el codigo de categoria ');
    readln(d.cateDoc);
    writeln('Ingrese el area de investigacion');
    readln(d.invest);
    writeln('Ingrese la cant de anios de investigacion');
    readln(d.cantAnios);
  end;
end;
procedure agregarAdelante(var L:lista;d:docente);
var nue:lista;
begin
  new(nue);
  nue^.dato:=d;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var d:docente;
begin
  leerDoc(d);
  while(L<>nil)do begin
    agregarAdelante(L,d);
    leerDoc(d);
  end;
end;
procedure inicializar(var v:vcont);
var i:rangoFacu;
begin
  for i:=1 to 17 do
    v[i]:=0;
end;
{a)Informar para cada docente el DNI, apellido, nombre y puntaje total otorgado según sus años de investigación 
y su categoría de docente. El puntaje total se calcula como: año de investigación del docente multiplicado por 
el valor que indique la tabla para su categoría de docente.}

procedure informar(L:lista);
var v:tabla;punTotal:real;
begin
  while(L<>nil)do begin
    punTotal:=L^.dato.cantAnios*v[L^.dato.cate];
    writeln('DNI:',L^.dato.dni);
    writeln('Apellido:',L^.dato.apellido);
    writeln('Nombre:',L^.dato.nombre);
    writeln('Puntaje total:',punTotal);
    L:=L^.sig;
  end;
end;
procedure mayorCantDoc(var max:integer;var codMax:integer;vc:vcont);
var i:rangoFacu;
begin
  for i:=1 to 17 do begin
    if(vc[i]>max)then begin
      max:=vc[i];
      codMax:=i;
    end;
  end;
end;
function igualCantidad(dni:integer):boolean;
var dig,par,impar:integer;
begin
  par:=0;impar:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    if(dig mod 2= 0)then  par:=par+1
      else impar:=impar+1;
    dni:=dni div 10;
  end;
  if(par=impar)then
    igualCantidad:=true
  else
    igualCantidad:=false;
end;
    
{b)Calcular e informar el código de facultad con mayor cantidad de docentes universitarios categoría 2.
c)Informar cuántos docentes categoría 5 se desempeñan en el área de “Ingeniería de software”.
d)Informar el DNI, apellido y nombre de aquellos docentes cuyo DNI contenga igual cantidad de dígitos pares que 
impares.}
procedure recorrer(L:lista);
var vc:vcont;
    max,codMax,doc5:integer;
begin
  max:=-1;codMax:=0;doc5:=0;
  inicializar(vc);
  while(L<>nil)do begin
    if(L^.dato.cate= 2)then
      vc[L^.dato.codFacu]:=vc[L^.dato.codFacu] + 1;
    if(L^.dato.cate= 5)and(L^.dato.invest='Ingenieria de Software')then
      doc5:=doc5 + 1;
    if(igualCantidad(L^.dato.dni))then
      writeln('Docentes cuyo DNI contenga igual cantidad de dígitos pares que impares:');
      writeln(L^.dato.dni,' ',L^.dato.ape,' ',L^.dato.nom);
    L:=L^.sig;
  end;
  mayorCantDoc(max,codMax,vc);
  writeln('El código de facultad con mayor cantidad de docentes universitarios categoría 2',codMax);
  writeln('Docentes categoría 5 se desempeñan en el área de “Ingeniería de software”',doc5);
end;
var
  L:lista;
begin
  L:=nil;
  cargarLista(L);
  Informar(L);
  recorrer(L);
end.
