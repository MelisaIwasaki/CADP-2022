{
Una compañía aérea desea analizar la información de los tickets vendidos a sus clientes.La empresa cuenta con
1200 servicios de vuelos diferentes,en adelante denominamos "vuelo".
De cada ticket se conoce el código de vuelo(entre 1 y 1200),DNI del cliente,país de origen,país de destino,y 
el valor de ticket.La información de los ticket se dispone en una estructura de datos adecuada, y se encuentra
ordenada por el DNI del cliente(un cliente puede haber comprado más de un ticket en distintos vuelos).Realizar
un programa que procese la información de los tickets y calcule:
a)Cantidad de vuelos dentro de un mismo país que hayan tenido más de 50 pasajeros.
b)DNI del cliente que más dinero gastó en tickets.
c)Cantidad de clientes cuyo DNI terminen en 0 ó en 5.
}
program Hello;
const 
      max_vuelo=1200;
type
      tCodigoVuelo=1..1200;
      tNombrePais=string[20];
      vectorVuelos=array[tCodigoVuelo]of integer;
      rTicket=record
        codigoVuelo:tCodigoVuelo;
        DNIcliente:integer;
        paisOrigen:tNombrePais;
        paisDestino:tNombrePais;
        valorTicket:real;
      end;
      ListaTickets=^nodo;
      nodo=record
        dato:rTicket;
        sig:ListaTickets;
      end;
procedure inicializarContadorPorVuelo(var vec:vectorVuelos);
var i:integer;
begin
  for i:=1 to max_vuelo do
    vec[i]:=0;
end;
procedure incrementarContador(t:rTicket;var vec:vectorVuelos);
begin
  if(t.paisOrigen=t.paisDestino)then
    vec[t.codigoVuelo]:=vec[t.codigoVuelo]+1;
end;
procedure contarSiCumpleDNI(dni:integer;var cant:integer);
var dig:integer;
begin
  dig:=dni mod 10;
  if((dig=0)or(dig=5))then
    cant:=cant+1;
end;
procedure actualizarMaximo(DNI:integer;gasto:real;var MaxDni:integer;var maxGasto:real);
begin
  if(gasto>maxGasto)then begin
    MaxDni:=DNI;
    maxGasto:=gasto;
  end;
end;
procedure procesarTickets(L:ListaTickets;var vec:vectorVuelos;var MaxDni:integer;var cant:integer);
var maxGasto:real;gastos:real;DNIAct:integer;
begin
  cant:=0;
  maxGasto:=-1;
  while(L<>nil)do begin
    DNIAct:=L^.dato.DNIcliente;
    gastos:=0;
    while(L<>nil)and(DNIAct=L^.dato.DNIcliente)do begin
      incrementarContador(L^.dato,vec);
      gastos:=gastos+L^.dato.valorTicket;
      contarSiCumpleDNI(L^.dato.DNIcliente,cant);
      L:=L^.sig;
    end;
    actualizarMaximo(DNIAct,gastos,MaxDni,maxGasto);
  end;
end;
function cantVuelosSuperanPasajeros(valor:integer;vec:vectorVuelos):integer;
var cant,i:integer;
begin
  cant:=0;
  for i:=1 to max_vuelo do begin
    if(vec[i]>valor)then
      cant:=cant+1;
  end;
  cantVuelosSuperanPasajeros:=cant;
end;
var
    LTickets:ListaTickets;
    VVuelos:vectorVuelos;  //inciso a
    DNIMasGasto:integer;   //inciso b
    cantClientes:integer;  //inciso c
begin
  cargarTickets(LTickets); //se dispone
  inicializarContadorPorVuelo(VVuelos);
  procesarTickets(LTickets,VVuelos,DNIMasGasto,cantClientes);
  writeln(cantVuelosSuperanPasajeros(50,VVuelos));
  writeln('El DNI del cliente que mas gasto:',DNIMasGasto);
  writeln('La cantidad de clientes con DNI terminados en 0 o 5:',cantClientes);
end.

