{
1. Dado el siguiente programa:
a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.
}
program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
begin
  write('Ingrese el codigo del alumno');
  readln(alu.codigo);
  if (alu.codigo <> 0) then begin
    write('Ingrese el nombre del alumno'); 
    readln(alu.nombre);
    write('Ingrese el promedio del alumno'); 
    readln(alu.promedio);
  end;
end;
procedure mejorPromedio(prom:real;nom:str20;var max:real;var maxNom:str20);
begin
  if(prom>max)then begin
    max:=prom;
    maxNom:=nom;
  end;    
end;
{ declaración de variables del programa principal }
var
  a : alumno;
  cant:integer;
  max:real;
  maxNom:str20;
{ cuerpo del programa principal }
begin
  cant:=0;
  max:=-1;
  maxNom:=' ';
  leer(a);
  while(a.codigo<>0)do begin
    cant:=cant+1;
    mejorPromedio(a.promedio,a.nombre,max,maxNom);
    leer(a);
  end;
  writeln('Cantidad de alumnos leidos',cant);
  writeln('Nombre del alumno con meor promedio',maxNom);
end.
{
2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}
program Hello;
type
  rangoD=1..31;
  rangoM=1..12;
  rangoA=2000..2050;
  fecha=record
      dia:rangoD;
      mes:rangoM;
      anio:rangoA;
  end;
procedure leerFecha(var f:fecha);
begin
  write('Ingrese el anio de casamiento');
  readln(f.anio);
  if(f.anio<>2020)then begin
    write('Ingrese el dia');
    readln(f.dia);
    write('Ingrese el mes');
    readln(f.mes);
  end;
end;
function diezDias(dia:rangoD):boolean;
begin
  diezDias:=(dia>=1)and(dia<=10);//la cantidad de casamientos realizados en los primeros 10 dias de cada mes.
end;
function mesDeVerano(mes:rangoM):boolean;
begin
  mesDeVerano:=(mes=1)or(mes=2)or(mes=3);//la cantidad de casamiento realizado durante los meses de verano
end;                                     //(enero,febrero,marzo).
var  
    fec:fecha;
    cantVerano,cantDiez:integer;
begin
  cantVerano:=0;
  cantDiez:=0;
  leerFecha(fec);
  while(fec.anio<>2020)do begin //la lectura finaliza al ingresar el anio 2020
    if(mesDeVerano(fec.mes))then
      cantVerano:=cantVerano+1;
    if(diezDias(fec.dia))then
      cantDiez:=cantDiez+1;
    leerFecha(fec);
  end;
  writeln('Cantidad de casamientos realizados en los primeros 10 dias de cada mes:',cantDiez);
  writeln('Cantidad de casamiento realizado durante los meses de verano:',cantVerano);
end.
{
3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docente.
}
program Hello;
const
    escuelas=2400;
    propUNESCO=1/23435;//proporción de alumnos por docente calculada por la UNESCO
type 
    cadena30=string[30];
    establecimiento=record
            CUE:integer;
            nom:cadena30;
            cantDoc:integer;
            cantAlu:integer;
            localidad:cadena30;
    end;
procedure leerEstablecimiento(var e:establecimiento);
begin
  write('Ingrese el CUE:');
  readln(e.CUE);
  write('Ingrese el nombre de establecimiento:');
  readln(e.nom);
  write('Ingrese la cantidad de docente:');
  readln(e.cantDoc);
  write('Ingrese la cantidad de alumnos:');
  readln(e.cantAlu);
  write('Ingrese la localidad:');
  readln(e.localidad);
end;
function cumple(localidad:cadena30;relacion:real):boolean;
begin
  cumple:=(localidad='La Plata')and(relacion>propUNESCO);//Cantidad de escuelas de La Plata con una relación de
end;                                                     //alumnos por docente superior a la sugerida por UNESCO.
procedure escMejorRelacion(cueAct:integer;nomAct:cadena30;relacion:real;var max1,max2:real;var cue1,cue2:integer;var nom1,nom2:cadena30);
begin
  if(relacion>max1)then begin
    max2:=max1;
    cue2:=cue1;
    nom2:=nom1;
    max1:=relacion;
    cue1:=cueAct;
    nom1:=nomAct;
  end
  else if(relacion>max2)then begin
    max2:=relacion;
    cue2:=cueAct;
    nom2:=nomAct;
  end;
