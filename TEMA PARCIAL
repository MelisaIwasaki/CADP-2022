{
La plataforma YouTube está analizando algunos de sus principales canales de video.Para eso YouTube cuenta con
una tablacon el nombre de las 60 categorías que utilizan para clasificar los videos(música,educación y ciencia,
hogar,deportes,etc).De cada video se conoce su título,nombre del canal donde fué publicado, duración en segundos,
año de publicación,cantidades de visualizaciones y el código de categoría a la que pertenece el video(1..60).
Realizar un programa que:
A)Invoque a un módulo.Que lea la información de los videos hasta ingresar un video de duración -1(que no debe 
procesarse)y devuelva en una estructura de datos adecuada para el canal "Paulina Cocina",la siguiente información:
-Nombre de canal de videos publicados.
-Cantidad total de visualizaciones entre todos los videos.
-Detalle del título,nombre de la categoría y duración de todos los videos con más de 1000 visualizaciones.
B)Invoque a un módulo que reciba a estructura generada en A) e imprima nombre del canal y el título de cada 
video con más de 1000 visualizaciones.
}
program Hello;
const 
      cantCategorias=60;
type  
      rangoCategorias=1..cantCategorias;
      cadena20=string[20];
      categorias=array[rangoCategorias]of cadena20;
      videoYouTube=record
        titulo:cadena20;
        canal:cadena20;
        duracion:integer;
        anioPublicacion:integer;
        cantVisualizaciones:integer;
        categoria:rangoCategorias;
      end;
      videoCanal=record
        titulo:cadena20;
        categoria:cadena20;
        duracion:integer;
      end;
      lista=^nodo;
      nodo=record
        dato:videoCanal;
        sig:lista;
      end;
      canal=record
        nombre:cadena20;
        anioMasReciente:integer;
        cantVideos:integer;
        cantVisualizaciones:integer;
        videos:lista;
      end;
procedure leerVideo(var v:videoYouTube);
begin
  write('Ingrese duracion del video:');
  readln(v.duracion);
  if(v.duracion<>-1)then begin
    write('Ingrese el titulo:');
    readln(v.titulo);
    write('Ingrese el canal:');
    readln(v.canal);
    write('Ingrese el anio de publicacion:');
    readln(v.anioPublicacion);
    write('Ingrese cantidad de viasualizaciones:');
    readln(v.cantVisualizaciones);
    write('Ingrese la categoria:');
    readln(v.categoria);
  end;
end;
procedure agregarAdelante(dato:videoCanal;var L:lista);
var nue:lista;
begin
  new(nue);
  nue^.dato:=dato;
  nue^.sig:=L;
  L:=nue;
end;
procedure armarVideoCanal(v:videoYouTube;var vc:videoCanal;cat:categorias);
begin
  vc.titulo:=v.titulo;
  vc.categoria:=cat[v.categoria];
  vc.duracion:=v.duracion;
end;
procedure inicializarCanal(nombreCanal:cadena20;var datos:canal);
begin
  datos.nombre:=nombreCanal;
  datos.anioMasReciente:=-1;
  datos.cantVideos:=0;
  datos.cantVisualizaciones:=0;
  datos.videos:=nil;
end;
procedure armarCanal(nombre:cadena20;var datos:canal;c:categorias);
var v:videoYouTube;vc:videoCanal;L:lista;
begin
  inicializarCanal(nombre,datos);
  leerVideo(v);
  while(v.duracion<>-1)do begin
    if(v.canal=nombre)then begin
      datos.cantVideos:=datos.cantVideos+1;
      datos.cantVisualizaciones:=datos.cantVisualizaciones+v.cantVisualizaciones;
      if(v.anioPublicacion>datos.anioMasReciente)then
        datos.anioMasReciente:=v.anioPublicacion;
        if(v.cantVisualizaciones>1000)then begin
          armarVideoCanal(v,vc,c);
          agregarAdelante(vc,L);
        end;
    end;
    leerVideo(v);
  end;