{
El servicio del comercio electrónico desea analizar las ventas de notebook durante la última edición del Hot Sale.
De cada notebook vendida se conoce:código de cliente,código de modelo(entre 1 y 200),marca y el medio de pago
utilizado (1:Crédito;2:Débito;3:Transferencia;4:Mercado Pago;5:Bitcoin;6:Otro).Además el servicio dispone de una 
tabla con el valor de venta de cada uno de los modelos de notebooks.
a)Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada.
La información se ingresa por teclado y debe almacenarse en el orden en que fué leída.La lectura finaliza cuando
se ingresa el código del cliente -1.
b)Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
i)Los dos medios de pagos que generaron el mayor monto total en ventas.
ii)Cantidad de notebooks de marca "Lenovo"vendidas a clientes cuyo código de cliente terminada con un dígito par. 
}
program Hello;
const
     MAX_FP=6;
     MAX_NOTEBOOK=200;
type
     tCodigoNotebook=1..MAX_NOTEBOOK;
     tFP=1..MAX_FP;
     stMarca=string[20];
     rVenta=record
       codCliente:integer;
       codigoNotebook:tCodigoNotebook;
       marca:stMarca;
       FP:tFP;
     end;
     listaVentas=^nodo;
     nodo=record
       dato:rVenta;
       sig:listaVentas;
     end;
     vectorPrecio=array[tCodigoNotebook]of real;
     vectorFP=array[tFP]of real;
procedure cargarInfoVentas(var L:listaVentas);
  procedure leerVenta(var v:rVenta);
  begin
    write('Ingrese codigo de cliente:');
    readln(v.codCliente);
    if(v.codCliente<>-1)then begin
      write('Ingrese codigo de modelo:');
      readln(v.codigoNotebook);
      write('Ingrese la marca:');
      readln(v.marca);
      write('Ingrese el medio de pago:');
      readln(v.FP);
    end;
  end;
  procedure agregarAtrasEnLista(var L,ult:listaVentas;v:rVenta);
  var nue:listaVentas;
  begin
    new(nue);
    nue^.dato:=v;
    nue^.sig:=nil;
    if(L=nil)then L:=nue
             else ult^.sig:=nue;
    ult:=nue;
  end;
var  v:rVenta;ult:listaVentas;
begin
  leerVenta(v);
  while(v.codCliente<>-1)do begin
    agregarAtrasEnLista(L,ult,v);
    leerVenta(v);
  end;
end;
procedure inicializar(var FP:vectorFP);
var i:integer;
begin
  for i:=1 to MAX_FP do begin
    FP[i]:=0;
  end;
end;
procedure procesarVentas(L:listaVentas;Precios:vectorPrecio;var FP:vectorFP;var cant:integer);
begin
  cant:=0;
  while(L<>nil)do begin
    FP[L^.dato.FP]:=FP[L^.dato.FP]+Precios[L^.dato.codigoNotebook];
    if(L^.dato.marca='Lenovo')and((L^.dato.codCliente mod 2 )=0)then
      cant:=cant+1;
    L:=L^.sig;
  end;
end;
procedure calcularDosMaximos(FP:vectorFP;var max1,max2:integer);
var cantMax1,cantMax2:real;
begin
  cantMax1:=-1;max1:=-1;
  for i:=1 to MAX_FP do begin
    if(FP[i]>cantMax1)then begin
      cantMax2:=cantMax1;
      max2:-max1;
      cantMax1:=FP[i];
      max1:=i;
    end
    else if(FP[i]>cantMax2)then begin
           cantMax2:=FP[i];
           max2:=i;
    end;
  end;
end;
var L:listaVentas;
    Precios:vectorPrecio;
    FP:=vectorFP;
    max1,max2,cant:integer;
begin
  cargarInfoVentas(L);
  inicializar(FP);
  cargarPrecios(Precios);//se dispone
  procesarVentas(L,Precios,FP,cant);
  calcularDosMaximos(FP,max1,max2);
  writeln('Los dos medios de pagos que generaron el mayor monto total en ventas:',max1,' y ',max2);
  writeln('Cantidad de notebooks de marca "Lenovo"vendidas a clientes cuyo código de cliente terminada con un dígito par:',cant);
