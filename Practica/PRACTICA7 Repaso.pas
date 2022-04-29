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
program Hello;
const tam=5;
type  rango=1..tam;
      cadena30=string[30];
      persona=record
        dni:integer;
        ap:cadena30;
        nom:cadena30;
        edad:integer;
        cod:rango;
      end;
      vcont=array[rango]of integer;
      lista=^nodo;
      nodo=record
        dato:persona;
        sig:lista;
      end;
procedure leerPersona(var p:persona);
begin
  write('Ingrese el DNI:');
  readln(p.dni);
  write('Ingrese el apellido:');
  readln(p.ap);
  write('Ingrese el nombre:');
  readln(p.nom);
  write('Ingrese la edad:');
  readln(p.edad);
  write('Ingrese el codigo de genero de actuacion que prefiere:');
  readln(p.cod); 
end;
procedure agregarAdelante(var L:lista;p:persona);
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var p:persona;
begin
  repeat
    leerPersona(p);
    agregarAdelante(L,p);
  until(p.dni=335);
end;
procedure inicializarVector(var vcont:vcont);
var i:integer;
begin
  for i:=1 to tam do 
    vcont[i]:=0;
end;
function masPares(dni:integer):boolean;
var resto,cantp,canti:integer;
begin
  canti:=0;cantp:=0;
  while(dni<>0)do begin
    resto:=dni mod 10;
    if(resto mod 2=0)then
      cantp:=cantp+1
    else
      canti:=canti+1;
    dni:=dni div 10;
  end;
  if(cantp>canti)then
    masPares:=true
  else 
    masPares:=false;
end;
procedure recorrerLista(L:lista;var vcont:vcont;var cantp:integer);
begin
  cantp:=0;
  while(L<>nil)do begin
    if(masPares(L^.dato.dni))then
      cantp:=cantp+1;
    vcont[L^.dato.cod]:=vcont[L^.dato.cod]+1;        //Informar los dos códigos de género más elegidos
  L:=L^.sig;
  end;
end;
procedure maximo(var cod1,cod2:integer;vcont:vcont); //Informar los dos códigos de género más elegidos
var i,max1,max2:integer;
begin
  max1:=-1;max2:=-1;
  for i:=1 to tam do begin
    if(vcont[i]>max1)then begin
      max2:=max1;
      max1:=vcont[i];
      cod2:=cod1;
      cod1:=i;
    end
    else
    if(vcont[i]>max2)then begin
      max2:=vcont[i];
      cod2:=i;
    end;
  end;
end;
procedure informar(vcont:vcont;cantp:integer);
var cod1,cod2:integer;
begin
  maximo(cod1,cod2,vcont);
  writeln('La cantidad de personas cuyo DNI contiene más dígitos pares que impares.',cantp);
  writeln('Los dos códigos de género más elegidos:',cod1,cod2);
end;
procedure EliminarDNI(var L:lista;dni:integer);
var ant,act:lista;ok:boolean;
begin
  ant:=L;
  act:=L;
  ok:=false;
  while(act<>nil)and(not ok)do begin
    if(act^.dato.dni=dni)then
      ok:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ok=true) then begin
      if(ant=act)then
        L:=act^.sig
      else
        ant:=act^.sig;
      dispose(act);
    end;
  end;
end;
var L:lista;
    v:vcont;
    dni:integer;
    cantp:integer;
begin
  L:=nil;
  inicializarVector(v);
  cargarLista(L);
  recorrerLista(L,v,cantp);
  informar(v,cantp);
  write('Ingrese el dni a eliminar:');
  readln(dni);
  EliminarDNI(L,dni);
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
program Hello;
type  cadena50=string[50];
      cliente=record
        codCliente:integer;
        dni:integer;
        apnom:cadena50;
        codPoliza:integer;
        montoAbono:real;
      end;
      vector=array[1..6]of real;
      lista=^nodo;
      nodo=record
        dato:cliente;
        sig:lista;
      end;
procedure leerCliente(var c:cliente);
begin
  write('Ingrese codigo de cliente:');
  readln(c.codCliente);
  write('Ingrese DNI:');
  readln(c.dni);
  write('Ingrese el apellido y nombre:');
  readln(c.apnom);
  write('Ingrese codigo de poliza:');
  readln(c.codPoliza);
  write('Ingrese el monto que abona:');
  readln(c.montoAbono);
end;
procedure agregarAdelante(var L:lista;c:cliente);
var nue:lista;
begin
  new(nue);
  nue^.dato:=c;
  nue^.sig:=L;
  L:=nue;
end;
procedure crearLista(var L:lista);
var c:cliente;
begin
  repeat
    leerCliente(c);
    agregarAdelante(L,c);
  until(c.codCliente=1122);
