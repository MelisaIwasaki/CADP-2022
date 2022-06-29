{
1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}
program casting; 
const
  tipo=5;
  corte=335;//55444;
type
  cadena=string[60];
  rango=1..tipo;
  actores=record
    dni:integer;
    apeYnom:cadena;
    edad:integer;
    genero:rango;
  end;
  lista=^nodo;
  nodo=record
    dato:actores;
    sig:lista;
  end;
  vcont=array[rango ]of integer;
  
procedure leer(var a:actores);
begin
  writeln('Ingrese el dni');
  readln(a.dni);
  writeln('Ingrese el apellido y nombre');
  readln(a.apeYnom);
  writeln('Ingrese la edad');
  readln(a.edad);
  writeln('Ingrese el genero');
  readln(a.genero);
end;
procedure agregarAdelante(var L:lista;a:actores);
var nue:lista;
begin
  new(nue);
  nue^.dato:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var a:actores;
begin
  repeat
    leer(a);
    agregarAdelante(L,a);
  until(a.dni=corte);
end;
function masPares(dni:integer):boolean;
var dig,par,impar:integer;
begin
  par:=0;impar:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    if(dig mod 2= 0)then  par:=par+1
                    else  impar:=impar+1;
    dni:=dni div 10;
  end;
  if(par>impar)then
    masPares:=true
  else
    masPares:=false;
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:=1 to tipo do
    v[i]:=0;
end;
procedure maximo(var max1,max2:integer;var cod1,cod2:rango;v:vcont);
var i:rango;
begin
  for i:=1 to tipo do 
    if(v[i]>max1)then begin
      max2:=max1;
      max1:=v[i];
      cod2:=cod1;
      cod1:=i;
    end
    else if(v[i]>max2)then begin
           max2:=v[i];
           cod2:=i;
    end;
end;
procedure recorrerLista(L:lista);
var cant,max1,max2:integer;
    cod1,cod2:rango;
    v:vcont;
begin
  cant:=0;
  max1:=-1;
  inicializar(v);
  while(L<>nil)do begin
    if(masPares(L^.dato.dni))then
      cant:=cant+1;
    v[L^.dato.genero]:=v[L^.dato.genero]+1;
  
    L:=L^.sig;
  end;
  maximo(max1,max2,cod1,cod2,v);
  writeln('Los dos códigos de género más elegidos:',cod1,' y ',cod2);
  writeln('Cantidad de personas cuyo DNI contiene más dígitos pares que impares:',cant);
end;
procedure eliminarDNI(var L:lista; dni:integer; var exito:boolean);
var  ant,act:lista;
begin
     exito:= false;
     act:= L;
     while(act <> nil)and(act^.dato.dni <> dni )do begin
          ant:= act;
          act:= act^.sig;
     end;
     if(act <> nil)then begin
          exito:= true;
          if(act = L)then   L:= act^.sig
                     else   ant^.sig:= act^.sig;
          dispose(act);
     end;
end;          
procedure mostrar(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.dato.dni,' ',L^.dato.apeYnom,' ',L^.dato.edad,' ',L^.dato.genero);
    L:=L^.sig;
  end;
end;
var
  L:lista;
  dni:integer;
  ok:boolean;
begin
  L:=nil;
  cargarLista(L);
  mostrar(L);   //prueba
  recorrerLista(L);
  writeln('Ingrese el DNI a eliminar');
  readln(dni);
  eliminarDNI(L,dni,ok);
  mostrar(L);   //prueba
end.
{
2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
}  
program automotriz;
const
  poliza=6;
type
  rango=1..poliza;
  cadena=string[30];
  cliente=record
    codigo:integer;
    dni:integer;
    apellido:cadena;
    nombre:cadena;
    codPol:rango;
    monto:real;
  end;
  lista=^nodo;
  nodo=record
    dato:cliente;
    sig:lista;
  end;
  tabla=array[rango]of real;//se dispone

procedure montoAdicional(var v:tabla); //se dispone, lo cargue para probar
begin
  v[1]:=100;
  v[2]:=200;
  v[3]:=300;
  v[4]:=400;
  v[5]:=500;
  v[6]:=600;
end;
procedure leer(var c:cliente);
begin
  writeln('Ingrese el codigo');
  readln(c.codigo);
  writeln('Ingrese el dni');
  readln(c.dni);
  writeln('Ingrese el apellido');
  readln(c.apellido);
  writeln('Ingrese el nombre');
  readln(c.nombre);
  writeln('Ingrese el codigo de poliza');
  readln(c.codPol);
  writeln('Ingrese el monto');
  readln(c.monto);
end;
procedure agregarAdelante(var L:lista;c:cliente);
var nue:lista;
begin
  new(nue);
  nue^.dato:=c;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargar(var L:lista);
var c:cliente;
begin
  repeat
    leer(c);
    agregarAdelante(L,c);
  until(c.codigo=1122);
end;
procedure informar(L:lista;v:tabla);
var  completo:real;
begin
    completo:=L^.dato.monto+v[L^.dato.codPol];
    writeln('DNI:',L^.dato.dni,'Apellido:',L^.dato.apellido,'Nombre:',L^.dato.nombre);
    writeln('Monto completo:',completo:2:2);
end;
function dosDigNueve(dni:integer):boolean;
var dig,nueve:integer;
begin
  nueve:=0;
  while(dni<>0)and(nueve<2)do begin
    dig:=dni mod 10;
    if(dig=9)then nueve:=nueve+1;
    dni:=dni div 10;
  end;
  if(nueve>=2)then
    dosDigNueve:=true
  else
    dosDigNueve:=false;
end;
procedure recorrer(L:lista);
var v:tabla;
begin
  montoAdicional(v);
  while(L<>nil)do begin
    informar(L,v);
    if(dosDigNueve(L^.dato.dni))then
      writeln('Apellido y nombre de clientes cuyo DNI contiene al menos dos dígitos 9:',L^.dato.apellido,' ',L^.dato.nombre);
    L:=L^.sig;
  end;
end;
procedure eliminar(var L:lista);
var ant,act:lista;codigo:integer;
begin
  writeln('Ingrese un codigo a eliminar');
  readln(codigo);
  act:=L;
  while(act<>nil)and(act^.dato.codigo<>codigo)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    if(act=L)then  L:=L^.sig
    else   ant^.sig:=act^.sig;
    dispose(act);
    writeln('El valor se elimino de la lista');
  end;
end;
procedure mostrar(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.dato.codigo,' ',L^.dato.apellido,' ',L^.dato.codPol,' ',L^.dato.monto);
    L:=L^.sig;
  end;
end;
var
  L:lista;