end.

{
La FIFA está analizando la información de resultados en los 18 partidos del Mundial de fútbol Uruguay 30.
Para ello,dispone de una estructura de datos con información de los goles realizados en todos los partidos.
De cada gol se conoce el número del partido(entre 1 y 18) y el equipo que lo realizó.La información se 
encuentra ordenada por equipo.Realizar un programa que:
1- Invoque a un módulo que retorne información de los 18 partidos almacenada en una estructura adecuada.
De cada partido se conoce su número(entre 1 y 18),nombre del estadio donde se jugó y nombre de los equipos 
o paises que participaron.Esta información se ingresa por teclado, y se ingresa sin ningun orden en particular.
2- Invoque a un módulo que reciba la información de los goles y la información de los partidos e informe:
a)Cantidad de partidos con menos de 5 goles.
b)Nombre del equipo con mayor cantidad de goles realizados en el Estadio Centenario.
}
program Hello;
const 
     MAX_PARTIDOS=18;
type
     rangoPartidos=1..MAX_PARTIDOS;
     cadena20=string[20];
     registroGol=record
       partido:rangoPartidos;
       equipo:cadena20;
     end;
     lista=^nodo;
     nodo=record
       dato:registroGol;
       sig:lista;
     end;
     registroPartido=record
       partido=rangoPartidos;
       estadio:cadena20;
       equipo1:cadena20;
       equipo2:cadena20;
     end;
     vectorPartidos=array[rangoPartidos]of registroPartido;
     vectorContador=array[rangoPartidos]of integer;  //inciso2a
procedure leerPartido(var p:registroPartido);
begin
  write('Ingrese el numero de partido:');
  readln(p.partido);
  write('Ingrese nombre del estadio:');
  readln(p.estadio);
  write('Ingrese nombre del equipo1:');
  readln(p.equipo1);
  write('Ingrese nombre del equipo2:');
  readln(p.equipo2);
end;
procedure cargarPartidos(var v:vectorPartidos);
var i:rangoPartidos;p:registroPartido;
begin
  for i:=1 to MAX_PARTIDOS do begin
    leerPartido(p);
    v[partido]:=p;  //no se lee en el orden
  end;
end;
function pocosGoles(v:vectorContador);
var i:rangoPartidos;cant:integer;
begin
  cant:=0;
  for i:=1 to MAX_PARTIDOS do 
    if(v[i]<5)then 
      cant:=cant+1;
  pocosGoles:=cant;
end;
procedure procesarInformacion(L:lista;v:vectorPartidos);
var  goles:vectorContador;
     equipoActual,equipoMax:cadena20;
     golesActual,golesMax:integer;
     i:rangoPartidos;
begin
  for i:=1 to rangoPartidos do
    goles[i]:=0;
  golesMax:=-1;
  while(L<>nil)do begin
    golesActual:=0;
    equipoActual:=L^.dato.equipo;
    while(L<>nil)and(equipoActual=L^.dato.equipo)do begin
      goles[L^.dato.partido]:=goles[L^.dato.partido]+1;
      if(v[L^.dato.partido].estadio='Centenario')then
        golesActual:=golesActual+1;
      L:=L^.sig;
    end;
    if(golesActual>golesMax)then begin
      golesMax:=golesActual;
      equipoMax:=equipoActual;
    end;
  end;
  writeln('Cantidad de partidos con menos de 5 goles:',pocosGoles(goles);
  writeln('Nombre del equipo con mayor cantidad de goles realizados en el Estadio Centenario:',equipoMax);
end;
var  L:lista;
     v:vectorPartidos;
begin
  cargarGoles(L); //se dispone
  cargarPartidos(v);
  procesarInformacion(L,v);
end;

{
El comité organizador de torneo de fútbol Copa América 2021,está analizando la información de las entradas 
vendidas para los 38 partidos del torneo.Para ello,dispone de una estructura de datos con información de 
todas las ventas de entradas.De cada venta se conoce el código del partido(entre 1 y 38),código de cliente 
y la cantidad de entradas vendidas.Esta información no se encuentra ordenada por ningún criterio.
Realizar un programa que:
a)Invoque a un módulo que lea la información de los 38 partidos, y la almacene en una estructura de datos 
adecuada.De cada partido se conoce su código(entre 1 y 38),nombre del estadio donde se juega, la capacidad
máxima del estadio y la hora de inicio.Esta información se ingresa por teclado y se ingresa sin ningun 
orden en particular.
b)Invoque a un módulo que reciba la información de las ventas de entradas y la información de los partidos 
y retorne:
i)Una lista con los códigos de partidos que superan el 50% de la capacidad del estadio.
ii)Cantidad de ventas de menos de 5 entradas cuyo código de cliente termina entre 30 y 39.
}
program Hello;
const
      MAX_PARTIDOS=38;