end;
procedure muestroListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln('Apellido y nombre:',L^.dato.apnom);
    writeln('Codigo de cliente:',L^.dato.codCliente);
    writeln('DNI:',L^.dato.dni);
    writeln('Codigo de poliza:',L^.dato.codPoliza);
    writeln('Monto que abona mensualmente:',L^.dato.montoAbono:2:2);
    L:=L^.sig;
  end;
end;
procedure iniVector(var v:vector);
var i,valor:integer;
begin
  valor:=100;
  for i:=1 to 6 do begin
    v[i]:=valor;
    valor:=valor+50;
  end;
end;
procedure muestroVectorCargado(v:vector);
var i:integer;
begin
  for i:=1 to 6 do 
    writeln('Poliza numero ',i,' monto extra a pagar:',v[i]:2:2);
end;
function dosNueve(dni:integer):boolean;
var  cant,numero:integer;ok:boolean;
begin
  cant:=0;
  ok:=false;
  while(dni<>0)and(cant<2)do begin
    numero:=dni mod 10;
    if(numero=9)then
      cant:=cant+1;
    dni:=dni div 10;
  end;
  if(cant=2)then
    ok:=true;
  dosNueve:=ok;
end;
procedure recorrerLista(L:lista;v:vector);
var montoCompleto:real;
begin
  while(L<>nil)do begin
    montoCompleto:=0;
    writeln('DNI:',L^.dato.dni);
    writeln('Apellido y nombre:',L^.dato.apnom);
    montoCompleto:=L^.dato.montoAbono+v[L^.dato.codPoliza];
    writeln('Monto completo a pagar:',montoCompleto:2:2);
    if(dosNueve(L^.dato.dni))then
      writeln('Apellido y nombre:',L^.dato.apnom);
    L:=L^.sig;
  end;
end;
procedure borrarCodigo(codigo:integer;L:lista);
var ant,act:lista;
begin
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.codCliente<>codigo)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    L:=act^.sig
  else
    ant^.sig:=act^.sig;
  dispose(act);
  writeln('Codigo borrado con exito.');
end;
var L:lista;
    v:vector;
    codBorrar:integer;
begin
  L:=nil;
  iniVector(v);
  crearLista(L);
  muestroListaCargada(L);
  muestroVectorCargado(v);
  recorrerLista(L,v);
  write('Ingrese el codigo de cliente a eliminar:');
  readln(codBorrar);
  borrarCodigo(codBorrar,L);
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
program Hello;
type cadena20=string[20];
     viaje=record 
       numViaje:integer;
       codAuto:integer;
       direOrigen:cadena20;
       direDestino:cadena20;
       kmRecorridos:real;
     end;
     lista=^nodo;
     nodo=record
       dato:viaje;
       sig:lista;
     end;
procedure leerRegistro(var v:viaje);
begin
  write('Ingrese codigo de auto:');
  readln(v.codAuto);
  if(v.codAuto<>0)then begin
    write('Ingrese numero de viaje:');
    readln(v.numViaje);
    write('Ingrese direccion de origen:');
    readln(v.direOrigen);
    write('Ingrese direccion de destino:');
    readln(v.direDestino);
    write('Ingrese km recorridos:');
    readln(v.kmRecorridos);
  end;
end;
procedure insertarOrdenado(var L:lista;dato:viaje);
var nue,act,ant:lista;
begin
  new(nue);
  nue^.dato:=dato;
  nue^.sig:=nil;
  if(L=nil)then 
    L:=nue
  else
    act:=L;
    ant:=L;
    while(act<>nil)and(act^.dato.codAuto<nue^.dato.codAuto)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then begin
      nue^.sig:=L;
      L:=nue;
    end
    else if(act<>nil)then begin
      ant^.sig:=nue;
      nue^.sig:=act;
    end
    else begin 
      ant^.sig:=nue;
      nue^.sig:=nil;
  end;
end;
procedure crearLista(var L:lista);
var v:viaje;
begin
  leerRegistro(v);
  while(v.codAuto<>0)do begin
    insertarOrdenado(L,v);
    leerRegistro(v);
  end;
end;
procedure nuevaLista(var L2:lista;dato:viaje);
var nue,act,ant:lista;
begin
  new(nue);
  nue^.dato:=dato;
  nue^.sig:=nil;
  if(L2=nil)then
    L2:=nue
  else
    act:=L2;
    ant:=L2;
    while(act<>nil)and(act^.dato.numViaje<nue^.dato.numViaje)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then
      nue^.sig:=L2;
      L2:=nue
    end;
    else
    if(act<>nil)then begin
      ant^.sig:=nue;
      nue^.sig:=act
    end;
    else
    begin
      ant^.sig:=nue;
      nue^.sig:=nil;
    end;
  end;