begin
  L:=nil;
  cargar(L);
  mostrar(L);  //para probar si se cargo
  recorrer(L);
  eliminar(L);
  mostrar(L);  //para probar si se borro
end.
{
3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.
}
program remiseria;
type
  cadena=string[30];
  viaje=record
    numero:integer;
    codigo:integer;
    origen:cadena;
    destino:cadena;
    km:real;
  end;
  lista=^nodo;  //se dispone la lista de viaje
  nodo=record
    dato:viaje;
    sig:lista;
  end;

procedure leer(var v:viaje); //se dispone,para probar
begin
  writeln('Ingrese numero de viaje');
  readln(v.numero);
  writeln('Ingrese codigo de auto');
  readln(v.codigo);
  writeln('Ingrese la direccion de origen');
  readln(v.origen);
  writeln('Ingrese la direccion de destino');
  readln(v.destino);
  writeln('Ingrese el km recorrido');
  readln(v.km);
end;
procedure insertarOrdenado(var L:lista;v:viaje);
var ant,act,nue:lista;
begin
  new(nue);
  nue^.dato:=v;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.numero<v.numero)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then L:=nue
    else ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure cargarLista(var L:lista);  //se dispone,para probar
var v:viaje;
begin
  repeat
    leer(v);
    insertarOrdenado(L,v);
  until(v.numero=1122);
end;
procedure maximos(var max1,max2:real;var cod1,cod2:integer;km:real;codigo:integer);
begin
  if(km>max1)then begin
    max2:=max1;
    max1:=km;
    cod2:=cod1;
    cod1:=codigo;
  end
  else if(km>max2)then begin
         max2:=km;
         cod2:=codigo;
  end;
end;

procedure recorrer(L:lista;var nueva:lista);
var codActual,cod1,cod2:integer;
    kmTotal,max1,max2:real;
begin
  max1:=-1;cod1:=0;
  while(L<>nil)do begin
    kmTotal:=0;
    codActual:=L^.dato.codigo;
    while(L<>nil)and(codActual=L^.dato.codigo)do begin
      kmTotal:=kmTotal+L^.dato.km;
      if(L^.dato.km>5)then
        insertarOrdenado(nueva,L^.dato);
      L:=L^.sig;
    end;
    maximos(max1,max2,cod1,cod2,kmTotal,codActual);
  end;
  writeln('Los dos códigos de auto que más kilómetros recorrieron ',cod1,' y ',cod2);
end;
procedure mostrarNuevaLista(L:lista);
begin
  writeln('Lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.');
  while(L<>nil)do begin
    writeln(L^.dato.numero,' ',L^.dato.origen,' a ',L^.dato.destino,' km recorridos:',L^.dato.km:2:2);
    L:=L^.sig;
  end;
end;
var
  L:lista;
  nueva:lista;
begin
  L:=nil; //se dispone
  cargarLista(L);  //se dispone
  recorrer(L,nueva);
  mostrarNuevaLista(nueva);
end.
{
4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}
program maternidad;
const
  sem=42;
type
  cadena=string[30];
  vector=array[1..sem]of real;
  paciente=record    //se dispone informacion sobre sus pacientes
    nombre:cadena;
    apellido:cadena;
    peso:vector;
    dimL:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:paciente;
    sig:lista;
  end;
  
procedure LeerVector(var v:vector;dimL:integer); //se dispone
var i:integer;
begin
  writeln('Ingrese el peso');
  for i:=1 to dimL do begin
    writeln('Peso de la semana:',i,':');
    readln(v[i]);
  end;
end;
procedure leer(var p:paciente); //se dispone,para probar
begin
  writeln('Ingrese el nombre');
  readln(p.nombre);
  writeln('Ingrese el apellido');
  readln(p.apellido);
  writeln('Ingrese dias de semanas registrados');
  readln(p.dimL);
  LeerVector(p.peso,p.dimL);
end;
procedure agregarAdelante(var L:lista;p:paciente); //se dispone
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);  //se dispone
var p:paciente;
begin
  repeat
    leer(p);
    agregarAdelante(L,p);
  until(p.nombre='Fulano');
end;
procedure maximo(var max:real;var maxSem:integer;v:vector;dimL:integer;var pesoTotal:real);
var i:integer;
begin
  max:=-1;
  pesoTotal:=0;
  for i:=1 to dimL do begin
    if(v[i]>max)then begin
      max:=v[i];
      maxSem:=i;
    end;
    pesoTotal:=pesoTotal+v[i];
  end;
end;
procedure recorrer(L:lista);
var max,pesoTotal:real;
    maxSem:integer;
begin
  while(L<>nil)do begin
    maximo(max,maxSem,L^.dato.peso,L^.dato.dimL,pesoTotal);
    writeln('Paciente:',L^.dato.nombre,' ',L^.dato.apellido);
    writeln('Semana con mayor aumento de peso:',maxSem);
    writeln('Peso total:',pesoTotal:2:2);
    L:=L^.sig;
  end;
end;
var 
  L:lista;
begin
  L:=nil; //se dispone
  cargarLista(L);  //se dispone, se carga la lista y el vector de peso.
  recorrer(L);
end.
{
5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.
}
program flota;
const
  dimF=3;//100;
type
  rango=1..dimF;
  cadena=string[30];
  camion=record
    patente:cadena;
    anioFab:integer;
    capacidad:real;
  end;
  camiones=array[rango]of camion; //se dispone
  viaje=record
    codViaje:integer;
    codCamion:rango;
    distancia:real;
    ciudad:cadena;
    anio:integer;
    dni:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:viaje;
    sig:lista;
  end;

procedure cargarVector(var v:camiones); //se dispone,no necesita cargar,solo para probar
begin
  v[1].patente:='AF200';
  v[1].anioFab:=1900;
  v[1].capacidad:=30;
  v[2].patente:='AR500';
  v[2].anioFab:=2022;
  v[2].capacidad:=40;
  v[3].patente:='GT100';
  v[3].anioFab:=2010;
  v[3].capacidad:=50;
end;
procedure leer(var v:viaje);
begin
  writeln('Ingrese el codigo de viaje');
  readln(v.codViaje);
  if(v.codViaje<>-1)then begin
    writeln('Ingrese el codigo de camion');
    readln(v.codCamion);
    writeln('Ingrese la distancia recorrida');
    readln(v.distancia);
    writeln('Ciudad de destino');
    readln(v.ciudad);
    writeln('Anio en que se realizo el viaje');
    readln(v.anio);
    writeln('DNI del chofer');
    readln(v.dni);
  end;
end;
procedure agregarAdelante(var L:lista;v:viaje);
var nue:lista;
begin
  new(nue);
  nue^.dato:=v;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarViaje(var L:lista);