end;
function relacDocAlu(cantDoc:integer;cantAlu:integer):real;
begin
  relacDocAlu:=(cantDoc/cantAlu);
end;
var est:establecimiento;
    i,cantEsc,cue1,cue2:integer;
    relacion,max1,max2:real;
    nom1,nom2:cadena30;
begin
  cantEsc:=0;
  max1:=-1;
  for i:=1 to escuelas do begin
    leerEstablecimiento(est);
    relacion:=relacDocAlu(est.cantDoc,est.cantAlu);
    if(cumple(est.localidad,relacion))then
      cantEsc:=cantEsc+1;
    escMejorRelacion(est.CUE,est.nom,relacion,max1,max2,cue1,cue2,nom1,nom2);
  end;
  writeln('Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO:', cantEsc);
  writeln('CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos:',cue1,nom1,'y',cue2,nom2);
end.
{
4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}
program Hello;
const
  CLI=3;
  MIN=3.40;
  MB=1.35;
type
  cliente=record
    codigo:integer;
    cantLineas:integer;
  end;
  linea=record
    numero:integer;
    cantMin:real;
    cantMB:real;
  end;
procedure leerCliente(var c:cliente);
begin
  writeln('Ingrese codigo de cliente');
  readln(c.codigo);
  writeln('Ingrese la cantidad de lineas');
  readln(c.cantLineas);
end;
procedure leerLinea(var l:linea);
begin
  writeln('Ingrese el numero de telefono');
  readln(l.numero);
  writeln('Ingrese la cantidad de minuto consumido');
  readln(l.cantMin);
  writeln('Ingrese la cantidad de MB consumido');
  readln(l.cantMB);
end;
procedure facturar(c:cliente;l:linea;var cantTotalMin,cantTotalMB:real);
var i:integer;
begin
  leerCliente(c);
  for i:=1 to c.cantLineas do begin
    leerLinea(l);
    cantTotalMin:=cantTotalMin+l.cantMin;
    cantTotalMB:=cantTotalMB+l.cantMB;
  end;
end;
var 
  c:cliente;
  lin:linea;
  cantTotalMin,cantTotalMB:real;
  i:integer;
begin
  for i:=1 to CLI do begin
    facturar(c,lin,cantTotalMin,cantTotalMB);
    writeln('Cantidad total de min $ ',cantTotalMin*MIN:2:2);
    writeln('Cantidad total de MB $',cantTotalMB*MB:2:2);
    writeln('Monto total a facturar $',cantTotalMin*MIN+cantTotalMB*MB:2:2);
  end; 
end.
{
5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.
}
program Hello;
type 
    cadena20=string[20];
    auto=record
        marca:cadena20;
        modelo:cadena20;
        precio:real;
    end;
procedure leerAuto(var a:auto);
begin
  write('Ingrese la marca:');
  readln(a.marca);
  if(a.marca<>'ZZZ')then begin
    write('Ingrese el modelo:');
    readln(a.modelo);
    write('Ingrese el precio:');
    readln(a.precio);
  end;    
end;
procedure masCaro(a:auto;var aMax:auto);
begin
  if(a.precio>aMax.precio)then begin
    aMax:=a;
end;
var  
   a:auto;aMax:auto;
   cantAutos:integer;
   sumaPrecios,precioPromedio:real;
   marcaActual:cadena20;
begin
  aMax.precio:=0;
  aMax.marca:='';
  aMax.modelo:='';
  leerAuto(a);
  while(a.marca<>'ZZZ')do begin
    marcaActual:=a.marca;
    cantAutos:=0;
    sumaPrecios:=0;
    precioPromedio:=0;
    while(marcaActual=a.marca)do begin
      cantAutos:=cantAutos+1;
      sumaPrecios:=sumaPrecios+a.precio;
      masCaro(a, aMax);
      leerAuto(a);
    end;
    precioPromedio:=sumaPrecios/cantAutos;
    writeln('Marca',marcaActual,'precio promedio',precioPromedio:4:2);
  end;
  writeln('Marca y modelo del auto mas caro:',aMax.marca,' ',aMax.modelo);
