{
Parcial 2015 18/7

Una consultora informática necesita organizar la información de sus proyectos. Para ello se debe: Leer y 
almacenar la información de los proyectos. De cada proyecto se lee: número interno del proyecto, descripción 
del proyecto, año de inicio, año de fin, código del tipo del lenguaje utilizado (1- PHP, 2- Java, 3- Phyton, 
4- Net, 5- Ruby) el costo de la hora de programación.La lectura finaliza con el número interno 0.
Una vez leída y almacenada la información de los proyectos se pide:
a- Calcular e informar los dos lenguajes de programación más utilizados.
b- Calcular e informar para cada año entre 2000 y 2014 el costo total de horas de programación de los proyectos 
cuyo “año de inicio” se encuentre en dicho rango (sin importar el año del fin).
c- Calcular e informar la cantidad de personas que participaron en proyectos en los que se utilizó el lenguaje 
“Phyton” y con duración menor a un año.
d- Calcular e informar la cantidad de proyectos en los que el número interno contenga a lo sumo 3 dígitos 
impares.
}

program consultoraInfo;
const
  dimF=5;
type
  rango=1..dimF;
  cadena=string[50];
  proyecto=record
    num:integer;
    descrip:cadena;
    anioI:integer;
    anioF:integer;
    tipo:rango;
    costo:real;
  end;
  lista=^nodo;
  nodo=record
    dato:proyecto;
    sig:lista;
  end;
  vcont=array[rango]of integer;
  
procedure leerProyecto(var p:proyecto);
begin
  writeln('Ingrese el numero interno');
  readln(p.num);
  if(p.num<>0)then begin
    writeln('Ingrese la descripcion');
    readln(p.descrip);
    writeln('Ingrese el anio de inicio');
    readln(p.anioI);
    writeln('Ingrese el anio de fin');
    readln(p.anioF);
    writeln('Ingrese el tipo de lenguaje');
    readln(p.tipo);
    writeln('Ingrese el costo x hora');
    readln(p.costo);
  end;
end;
procedure insertarOrdenado(var L:lista;p:proyecto);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=p;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.anioI< p.anioI)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then  
    L:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure cargarLista(var L:lista);
var p:proyecto;
begin
  leerProyecto(p);
  while(p.num<>0)do begin
    insertarOrdenado(L,p);
    leerProyecto(p);
  end;
end;
procedure inicializar(var vc:vcont);
var i:rango;
begin
  for i:=1 to dimF do
    vc[i]:=0;
end;
procedure maximo(var max1,max2:integer;var tipo1,tipo2:integer;vc:vcont);
var i:rango;
begin
  for i:=1 to dimF do begin
    if(vc[i]>max1)then begin
      max2:=max1;
      max1:=vc[i];
      tipo2:=tipo1;
      tipo1:=i;
    end
    else if(vc[i]>max2)then begin
           max2:=vc[i];
           tipo2:=i;
    end;
  end;
end;
function tresImpares(num:integer):boolean;
var dig,impar:integer;
begin
  impar:=0;
  while(num<>0)and(impar<3)do begin
    dig:=num mod 10;
    if(dig mod 2 = 1)then
      impar:= impar + 1;
    num:=num div 10;
  end;
  if(impar<= 3)then
    tresImpares:=true
  else
    tresImpares:=false;
end;
{a- Calcular e informar los dos lenguajes de programación más utilizados.
b- Calcular e informar para cada año entre 2000 y 2014 el costo total de horas de programación de los proyectos 
cuyo “año de inicio” se encuentre en dicho rango (sin importar el año del fin).
c- Calcular e informar la cantidad de personas que participaron en proyectos en los que se utilizó el lenguaje 
“Phyton” y con duración menor a un año.
d- Calcular e informar la cantidad de proyectos en los que el número interno contenga a lo sumo 3 dígitos 
impares.}
procedure recorrerLista(L:lista);
var  vc:vcont;
     max1,max2,tipo1,tipo2,anioActual,cantPhyton,duracion,canTres:integer;
     costoTotal:real;
begin
  max1:=-1;tipo1:=0;cantPhyton:=0;canTres:=0;
  inicializar(vc);
  while(L<>nil)do begin
    anioActual:=L^.dato.anioI;
    costoTotal:=0;
    while(L<>nil)and(anioActual=L^.dato.anioI)do begin
      costoTotal:=costoTotal +L^.dato.costo;
      vc[L^.dato.tipo]:=vc[L^.dato.tipo] + 1;
      duracion:=L^.dato.anioF-L^.dato.anioI;
      if(L^.dato.tipo= 3)and(duracion< 1)then
        cantPhyton:=cantPhyton + 1;
      if(tresImpares(L^.dato.num))then
        canTres:=canTres + 1;
      L:=L^.sig;
    end;
    if(anioActual>=2000)and(anioActual<=2014)then
      writeln('Anio:',anioActual,' costo total:',costoTotal);
  end;
  maximo(max1,max2,tipo1,tipo2,vc);
  writeln('Los dos lenguajes de programación más utilizados:',tipo1,' y ',tipo2);
  writeln('La cantidad de personas que utilizaron el lenguaje “Phyton” en menos de un año:',cantPhyton);
  writeln('La cantidad de proyectos en los que el número interno contenga a lo sumo 3 dígitos impares:',canTres);
end;
var
  L:lista;
begin
  L:=nil;
  cargarLista(L);
  recorrerLista(L);
end.


