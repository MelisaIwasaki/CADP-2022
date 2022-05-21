{
1. Dado el siguiente programa:
a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
b) Al terminar el programa, ¿con qué valores finaliza la variable números?
c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?
d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
for i:=1 to 9 do
numeros[i+1] := numeros[i];
}
program sumador;
type
 vnums = array [1..10] of integer;
var
 numeros : vnums;
 i : integer;
begin
 for i:=1 to 10 do begin                    
   numeros[i] := i;                         
   writeln(numeros[i]);
 end;                                       
 for i := 2 to 10 do begin{segundo bloque for}
 //c:for i:=1 to 9 do begin
 //d:for i:=1 to 9 do begin
   numeros[i] := numeros[i] + numeros [i-1]; 
   //c:numeros[i+1] := numeros[i+1] + numeros [i];
   //d:numeros[i+1] := numeros[i];  //todos unos
   writeln(numeros[i]);         //3 6 10 15 21 28 36 45 55
 end;
end.

{
2. Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.
}
program Vectores;
const
cant_datos = 150;
type
vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos;var dimL : integer);
var
  numero:real;{ completar }
begin
  writeln('Ingrese un numero real');  { completar }
  readln(numero);
  while(numero<>0)and(dimL<cant_datos)do begin 
    dimL:=dimL+1;
    v[dimL]:=numero;
    writeln('Ingrese un numero real');
    readln(numero);
  end;
end;
procedure modificarVectorySumar(var v:vdatos;dimL : integer; n: real; var suma: real);
var
  i:integer;   { completar }
begin
  for i:=1 to dimL do begin { completar }
    v[i]:=v[i]+n;
    suma:=suma+v[i];
  end;
end;
{ programa principal }
var
  datos : vdatos;
  dim : integer;
  num, suma : real;
begin
  dim := 0;
  suma := 0;
  cargarVector(datos,dim); { completar }
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos,dim,num,suma);{completar}
  writeln('La suma de los valores es: ', suma:2:2);
  writeln('Se procesaron: ',dim, ' números');
end.
{
3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
}
program Hello;
const
  dimF=5;
type
  vector=array[1..dimF]of integer;

procedure cargarVector(var v:vector;var dimL:integer);
var num:integer;
begin
  write('Ingrese un numero:');
  readln(num);
  while(num<>0)and(dimL<dimF)do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    write('Ingrese un numero:');
    readln(num);
  end;