var v:viaje;
begin
  leer(v);
  while(v.codViaje<>-1)do begin
    agregarAdelante(L,v);
    leer(v);
  end;
end;
procedure maximoKm(var max:real;var patenteMax:cadena;km:real;patente:cadena);
begin
  if(km>max)then begin
    max:=km;
    patenteMax:=patente;
  end;
end;
procedure minimoKm(var min:real;var patenteMin:cadena;km:real;patente:cadena);
begin
  if(km<min)then begin
    min:=km;
    patenteMin:=patente;
  end;
end;
function condicion(capacidad:real;anio:integer):boolean;
begin
  condicion:=(capacidad>30.5)and(anio>5);
end;
function soloDigImpares(dni:integer):boolean;
var dig,cant,impar:integer;
begin
  cant:=0;impar:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    cant:=cant+1;
    if(dig mod 2 =1)then
      impar:=impar+1;
    dni:=dni div 10;
  end;
  if(cant=impar)then
    soloDigImpares:=true
  else
    soloDigImpares:=false;
end;
procedure recorrerViaje(L:lista);
var
    patente,patenteMax,patenteMin:cadena;
    v:camiones;
    max,min:real;
    cant:integer;
begin
  cant:=0;
  max:=-1;min:=9999;
  cargarVector(v);
  while(L<>nil)do begin
    patente:=v[L^.dato.codCamion].patente;
    maximoKm(max,patenteMax,L^.dato.distancia,patente);
    minimoKm(min,patenteMin,L^.dato.distancia,patente);
    if(condicion(v[L^.dato.codCamion].capacidad,2022-L^.dato.anio))then
      cant:=cant+1;
    if(soloDigImpares(L^.dato.dni))then
      writeln('Los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares',L^.dato.codViaje);
    L:=L^.sig;
  end;
  writeln('La patente del camión que más kilómetros recorridos posee',patenteMax);
  writeln('La patente del camión que menos kilómetros recorridos posee',patenteMin);
  writeln('La cantidad de viajes con capacidad mayor a 30,5 y antigüedad mayor a 5 años:',cant);
end;
var
  L:lista;
begin
  L:=nil;
  cargarViaje(L);
  recorrerViaje(L);
end.

{
6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.
}
program astronomicos;
const
  obj=7;
type
  cadena=string[30];
  rango=1..obj;
  objeto=record
    codigo:integer;
    categoria:rango;
    nombre:cadena;
    distancia:real;
    descubridor:cadena;
    anio:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:objeto;
    sig:lista;
  end;
  vcont=array[rango]of integer;
  
procedure leer(var o:objeto);
begin
  writeln('Ingrese el codigo');
  readln(o.codigo);
  if(o.codigo<>-1)then begin
    writeln('Ingrese la categoria[1-7]');
    readln(o.categoria);
    writeln('Ingrese el nombre');
    readln(o.nombre);
    writeln('Ingrese la distancia');
    readln(o.distancia);
    writeln('Nombre del descubridor');
    readln(o.descubridor);
    writeln('Anio de descubrimiento');
    readln(o.anio);
  end;
end;
procedure agregarAtras(var L,ult:lista;o:objeto);
var nue:lista;
begin
  new(nue);
  nue^.dato:=o;
  nue^.sig:=nil;
  if(L=nil)then  L:=nue
    else  ult^.sig:=nue;
  ult:=nue;
end;
procedure cargarObjeto(var L:lista);
var o:objeto;ult:lista;
begin
  leer(o);
  while(o.codigo<>-1)do begin
    agregarAtras(L,ult,o);
    leer(o);
  end;
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:=1 to obj do
    v[i]:=0;
end; 
procedure masLejano(var max1,max2:real;var cod1,cod2:integer;distancia:real;codigo:integer);
begin
  if(distancia>max1)then begin
    max2:=max1;
    max1:=distancia;
    cod2:=cod1;
    cod1:=codigo;
  end
  else if(distancia>max2)then begin
         max2:=distancia;
         cod2:=codigo;
  end;
end;
function galileo(descubridor:cadena;anio:integer):boolean;
begin
  galileo:=(descubridor='Galileo Galilei')and(anio<1600);
end;
procedure mostrarVector(v:vcont);
var i:rango;
begin
  for i:=1 to obj do
    writeln('Categoria: ',i,' objetos observados: ',v[i]);
end;
function masPares(codigo:integer):boolean;
var dig,pares,impares:integer;
begin
  pares:=0;impares:=0;
  while(codigo<>0)do begin
    dig:=codigo mod 10;
    if(dig mod 2 = 0 )then  pares:=pares+1
                      else impares:=impares+1;
    codigo:=codigo div 10;
  end;
  if(pares>impares)then
    masPares:=true
  else
    masPares:=false;
end;
procedure recorrerObjeto(L:lista);
var v:vcont;
    max1,max2:real;
    cod1,cod2,cant:integer;
begin
  cant:=0;
  max1:=-1;cod1:=0;
  inicializar(v);
  while(L<>nil)do begin
    masLejano(max1,max2,cod1,cod2,L^.dato.distancia,L^.dato.codigo);
    if(L^.dato.categoria=2)and(galileo(L^.dato.descubridor,L^.dato.anio))then
      cant:=cant+1;
    v[L^.dato.categoria]:=v[L^.dato.categoria]+1;
    if(L^.dato.categoria=1)and(masPares(L^.dato.codigo))then
      writeln('Nombre de las estrellas con codigo mas par: ',L^.dato.nombre);
    L:=L^.sig;
  end;
  writeln('Los códigos de los dos objetos más lejanos de la tierra ',cod1,' y ',cod2);
  writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 ',cant);
  mostrarVector(v);
end;
var  
  L:lista;
begin
  L:=nil;
  cargarObjeto(L);
  recorrerObjeto(L);
end.
{
7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.
}
program APU;
const
  dimF=3;//24;
type
  rango=1..dimF;
  cadena=string[30];
  materias=array[rango]of real;
  alumno=record
    numero:integer;
    apellido:cadena;
    nombre:cadena;
    email:cadena;
    anioIngreso:integer;
    anioEgreso:integer;
    notas:materias;
  end;
  lista=^nodo;
  nodo=record
    dato:alumno;
    sig:lista;
  end;
  dosAlumnos=record
    apellido:cadena;
    nombre:cadena;
    email:cadena;
  end;
  
Procedure OrdenarNotas(var v:materias);
var i, j, p:integer;item:real;	
begin
  for i:=1 to dimF-1 do begin 
    p := i;
    for j := i+1 to dimF do
      if v[ j ] > v[ p ] then p:=j;
    item := v[ p ];   
    v[ p ] := v[ i ];   
    v[ i ] := item;
  end;