end.
{
6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.
}
program microprocesadores;
type
  cadena=string[30];
  microp=record
    marca:cadena;
    linea:cadena;
    cores:integer;
    velocidad:real;
    nano:integer;
  end;
procedure leer (var m:microp);
begin
  writeln('Ingrese la cant de cores ');
  readln(m.cores);
  if(m.cores<>0)then begin
   writeln('Ingrese la marca');
   readln(m.marca);
   writeln('Ingrese la linea');
   readln(m.linea);
   writeln('Ingrese la velocidad del reloj ');
   readln(m.velocidad);
   writeln('Ingrese el tamanio en manometros de los transitores');
   readln(m.nano);
  end;
end;
procedure masDeDosCores(m:microp);
begin
  if(m.cores>2)and(m.nano<=22)then begin
    writeln('Procesadores de más de 2 cores con transistores de a lo sumo 22 nm',m.marca,' y ',m.linea);
  end;
end;
procedure dosMaximos(nano14:integer;var marca1,marca2:cadena;var max1,max2:integer;marca:cadena);
begin
  if(nano14>max1)then begin
    max2:=max1;
    max1:=nano14;
    marca2:=marca1;
    marca1:=marca;
  end
  else if(nano14>max2)then begin
         max2:=nano14;
         marca2:=marca;
  end;
end;
function multicore(m:microp):boolean;
begin
  multicore:=(m.cores>1)and((m.marca='Intel')or(m.marca='AMD'))and(m.velocidad>=2);
end;
var
  m:microp;
  marcaActual,marca1,marca2:cadena;
  max1,max2,nano14,cantMulti:integer;
begin
  max1:=-1;marca1:='';cantMulti:=0;
  leer(m);
  while(m.cores<>0)do begin
    marcaActual:=m.marca;
    nano14:=0;
    while(m.cores<>0)and(marcaActual=m.marca)do begin
      masDeDosCores(m);
      if(m.nano=14)then
        nano14:=nano14+1;
      if (multicore(m))then
        cantMulti:=cantMulti+1;
      leer(m);
    end;
    dosMaximos(nano14,marca1,marca2,max1,max2,marcaActual);
  end;
  writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm ',marca1,' y ',marca2);
  writeln('Cantidad de procesadores multicore de Intel o AMD,con velocidades de al menos 2 Ghz',cantMulti);
end.
{
7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.
}
program CIUN;
type 
  cadena=string[30];
  centro=record
    nombre:cadena;
    universidad:cadena;
    cantInv:integer;
    cantBec:integer;
  end;
procedure leer(var c:centro);
begin
  writeln('Ingrese la cantidad de investigadores');
  readln(c.cantInv);
  if(c.cantInv<>0)then begin
    writeln('Ingrese el nombre del centro');
    readln(c.nombre);
    writeln('Ingrese la universidad a la que pertenece');
    readln(c.universidad);
    writeln('Ingrese la cantidad de becarios que poseen');
    readln(c.cantBec);
  end;
end;
procedure maximo(cant:integer;max:integer;uni:cadena;var uniMax:cadena);
begin
  if(cant>max)then begin
    max:=cant;
    uniMax:=uni;
  end;
end;
procedure dosMinimos(var min1,min2:integer;cantBecarios:integer;var nom1,nom2:cadena;nom:cadena);
begin
  if(cantBecarios<min1)then begin
    min2:=min1;
    min1:=cantBecarios;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(cantBecarios<min1)then begin
         min2:=cantBecarios;
         nom2:=nom;
  end;
end;
var
  c:centro;
  uniActual,nom1,nom2,uniMax:cadena;
  cantUni,max,min1,min2:integer;