end;
procedure imprimirCanal(nombre:cadena20;L:lista);
begin
  writeln(nombre);
  while(L<>nil)do begin 
    writeln(L^.dato.titulo);
    L:=L^.sig;
  end;
end;
var   datos:canal;
      cat:categorias;
      L:lista;
begin
  //inicializarCategorias(cat)  //se dispone
  armarCanal('Paulina Cocina',datos,cat);
  imprimirCanal(datos.nombre,dato.videos);
end.

{
Una consesionaria de la ciudad de La Plata necesita un programa para administrar información de ventas de autos 
efectuadas en Febrero de 2020.Para ello se debe leer la información de ventas realizadas.De cada venta se lee
su código de venta, modelo de auto,DNI del cliente al que se vendió el auto,el día de la venta(1..28).La 
información de la venta se lee de manera ordenada por modelo de auto y finaliza cuando se ingresa el modelo
'ZZZ'(que no debe procesarse).Se pide:
- Generar una estructura que contenga,para cada modelo de auto la cantidad de veces que fué vendido.Esta 
estructura debe quedar ordenada por modelo de auto.
- Calcular e informar el día del mes en que se realizaron más ventas a cliente con DNI impar.
- Calcular e informar el porcentaje de ventas con código par.
}
program Hello;
type
     rango_dia=1..28;
     cadena20=string[20];
     venta=record
       cod_venta:integer;
       modelo:cadena20;
       dni:integer;
       dia:rango_dia;
     end;
     venta_modelo=record
       modelo:cadena20;
       cantidad:integer;
     end;
     lista=^nodo;
     nodo=record
       dato:venta_modelo;
       sig:lista;
     end;
     vector_dias=array[rango_dia]of integer;
procedure inicializar_vector(var v:vector_dias);
var i:rango_dia;
begin
  for i:=1 to 28 do 
    v[i]:=0;
end;
procedure leer_Venta(var vent:venta);
begin
  write('Ingrese modelo:');
  readln(vent.modelo);
  if(vent.modelo<>'ZZZ')then begin
    write('Ingrese codigo de venta:');
    readln(vent.cod_venta);
    write('Ingrese DNI:');
    readln(vent.dni);
    write('Ingrese dia:');
    readln(vent.dia);
  end;
end;
procedure insertar(var L:lista;var ult:lista;vent_modelo:venta_modelo);
var aux:lista;
begin
  new(aux);
  aux^.dato:=vent_modelo;
  aux^.sig:=nil;
  if(L=nil)then  
    L:=aux
  else
    ult^.sig:=aux;
  ult:=aux;
end;
function es_par(dni:integer):boolean;
begin
  es_par:=((dni mod 2)=0);
end;
procedure procesar_ventas(var L:lista;var porcentaje:real;var v:vector_dias);
var
  cant_total:integer;
  cant_par:integer;
  vent:venta;
  vent_mod:venta_modelo;
  ult:lista;
begin
  cant_total:=0;
  cant_par:=0;
  leer_Venta(vent);
  while(vent.modelo<>'ZZZ')do begin
    vent_mod.modelo:=vent.modelo;
    vent_mod.cantidad:=0;
    while((vent.modelo<>'ZZZ')and(vent.modelo=vent_mod.modelo))do begin
      cant_total:=cant_total+1;
      vent_mod.cantidad:=vent_mod.cantidad+1;
      if(es_par(vent.cod_venta))then
        cant_par:=cant_par+1;
      if(es_par(vent.dni))then
        v[vent.dia]:=v[vent.dia]+1;
      leer_Venta(vent);
    end;
    insertar(L,ult,vent_mod);
  end;
  porcentaje:=(cant_par*100)/cant_total;
end;
procedure calcular_maximo(v:vector_dias;var dia_max:rango_dia);
var i,max:integer;
begin
  max:=0;
  for i:=1 to 28 do begin
    if(v[i]>max)then begin
      max:=v[i];
      dia_max:=i;
    end;
  end;
end;
var  L:lista;
     v:vector_dias;
     porcentaje:real;
     dia_max_venta:rango_dia;