end;
procedure cargarNotas(var v:materias);
var i:rango;
begin
  for i:=1 to dimF do begin
    writeln('Ingrese la nota:',i);
    readln(v[i]);
  end;
  OrdenarNotas(v);
end;

procedure leerAlumno(var a:alumno);
begin
  writeln('Ingrese el numero');
  readln(a.numero);
  if(a.numero<>-1)then begin
    writeln('Ingrese el apellido');
    readln(a.apellido);
    writeln('Ingrese el nombre');
    readln(a.nombre);
    writeln('Ingrese email');
    readln(a.email);
    writeln('Anio de ingreso');
    readln(a.anioIngreso);
    writeln('Anio de egreso');
    readln(a.anioEgreso);
    writeln('Ingrese las notas');
    cargarNotas(a.notas);
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
procedure cargarAlumno(var L:lista);
var a:alumno;
begin
  leerAlumno(a);
  while(a.numero<>-1)do begin
    agregarAdelante(L,a);
    leerAlumno(a);
  end;
end;
function promedio(v:materias):real;
var i:rango;
    suma:real;
begin
  suma:=0;
  for i:=1 to dimF do
    suma:=suma+v[i];
  promedio:=suma/dimF;
end;
function digImpares(num:integer):boolean;
var dig,impares,cant:integer;
begin
  cant:=0;
  impares:=0;
  while(num<>0)do begin
    dig:=num mod 10;
    cant:=cant+1;
    if(dig mod 2 = 1)then  impares:=impares+1;
    num:=num div 10;
  end;
  if(cant=impares)then
    digImpares:=true
  else
    digImpares:=false;
end;
procedure inicializarAlu(var alu1:dosAlumnos);
begin
  alu1.apellido:='';
  alu1.nombre:='';
  alu1.email:='';
end;
procedure masRapidoRecibido(var min1,min2:integer;var alu1,alu2:dosAlumnos;anioRec:integer;a:alumno); 
begin
  if(anioRec<min1)then begin       //use un registro con los 3 campos
    min2:=min1;
    min1:=anioRec;
    alu2:=alu1;
    alu1.apellido:=a.apellido;
    alu1.nombre:=a.nombre;
    alu1.email:=a.email;
  end
  else if(anioRec<min2)then begin
         min2:=anioRec;
         alu2.apellido:=a.apellido;
         alu2.nombre:=a.nombre;
         alu2.email:=a.email;
  end;
end;
procedure recorrerAlumno(L:lista);
var  prom:real;
     cant,min1,min2,anioRec:integer;
     alu1,alu2:dosAlumnos;
begin
  min1:=9999;
  cant:=0;
  inicializarAlu(alu1);
  while(L<>nil)do begin
    prom:=promedio(L^.dato.notas);
    writeln('Alumno:',L^.dato.apellido,' ',L^.dato.nombre,' Promedio de notas:',prom:2:2);
    if(L^.dato.anioIngreso=2012)and(digImpares(L^.dato.numero))then
      cant:=cant+1;
    anioRec:=L^.dato.anioEgreso-L^.dato.anioIngreso;
    masRapidoRecibido(min1,min2,alu1,alu2,anioRec,L^.dato);
    L:=L^.sig;
  end;
  writeln('La cantidad de alumnos ingresantes 2012 con nros impares:',cant);
  writeln('Los dos alumnos que mas rapido se recibieron:');
  writeln('Alumno 1:',alu1.apellido,' ',alu1.nombre,' ',alu1.email);
  writeln('Alumno 2:',alu2.apellido,' ',alu2.nombre,' ',alu2.email);
end;
procedure eliminar(var L:lista;var exito:boolean);
var  ant,act:lista;num:integer;
begin
    exito:= false;
    writeln('Ingrese el numero de alumno a borrar');
    readln(num);
    act:= L;
    while(act <> nil)and(act^.dato.numero <> num )do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil)then begin
        exito:= true;
        if(act = L)then   L:= act^.sig
                   else   ant^.sig:= act^.sig;
        dispose(act);
    end;
end;          
var 
  L:lista;
  ok:boolean;
begin
  L:=nil;
  cargarAlumno(L);
  recorrerAlumno(L);
  eliminar(L,ok);
  if(ok)then
    writeln('Se borro el alumno')
  else
    writeln('No se encontro el alumno');
end.
{
8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.
}
program banco;  //No esta probado, hay que cargar la lista para probar
const
  motivo=7;
type
  rango=1..motivo;
  rangoDia=1..31;
  rangoMes=1..12;
  rangoAnio=2000..2022;
  cadena=string[30];
  fechaF=record
    dia:rangoDia;
    mes:rangoMes;
    anio:rangoAnio;
  end;
  transferencia=record
    nroOrigen:integer;
    dniOrigen:integer;
    nroDestino:integer;
    dniDestino:integer;
    fecha:fechaF;
    hora:real;
    monto:real;
    codMotivo:rango;
  end;
  lista=^nodo;
  nodo=record
    dato:transferencia;  //se dispone
    sig:lista;
  end;
  vcont=array[rango ]of integer;
  
procedure insertarOrdenado(var L:lista;t:transferencia);
var  act,ant,nue:lista;
begin
    new(nue);
    nue^.dato:= t;
    ant:= L;
    act:= L;
    while (act <> nil)and(act^.dato.nroOrigen < t.nroOrigen)do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(ant = act)then L:= nue
                 else ant^.sig:= nue;
    nue^.sig:= act;
end;
function distintoTitular(dniO,dniD:integer):boolean;
begin
  distintoTitular:=(dniO <> dniD);
end;
procedure cargarLista2(L:lista;var L2:lista);
begin
  while(L<>nil)do begin
    if(distintoTitular(L^.dato.dniOrigen,L^.dato.dniDestino))then
      insertarOrdenado(L2,L^.dato);
    L:=L^.sig;
  end;
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:=1 to motivo do
    v[i]:=0;
end;
procedure masTranferencias(var max:integer;v:vcont);
var i:rango;
begin
  max:=-1;
  for i:=1 to motivo do
    if(v[i]>max)then
      max:=v[i];
end;
function menosPares(numero:integer):boolean;
var dig,pares,impares:integer;
begin
  pares:=0;
  impares:=0;
  while(numero<>0)do begin
    dig:=numero mod 10;
    if(dig mod 2 = 0)then  pares:=pares+1
                     else  impares:=impares+1;
    numero:=numero div 10;
  end;
  if(pares<impares)then
    menosPares:=true
  else
    menosPares:=false;
end;      
procedure recorrerLista2(L:lista);
var ctaActual,max,cant:integer;
    montoTotal:real;
    v:vcont;