type
      rangoPartidos=1..MAX_PARTIDOS;
      tventa=record
        partido:rangoPartidos;
        clientes:integer;
        cantEntradas:integer;
      end;
      lista=^nodo;
      nodo=record
        dato:tventa;
        sig:lista;
      end;
      tpartido=record
        codigo:rangoPartidos;
        estadio:string;
        capacidad:integer;
        horaInicio:string;
      end;
      vectorPartidos=array[rangoPartidos]of tpartido;
      vectorContador=array[rangoPartidos]of integer;
      listaCodigos=^registroCodigos;
      registroCodigos=record
            num:rangoPartidos;
            sig:^listaCodigos;
      end;
procedure leerPartido(var p:tpartido);
begin
  write('Ingrese el codigo:');
  readln(p.codigo);
  write('Ingrese el estadio:');
  readln(p.estadio);
  write('Ingrese el capacidad:');
  readln(p.capacidad);
  write('Ingrese el hora inicio:');
  readln(p.horaInicio);
end;
procedure cargarPartidos(var v:vectorPartidos);
var i:rangoPartidos;p:tpartido;
begin
  for i:=1 to MAX_PARTIDOS do begin
    leerPartido(p);
    v[p.codigo]:=p; //se ingresa sin ningun orden en particular
  end;
end;
procedure agregarAdelante(var L:listaCodigos;num:integer);
var nue:lista;
begin
  new(nue);
  nue^.dato:=num;
  nue^.sig:=L;
  L:=nue;
end;
procedure procesarVentas(L:lista;v:vectorPartidos;var codigos:listaCodigos;var cantVentas:integer);
var i:rangoPartidos;fin:integer;V2:vectorContador;
begin
  for i:=1 to MAX_PARTIDOS do 
    V2[i]:=0;
  cantVentas:=0;
  while(L<>nil)do begin
    V2[L^.dato.codigo]:=V2[L^.dato.codigo]+L^.dato.cantEntradas;
    fin:=L^.dato.cliente mod 100;
    if(fin >=30)and(fin<=39)then
      cantVentas:=cantVentas+1;
    L:=L^.sig;
  end;
  codigos:=nil;
  for i:=1 to MAX_PARTIDOS do  
    if(V2[i]>(v[i].capacidad/2))then
      agregarAdelante(codigos,i);
end;
var L:lista;
    v:vectorPartidos;
    L2:listaCodigos;
    cantVentas:integer;
begin
  cargarVentas(L);
  cargarPartidos(v);
  procesarVentas(L,v,L2,cantVentas);
end.

{
La FIFA está analizando la información de las entradas vendidas para los 52 partidos del Mundial de fútbol Italia
90.Para ello,dispone de una estructura de datos con información de todas las entradas vendidas.De cada entrada se 
conoce el número de partido(entre 1 y 52)y el país de origen del comprador.La información se encuentra ordenada
por el país de origen del comprador.
Realizar un programa que:
1)Invoque a un módulo que lea la información de los 52 partidos y la almacene en una estructura adecuada.De cada
partido se conoce su número(entre 1 y 52),nombre del estadio donde se jugó y nombre de los dos equipos que 
participaron.Esta información se ingresa por teclado y se ingresa sin ningun orden en particular.
2)Invoque a un módulo que reciba la información de las entradas y la información de los partidos e informe:
a)Cantidad de partidos con más de 30000 entradas vendidas.
b)Nombre del país con mayor cantidad de entradas adquiridas para partidos en los que no juega su equipo.
}
program Hello;
const  
      MAX_PARTIDOS=52;
