{
Parcial 2017 25/11

Una biblioteca necesita un programa para administrar información de los préstamos de libros realizados, a sus 
socios, durante 2017. Para ello, se debe:
a)Leer y almacenar información de los préstamos. De cada préstamo se lee: número de préstamo, fecha de préstamo
( día, mes) , número de socio, apellido y nombre del socio, ISBN de libro, título del libro. La lectura de 
información finaliza cuando se lee el ISBN de libro -1(que no debe procesarse). La información debe ser 
almacenada de manera ordenada por ISBN de libro.Tener en cuenta que el libro puede haber sido prestado 0, 1 o 
más veces.
b)Una vez leída y almacenada toda la información, calcular e informar:
1) Para cada libro, su título y la cantidad de veces que fue prestado en el mes de Marzo.
2) Apellido y nombre de los socios con número de socio compuesto sólo por dígitos múltiplos de 3.
3)Mes en el que se realizó la mayor cantidad de préstamos y mes en el que se realizó la menor cantidad
C)  Implementar un módulo que actualice, en la estructura generada en “A)”, el título del    libro con 
ISBN 1122334455, el nuevo título debería ser “Introducción a la Programación”.
Nota: Se pide realizar la invocación del módulo.
}
program biblioteca;
const
  tam=11; //1122334455;
type
  ranDia=1..31;
  ranMes=1..12;
  cadena=string[50];
  fecha=record
    dia:ranDia;
    mes:ranMes;
  end;  
  prestamo=record
    numPres:integer;
    fechaF:fecha;
    numSocio:integer;
    apeYnom:cadena;
    isbn:integer;
    titulo:cadena;
  end;
  lista=^nodo;
  nodo=record
    dato:prestamo;
    sig:lista;
  end;
  vpresto=array[ranMes]of integer;
  
procedure leerFecha(var f:fecha);
begin
  writeln('Ingrese el dia');
  readln(f.dia);
  writeln('Ingrese el mes');
  readln(f.mes);
end;
procedure leerPrestamo(var p:prestamo);
begin
  writeln('Ingrese ISBN del libro');
  readln(p.isbn);
  if(p.isbn<>-1)then begin
    writeln('Ingrese numero de prestamo');
    readln(p.numPres);
    writeln('Ingrese la fecha');
    leerFecha(p.fechaF);
    writeln('Ingrese el nro de socio');
    readln(p.numSocio);
    writeln('Ingrese el apellido y nombre');
    readln(p.apeYnom);
    writeln('Ingrese el titulo');
    readln(p.titulo);
  end;
end;
procedure insertarOrdenado(var L:lista;p:prestamo);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=p;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.isbn< p.isbn)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then  L:=nue
    else  ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure cargarLista(var L:lista);
var p:prestamo;
begin
  leerPrestamo(p);
  while(p.isbn<>-1)do begin
    insertarOrdenado(L,p);
    leerPrestamo(p);
  end;
end;
function multiploTres(num:integer):boolean;
var dig,multiplo,cant:integer;
begin
  multiplo:=0;cant:=0;
  while(num<>0)do begin
    dig:=num mod 10;
    cant:=cant+1;
    if(dig mod 3= 0)then 
      multiplo:=multiplo+1;
    num:=num div 10;
  end;
  if(cant=multiplo)then
    multiploTres:=true
  else
    multiploTres:=false;
end;
procedure inicializar (var v:vpresto);
var i:ranMes;
begin
  for i:=1 to 12 do
    v[i]:=1;
end;
procedure maximoYminimo(var max,min:integer;var mesMax,mesMin:ranMes;vp:vpresto);
var i:ranMes;
begin
  for i:=1 to 12 do begin
    if(vp[i]>max)then begin
      max:=vp[i];
      mesMax:=i;
    end;
    if(vp[i]<min)then begin
      min:=vp[i];
      mesMin:=i;
    end;
  end;
end;
{1) Para cada libro, su título y la cantidad de veces que fue prestado en el mes de Marzo.
2) Apellido y nombre de los socios con número de socio compuesto sólo por dígitos múltiplos de 3.
3)Mes en el que se realizó la mayor cantidad de préstamos y mes en el que se realizó la menor cantidad}
procedure procesar(L:lista);
var  isbnActual,max,min:integer;
     tituloAct:cadena;
     vp:vpresto;
     mesMax,mesMin:ranMes;
begin
  max:=-1;min:=999;
  inicializar(vp);
  while(L<>nil)do begin
    isbnActual:=L^.dato.isbn;
    while(L<>nil)and(isbnActual=L^.dato.isbn)do begin
      vp[L^.dato.fechaF.mes]:=vp[L^.dato.fechaF.mes]+1; //cantidad de veces que se va prestando en cada mes
      tituloAct:=L^.dato.titulo;
      if(multiploTres(L^.dato.numSocio))then
        writeln('Con nro de socio compuesto sólo por dígitos múltiplos de 3:',L^.dato.apeYnom);
      L:=L^.sig;
    end;
    writeln('Libro:',isbnActual,' Titulo:',tituloAct,' se presto en marzo:',vp[3],' veces');
  end;
  maximoYminimo(max,min,mesMax,mesMin,vp);
  writeln('Mes en el que se presto mas:',mesMax,' y mes en el que se presto menos:',mesMin);
end;
{C)  Implementar un módulo que actualice, en la estructura generada en “A)”, el título del    libro con 
ISBN 1122334455, el nuevo título debería ser “Introducción a la Programación”.
Nota: Se pide realizar la invocación del módulo}
procedure actualizar( L:lista);
begin
  while(L<>nil)do begin
    if(L^.dato.isbn = tam)then
      L^.dato.titulo := 'Introduccion a la Programacion';
    L:=L^.sig;
  end;
end;
procedure mostrar( L:lista);  //para probar
begin
  writeln('Lo que se actualizo:');
  while(L<>nil)do begin
    writeln('ISBN:',L^.dato.isbn,'TItulo:',L^.dato.titulo);
    L:=L^.sig;
  end;
end;
var
  L:lista;
begin
  L:=nil;
  cargarLista(L);
  procesar(L);
  actualizar(L);
  mostrar(L);  //para probar
end.