begin
  cant:=0;
  inicializar(v);
  while(L<>nil)do begin
    ctaActual:=L^.dato.nroOrigen;
    montoTotal:=0;
    while(L<>nil)and(ctaActual=L^.dato.nroOrigen)do begin
      montoTotal:=montoTotal+L^.dato.monto;
      v[L^.dato.codMotivo]:=v[L^.dato.codMotivo]+1;
      if(L^.dato.fecha.mes=6)and(menosPares(L^.dato.nroDestino))then
        cant:=cant+1;
      L:=L^.sig;
    end;
    writeln('Cuenta de origen:',ctaActual,' monto total:',montoTotal:2:2);
  end;
  masTranferencias(max,v);
  writeln('Código de motivo que más transferencias a terceros tuvo:',max);
  writeln('Cantidad de trans en junio con nro cta destino con menos dig pares:',cant);
end;
var 
  L,L2:lista;
begin
  L:=nil;  //se dispone
  L2:=nil;
  cargarLista(L); //se dispone
  cargarLista2(L,L2);
  recorrerLista2(L2);
  writeln ('Hello World')
end.
{ 
9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).
}
program cine;
const
  dimF=8;
type
  cadena=string[30];
  rango=1..dimF;
  pelicula=record
    codigo:integer;
    titulo:cadena;
    genero:rango;
    puntaje:real;
  end;
  lista=^nodo;  //se dispone
  nodo=record
    dato:pelicula;
    sig:lista;
  end;
  critica=record
    dni:integer;
    ape:cadena;
    nom:cadena;
    cod:integer;
    punto:real;
  end;
  vcont=array[rango]of real;

procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:= 1 to dimF do
    v[i]:=0;
end;
procedure leerPeli(var p:pelicula); //se dispone
begin
  writeln('Ingrese el codigo');
  readln(p.codigo);
  writeln('Ingrese el titulo');
  readln(p.titulo);
  writeln('Ingrese el genero');
  readln(p.genero);
  writeln('Ingrese el puntaje');
  readln(p.puntaje);
end;
procedure agregarAdelante(var L:lista;p:pelicula); //se dispone
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarPeli(var L:lista);  //se dispone
var p:pelicula;
begin
  repeat
    leerPeli(p);
    agregarAdelante(L,p);
  until(p.codigo= 1122);
end;
procedure leerCritica(var c:critica);
begin
  writeln('Ingrese el dni');
  readln(c.dni);
  writeln('Ingrese el apellido');
  readln(c.ape);
  writeln('Ingrese el nombre');
  readln(c.nom);
  writeln('Ingrese el codigo');
  readln(c.cod);
  writeln('Ingrese el puntaje');
  readln(c.punto);
end;

function paresImpares(dni:integer):boolean;
var dig,par,impar:integer;
begin
  par:=0;impar:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    if(dig mod 2 = 0)then
      par:=par+1
    else
      impar:=impar+1;
    dni:=dni div 10;
  end;
  if(par=impar)then
    paresImpares:=true
  else
    paresImpares:=false;
end;
procedure actualizar(L:lista;var v:vcont);
var c:critica;
    codActual,total:integer;
    suma,promedio:real;
begin
  total:=0;
  leerCritica(c);
  while(c.cod<>-1)do begin
    codActual:=c.cod;
    suma:=0;
    while(c.cod<>-1)and (codActual=c.cod)do begin
      suma:=suma + c.punto;
      total:=total+1;
      if(paresImpares(c.dni))then
        writeln('críticos con la misma cantidad de dígitos pares que impares en su DNI:',c.ape,' ',c.nom);
      leerCritica(c);
    end;
    promedio:=suma/total;  //promedio por cada codigo de pelicula
    while(L<>nil)do begin
      if(L^.dato.codigo=codActual)then  //pregunto si los codigos de peli son iguales
          L^.dato.puntaje:=promedio;       //Le agrego nuevo promedio
      v[L^.dato.genero]:=v[L^.dato.genero]+L^.dato.puntaje;  //Le cargo el promedio en el vector
      L:=L^.sig;
    end;
  end;
end;
procedure informar(v:vcont);
var i:rango;max:real;pos:integer;
begin
  max:=-1;
  for i:=1 to dimF do
    if(v[i]>max)then begin
      max:=v[i];
      pos:=i;
    end;
  writeln('Código de género que más puntaje obtuvo entre todas las críticas:',pos);
end;    
procedure eliminar(var L:lista;codigo:integer;var exito:boolean);
var  ant,act:lista;num:integer;
begin
    exito:= false;
    act:= L;
    while(act <> nil)and(act^.dato.codigo <> codigo )do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil)then begin
        exito:= true;
        if(act = L)then   L:= act^.sig
                   else   ant^.sig:= act^.sig;
        dispose(act);
    end;
end;          
var
  L:lista;
  v:vcont;
  codigo:integer;
  ok:boolean;
begin
  L:=nil;  //se dispone
  cargarPeli(L); //se dispone
  actualizar(L,v);
  informar(v);
  writeln('Ingrese un codigo a eliminar');
  readln(codigo);
  eliminar(L,codigo,ok);
  if(ok)then  writeln('Se elimino de la lista')
        else  writeln('No se encontro el codigo');
end.
{
10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.
}
program repaso10;
const
  dimF=20;
type
  cadena=string[30];
  rango=1..dimF;
  cultivos=record
    tipo:cadena;
    hectarea:real;
    meses:integer;
  end;
  vector=array[rango]of cultivos;
  empresa=record
    cod:integer;
    nom:cadena;
    estOpri:boolean; {es V cuando es estatal}
    ciudad:cadena;
    cultivo:vector;
    dimL:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:empresa;
    sig:lista;
  end;
  
procedure leerCultivo(var c:cultivos);
begin
  writeln('Ingrese la cantidad de hectareas');
  readln(c.hectarea);
  if(c.hectarea<> 0)then begin
    writeln('Ingrese el tipo de cultivo[1-20]');
    readln(c.tipo);
    writeln('Ingrese la cantidad de meses');
    readln(c.meses);
  end;
end;
procedure cargarCultivo(var v:vector;var dimL:integer);
var c:cultivos;
begin
  dimL:=0;
  leerCultivo(c);
  while (dimL< dimF)and(c.hectarea<> 0)do begin
    dimL:=dimL+1;
    v[dimL]:= c;
    leerCultivo(c);
  end;
end;
procedure leerEmpresa(var e:empresa);
var aux:char;dim:integer;
begin
  writeln('Ingrese el codigo');
  readln(e.cod);
  if(e.cod<> -1)then begin
    writeln('Ingrese el nombre');
    readln(e.nom);
    writeln('Ingrese E para estatal, P para privado');
    readln(aux);
    e.estOpri:=(aux='E');  //significa que E es true
    writeln('Ingrese la ciudad');
    readln(e.ciudad);
    writeln('Se leen los cultivos de la empresa');
    cargarCultivo(e.cultivo,e.dimL); 
  end;