type
      RangoPartidos=1..MAX_PARTIDOS;
      cadena20=string[20];
      tventa=record
        partido:RangoPartidos;
        pais:cadena20;
      end;
      lista=^nodo;
      nodo=record
        dato:tventa;
        sig:lista;
      end;
      tpartido=record
        codigo:RangoPartidos;
        estadio:cadena20;
        equipo1:cadena20;
        equipo2:cadena20;
      end;
      vectorPartidos=array[RangoPartidos]of tpartido;
      vectorContador=array[RangoPartidos]of integer;
procedure actualizarMaximos(paisActual:string;cant:integer;var paisMax:cadena20;var max:integer);
begin
  if(cant>max)then begin
    max:=cant;
    paisMax:=paisActual;
  end;
end;
function muchasVentas(V2:vectorContador):integer;
var i:RangoPartidos;cantMas30mil:integer;
begin
  cantMas30mil:=0;
  for i:=1 to MAX_PARTIDOS do 
    if(V2[i]>30000)then
      cantMas30mil:=cantMas30mil+1;
  muchasVentas:=cantMas30mil;
end;
procedure procesarVentas(L:lista;v:vectorPartidos);
var i:RangoPartidos;
    V2:vectorContador;
    paisActual,paisMax:cadena20;
    entradasPaisActual,entradasPaisMax:integer;
begin
  for i:=1 to MAX_PARTIDOS do 
    V2[i]:=0;
  entradasPaisMax:=-1;
  while(L<>nil)do begin
    paisActual:=L^.dato.pais;
    entradasPaisActual:=0;
    while(L<>nil)and(paisActual=L^.dato.pais)do begin
      V2[L^.dato.codigo]:=V2[L^.dato.codigo]+1;
      if(L^.dato.pais<>v[L^.dato.codigo].equipo1)and(L^.dato.pais<>v[L^.dato.codigo].equipo2)then
        entradasPaisActual:=entradasPaisActual+1;
      L:=L^.sig;
    end;
    actualizarMaximos(paisActual,entradasPaisActual,paisMax,entradasPaisMax);
  end;
  writeln('Cantidad de partidos con más de 30000 entradas vendidas',muchasVentas(V2));
  writeln('Nombre del país con mayor cantidad de entradas adquiridas para partidos en los que no juega su equipo',paisMax);
end;
var L:lista;
    v:vectorPartidos;
begin
  cargarVenta(L); //se dispone
  cargarPartidos(v);
  procesarVentas(L,v);
end.

{
Un criadero de conejos está analizando ciclos de reproducción.El criadero cuenta con conejas reproductoras y
dispone de una estructura que contiene, para cada coneja, su código,año de nacimiento,nombre,cantidad de partos
(entre 1 y 10)y cantidad de crías que tuvo en cada parto.
a)Realice un módulo que reciba la información de las conejas y retorne en una estructura adecuada el código,el
nombre y el año de nacimiento de las conejas que tuvieron en promedio más de 5 crías por parto.
b)Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par,
nacidas antes del año 2016.
c)Realice una función que reciba la información de las conejas y un código de coneja, y retorne la cantidad
máxima de crías que tuvo la coneja con dicho código en alguno de sus partos(retornar -1 si la coneja no se 
encuentra en la estructura).
}
program Hello;
const 
      MAX_PARTOS=10;
type
      vector_crias=array[1..MAX_PARTOS]of integer;
      cadena20=string[20];
      coneja=record
        codigo:integer;
        anioNac:integer;
        nombre:cadena20;
        cantPartos:integer;
        crias:vector_crias;
      end;
      lista=^nodo;
      nodo=record
        dato:coneja;
        sig:lista;
      end;
      coneja2=record
        codigo:integer;
        nombre:cadena20;
        anioNac:integer;
      end;
      lista2=^nodo2;
      nodo2=record
        dato:coneja2;
        sig:lista2;
      end;