begin
  L:=nil;
  inicializar_vector(v);
  procesar_ventas(L,porcentaje,v);
  calcular_maximo(v,dia_max_venta);
  writeln('El dia del mes en que se realizaron mas ventas a clientes con DNI impar es el:',dia_max_venta);
  writeln('El porcentaje de ventas con codigo par es:',porcentaje:2:2);
end.

{
Un centro de estética ofrece 12 planes para sus clientes:ozonoterepia,cama solar,spa,depilación,tratamientos 
antiarrugas,etc.Cada plan posee un código(1..12),un costo y una cantidad de sesiones.Se dispone de una estructura
con esta información.El centro de estética posee como máximo 90000 clientes.Realizar un programa que lea la 
información de clientes del centro de estética.De cada cliente se lee:nombre,DNI,ciudad de origen,código de plan
contratado,y si ya finalizó el tratamiento.La información de los clientes finaliza al ingresar al cliente
'Mirtha Legrand'con DNI 2320718(que debe procesarse)o al alcanzarse el máximo de clientes.Una vez leída y 
almacenada la información,procesar los datos para:
1)Informar la ganancia del centro para cada tipo de plan(incluyendo tratamientos finalizados y no finalizados).
2)Almacenar en una lista todos los datos de los clientes cuyo tratamientos aún no han finalizados.
}
program Hello;
const
      maxPlanes=12;
      maxClientes=90000;
type  
      CodPlanes=1..maxPlanes;
      cadena30=string[30];
      plan=record
        costo:real;
        cantS:integer;
      end;
      planes=array[CodPlanes]of plan;
      cliente=record
        nomape:cadena30;
        dni:integer;
        ciudad:cadena30;
        codigoP:CodPlanes;
        finalizado:boolean;
      end;
      clientes=array[1..maxClientes]of cliente;
      ganancias=array[CodPlanes]of real;
      lista=^nodo;
      nodo=record
        dato:cliente;
        sig:lista;
      end;
procedure leerCliente(var c:cliente);
var aux:string[1];
begin
  write('Ingrese S para finalizado,ingrese N para no finalizado:');
  readln(aux);
  write('Ingrese el nombre:');
  readln(c.nomape);
  write('Ingrese el DNI:');
  readln(c.dni);
  write('Ingrese el ciudad:');
  readln(c.ciudad);
  write('Ingrese el codigo de plan contratado:');
  readln(c.codigoP);
  c.finalizado:=(aux='S');
end;
procedure cargarClientes(var vc:clientes;var dimL:integer);
var c:cliente;
begin
  repeat
    leerCliente(c);
    dimL:=dimL+1;
    vc[dimL]:=c;
  until(c.nomape='Mirtha Legrand')and(c.dni=2320)or(dimL=maxClientes);
end;
procedure inicializarVector(var vg:ganancias);
var i:integer;
begin
  for i:=1 to maxPlanes do
    vg[i]:=0;
end;
procedure agregarCliente(c:cliente;var L:lista);
var nue:lista;
begin
  new(nue);
  nue^.dato:=c;
  nue^.sig:=L;
  L:=nue;
end;
procedure informarGanancias(vg:ganancias);
var i:integer;
begin
  for i:=1 to maxPlanes do
    writeln('La ganancia del plan ',i,' es:',vg[i]);
end;
procedure procesarClientes(var L:lista; var vg:ganancias;vc:clientes;vp:planes;dimL:integer);
var i:integer;
begin
  inicializarVector(vg);
  for i:=1 to dimL do begin
    //if(vc[i].finalizado)then
      vg[vc[i].codigoP]:=vg[vc[i].codigoP]+vp[vc[i].codigoP].costo;
      if(vc[i].finalizado )then
        agregarCliente(vc[i],L);
  end;
end;
var
     L:lista;
     vp:planes;
     vg:ganancias;
     vc:clientes;
     dimL:integer;
begin
  L:=nil;
  dimL:=0;
  cargarPlanes(vp); //se dispone
  cargarClientes(vc,dimL);
  procesarClientes(L,vg,vc,vp,dimL);
  informarGanancias(vg);