end;
procedure moduloA(v:vector;dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do
    writeln('En la posicion ',i,' contiene:',v[i]);
end;
procedure moduloB(v:vector;dimL:integer);
var i:integer;
begin
  for i:=dimL downto 1 do
  writeln ('En la posicion ',i,' contiene:',v[i]);
end;
procedure moduloC(v:vector;dimL:integer);
var i:integer;
begin
  for i:=(dimL div 2)downto 1 do
    writeln('Desde la mitad hacia la primer posicion:',i,'contiene',v[i]);
  for i:=((dimL div 2)+1)to dimL do
    writeln('Desde la mitad mas uno hacia la ultima posicion:',i,'contiene',v[i]);
end;
procedure moduloD(v:vector;x,y:integer);
var i:integer;
begin
    if(x<y)then begin
      for i:= x to y do
        writeln('El contenido es ',v[i]);
    end
    else 
      for i:= y to x do
        writeln('El contenido es ',v[i]);
    end;
end;

var v:vector;
    dimL:integer;
begin
  dimL:=0;
  cargarVector(v,dimL); //se dispone
  moduloA(v,dimL);
  moduloB(v,dimL);
  moduloC(v,dimL);
  moduloD(v,1,dimL);
  moduloD(v,dimL,1);
end.
{
4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector
}
program Hello;
const dimF=100;
type
  rangoValor=1..100;
  vector=array[1..dimF]of integer;
procedure cargarVector(var v:vector);
var num,i:integer;
begin
  for i:=1 to dimF do begin
    writeln('Ingrese un numero');
    readln(num);
    v[i]:=num;
  end;
end;
function posicion(v:vector;x:integer):integer;
var i:integer;
begin
  i:=1;
  while(i<=dimF)and(v[i]<>x)do
    i:=i+1;
  if(v[i]=x)then
    pos:=i
  else
    pos:=-1;
end; 
procedure intercambio(x,y:integer;var v:vector);
var aux:integer;
begin
  aux:=v[x];
  v[x]:=v[y];
  v[y]:=aux;
end;
procedure sumaVector(v:vector; var suma:integer);
var i:rangoValor;
begin
  for i:=1 to dimF do
    suma:=suma+v[i];
end;
function promedio(v:vector;suma:integer):real;
begin
  promedio:=suma/dimF;   
end;
function elementoMaximo(v:vector):integer;
var i,max,pos:integer;
begin
  max:=-1;
  for i:=1 to dimF do begin
    if(v[i]>max)then begin
      max:=v[i];
      pos:=i;
    end;
  end; 
  elementoMaximo:=pos;
end;
function elementoMinimo(v:vector):integer;
var i,min,pos:integer;
begin
  min:=999;
  for i:=1 to dimF do begin
    if(v[i]<min)then begin
      min:=v[i];
      pos:=i;
    end;
  end; 
  elementoMinimo:=pos;
end;
var
  v:vector;
  numx,pos,suma:integer;
  x,y:rangoValor;
begin
  suma:=0;
  cargarVector(v);
  writeln('Ingrese un numero x');
  readln(numx);
  writeln('El numero x se encontro en la posicion ',posicion(v,numx));
  writeln('Ingrese la posicion que quiera intercambiar');
  readln(x);
  writeln('por cual?');
  readln(y);
  intercambio(x,y,v);
  sumaVector(v,suma);
  writeln('La suma de todos los elementos del vector',suma);
  writeln('Promedio',promedio(v,suma):2:2);
  writeln('La posición del mayor elemento del vector',elementoMaximo(v));
  writeln('La posicion del menor elemento del vector',elementoMinimo(v));
end.

{
5. Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
}
program Hello;
const dimF=100;  
type  vector=array[1..dimF]of integer;

function elementoMaximo(v:vector;dimL:integer):integer;
var i,pos,max:integer;
begin
  max:=-1;
  for i:=1 to dimL do begin
    if(v[i]>max)then begin
      max:=v[i];
      pos:=i;
    end;
  end;
  elementoMaximo:=pos;
end;
function elementoMinimo(v:vector;dimL:integer):integer;
var i,pos,min:integer;
begin
  min:=999;
  for i:=1 to dimL do begin
    if(v[i]<min)then begin
      min:=v[i];
      pos:=i;
    end;
  end;
  elementoMinimo:=pos;
end;
procedure intercambio(var x,y:integer;var v:vector);
var aux:integer;
begin
  aux:=v[x];
  v[x]:=v[y];
  v[y]:=aux;
end;
var v:vector;
    posMax,posMin,dimL,num:integer;
begin
  dimL:=0;
  write('Ingrese un numero entero:');
  readln(num);
  while(num<>0)and(dimL<dimF)do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    write('Ingrese un numero entero:');
    readln(num);
  end;
  posMax:=elementoMaximo(v,dimL);
  posMin:=elementoMinimo(v,dimL);
  intercambio(posMax,posMin,v);
  writeln ('El elemento maximo ',v[posMin],' que se encontraba en la posicion ',posMax,
  ' fue intercambiado con el elemento minimo ',v[posMax],' que se encontraba en la posicion ',posMin);
end.
{
6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.
}
program Hello;
const dimF=100;
type  vector=array[1..dimF]of integer;
procedure cargarVector(var v:vector;var dimL:integer);
var num:integer;
begin
  write('Ingrese un numero entero:');
  readln(num);
  while(num<>0)and(dimL<dimF)do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    write('Ingrese un numero entero:');
    readln(num);
  end;
end;
procedure recorrerVector(v:vector;dimL:integer;var posMax,posMin:integer);
var i,min,max:integer;
begin
  min:=999;
  max:=-1;
  for i:=1 to dimL do begin
    if(v[i]<min)then begin
      min:=v[i];
      posMin:=i;
    end;
    if(v[i]>max)then begin
      max:=v[i];
      posMax:=i;
    end;
  end;    
end;
procedure intercambio(var x,y:integer;var v:vector);
var aux:integer;
begin
  aux:=v[x];
  v[x]:=v[y];
  v[y]:=aux;
end;
var v:vector;
    posMax,posMin,dimL:integer;
begin
  cargarVector(v,dimL);
  recorrerVector(v,dimL,posMax,posMin);
  intercambio(posMax,posMin,v);
  writeln ('El elemento maximo ',v[posMin],' que se encontraba en la posicion ',posMax,
  ' fue intercambiado con el elemento minimo ',v[posMax],' que se encontraba en la posicion ',posMin);
end.
{
7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}
program Hello;
const dimF=9;
type  rango=0..dimF;
      vector=array[rango]of integer;
procedure inicializar(var v:vector);
var i:rango;
begin
  for i:=0 to dimF do
    v[i]:=0;
end;
procedure descomponer(var v:vector;num:integer);
var resto:rango;
begin
  while(num<>0)do begin
    resto:=num mod 10;
    v[resto]:=v[resto]+1;
    num:=num div 10;
  end;
end;
procedure actualizarMaximo(num:integer;var max,pos:integer;i:integer);
begin
  if(num>max)then begin
    max:=num;
    pos:=i;
  end;
end;
procedure imprimir(v:vector);
var i,max,pos:integer;
begin
  max:=-1;
  pos:=-1;
  for i:=0 to 9 do begin
    actualizarMaximo(v[i],max,pos,i);
    if(v[i]=0)then 
      writeln('El digito ',i,' no tuvo ocurrencias.')
    else
      writeln('El digito ',i,' ocurrio ',v[i],'veces');
  end;
  writeln('El digito mas leido fue:',pos);
end;
var v:vector;
    num:integer;
begin
  inicializar(v);
  write('Ingrese un numero:');
  readln(num);
  while (num<>-1)do begin
    descomponer(v,num);   
    write('Ingrese un numero:');
    readln(num);
  end;
  imprimir(v);
end.
{
8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}
program FI;
const 
  ING=3;//400
type
  cadena=string[30];
  alumno=record
    num:integer;
    dni:integer;
    ape:cadena;
    nom:cadena;
    anio:integer;
  end;
  vector=array[1..ING]of alumno;
  
procedure leerAlu(var a:alumno);
begin
  writeln('Ingrese el numero de inscripcion');
  readln(a.num);
  writeln('Ingrese el dni');
  readln(a.dni);
  writeln('Ingrese el apellido');
  readln(a.ape);
  writeln('Ingrese el nombre');
  readln(a.nom);
  writeln('Ingrese el ano de nacimiento');
  readln(a.anio);
end;
procedure cargarVector(var v:vector;i:integer);
var a:alumno;
begin
    leerAlu(a);
    v[i]:=a;
end;
function soloDigitosPares(dni:integer):boolean;
var dig,pares,cant:integer;
begin
  cant:=0;pares:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    cant:=cant+1;
    if((dig mod 2)=0)then
      pares:=pares+1;
    dni:=dni div 10;
  end;
  soloDigitosPares:=(cant=pares);
end;
procedure dosMayorEdad(var ape1,ape2,nom1,nom2:cadena;var min1,min2:integer;ape:cadena;nom:cadena;anio:integer);
begin
  if(anio<min1)then begin
    min2:=min1;
    min1:=anio;
    ape2:=ape1;
    ape1:=ape;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(anio<min2)then begin
         min2:=anio;
         ape2:=ape;
         nom2:=nom;
  end;
end;
var
  v:vector;
  contador,i,min1,min2:integer;
  porcentaje:real;
  ape1,ape2,nom1,nom2:cadena;
begin
  contador:=0;
  min1:=9999;ape1:='';nom1:='';
  for i:=1 to ING do begin
    cargarVector(v,i);
    dosMayorEdad(ape1,ape2,nom1,nom2,min1,min2,v[i].ape,v[i].nom,v[i].anio);
    if(soloDigitosPares(v[i].dni))then
      contador:=contador+1;
  end;
  porcentaje:=contador*100/ING;
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares',porcentaje:2:2);
  writeln('Apellido y nombre de los dos alumnos de mayor edad ',ape1,nom1,' y ',ape2,nom2);
end.
{
9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}
program aLoSumoCuatrocientos;
const 
  ING=3;//400
type
  cadena=string[30];
  alumno=record
    num:integer;
    dni:integer;
    ape:cadena;
    nom:cadena;
    anio:integer;
  end;
  vector=array[1..ING]of alumno;
  
procedure leerAlu(var a:alumno);
begin
  writeln('Ingrese el dni');
  readln(a.dni);
  if(a.dni<>-1)then begin
   writeln('Ingrese el numero de inscripcion');
   readln(a.num);
   writeln('Ingrese el apellido');
   readln(a.ape);
   writeln('Ingrese el nombre');
   readln(a.nom);
   writeln('Ingrese el ano de nacimiento');
   readln(a.anio);
  end;
end;
procedure cargarVector(var v:vector;var dimL:integer);
var a:alumno;
begin
  leerAlu(a);
  while(a.dni<>-1)and(dimL<ING)do begin
    dimL:=dimL+1;
    v[dimL]:=a;
    leerAlu(a);
  end;
end;
function soloDigitosPares(dni:integer):boolean;
var dig,pares,cant:integer;
begin
  cant:=0;pares:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    cant:=cant+1;
    if((dig mod 2)=0)then
      pares:=pares+1;
    dni:=dni div 10;
  end;
  soloDigitosPares:=(cant=pares);
end;
procedure dosMayorEdad(var ape1,ape2,nom1,nom2:cadena;var min1,min2:integer;ape:cadena;nom:cadena;anio:integer);
begin
  if(anio<min1)then begin
    min2:=min1;
    min1:=anio;
    ape2:=ape1;
    ape1:=ape;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(anio<min2)then begin
         min2:=anio;
         ape2:=ape;
         nom2:=nom;
  end;
end;
var
  v:vector;
  contador,dimL,min1,min2,i:integer;
  porcentaje:real;
  ape1,ape2,nom1,nom2:cadena;
begin
  dimL:=0;
  contador:=0;
  min1:=9999;ape1:='';nom1:='';
  cargarVector(v,dimL);
  for i:=1 to dimL do begin
    dosMayorEdad(ape1,ape2,nom1,nom2,min1,min2,v[i].ape,v[i].nom,v[i].anio);
    if(soloDigitosPares(v[i].dni))then
      contador:=contador+1;
  end;
  porcentaje:=contador*100/ING;
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares',porcentaje:2:2);
  writeln('Apellido y nombre de los dos alumnos de mayor edad ',ape1,nom1,' y ',ape2,nom2);
end.
{
10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
}                      
program Hello;
const dimF=300;
type rango=1..dimF;
vector=array[rango]of real;
procedure cargarSalario(var v:vector; var dimL:integer);
var salario:real;
begin
  write('Ingrese el salario:');
  readln(salario);
  while(salario<>0)and(dimL<dimF)do begin
    dimL:=dimL+1;
    v[dimL]:=salario;
    write('Ingrese el salario:');
    readln(salario);
  end;
end;
procedure incrementar(x:real;var v:vector;dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do
    v[i]:=v[i]+(v[i]*x);
end;
procedure promedio(v:vector;dimL:integer);
var i:integer;
    suma:real;
begin
  suma:=0;
  for i:=1 to dimL do
    suma:=suma+v[i];
  writeln('El sueldo promedio es:',(suma/dimL):2:2);
end;
var v:vector;
    dimL,x:integer;
begin
  dimL:=0;
  cargarSalario(v,dimL);
  writeln('Ingrese cuanto % quiere aumentar los salarios');
  readln(x);
  incrementar(x,v,dimL);
  promedio(v,dimL);
end.
{
11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}
program ArgenPics;
const
  FOTO=5;  //200
type
  cadena=string[30];
  facebook=record
    titulo:cadena;
    autor:cadena;
    cantMeGusta:integer;
    cantClic:integer;
    cantComent:integer;
  end;
  vector=array[1..FOTO]of facebook;
  
procedure leer(var f:facebook);
begin
  writeln('Titulo de la foto');
  readln(f.titulo);
  writeln('Autor de la foto');
  readln(f.autor);
  writeln('Cantidad de me gusta');
  readln(f.cantMeGusta);
  writeln('Cantidad de clics');
  readln(f.cantClic);
  writeln('Cantidad de comentarios');
  readln(f.cantComent);
end;
procedure cargar(var v:vector;i:integer);
var f:facebook;
begin
    leer(f);
    v[i]:=f;
end;
procedure incisoA(var maxTitulo:cadena;titulo:cadena;var max:integer;cantClic:integer);
begin
  if(cantClic>max)then begin
    max:=cantClic;
    maxTitulo:=titulo;
  end;
end;
procedure incisoB(autor:cadena;cantMeGusta:integer;var cantTotal:integer);
begin
  if(autor='Art Vandelay')then
    cantTotal:=cantTotal+cantMeGusta;
end;
var
  v:vector;
  max,i,cantTotal:integer;
  maxTitulo:cadena;
begin
  max:=-1;
  for i:=1 to FOTO do begin
    cargar(v,i);
    incisoA(maxTitulo,v[i].titulo,max,v[i].cantClic);
    incisoB(v[i].autor,v[i].cantMeGusta,cantTotal);
    writeln('Foto:',v[i].titulo,'Cantidad de comentarios:',v[i].cantComent);
  end;
  writeln('Título de la foto más vista (la que posee mayor cantidad de clics)',maxTitulo);
  writeln('Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”',cantTotal);
end.
{
12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}
program astrofisica;
const
  GA=4;//53
type
  rango=1..4;
  cadena=string[30];
  galaxia=record
    nombre:cadena;
    tipo:rango;
    masa:real;
    distancia:real;
  end;
  vector=array[1..GA]of galaxia;
  vContador=array[rango]of integer;
  
procedure leer(var g:galaxia);
begin
  writeln('Ingrese el nombre de la galaxia');
  readln(g.nombre);
  writeln('Ingrese el tipo');
  readln(g.tipo);
  writeln('Ingrese la masa');
  readln(g.masa);
  writeln('Ingrese la distancia');
  readln(g.distancia);
end;
procedure cargar(var v:vector;i:integer);
var g:galaxia;
begin
  leer(g);
  v[i]:=g;
end;
procedure inicializar(var vc:vContador);
var i:rango;
begin
  for i:=1 to 4 do
    vc[i]:=0;
end;
procedure cargarTipo(var vc:vContador;tipo:rango);
begin
  vc[tipo]:=vc[tipo]+1;
end;
procedure informarTipo(vc:vContador);
var i:rango;
begin
  for i:=1 to 4 do 
    writeln('Tipo: ',i,' cantidad de galaxias:',vc[i]);
end;
function tresGalaxias(nombre:cadena):boolean;
begin
  tresGalaxias:=(nombre='Via Lactea')or(nombre='Andromeda')or(nombre='Triangulo');
end;
function noIrregular(tipo:rango;distancia:real):boolean;
begin
  noIrregular:=(tipo=4)and(distancia<1000);
end;
procedure maximos(var max1,max2:real;var maxNom1,maxNom2:cadena;masa:real;nombre:cadena);
begin
  if(masa>max1)then begin
    max2:=max1;
    max1:=masa;
    maxNom2:=maxNom1;
    maxNom1:=nombre;
  end
  else if(masa>max2)then begin
         max2:=masa;
         maxNom2:=nombre;
  end;
end;
procedure minimos(var min1,min2:real;var minNom1,minNom2:cadena;masa:real;nombre:cadena);
begin
  if(masa<min1)then begin
    min2:=min1;
    min1:=masa;
    minNom2:=minNom1;
    minNom1:=nombre;
  end
  else if(masa<min2)then begin
         min2:=masa;
         minNom2:=nombre;
  end;
end;
var
  v:vector;vc:vContador;
  i,cantNoIrreg:integer;
  masa3,masaTotal,porcentaje,max1,max2,min1,min2:real;
  maxNom1,maxNom2,minNom1,minNom2:cadena;
begin
  max1:=-1;min1:=9999;maxNom1:='';minNom1:='';
  cantNoIrreg:=0;masaTotal:=0;
  inicializar(vc);
  for i:=1 to GA do begin
    cargar(v,i);
    cargarTipo(vc,v[i].tipo);
    masaTotal:=masaTotal+v[i].masa;
    if(tresGalaxias(v[i].nombre))then
      masa3:=masa3+v[i].masa;
    if(noIrregular(v[i].tipo,v[i].distancia))then
      cantNoIrreg:=cantNoIrreg+1;
    maximos(max1,max2,maxNom1,maxNom2,v[i].masa,v[i].nombre);
    minimos(min1,min2,minNom1,minNom2,v[i].masa,v[i].nombre);
  end;
  porcentaje:=masa3*100/masaTotal;
  informarTipo(vc);
  writeln('La masa total acumulada de las 3 galaxias principales',masa3:2:2);
  writeln('Porcentaje de las 3 galaxias respecto a la masa de todas las galaxias',porcentaje:2:2);
  writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc',cantNoIrreg);
  writeln('Nombre de las dos galaxias con mayor masa',maxNom1,' y ',maxNom2);
  writeln('Las dos galaxias con menor masa',minNom1,' y ',minNom2);
end.
{
13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}
program GIE;
const
  LUGAR= 100;
  anioI= 1972;
  anioF= 2022;
type
 
  vector= array[1..100]of real;  {temperatura de cada anio}
  anios= array[1972..2022]of vector; {NICO: Para que concuerde con el indice del FOR}

procedure cargar(var v:vector;anio,punto:integer);
var temperatura:real;aux:real;
begin
  writeln('Ingrese la temperatura promedio anual');
  readln(temperatura);
  aux:=v[anio];
  aux[punto]:= temperatura;  
end;
procedure maximo(promedio:real;var max:real;var anioMax:integer;anio:integer);
begin
  if(promedio>max)then begin
    max:= promedio;
    anioMax:= anio;
  end;
end;
procedure mayor(temp:real;var maxTemp:real;anio:integer;var anioMayor:integer);
begin
  if(temp>maxTemp)then begin
    maxTemp:= temp;
    anioMayor:= anio;
  end;
end;
var
  v:anios; {NICO: anios contiene vectores}
  anio,punto,anioMayor,anioMax:integer;
  temp,max,promedio,maxTemp:real;
begin
  maxTemp:= -1;max:= -1;
  anioMayor:= 0;anioMax:= 0;
  cargar(v,anio,punto);
  for anio:= anioI to anioF do begin {NICO: Primero almacenar, y luego procesar}
    temp:= 0;
    for punto:= 1 to LUGAR do begin
      temp:= temp+v[anio][punto]; {NICO: Con anio actual}
      mayor(v[anio][punto],maxTemp,anio,anioMayor); 
    end;
    promedio:= temp/LUGAR;
    maximo(promedio,max,anioMax,anio);
  end;
  
  writeln('El año con mayor temperatura promedio a nivel mundial',anioMax);
  writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años',anioMayor);
end.
{
14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.
}
program GitHub;
const
  PRO=3; //1000 proyectos
type
  rangoRol=1..5;
  cadena=string[60];
  tabla=record         //se dispone
    codigo:integer;
    rol:cadena;
    valor:real;
  end;
  vtabla=array[rangoRol]of tabla; //se dispone
  participante=record
    pais:cadena;
    codProy:integer;
    nomProy:cadena;
    rol:rangoRol;
    cantHoras:real;
  end;
  vcont=array[1..PRO]of integer;
  
procedure tablaCargarDatos(var v:vtabla); //se dispone,pero para probar
begin
  v[1].codigo:=1;
  v[1].rol:='Analista Funcional';
  v[1].valor:=35.20;
  v[2].codigo:=2;
  v[2].rol:='Programador';
  v[2].valor:=27.45;
  v[3].codigo:=3;
  v[3].rol:='Administrador de bases de datos';
  v[3].valor:=31.03;
  v[4].codigo:=4;
  v[4].rol:='Arquitecto de software';
  v[4].valor:=44.28;
  v[5].codigo:=5;
  v[5].rol:='Administrador de redes y seguridad';
  v[5].valor:=39.87;
end;
procedure imprimirTabla(v:vtabla);  //para probar
var i:rangoRol;
begin
  for i:=1 to 5 do
    writeln(v[i].codigo,' : ',v[i].rol,' ',v[i].valor:2:2);
end;
procedure leer(var p:participante);
begin
  writeln('Ingrese el codigo de proyecto');
  readln(p.codProy);
  if(p.codProy<>-1)then begin
    writeln('Ingrese el pais de residencia');
    readln(p.pais);
    writeln('Ingrese el nombre del proyecto');
    readln(p.nomProy);
    writeln('Ingrese el rol del desarrollador');
    readln(p.rol); 
    writeln('Ingrese la cantidad de horas trabajadas');
    readln(p.cantHoras);
  end;
end;
function procesar(cantHoras:real;rol:rangoRol;v:vtabla):real;
begin
  procesar:=cantHoras*v[rol].valor;
end;
procedure minimo(monto:real;var min:real;var codMin:integer;codP:integer);
begin
  if(monto<min)then begin
    min:=monto;
    codMin:=codP;
  end;
end;
procedure inicializar(var vc:vcont);
var i:integer;
begin
  for i:=1 to PRO do
    vc[i]:=0;
end;
procedure arquiSoft(var vc:vcont;codigo:integer);
begin
  vc[codigo]:=vc[codigo]+1;
end;
procedure informar(vc:vcont);
var i:integer;
begin
  for i:=1 to PRO do
    writeln('Proyecto:',i,' Cantidad de Arquitectos de software:',vc[i]);
end;
var  
  v:vtabla;vc:vcont;
  p:participante;
  montoTotal,cantTotalHoras,min,monto:real;
  codMin:integer;
begin
  min:=9999;codMin:=0;
  montoTotal:=0;cantTotalHoras:=0;
  inicializar(vc);
  tablaCargarDatos(v); //se dispone
  imprimirTabla(v);    //prueba
  leer(p);
  while(p.codProy<>-1)do begin
    monto:=procesar(p.cantHoras,p.rol,v);
    if(p.pais='Argentina')then 
      montoTotal:=montoTotal+monto;
    if(p.rol=3)then                    //3:Administradores de bases de datos
      cantTotalHoras:=cantTotalHoras+p.cantHoras;
    minimo(monto,min,codMin,p.codProy);
    if(p.rol=4)then                    //4:Arquitectos de software
      arquiSoft(vc,p.codProy);
    leer(p);
  end;
  writeln('El monto total invertido en desarrolladores con residencia en Argentina',montoTotal:2:2);
  writeln('La cantidad total de horas trabajadas por Administradores de bases de datos',cantTotalHoras:2:2);
  writeln('El código del proyecto con menor monto invertido',codMin);
  informar(vc);
end.