end;
procedure mostrarListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln('Codigo de auto:',L^.dato.codAuto);
    writeln('Numero de viaje:',L^.dato.numViaje);
    writeln('Direccion de origen:',L^.dato.direOrigen);
    writeln('Direccion de destino:',L^.dato.direDestino);
    writeln('Km recorridos',L^.dato.kmRecorridos:2:2);
  L:=L^.sig;
end;
procedure maximo(var cod1,cod2:integer;max1.max2,kmTotal:real;cod:integer);
begin
  if(kmTotal>max1)then begin
    max2:=max1;
    max1:=kmTotal;
    cod2:=cod1;
    cod1:=cod;
  end
  else  
    if(kmTotal>max2)then begin
      max2:=kmTotal;
      cod2:=cod;
  end;
end;
procedure recorrerLista(L:lista);
var  act,max1,max2,cod1,cod2:integer;
     kmTotal:real;L2:lista;
begin
  max1:=-1;max2:=-1;
  while(L<>nil)do begin
    kmTotal:=0;
    act:=L^.dato.codAuto;
    while(act=L^.dato.codAuto)do begin
      kmTotal:=kmTotal+L^.dato.kmRecorridos;
      if(L^.dato.kmRecorridos>5)then
        nuevaLista(L2,L^.dato);
      L:=L^.sig;
    end;
    maximo(cod1,cod2,max1,max2,kmTotal,L^.dato.codAuto);
    L:=L^.sig;
  end;
  writeln('Los dos códigos de auto que más kilómetros recorrieron:', cod1,' y ',cod2);
end;
var    L:lista;
begin
  L:=nil;
  crearLista(L);
  mostrarListaCargada(L);
  recorrerLista(L);
end.
{
4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}
program Hello;
const dimF=42;
type  vector=array[1..dimF]of real;
      cadena30=string[30];
      paciente=record
        apynom:cadena30;
        peso:vector;
        dimL:integer;
      end;
      lista=^nodo;
      nodo=record
        dato:paciente;
        sig:lista;
      end;
procedure leerVector(var v:vector;dimL:integer);
var i:integer;peso:real;
begin
  for i:=1 to dimL do begin
    writeln ('Peso de la semana numero:',i,' : ');
    readln(peso);
    v[i]:=peso;
  end;
end;
procedure leerRegistro(var p:paciente);
begin
  write('Ingrese apellido y nombre de la paciente:');
  readln(p.apynom);
  if(p.apynom<>' ')then begin
    write('Ingrese cantidad de semana de embarazo(maximo 42):');
    readln(p.dimL);
    while(p.dimL>dimF)do begin
      write('Incorrecto, ingrese otro valor');
      readln(p.dimL);
    end;
    leerVector(p.peso,p.dimL);
  end;
end;
procedure agregarAdelante(var L:lista;p:paciente);
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=L;
  L:=nue;
end;
procedure crearLista(var L:lista);
var p:paciente;
begin
  leerRegistro(p);
  while(p.apynom<>' ')do begin
    agregarAdelante(L,p);
    leerRegistro(p);
  end;