begin
  max:=-1;min1:=999;nom1:='';
  leer(c);
  while(c.cantInv<>0)do begin
    uniActual:=c.universidad;
    cantUni:=0;
    while(c.cantInv<>0)and(uniActual=c.universidad)do begin
      cantUni:=cantUni+1;
      dosMinimos(min1,min2,c.cantBec,nom1,nom2,c.nombre);
      leer(c);
    end;
    maximo(c.cantInv,max,uniActual,uniMax);
    writeln('Cantidad total de centros para cada universidad',cantUni);
  end;
  writeln('Universidad con mayor cantidad de investigadores en sus centros',uniMax);
  writeln('Los dos centros con menor cantidad de becarios',nom1,' y ',nom2);
end.
{
8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}
program CPM;
type
  cadena=string[30];
  coordinador=record    
    dni:integer;
    nomYape:cadena;
    email:cadena;
  end;
  proyecto=record
    codUnico:integer;
    titulo:cadena;
    docente:coordinador;
    cantAlu:integer;
    escuela:cadena;     
    localidad:cadena;    
  end;                                  
procedure leerCoordinador(var c:coordinador);
begin
  writeln('Ingrese DNI');
  readln(c.dni);
  writeln('Ingrese el nombre y apellido');
  readln(c.nomYape);
  writeln('Ingrese el email');
  readln(c.email);
end; 
procedure leerProyecto(var p:proyecto);
var c:coordinador;
begin
  writeln('Ingrese el codigo unico');
  readln(p.codUnico);
  if(p.codUnico<>-1)then begin
   writeln('Ingrese el titulo');
   readln(p.titulo);
   writeln('Ingrese docente');
   leerCoordinador(c);
   writeln('Ingrese la cantidad de alumno');
   readln(p.cantAlu);
   writeln('Ingrese la escuela');
   readln(p.escuela);
   writeln('Ingrese la localidad');
   readln(p.localidad);
  end;
end;
procedure dosMaximos(var nom1,nom2:cadena;var max1,max2:integer;nomEsc:cadena;cant:integer);
begin
  if(cant>max1)then begin
    max2:=max1;
    max1:=cant;
    nom2:=nom1;
    nom1:=nomEsc;
  end
  else if(cant>max2)then begin
         max2:=cant;
         nom2:=nomEsc;
  end;
end;
function codigoIgual(codigo:integer):boolean;
var dig,par,impar:integer;
begin
  par:=0;impar:=0;
  while(codigo<>0)do begin
    dig:=codigo mod 10;
    if(dig mod 2 = 0)then
      par:=par+1
    else 
      impar:=impar+1;
    codigo:=codigo div 10;
  end;
  codigoIgual:=(par=impar);
end;
var 
  p:proyecto;
  locActual,escActual,nom1,nom2:cadena;       
  cantEsc2020,cantEscLoc,max1,max2,cantAluTotal:integer;              
begin
  max1:=-1;nom1:='';
  cantEsc2020:=0;
  leerProyecto(p);
  while(p.codUnico<>-1)do begin
    locActual:=p.localidad;
    cantEscLoc:=0;
    while(p.codUnico<>-1)and(locActual=p.localidad)do begin
      escActual:=p.escuela;     
      cantEsc2020:=cantEsc2020+1;
      cantEscLoc:=cantEscLoc+1;
      if(locActual='Daireaux')and(codigoIgual(p.codUnico))then
            writeln('Título loc de Daireaux con código igual cantidad de dígitos pares e impares',p.titulo);
      cantAluTotal:=0;
      
      while(p.codUnico<>-1)and(locActual=p.localidad)and(escActual=p.escuela)do begin 
        cantAluTotal:=cantAluTotal+p.cantAlu;
        leerProyecto(p);
      end;
      dosMaximos(nom1,nom2,max1,max2,escActual,cantAluTotal);
    end;
    writeln('cantidad de escuelas ',cantEscLoc,' localidad ',locActual);
  end;
  writeln('Cantidad total de escuelas que participan en la convocatoria 2020',cantEsc2020);
  writeln('Nombres de las dos escuelas con mayor cantidad de alumnos participantes',nom1,' Y ',nom2);
end.
{
9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.
}
program Hello;
type
    cadena30=string[30];
    candidato=record
         localidad:cadena30;
         apellido:cadena30;
         cantVotos:integer;
         cantVotantes:integer;
    end;