end;
procedure agregarAdelante(var L:lista; e:empresa);
var nue:lista;
begin
  new(nue);
  nue^.dato:=e;
  nue^.sig:=L;
  L:=nue;
end;

procedure cargarEmpresa(var L:lista);
var e:empresa;
begin
  leerEmpresa(e);
  while(e.cod<> -1)do begin
    agregarAdelante(L,e);
    leerEmpresa(e);
  end;
end;
function dosCeros(codigo:integer):boolean;
var dig,ceros:integer;
begin
  ceros:=0;
  while(codigo<>0)and(ceros<=2)do begin
    dig:=codigo mod 10;
    if(dig=0)then ceros:=ceros+1;
    codigo:=codigo div 10;
  end;
  if(ceros>=2)then dosCeros:=true
    else dosCeros:=false;
end;
function buscoPos(v:vector;dimL:integer;busco:cadena):integer;
var i:integer;ok:boolean;
begin
  i:=1;ok:=false;
  while(i<= dimL)and(not ok)do begin
    if(busco= v[i].tipo)then  ok:=true
        else  i:=i+1;
  end;
  if(ok= false)then  buscoPos:=0
    else  buscoPos:= i;
end;
function sumaHectTotal(v:vector;dimL:integer):real;
var i:integer;suma:real;
begin
  suma:=0;
  for i:=1 to dimL do
    suma:=suma + v[i].hectarea;
  sumaHectTotal:=suma;
end;
procedure maximo(tiempo:integer;var max:integer;nom:cadena;var maxNom:cadena);
begin
  if(tiempo> max)then begin
    max:=tiempo;
    maxNom:=nom;
  end;
end;

procedure recorrerLista(L:lista);
var v:vector; 
    maxNom:cadena;
    pos,tiempoMaiz,max:integer;
    hecTotal,porcentaje,cantHectSoja:real;
begin
  cantHectSoja:=0;hecTotal:=0;porcentaje:=0;max:=-1;maxNom:='';
  while(L<>nil)do begin
    pos:=(buscoPos(L^.dato.cultivo,L^.dato.dimL,'trigo'));
    if(pos<>0)then begin
      if(L^.dato.ciudad ='San Miguel del Monte')and(dosCeros(L^.dato.cod))then
        writeln('Empresas radicadas en San Miguel del Monte con codigo minimo a 2 ceros:',L^.dato.nom);
    end;
    hecTotal:=hecTotal +(sumaHectTotal(L^.dato.cultivo,L^.dato.dimL));
    pos:=(buscoPos(L^.dato.cultivo,L^.dato.dimL,'soja'));
    if(pos<>0)then
      cantHectSoja:=cantHectSoja+L^.dato.cultivo[pos].hectarea;
      
    pos:=(buscoPos(L^.dato.cultivo,L^.dato.dimL,'maiz'));
    if(pos<>0)then begin
      tiempoMaiz:=L^.dato.cultivo[pos].meses;
      maximo(tiempoMaiz,max,L^.dato.nom,maxNom);
    end;
    L:=L^.sig;
  end;
  porcentaje:=cantHectSoja*100/hecTotal;
  writeln('Cantidad de hectareas dedicadas al cultivo de soja:',cantHectSoja);
  writeln('Porcentaje de hectareas dedicadas al cultivo de soja:',porcentaje:2:2,'%'); 
  writeln('La empresa que dedica más tiempo al cultivo de maíz:',maxNom);
end;
{e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}{NICO: Segun enunciado deberia ser un modulo aparte}
procedure moduloE(L:lista);
var pos:integer;
begin
  while(L<>nil)do begin
    pos:=(busco(L^.dato.cultivo,L^.dato.dimL,'girasol'))
    if(pos<>0)then begin
    if(L^.dato.cultivo[pos].hectarea< 5)and(not L^.dato.estOpri)then
        L^.dato.cultivo[pos].meses:=L^.dato.cultivo[pos].meses + 1;
    end;
  end;
end;
//no entiendo la necesidad de hacerlo en un modulo aparte...sera que se hace de otra manera?
var
  L:lista;
begin
  L:=nil;
  cargarEmpresa(L);
  recorrerLista(L);
  moduloE(L);
end.

{
11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De
cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3:
obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas
para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.
}
program productora; //Ya esta,anda bien
const
  dimF=3;//100;
type
  cadena=string[30];
  rango=1..dimF;
  rangoTipo=1..5;
  evento=record
    nom:cadena;
    tipo:rangoTipo;  //(1: música, 2: cine, 3:obra de teatro, 4: unipersonal y 5: monólogo)
    lugar:cadena;
    cantMaxPers:integer;
    costo:real;
  end;
  vector=array[rango]of evento;  //se dispone
  venta=record
    cod:integer;
    num:rango;    //número de evento (1..100) del vector
    dni:integer;
    cantEnt:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:venta;
    sig:lista;
  end;
  rMinimo=record
    min:real;
    nom:cadena;
    lug:cadena;
  end;
  vMinimo=array[1..2]of rMinimo;  //para sacar los dos minimos

procedure cargarVector(var v:vector); //se dispone
begin
  v[1].nom:='Evento';
  v[1].tipo:=1;
  v[1].lugar:='La Plata';
  v[1].cantMaxPers:=1000;
  v[1].costo:=10;
  v[2].nom:='Feria';
  v[2].tipo:=2;
  v[2].lugar:='City Bell';
  v[2].cantMaxPers:=50;
  v[2].costo:=11;
  v[3].nom:='Arte';
  v[3].tipo:=3;
  v[3].lugar:='Ensenada';
  v[3].cantMaxPers:=100;
  v[3].costo:=12;
end;
procedure leerVenta(var v:venta);
begin
  writeln('Ingrese el codigo');
  readln(v.cod);
  if(v.cod<>-1)then begin
    writeln('Ingrese el numero de evento');
    readln(v.num);
    writeln('Ingrese el DNI');
    readln(v.dni);
    writeln('Ingrese la cantidad de entradas');
    readln(v.cantEnt);
  end;
end;
procedure agregarAdelante(var L:lista;v:venta);
var nue:lista;
begin
  new(nue);
  nue^.dato:=v;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarVenta(var L:lista);
var v:venta;
begin
  leerVenta(v);
  while(v.cod<>-1)do begin
    agregarAdelante(L,v);
    leerVenta(v);
  end;
end;