function promedio(c:coneja):real;
var  i,suma:integer;
begin
  suma:=0;
  for i:=1 to cantPartos do 
    suma:=suma+c.crias[i];
  promedio:=suma/c.cantPartos;
end;
procedure generarLista(L:lista;var L2:lista2);
begin
  L2:=nil;
  while(L<>nil)do begin
    if(promedio(L^.dato)>5)then
      agregarAdelante(L2,L^.dato.codigo,L^.dato.anioNac,L^.dato.nombre);
    L:=L^.sig;
  end;
end;
procedure imprimirConejas(L:lista2);
begin
  while(L<>nil)do begin
    if(L^.dato.codigo mod 2= 0)and(L^.dato.anioNac<2016)then
      writeln(L^.dato.nombre);
    L:=L^.sig;
  end;
end;
function maxCrias(L:lista;cod:integer):integer;
var i,max:integer;
begin
  while(L<>nil)and(L^.dato.codigo<>cod)do 
    L:=L^.sig;
  max:=-1;
  if(L<>nil)then  //encontre la coneja
    max:=maximo(L^.dato.crias,L^.dato.cantPartos);
  maxCrias:=max;
end;
function maximo(V:vector_crias,dimL:integer):integer;
var i,max:integer;
begin
  max:=-1;
  for i:=1 to dimL do 
    if(v[i]>max)then
      max:=v[i];
  maximo:=max;
end;

{
Un criadero de cerdo dispone de información sobre los partos registrados.De cada parto se conoce año,código de la
madre(entre 200 y 599) y cantidad de crías paridas.Una madre puede parir más de una vez.
a)Realice un módulo que lea la información de las 400 madres y la almacene en una estructura adecuada.De cada 
madre se lee:código,año de nacimiento y raza.La información se ingresa sin orden.
b)Realice un módulo que reciba la información de partos,la información de la madre y un código de madre, y 
retorne en una estructura adecuada la información de todos los partos de dicha madre, en los que hayan parido al
menos 4 crías y en los que la madre tenía al menos 2 años al momento del parto.La estructura debe quedar ordenada
por cantidad de crías del parto.
c)Realice un módulo que reciba la información de partos generada en b) e informe el promedio de crías por parto
de dicha madre.
}
program Hello;
const  
      min=200;
      max=599;
type
      rango=min..max;
      parto=record
        anio:integer;
        madres:rango;
        crias:integer;
      end;
      lista=^nodo;
      nodo=record
        dato:parto;
        sig:lista;
      end;
      madre=record
        codigo:rango;
        anioNac:integer;
        raza:string;
      end;
      vector=array[rango]of madre;
procedure leerMadre(var m:madre);
begin
  write('Ingrese el codigo:');
  readln(m.codigo);
  write('Ingrese el anio de nacimiento:');
  readln(m.anioNac);
  write('Ingrese la raza:');
  readln(m.raza);
end;
procedure cargarMadres(var v:vector);
var m:madre;i:integer;
begin
  for i:=min to max do begin
    leerMadre(m);
    v[m.codigo]:=m;
end;
function cumpleCondicion(p:parto;m:madre):boolean;
begin
  cumpleCondicion:=(p.crias>=4)and(p.anio-m.anioNac>=2);
end;
procedure buscarPartos(L:lista;v:vector;cod:string;var L2:lista);
begin
  L2:=nil;
  while(L<>nil)do begin
    if(cumpleCondicion(L^.dato,v[L^.dato.madre]))then
      insertarOrdendado(L2,L^.dato);
    L:=L^.sig;
  end;
end;
function promedio(L:lista):real;  //inciso c
var  cantPartos,cantCrias:integer;
begin
  cantPartos:=0;
  cantCrias:=0;
  while(L<>nil)do begin
    cantPartos:=cantPartos+1;
    cantCrias:=cantCrias+crias;
    L:=L^.sig;
  end;
  promedio:=cantCrias/cantPartos;
end;