procedure leerCandidato(var c:candidato);
begin
  write('Ingrese la localidad:');
  readln(c.localidad);
  write('Ingrese el apellido:');
  readln(c.apellido);
  write('Ingrese la cantidad de votos:');
  readln(c.cantVotos);
  write('Ingrese la cantidad de votantes');
  readln(c.cantVotantes);
end;
procedure mayorCantVotos(cantVotos:integer;apellido:cadena30;var max:integer;maxApe:cadena30);
begin 
  if(cantVotos>max)then begin
    max:=cantVotos;
    maxApe:=apellido;
  end;
end;
function porcentaje(cantVotos:integer;totalVotos:integer):real;
begin
  porcentaje:=(cantVotos*100)/totalVotos;
end;
procedure mayorPorcentaje(porActual:real;apellido:cadena30;var maxP:real;var maxNom:cadena30);
begin
  if(porActual>maxP)then begin
    maxP:=porActual;
    maxNom:=apellido;
  end;
end;
var  
    can:candidato;
    max,cantTotalVotos:integer;
    maxP,porcentajeActual:real;
    maxApe,maxNom:cadena30;
begin
  max:=-1;
  maxP:=-1;
  cantTotalVotos:=0;
  repeat
    leerCandidato(can);
    cantTotalVotos:=cantTotalVotos+can.cantVotos;
    mayorCantVotos(can.cantVotos,can.apellido,max,maxApe);
    porcentajeActual:=porcentaje(can.cantVotos,cantTotalVotos);
    mayorPorcentaje(porcentajeActual,can.apellido,maxP,maxNom);
  until(can.localidad='Zarate');
  writeln('Intendente con mayor cantidad de votos:',maxApe);
  writeln('Intendente con mayor porcentaje de votos:',maxNom);
end.
{
10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países.
}
program CIUNLP;  
const   
  ESP=320;   
type
  cadena=string[50];
  rangoMeses=1..12;
  especie=record
    nombre:cadena;
    tiempo:rangoMeses;
    tipo:cadena;
    clima:cadena;
    pais:cadena;  
  end;          
procedure leer(var e:especie );
begin
  
  writeln('Ingrese el nombre cientifico');
  readln(e.nombre);
  writeln('Ingrese el tiempo promedio de vida, en meses');
  readln(e.tiempo);
  writeln('Ingrese tipo de planta ');
  readln(e.tipo);
  writeln('Ingrese el clima');
  readln(e.clima);
end;
procedure masPaises(cant:integer;var max:integer;var nomMax:cadena;nombre:cadena);
begin
  if(cant>max)then begin
    max:=cant;
    nomMax:=nombre;
  end;
end;
procedure menorCantPlanta(cantPlantas:integer;var min:integer;var tipoMin:cadena;tipo:cadena);
begin
  if(cantPlantas<min)then begin
    min:=cantPlantas;
    tipoMin:=tipo;
  end;
end;
procedure dosLongevas(var max1,max2:rangoMeses;tiempo:rangoMeses;var nom1,nom2:cadena;nombre:cadena);
begin
  if(tiempo>max1)then begin
    max2:=max1;
    max1:=tiempo;
    nom2:=nom1;
    nom1:=nombre;
  end
  else if(tiempo>max2)then begin
         max2:=tiempo;
         nom2:=nombre;
  end;
end;

var
  e:especie;
  i,cant,max,cantPlantas,min,cantVida:integer;
  nomMax,tipoActual,tipoMin,nom1,nom2:cadena;
  promedio:real;
  max1,max2:rangoMeses;
begin
  i:=1;
  cant:=0;
  max:=-1;min:=999;max1:=-1;nom1:='';
  leer(e);
  While(i<ESP)do begin
    tipoActual:=e.tipo;
    cantPlantas:=0;
    cantVida:=0;
    while(i<ESP)and(tipoActual=e.tipo)do begin
      cantPlantas:=cantPlantas+1;
      cantVida:=cantVida+e.tiempo;
      writeln('Ingrese el pais');
      readln(e.pais);
      while(e.pais<>'ZZZ')do begin
        cant:=cant+1;
        if(e.pais='Argentina')and(e.clima='subtropical')then
          writeln('Los nombres de las plantas de Argentina con clima subtropical',e.nombre);
        writeln('Ingrese el pais');
        readln(e.pais);
      end;
      i:=i+1;
      leer(e);
    end; 
    promedio:=cantVida/cantPlantas;
    masPaises(cant,max,nomMax,e.nombre);
    dosLongevas(max1,max2,e.tiempo,nom1,nom2,e.nombre);
    menorCantPlanta(cantPlantas,min,tipoMin,tipoActual);
    writeln('El tiempo promedio de vida',promedio:2:2);
  end;
  writeln('El nombre de la planta que se encuentra en más países',nomMax);
  writeln('El tipo de planta con menor cantidad de plantas',tipoMin);
  writeln('El nombre científico de las dos plantas más longevas',nom1,' y ',nom2);