procedure minimoQNoAnda(var min1,min2:real;var nom1,nom2:cadena;var lug1,lug2:cadena;recaudacion:real;nom,lugar:cadena);
begin
  if(recaudacion<min1)then begin
    min2:=min1;
    min1:=recaudacion;
    nom2:=nom1;  writeln('nom2:',nom2); //nom1,nom2,lug1,lug2 anda mal,no guarda los valores
    nom1:=nom;   writeln('nom1:',nom1); //<-esto ni siquiera lo esta leyendo
    lug2:=lug1;  writeln('lug2:',lug2); //Estaba bien el modulo.La recaudacion pasaba al minimo,por eso 
    lug1:=lugar; writeln('lug1:',lug1); //que no entraba al if.
  end
  else if(recaudacion<min2)then begin
         min2:=recaudacion;
         nom2:=nom;
         lug2:=lugar;
  end;                          
end;
procedure inicializarMinimo(var vm:vMinimo); 
var i:integer;
begin
  for i:=1 to 2 do begin
    vm[i].min:=9999;
    vm[i].nom:='vacio';
    vm[i].lug:='vacio';
    writeln('Que tiene en el vector min:',vm[i].min,' ',vm[i].nom,' ',vm[i].lug);
  end;
end;
procedure minimo(var vm:vMinimo;recaudacion:real;nom,lugar:cadena);
begin
  //writeln('Que tiene recaudacion en minimo:',recaudacion);
  //writeln('Que tiene vm[1].min:',vm[1].min);
  if(recaudacion < (vm[1].min))then begin  //no esta entrando en if,o sea que esta dando falso
    vm[2].min:=vm[1].min;                  //claro,porque la cant de recaudacion se pasaba los 9999
    vm[2].nom:=vm[1].nom;
    vm[2].lug:=vm[1].lug;
    vm[1].min:=recaudacion;
    vm[1].nom:=nom;
    vm[1].lug:=lugar;
  end
  else if(recaudacion < vm[2].min)then begin
         vm[2].min:=recaudacion;
         vm[2].nom:=nom;
         vm[2].lug:=lugar;
  end;
end;
function masPares(dni:integer):boolean;
var dig,pares,impares:integer;
begin
  pares:=0;impares:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    if(dig mod 2 = 0)then
      pares:=pares+1
    else
      impares:=impares+1;
    dni:=dni div 10;
  end;
  if(pares>impares)then
    masPares:=true
  else
    masPares:=false;
end;
procedure recorrerVenta(L:lista;v:vector);  { evento->vector venta->lista}
var recaudacion:real;
    vm:vMinimo;
begin
  inicializarMinimo(vm);
  while(L<>NIL)do begin
    recaudacion:=v[L^.dato.num].costo* L^.dato.cantEnt;
    //writeln('Prueba, que tiene recaudacion:',recaudacion); //bien
    //writeln('Prueba, que tiene v[L^.dato.num].nom:',v[L^.dato.num].nom); //bien
    //writeln('Prueba, que tiene v[L^.dato.num].lugar:',v[L^.dato.num].lugar); //bien
    minimo(vm,recaudacion,v[L^.dato.num].nom,v[L^.dato.num].lugar);//ya anda
    if(v[L^.dato.num].tipo= 3)and(masPares(L^.dato.dni))then
      writeln('Cantidad de entradas de Obra de Teatro con dni mas pares:',L^.dato.cantEnt);
    if(L^.dato.num=3)and(L^.dato.cantEnt >= v[3].cantMaxPers)then   //en vez de 50->3 para probar
      writeln('El evento 50 alcanzó la cantidad máxima de personas permitidas');
    L:=L^.sig;
  end;
  writeln('El nombre y lugar de los dos eventos que han tenido menos recaudación:');
  writeln('Evento 1: ',vm[1].nom,' ',vm[1].lug,' Evento 2: ',vm[2].nom,' ',vm[2].lug);
end;
var
  L:lista;
  v:vector;
begin
  L:=nil;
  cargarVenta(L);
  cargarVector(v);
  recorrerVenta(L,v);
end.
{
12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.
}
program Fortaco;
const
  dimF=4;
type
  cadena=string[30];
  rango=1..dimF;
  vtabla=array[rango]of real; //dispone de una tabla con el costo de cada tipo
  cliente=record
    nom:cadena;
    dni:integer;
    edad:integer;
    tipo:rango;
  end;
  lista=^nodo;
  nodo=record
    dato:cliente;
    sig:lista;
  end;
  masDe40=record
    nom:cadena;
    dni:integer;
  end;
  lista2=^nodo2;
  nodo2=record
    dato:masDe40;
    sig:lista2;
  end;
  vcont=array[rango]of integer; //Las 2 suscripciones con más clientes

procedure cargarTabla(var v:vtabla);//se dispone,solo para probar
begin
  v[1]:=300;
  v[2]:=400;
  v[3]:=500;
  v[4]:=600;
end;
procedure leer(var c:cliente);
begin
  writeln('Ingrese el dni');
  readln(c.dni);
  if(c.dni<>0)then begin
    writeln('Ingrese el nombre');
    readln(c.nom);
    writeln('Ingrese la edad');
    readln(c.edad);
    writeln('Ingrese el tipo');
    readln(c.tipo);
  end;
end;
procedure agregarAdelante(var L:lista;c:cliente);
var nue:lista;
begin
  new(nue);
  nue^.dato:=c;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var c:cliente;
begin
  leer(c);
  while(c.dni<>0)do begin
    agregarAdelante(L,c);
    leer(c);
  end;
end;
procedure inicializar(var vc:vcont);
var i:rango;
begin
  for i:=1 to 4 do
    vc[i]:=0;
end;
procedure maximo(var max1,max2:integer;var tipo1,tipo2:rango;vc:vcont);
var i:rango;
begin
  for i:=1 to 4 do begin
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
procedure insertarOrdenado(var L2:lista2;c:cliente);
var nue,ant,act:lista2;
begin
  new(nue);
  nue^.dato.nom:=c.nom;
  nue^.dato.dni:=c.dni;
  ant:=L2;
  act:=L2;
  while(act<>nil)and(act^.dato.dni < c.dni)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then L2:=nue
             else ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure recorrerLista( L:lista; var L2:lista2; v:vtabla);
var 
    vc:vcont;
    gananciaTotal:real;
    max1,max2:integer; 
    tipo1,tipo2:rango;
begin
  max1:=-1;tipo1:=0;gananciaTotal:=0;
  inicializar(vc);
  while(L<>nil)do begin
    gananciaTotal:=gananciaTotal+v[L^.dato.tipo];
    vc[L^.dato.tipo]:=vc[L^.dato.tipo]+1;
    if(L^.dato.edad>40)and((L^.dato.tipo=3)or(L^.dato.tipo=4))then
      insertarOrdenado(L2,L^.dato);
    L:=L^.sig;
  end;
  maximo(max1,max2,tipo1,tipo2,vc);
  writeln('La ganancia total de Fortaco’s:', gananciaTotal);
  writeln('Las 2 suscripciones con más clientes:',tipo1,' y ',tipo2);