end.

{
Una empresa de logística desea procesar información de los envíos que debe realizar.Para ello dispone de una 
estructura con información de cada paquete.De cada paquete se conoce:nombre de la localidad del destino y 
tipo de pauqete a enviar(1:encomienda común;2:encomienda express;3:encomienda frágil;4:certificado).
Esta estructura se encuentra ordenada por nombre de la localidad del destino y puede existir mas de un envío 
por localidad.Se solicita calcular e informar:
La localidad en la cual se debe entregar la mayor cantidad de paquetes.
La cantidad a enviar de cada tipo de paquete.
}
program Hello;
const max_tipoPaquete=4;
type
      cadena30=strig[30];
      tipoPaquete=1..max_tipoPaquete;
      paquete=record
        nomLocalidad:cadena30;
        tipo:tipoPaquete;
      end;
      lista=^nodo;
      nodo=record
        dato:paquete;
        sig:lista;
      end;
      vector=array[tipoPaquete]of integer;
procedure inicializarVector(var v:vector);
var i:tipoPaquete;
begin
  for i:=1 to max_tipoPaquete do 
    v[i]:=0;
end;
procedure procesarLista(L:lista;var v:vector);
var locActual:cadena30;cantPaquete:integer;
begin
  while(L<>nil)do begin
    locActual:=L^.dato.nomLocalidad;
    cantPaquete:=0;
    while(L<>nil)and(locActual=L^.dato.nomLocalidad)do begin    
      cantPaquete:=cantPaquete+1;
      v[L^.dato.tipo]:=v[L^.dato.tipo]+1;
      L:=L^.sig;
    end;
    writeln('La cantidad de paquetes que se enviaran a ',locActual,' es ',cantPaquete);
end;
function max_tipo(v:vector):tipoPaquete;
var i,max:tipoPaquete;cant_max:integer;
begin
  cant_max:=-1;
  for i:=1 to max_tipoPaquete do 
    if(v[i]>cant_max)then begin
      cant_max:=v[i];
      max:=i;
    end;
  max_tipo:=max;
end;
var v:vector;
    L:lista;
begin
  cargarLista(L);//se dispone
  inicializarVector(v);
  procesarLista(L,v);
  writeln('El tipo de paquete que mas se va enviar es:',max_tipo(V));
end.

{
Una constructora dispone de información sobre los 3500 departamentos construidos.De cada departamento se conoce
su superficie en metros cuadrados,el monto invertido en dólares y la localidad donde se contruyó.La información
se encuentra ordenada por localidad.Se pide:
Generar una lista con todos los departamentos de más de 75m2.
Informar el monto total invertido por cada localidad.
}

program Hello;
const totalDeptos=3500;
type
      cadena20=string[20];
      rango=1..totalDeptos;
      depto=record
        superficie:real;
        monto:real;
        localidad:cadena20;
      end;
      departamentos=array[rango]of depto;
      lista=^nodo;
      nodo=record
        dato:depto;
        sig:lista;
      end;
procedure agregarDepto(var L:lista;d:depto);
var nue:lista;
begin
  new(nue);
  nue^.dato:=d;
  nue^.sig:=L;
  L:=nue;
end;
procedure procesarDepartamentos(v:departamentos;var L:lista);
var  i:integer;monto:real;locActual:cadena20;
begin
  i:=1;
  while(i<=3500)do begin
    locActual:=v[i].localidad;
    monto:=0;
    while((i<=3500)and(locActual=v[i].localidad))do begin
      if(v[i].superficie>75)then
        agregarDepto(L,v[i]);
      monto:=monto+v[i].monto;
      i:=i+1;
    end;
    writeln('El monto total inertido de la localidad ',locActual,' es de:',monto);
  end;
end;
var  L:lista;
     v:departamentos;
begin
  L:=nil;
  CargarDepartaentosOrdenados(v);//se dispone
  procesarDepartamentos(v,L);
end.