end.
{
11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}
program aviones;
type
  cadena=string[30];
  vuelo=record
    cod:integer;
    paisS:cadena;
    destino:cadena;
    cantkm:real;
    ocupacion:real;
  end;
procedure leer(var v:vuelo);
begin
  writeln('Ingrese el codigo');
  readln(v.cod);
  if(v.cod<>44)then begin
    writeln('Ingrese el pais de salida');
    readln(v.paisS);
    writeln('Ingrese el pais de llegada');
    readln(v.destino);
    writeln('Ingrese la cant de km');
    readln(v.cantkm);
    writeln('Ingrese el porcentaje de ocupacion del avion');
    readln(v.ocupacion);
  end;
end;
procedure maximo(var max1,max2:real;var codMax1,codMax2:integer;kmTotal:real;codAct:integer);
begin
  if(kmTotal>max1)then begin
    max2:=max1;
    max1:=kmTotal;
    codMax2:=codMax1;
    codMax1:=codAct;
  end
  else if(kmTotal>max2)then begin
         max2:=kmTotal;
         codMax2:=codAct;
  end;
end;
procedure minimo(var min1,min2:real;var codMin1,codMin2:integer;kmTotal:real;codAct:integer);
begin
  if(kmTotal<min1)then begin
    min2:=min1;
    min1:=kmTotal;
    codMin2:=codMin1;
    codMin1:=codAct;
  end
  else if(kmTotal<min2)then begin
         min2:=kmTotal;
         codMin2:=codAct;
  end;
end;

function diferentes(paisAct,destino:cadena):boolean;
begin
  diferentes:=(paisAct<>destino);
end;

function masDeCincoMil(km:real;ocupacion:real):boolean;
begin
  masDeCincoMil:=(km>5000)and(ocupacion<60);
end;

function menosDeDiez(km:real;destino:cadena):boolean;
begin
  menosDeDiez:=(km<10000)and(destino='Australia')or(destino='Nueva Zelanda');
end;

var
  v:vuelo;
  codAct,codMax1,codMax2,codMin1,codMin2,cantCinco,cantDiez:integer;
  paisAct:cadena;
  max1,max2,min1,min2,kmTotal:real;
begin
  max1:=-1;min1:=9999;codMax1:=0;codMin1:=0;
  cantCinco:=0;cantDiez:=0;
  leer(v);
  while(v.cod<>44)do begin
    codAct:=v.cod;
    while(codAct=v.cod)do begin
      paisAct:=v.paisS;
      kmTotal:=kmTotal+v.cantkm;
      while(v.cod<>44)and(paisAct=v.paisS)do begin
        if(diferentes(paisAct,v.destino))then
          writeln('El avión que salió desde más países diferentes',codAct);
        if(masDeCincoMil(v.cantkm,v.ocupacion))then
          cantCinco:=cantCinco+1;
        if(menosDeDiez(v.cantkm,v.destino))then
          cantDiez:=cantDiez+1;
        leer(v);
      end;
    end;
    maximo(max1,max2,codMax1,codMax2,kmTotal,codAct);
    minimo(min1,min2,codMin1,codMin2,kmTotal,codAct);
  end;
  writeln('Los dos aviones que más kilómetros recorrieron',codMax1,' y ',codMax2);
  writeln('Los dos aviones que menos kilómetros recorrieron',codMin1,' y ',codMin2);
  writeln('La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión',cantCinco);
  writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda',cantDiez);
end.