end;
procedure informarL2(L2:lista2);
begin
  while(L2<>nil)do begin
    writeln(L2^.dato.nom,' ',L2^.dato.dni);
    L2:=L2^.sig;
  end;
end;
var  
  L:lista;
  L2:lista2;
  v:vtabla;
begin
  L:=nil;
  L2:=nil;
  cargarTabla(v); //se dispone
  cargarLista(L);
  recorrerLista(L,L2,v);
  informarL2(L2);
end.
{
13. La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.
}
program AmazonBooks;
const
  tema=35;
type
  rango=1..tema;
  cadena=string[30];
  tabla=array[rango]of cadena; //se dispone
  libro=record
    titulo:cadena;
    editorial:cadena;
    cantPag:integer;
    edicion:integer;
    cantVenta:integer;
    codigo:rango;
  end;
  detalleLib=record
    titulo:cadena;
    areaNom:cadena;
    cantPag250:integer;
  end;
  lista=^nodo;    //lo que no entiendo: como se cual hago lista?
  nodo=record
    dato:detalleLib;
    sig:lista;
  end;
  planetaLibros=record
    editorial:cadena;
    edicion:integer;  
    cantEdicion:integer;
    cantTotalVenta:integer;
    detalle:lista;
  end;
procedure agregarAdelante(var L:lista;d:detalleLib);
var nue:lista;
begin
  new(nue);
  nue^.dato:=d;
  nue^.sig:=L;
  L:=nue;
end;
{A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros” 
Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas}  
procedure inicializarPlaneta(var p:planetaLibros);  
begin
  p.editorial:='Planeta Libros';
  p.edicion:=9999;       //Año de edición del libro más antiguo->min
  p.cantEdicion:=0;
  p.cantTotalVenta:=0;
  p.detalle:=nil;
end;
procedure procesarPlaneta(var p:planetaLibros;v:tabla);
var lib:libro;d:detalleLib;
begin
  repeat
    leerLibro(lib);
    if(lib.editorial='Planeta Libros')then begin
      p.cantEdicion:=p.cantEdicion+ 1;
      p.cantTotalVenta:=p.cantTotalVenta+ lib.cantVenta;
      if(lib.edicion< p.edicion)then  //saco el minimo
        p.edicion:= lib.edicion;
      if(lib.cantVenta> 250)then begin
        d.titulo:= lib.titulo;
        d.areaNom:= v[lib.codigo];
        d.cantPag250:= lib.cantPag;
        agregarAdelante(p.detalle,d);  //recien aca entiendo que hay que cargar en una lista
      end;                             //"de todos los libros con más de 250 ventas."
  until(lib.titulo='Relato de un naufrago'); //no se cuantos libros son por eso es una lista
end;
{ B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}
procedure imprimirPlaneta(p:planetaLibros);
  procedure imprimirLista(L:lista);
  begin
    while(L<>nil)do begin
      writeln('El título del libro con más de 250 ventas',L^.dato.titulo);
      L:=L^.sig;
    end;
  end;
begin
  writeln('Editorial:',p.editorial);
  imprimirLista(p.detalle);
end;
var
  p:planetaLibros;
  v:tabla;
begin
  cargarTabla(v); //se dispone
  inicializarPlaneta(p);
  procesarPlaneta(p,v);
  imprimirPlaneta(p);
end.
{
14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.
}
program Hello;
type
  rangoDia=1..31;
  prestamo=record
    numero:integer;
    isbn:integer;
    numSocio:integer;
    dia:rangoDia;
  end;
  libro=record
    isbn:integer;
    cantVeces:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:libro;
    sig:lista;
  end;
  vdia=array[rangoDia]of integer;
  
procedure leerPrestamo(var p:prestamo);
begin
  writeln('Ingrese el isbn');
  readln(p.isbn);
  if(p.isbn<>-1)then begin
    writeln('Ingrese el numero prestamo');
    readln(p.numero);
    writeln('Ingrese el numero de socio');
    readln(p.numSocio);
    writeln('Ingrese el dia');
    readln(p.dia);
  end;
end;
procedure agregarAtras(var L,ult:lista;lib:libro);
var nue:lista;
begin
  new(nue);
  nue^.dato:=lib;
  nue^.sig:=nil;
  if(L=nil)then L:=nue
           else  ult^.sig:=nue;
  ult:=nue;
end;
procedure inicializar(var v:vdia);
var i:rangoDia;
begin
  for i:=1 to 31 do 
    v[i]:=0;
end;
procedure minimo(var min:integer;var diaMin:rangoDia;v:vdia);
var i:rangoDia;
begin
  for i:=1 to 31 do begin
    if(v[i]<min)then begin
      min:=v[i];
      diaMin:=i;
    end;
  end;
end;
function digitosPar(num:integer):boolean;
var dig:integer;
begin
    dig:=num mod 10;
    if(dig mod 2 = 0)then
          digitosPar:=true
    else
          digitosPar:=false;
end;
procedure recorrerLista(p:prestamo;var L:lista);
var lib:libro;
    v:vdia;
    cant,total,min:integer;
    porcentaje:real;
    ult:lista2;
    diaMin:rangoDia;
begin
  cant:=0;total:=0;min:=999;
  inicializar(v);
  leerPrestamo(p);
  while(p.isbn<>-1)do begin
    lib.isbn:= p.isbn;
    lib.cantVeces:= 0;
    while(lib.isbn=p.isbn)do begin
      lib.cantVeces:=lib.cantVeces+1;
      v[p.dia]:=v[p.dia]+1;
      total:=total+lib.cantVeces;
      if(digitosPar(p.numSocio))and(not digitosPar(p.numero))then
        cant:=cant+1;
      L:=L^.sig;
    end;
    agregarAtras(L2,ult,lib);
  end;
  minimo(min,diaMin,v);
  writeln('Día del mes en que se realizaron menos préstamos',diaMin);
  porcentaje:=cant*100/total;
  writeln('Porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par',porcentaje:2:2,'%');
end;
procedure mostrar(L:lista); //para probar
begin
  while(L<>nil)do begin
    writeln('ISBN:',L^.dato.isbn,'Cantidad de veces:',L^.dato.cantVeces);
    L:=L^.sig;
  end;
end;
var
  L:lista;
begin
  L:=nil;
  recorrerLista(p,L);
  mostrar(L2);
end.