end;
procedure mostrarVector(v:vector;dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do 
    writeln('Peso registrado en la semana numero:',i,':',v[i]);
end;
procedure muestroListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln('Apellido y nombre de la paciente:',L^.dato.apynom);
    mostrarVector(L^.dato.peso,L^.dato.dimL);
    L:=L^.sig;
  end;
end;
procedure informo(sem:integer;pesoTotal:real);
begin
  writeln('Semana con mayor aumento de peso:',sem);
  writeln('Aumento de peso total:', pesoTotal);
end;
procedure recorrerVn(v:vector;dimL:integer;var sem:integer;var pesoTotal:real);
var  max:real; i:integer;
begin
  max:=-1;
  for i:=1 to dimL do begin
    if(v[i]>max)then begin
      max:=v[i];
      sem:=i;
    end;
    pesoTotal:=pesoTotal+v[i];
  end;
end;
procedure recorrerLista(L:lista);
var  sem:integer;pesoTotal:real;
begin
  while(L<>nil)do begin
    pesoTotal:=0;
    recorrerVn(L^.dato.peso,L^.dato.dimL,sem,pesoTotal);
    writeln('Apellido y nombre:',L^.dato.apynom);
    informo(sem,pesoTotal);
    L:=L^.sig;
  end;
end;
var  L:lista;
begin
  L:=nil;
  crearLista(L);
  muestroListaCargada(L);
  recorrerLista(L);
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
program Hello;
const dimF=3;    //100 camiones
type  rango=1..dimF;
      cadena20=string[20];
      camion=record 
        patente:cadena20;
        aniof:integer;
        capacidad:real;
      end;
      viaje=record 
        codviaje:integer;
        codcamion:rango;
        distancia:real;
        ciudad:cadena20;
        aniov:integer;
        dni:integer;
      end;
      vector=array[rango]of camion;
      lista=^nodo;
      nodo=record
        dato:viaje;
        sig:lista;
      end;
procedure leerCamion(var c:camion);
begin
 write('Ingrese patente del camion:');
 readln(c.patente);
 write('Ingrese anio de fabricacion:');
 readln(c.aniof);
 write('Ingrese capacidad');
 readln(c.capacidad);
end;
procedure cargarVcamion(var v:vector);
var i:integer;c:camion;
begin
  for i:=1 to dimF do begin
    leerCamion(c);
    v[i]:=c;
  end;
end;
procedue mostrarVectorCamion(v:vector);
var i:integer;
begin
  for i:=1 to dimF do begin
    writeln('Camion numero:',i,':');
    writeln('Patente:',v[i].patente);
    writeln('Anio de fabricacion:',v[i].aniof);
    writeln('Capacidad:',v[i].Capacidad);
  end;
end;
procedure leerViaje(var v:viaje);
begin
  write('Ingrese codigo de vije:');
  readln(v.codviaje);
  if(v.codviaje<>-1)then begin
    write('Ingrese codigo de camion:');
    readln(v.codcamion);
    write('Ingrese distancia recorrida:');
    readln(v.distancia);
    write('Ingrese ciudad de destino:');
    readln(v.ciudad);
    write('Ingrese el anio en que se realizo el viaje:');
    readln(v.aniov);
    write('Ingrese el dni del chofer:');
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
procedure crearLista(var L:lista);
var v:viaje;
begin 
  leerViaje(v);
  while(v.codviaje<>-1)do begin
    agregarAdelante(L,v);
    leerViaje(v);
  end;
end;
procedure maximo(var max,min:real,var patmax,patmin:cadena20;v:vector;km:real;codcamion:integer);
begin
  if(km>max)then begin
    max:=km;
    patmax:=v[codcamion].patente;
  end;
  if(km<min)then begin
    min:=km;
    patmin:=v[codcamion].patente;
  end;
end;
function cumpleInciso2(v:vector;cod,aniov:integer):boolean;
var  antiguedad:integer;
begin
  antiguedad:=aniov-v[cod].aniof;
  if(v[cod].capacidad>30.5)and(antiguedad>5)then
    cumpleInciso2:=true
  else
    cumpleInciso2:=false;
end;
function cumpleInciso3(dni:integer):boolean;
var resto:integer;
begin
  while(dni<>0)do begin
    resto:=dni mod 10;
    if(resto mod 2<>0)then
      dni:=dni div 10;
    else
      cumpleInciso3:=false;
  end;
  cumpleInciso3:=true;
end;
procedure informar(patmax,patmin:cadena20;cantv:integer);
begin
  writeln('Patente del camion que mas km recorridos tiene:',patmax);
  writeln('Patente del camion que menos km recorridos tiene:',patmin);
  writeln('Cantidad de viajes realizado con camiones con capacidad mayor a 30.5 toneladas con antiguedad mayor a 5 anios',cantv);
end;
procedure recorrerLista(L:lista,v:vector);
var max,min:real;patmin,patmax:cadena20;cantv:integer;
begin
  max:=-1;
  min:=999;
  cantv:=0;
  while(L<>nil)do begin
    maximo(max,min,patmax,patmin,v,L^.dato.distancia,L^.dato.codcamion);
    if(cumpleInciso2(v,L^.dat.codcamion,L^.dato.aniov))then
      cantv:=cantv+1;
      if(cumpleInciso3(L^.dato.dni))then
        writeln('Codigo de viaje realizado por chofer con digitos impares:',L^.dato.codviaje);
    L:=L^.sig;
  end;
  informar(patmax,patmin,cantv);
end;
var  L:lista;
     v:vector;
begin
   L:=nil;
   cargarVcamion(v);//se dispone
   mostrarVectorCamion(v);
   crearLista(L);
   recorrerLista(L,v);
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
program Hello;
const tam=7;
type  rango=1..tam;
      cadena20=string[20];
      objeto=record
        cod:integer;
        categoria:rango;
        nomObjeto:cadena20;
        distancia:real;
        nomDescubridor:cadena20;
        anio:integer;
      end;
      vector=array[rango]of integer;
      lista=^nodo;
      nodo=record
        dato:objeto;
        sig:lista;
      end;
procedure inicializar(var v:vector);
var i:integer;
begin
  for i:=1 to tam do 
    v[i]:=0;
end;
procedure leerObjeto(var o:objeto);
begin
  write('Ingrese el codigo:');
  readln(o.cod);
  if(o.cod<>-1)then begin
    write('Ingrese la categoria:');
    readln(o.categoria);
    write('Ingrese el nombre del objeto:');
    readln(o.nomObjeto);  
    write('Ingrese la distancia:');
    readln(o.distancia);
    write('Ingrese el nombre del descubridor:');
    readln(o.nomDescubridor);
    write('Ingrese el anio :');
    readln(o.anio);
  end;
end;
procedure agregarAtras(var L:lista;o:objeto;var ult:lista);
var nue:lista;
begin
  new(nue);
  nue^.dato:=o;
  nue^.sig:=nil;
  if(L<>nil)then  L:=nue;
            else  ult^.sig:=nue;
  ult:=nue;
end;
procedure crearLista(var L:lista);
var o:objeto;ult:lista;
begin
  leerObjeto(o);
  while(o.cod<>-1)do begin
    agregarAtras(L,o,ult);
    leerObjeto(o);
  end;
end;
procedure mostrarListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln('Codigo de objeto:',L^.dato.cod);
    writeln('Categoria del objeto:',L^.dato.categoria);
    writeln('Nombre del objeto:',L^.dato.nomObjeto);
    writeln('Nombre del descubridor:',L^.dato.nomDescubridor);
    writeln('Distancia a la tierra:',L^.dato.distancia);
    writeln('Anio de descubrimiento:',L^.dato.anio);
    L:=L^.sig;
  end;
end;
procedure maximos(var max1,max2:real;var codmax1,codmax2:integer;dist:real;cod:integer);
begin
  if(dist>max1)then begin
    max2:=max1;
    max1:=dist;
    codmax2:=codmax1;
    codmax1:=cod;
  end
  else if(dist>max2)then begin
         max2:=dist;
         codmax2:=cod;
  end;
end;
function cumpleInciso2(nom:cadena20;anio:integer;categ:integer):boolean;
begin
  if(nom='Galileo Galilei')and(anio<1600)and(categ=2)then
    cumpleInciso2:=true;
  else
    cumpleInciso2:=false;
end;
procedure informoInciso3(v:vector);
var i:integer;
begin
  for i:=1 to tam do 
    writeln('La cantidad de objetos observados en categoria ',i,' es de ',v[i]);
end;
function cumpleInciso4(codigo:integer):boolean;
var resto,cantp,canti:integer;
begin
  while(codigo<>0)do begin
    resto:=codigo mod 10;
    if(resto mod 2=0)then
      cantp:=cantp+1;
    else
      canti:=canti+1;
    codigo:=codigo div 10;
  end;
  if(cantp>canti)then 
    cumpleInciso4:=true;
  else
    cumpleInciso4:=false;
end;
procedure informo(codmax1,codmax2,cantGalileo:integer;v:vector);
begin
  writeln('Codigo de los dos objetos mas lejano a la tierra:',codmax1,codmax2);
  writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600',cantGalileo);
  informoInciso3(v);
end;
procedure recorrerLista(L:lista;v:vector);
var max1,max2:real;codmax1,codmax2,cantGalileo:integer;
begin
  cantGalileo:=0;
  while(L<>nil)do begin
    maximos(max1,max2,codmax1,codmax2,L^.dato.distancia,L^.dato.cod);
    if(cumpleInciso2(L^.dato.nomDescubridor,L^.dato.anio,L^.dato.categoria))then
      cantGalileo:=cantGalileo+1;
    v[L^.dato.categoria]:=v[L^.dato.categoria]+1;
    if(L^.dato.categoria=1)and(cumpleInciso4(L^.dato.cod))then
      writeln('Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.',L^.dato.nomObjeto);
    L:=L^.sig;
  end;
  informo(codmax1,codmax2,cantGalileo,v);
end;
var  L:lista;
     v:vector;
begin
  L:=nil;
  inicializar(v);
  crearLista(L);
  mostrarListaCargada(L);
  recorrerLista(L,v);
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
program Hello;
const  dimF=24;
type   rango=1..dimF;
       cadena30=string[30];
       vector=array[rango]of real;
       alumno=record
         numero:integer;
         apnom:cadena30;
         mail:cadena30;
         anioIngreso:integer;
         anioEgreso:integer;
         notas:vector;
       end;
       lista=^nodo;
       nodo=record
         dato:alumno;
         sig:lista;
       end;
procedure cargarVector(var v:vector);
var i:integer;nota:real;
begin
  for i:=1 to dimF do begin
    writeln('Ingrese la nota de la materia:',i,':');
    readln(nota);
    v[i]:=nota;
  end;
end;
procedure ordenarVector(var v:vector);
var i,j,p:integer;item:real;
begin
  for i:=1 to dimF-1 do begin
    p:=i;
    for j:=i+1 to dimF do
      if(v[j]>v[p])then
        p:=j;
    item:=v[p];
    v[p]:=v[i];
    v[i]:=item;
  end;
end;
procedure leerAlumno(var a:alumno);
begin
  write('Ingrese el numero de alumno:');
  readln(a.numero);
  if(a.numero<>-1)then begin
    write('Ingrese el apellido y nombre de alumno:');
    readln(a.apnom);
    write('Ingrese el mail de alumno:');
    readln(a.mail);
    write('Ingrese el anio de ingreso:');
    readln(a.anioIngreso);
    write('Ingrese el anio de egreso:');
    readln(a.anioEgreso);
    write('Ingrese la nota de alumno:');
    cargarVector(a.notas);
    ordenarVector(a.notas);
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
  while(a.numero<>-1)do begin
    agregarAdelante(L,a);
    leerAlumno(a);
  end;
end;
procedure mostrarVectorCargado(v:vector);
var i: integer;
begin
  for i:=1 to dimF do
    writeln('Nota numero:',i,':',v[i]:2:2);
end;
procedure mostrarListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln('Numero de alumno:',L^.dato.numero);
    writeln('Apellido y nombre de alumno:',L^.dato.apnom);
    writeln('Mail de alumno:',L^.dato.mail);
    writeln('Anio de ingreso:',L^.dato.anioIngreso);
    writeln('Anio de egreso:',L^.dato.anioEgreso);
    writeln('Notas:');
    mostrarVectorCargado(L^.dato.notas);
    L:=L^.sig;
  end;
end;
procedure incisoA(v:vector;apnom:cadena30);
var i:integer;suma,promedio:real;
begin
  suma:=0;
  for i:=1 to dimF do 
    suma:=suma+v[i];
  promedio:=suma/dimF;
  writeln('Alumno:',apnom);
  writeln('Promedio de notas:',promedio);
end;
function incisoB(num:integer):boolean;
var resto:integer;
begin
  while(num<>0 )do begin
    resto:=num mod 10;
    if(resto mod 2<>0 )then
      num:=num div 10
    else 
      incisoB:=false;
    end;
      incisoB:=true;
end;
procedure incisoC(L:lista;var min1,min2:integer;var apnom1,apnom2,mail1,mail2:cadena30);
var resta:integer;
begin
  resta:=L^.dato.anioEgreso-L^.dato.anioIngreso;
  if(resta<min1)then begin 
    min2:=min1;
    min1:=resta;
    apnom2:=apnom1;
    apnom1:=L^.dato.apnom;
    mail2:=mail1;
    mail1:=L^.dato.mail;
  end
  else if(resta<min2)then begin
         min2:=resta;
         apnom2:=L^.dato.apnom;
         mail2:=L^.dato.mail;
  end;
end;
procedure informo(cant:integer;apnom1,mail1,apnom2,mail2:cadena30);
begin
  writeln('Cantidad de alumnos cuyo numero de alumno tiene solo digitos impares:',cant);
  writeln('Datos del primer alumno que menos tardo en recibirse:',apnom1,mail1);
  writeln('Datos del segundo alumno que menos tardo en recibirse:',apnom2,mail2);
end;
procedure recorrerLista(L:lista);
var  cant,min1,min2:integer;apnom1,apnom2,mail1,mail2:cadena30;
begin
  cant:=0;
  min1:=999;min2:=999;
  apnom1:='';apnom2:='';mail1:='';mail2:='';
  while(L<>nil)do begin
    incisoA(L^.dato.notas,L^.dato.apnom);
    if(L^.dato.anioIngreso=2012)and(incisoB(L^.dato.numero))then
      cant:=cant+1;
    incisoC(L,min1,min2,apnom1,apnom2,mail1,mail2);
    L:=L^.sig;
  end;
  informo(cant,apnom1,mail1,apnom2,mail2);
end;
procedure eliminarNumero(var L:lista;numero:integer);
var ant,act:lista;ok:boolean;
begin
  ant:=L;
  act:=L;
  ok:=false;
  while(act<>nil)and(not ok)do begin
    if(act^.dato.numero=numero)then
      ok:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if(ok=true)then begin
    if(ant=act)then  L:=act^.sig
               else  ant^.sig:=act^.sig;
    dispose(act);
    writeln('El alumno se elimino correctamente.');
  end
  else
    writeln('No se encotro el alumno.');
end;
var  L:lista;
     numElimino:integer;
begin
  L:=nil;
  cargarLista(L);
  mostrarListaCargada(L);
  recorrerLista(L);
  writeln('Ingrese el numero de alumno a eliminar:');
  readln(numElimino);
  eliminarNumero(L,numElimino);
  mostrarListaCargada(L);  //para corroborar si se elimino el numero.
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
program Hello;
const tam=7;
type  rango=1..tam;
      fecha=record
        dia:1..31;
        mes:1..12;
        anio:integer;
      end;
      hora=record
        horas:1..24;
        min:0..59;
      end;
      transferencia=record
        numOrigen:integer;
        dniOrigen:integer;
        numDestino:integer;
        dniDestino:integer;
        f:fecha;
        h:hora;
        monto:real;
        cod:rango;
      end;
      vector=array[rango]of integer;
      lista=^nodo;
      nodo=record
        dato:transferencia;
        sig:lista;
      end;
procedure inicializar(var v:vector);
var i:integer;
begin
  for i:=1 to tam do 
    v[i]:=0;
end;
function cumple(dniOrigen,dniDestino:integer):boolean;
begin
  cumple:=(dniOrigen<>dniDestino);
end;
procedure insertarOrdenado(var L2:lista;trans:transferencia);
var  nue,act,ant:lista;
begin
  new(nue);
  nue^.dato:=trans;
  nue^.sig:=nil;
  if(L2=nil)then  L2:=nue
            else begin  
                  act:=L2;
                  ant:=L2;
    while(act<>nil)and(act^.dato.numOrigen<nue^.dato.numOrigen)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then begin
      nue^.sig:=L2;
      L2:=nue;
    end
    else if(act<>nil)then begin
           ant^.sig:=nue;
           nue^.sig:=act;
         end
         else begin
           ant^.sig:=nue;
           nue^.sig:=nil;
         end;
    end;
end;
procedure leerTransferencia(var t:transferencia);  //se dispone
begin
  write('Ingrese numero cuenta origen:');
  readln(t.numOrigen);
  if(t.numOrigen<>-1)then begin
    write('DNI de titular de cuenta origen:');
    readln(t.dniOrigen);
    write('Ingrese numero cuenta destino:');
    readln(t.numDestino);
    write('DNI de titular de cuenta destino:');
    readln(t.dniDestino);
    write('Ingrese el dia:');
    readln(t.f.dia);
    write('Ingrese el mes:');
    readln(t.f.mes);
    write('Ingrese el anio:');
    readln(t.f.anio);
    write('Ingrese la hora:');
    readln(t.h.horas);
    write('Ingrese el minuto:');
    readln(t.h.min);
    write('Ingrese el monto:');
    readln(t.monto);
    write('Ingrese código del motivo de la transferencia:');
    readln(t.cod);
  end;
end;
procedure insertarPrincipio(var L:lista;t:transferencia);
var nue:lista;
begin
  new(nue);
  nue^.dato:=t;
  nue^.sig:=nil;
  if(L=nil)then  L:=nue;
           else  nue^.sig:=L;
  L:=nue;
  end;
end;
procedure cargarLista(var L:lista);
var t:transferencia;
begin
  leerTransferencia(t);
  while(t.numOrigen<>-1)do begin
    insertarPrincipio(L,t);
    leerTransferencia(t);
  end;
end;
procedure recorrerLista(L:lista;var L2:lista);
begin
  while(L<>nil)do begin
    if(cumple(L^.dato.dniOrigen,L^.dato.dniDestino))then
      insertarOrdenado(L2,L^.dato);
      L:=L^.sig
  end;
end;
procedure calcularMaximo(v:vector;var codmax:integer);
var i,max:integer;
begin
  max:=-1;
  for i:=1 to tam do begin
    if(v[i]>max)then begin
      max:=v[i];
      codmax:=i;
    end;
  end;
end;
function cumpleMenosPares(numero:integer):boolean;
var resto,cantp,canti:integer;
begin
  cantp:=0;canti:=0;
  while(numero<>0)do begin
    resto:=numero mod 10;
    if(resto mod 2=0)then
      cantp:=cantp+1
    else
      canti:=canti+1;
    numero:=numero div 10;
  end;
  if(canti>cantp)then
     cumpleMenosPares:=true
  else
     cumpleMenosPares:=false;
end;
procedure recorrerLista2(L2:lista;v:vector);
var codmax,cant,aux:integer;suma:real;
begin
  cant:=0;
  while(L2<>nil)do begin
    aux:=L2^.dato.numOrigen;
    suma:=0;
    while(L2<>nil)and(aux=L2^.dato.numOrigen)do
      suma:=suma+L2^.dato.monto;
    v[L2^.dato.cod]:=v[L2^.dato.cod]+1;
    if(L2^.dato.mes=6)and(cumpleMenosPares(L2^.dato.numDestino))then
      cant:=cant+1;
    L2:=L2^.sig;
    writeln('Monto total:',suma:2:2);
  end;
  calcularMaximo(v,codmax);
  writeln('Código de motivo que más transferencias a terceros tuvo:',codmax);
  writeln('la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares:',cant);
end;
var  L:lista;
     L2:lista;
     v:vector;
begin
  L:=nil;
  L2:=nil;
  inicializar(v);
  cargarLista(L);  //se dispone
  recorrerLista(L,L2);
  recorrerLista2(L2,v);
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
program Hello;
const  dimF=8;
type   rango=1..dimF;
       cadena50=string[50];
       pelicula=record
         codigo:integer;
         nombre:cadena50;
         codGenero:rango;
         puntaje:real;
       end;
       lista=^nodo;
       nodo=record
         dato:pelicula;
         sig:lista;
       end;
       critico=record
         dni:integer;
         nomape:cadena50;
         cod:integer;
         punto:real;
       end;
       vector=array[rango]of real;
procedure inicializar(var v:vector);
var i:integer;
begin
  for i:=1 to dimF do
    v[i]:=-1;
end;
procedure leerCritico(var c:critico);
begin
  write('Ingrese el codigo:');
  readln(c.cod);
  if(c.cod<>-1)then begin
    write('Ingrese el DNI:');
    readln(c.cod);
    write('Ingrese nombre y apellido:');
    readln(c.cod);
    write('Ingrese el puntaje:');
    readln(c.cod);
  end;
end;
procedure leerPelicula(var p:pelicula);
begin
  write('Ingrese el codigo:');
  readln(p.codigo);
  if(p.codigo<>-1)then begin
    write('Ingrese el nombre:');
    readln(p.nombre);
    write('Ingrese el codigo de genero:');
    readln(p.codGenero);
    write('Ingrese el punteje:');
    readln(p.puntaje);
  end;
end;
procedure insertarPrincipio(var L:lista;p:pelicula);
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=nil;
  if(L=nil)then 
    L:=nue
  else 
    nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var p:pelicula;
begin
  leerPelicula(p);
  while(p.codigo<>-1)do begin
    insertarPrincipio(L,p);
    leerPelicula(p);
  end;
end;
function parImpar(dni:integer):boolean;
var par,impar,dig:integer;
begin
  par:=0;impar:=0;
  while(dni<>0)do begin
    dig:=dni mod 10;
    if(dig mod 2=0)then
      par:=par+1
    else
      impar:=impar+1;
    dni:=dni div 10;
  end;
  parImpar:=(par=impar);
end;
procedure masPuntaje(v:vector);
var i,cod:integer;max:real;
begin
  max:=-1;
  for i:=1 to dimF do  
    if(v[i]>max)then begin
      cod:=i;
      max:=v[i];
    end;
    writeln(cod,' tuvo el mayor puntaje:',max:2:2);
end;
procedure actualizar(var v:vector;L:lista);
var c:critico;Actual,cant:integer;promedio,suma:real;
begin
  leerCritico(c);
  suma:=0;cant:=0;
  while(c.cod<>-1)do begin
    Actual:=c.cod;
    while(c.cod<>-1)and(Actual=c.cod)do begin
      if(parImpar(c.dni))then
        writeln('Nombre y apellido de aquellos críticos con cantidad de dígitos pares que impares en su DNI:',c.nomape);
      suma:=suma+c.punto;
      cant:=cant+1;
      leerCritico(c);
    end;
    promedio:=suma/cant;
    while(L<>nil)do begin
      if(L^.dato.codigo=c.cod)then
        L^.dato.puntaje:=promedio;
      if(v[L^.dato.codigo]<L^.dato.puntaje)then
        v[L^.dato.codigo]:=L^.dato.puntaje;
      L:=L^.sig;
    end;
  end;
end;
procedure Eliminar(var L:lista;numero:integer);
var act,ant:lista;ok:boolean;
begin
  act:=L;ant:=L;ok:=false;
  while(act<>nil)and(not ok)do 
    if(act^.dato.codigo=numero)then
      ok:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ok=true)then begin
      if(act=L)then
        L:=act^.sig
      else
        ant^.sig:=act^.sig;
      dispose(act);
  end;
end;
var L:lista;
    v:vector;
    cod:integer;
begin
  L:=nil;
  inicializar(v);
  cargarLista(L);
  actualizar(v,L);
  masPuntaje(v);
  write('Ingrese el codigo a borrar:');
  readln(cod);
  Eliminar(L,cod);
end.
