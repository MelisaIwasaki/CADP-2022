{
1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un 
valor n y retorne si n se encuentra en el vector o no. 
}
program Hello;
const dimF=5;//500 valores
type  vector=array[1..dimF]of integer;

function buscar( v:vector;dimL:integer;n:integer):boolean;
var pos:integer;esta:boolean;
begin
  pos:=1;
  esta:=false;
  while (pos<=dimL)and(not esta)do begin
    if(v[pos]=n)then
      esta:=true;
    else
      pos:=pos+1;
  end;
  buscar:=esta;
end;
var v:vector;
    n,dimL:integer;
begin
  write('Ingrese el valor a buscar:');
  readln(n);
  if(buscar(v,dimL,n))then
    writeln('Se ha encontrado el elemento ',n);
  else
    writeln('No se ha encontrado el elemento ',n);
end.
{
1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un 
valor n y retorne si n se encuentra en el vector o no. 
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera 
ascendente.
}
program Hello;
const dimF=5;//500 valores
type  vector=array[1..dimF]of integer;

function buscar( v:vector;dimL:integer;n:integer):boolean;
var pos:integer;
begin
  pos:=1;
  while (pos<=dimL)and(v[pos]<n)do begin
    pos:=pos+1;
    if(pos<=dimL)and(v[pos]=n)then
      buscar:=true;
    else
      buscar:=false;
  end;
end;
var v:vector;
    n,dimL:integer;
begin
  write('Ingrese el valor a buscar:');
  readln(n);
  if(buscar(v,dimL,n))then
    writeln('Se ha encontrado el elemento ',n);
  else
    writeln('No se ha encontrado el elemento ',n);
end.
{
2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza 
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}
program Hello;
const dimF=5;            //500
type cadena50=string[50];
     valumnos=array[1..dimF]of cadena50;
     
procedure leerAlumnos(var alumno:cadena50);
begin
  write('Ingrese el nombre del alumno:');
  readln(alumno);
end;
procedure cargarAlumnos(var v:valumnos;var dimL:integer);
var a:cadena50;
begin
  dimL:=0;
  leerAlumnos(a);
  while(dimL<dimF)and(a<>'ZZZ')do begin
    dimL:=dimL+1;
    v[dimL]:=a;
    leerAlumnos(a);
  end;
end;
procedure borrar(var v:valumnos;var dimL:integer;var ok:boolean);
var nom:cadena50;pos, i:integer;
begin
  pos:=1; 
  ok:=false;
  write('Ingrese el nombre que desea borrar:');
  readln(nom);
  while(pos<=dimL)and(not ok)do begin
    if(v[pos]=nom)then begin
      for i:=pos to (dimL-1)do
        v[i]:=v[i+1];
      ok:=true;
      dimL:=dimL-1;
    end
    else pos:=pos+1;
  end;
end;
procedure insertar(var v:valumnos;var dimL:integer;var ok:boolean);
var nom:cadena50;i:integer;
begin
  ok:=false;
  write('Ingrese el nombre que desea insertar en la posicion 4:');
  readln(nom);
  if((dimL+1)<=dimF)then begin
    for i:=dimL downto 4 do
      v[i+1]:=v[i];
    ok:=true;
    v[4]:=nom;
    dimL:=dimL+1;
  end;
end;
procedure agregar(var v:valumnos;var dimL:integer;var ok:boolean);
var nom:cadena50;
begin
  ok:=false;
  write('Ingrese el nombre que desea agregar:');
  readln(nom);
  if((dimL+1)<=dimF)then begin
    ok:=true;
    dimL:=dimL+1;
    v[dimL]:=nom;
  end;
end;
procedure imprimir(v:valumnos,dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do
    writeln('Posicion ',i ,' : ' v[i]);
end;
var v:valumnos;
    dimL:integer;
    ok:boolean;
begin
  cargarAlumnos(v,dimL);
  borrar(v,dimL,ok);
  insertar(v,dimL,ok);
  agregar(v,dimL,ok);
  imprimir(v,dimL);
end.
{
3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, 
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta 
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida 
por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza 
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida 
sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}
program caudales;
const
  dimF=200;
type
  rango=1..31;
  viaje=record
    dia:rango;
    monto:real;
    distancia:real;
  end;
  vector=array[1..dimF]of viaje;
  vcont=array[rango]of integer;
procedure inicializar(var vc:vcont);
var i:rango;
begin
  for i:=1 to 31 do 
    vc[i]:=0;
end;
procedure leer(var v:viaje);
begin
  writeln('Ingrese la distancia en km');
  readln(v.distancia);
  if(v.distancia<>0)then begin
   writeln('Ingrese el dia del viaje');
   readln(v.dia);
   writeln('Ingrese el monto');
   readln(v.monto);
  end;
end;
procedure cargar(var v:vector;var dimL:integer);
var via:viaje;
begin
  leer(via);
  while(via.distancia<>0)and(dimL<dimF)do begin
    dimL:=dimL+1;
    v[dimL]:=via;
    leer(via);
  end;
end;
procedure mostrarVector(v:vector;dimL:integer);
var i:integer;
begin
  for i:= 1 to dimL do
    writeln('Dia:',v[i].dia,' monto:',v[i].monto:2:2,' distancia:',v[i].distancia:2:2);
end;
procedure minimo(monto:real;distancia:real;dia:rango;var min:real;var minDia:rango;var minDist:real);
begin
  if(monto<min)then begin
    min:=monto;
    minDia:=dia;
    minDist:=distancia;
  end;
end;
procedure recorrer(v:vector;dimL:integer;var vc:vcont);
var i:integer;montoTotal:real;promedio:real;min,minDist:real;minDia:rango;
begin
  montoTotal:=0;
  min:=9999;
  for i:=1 to dimL do begin
    montoTotal:=montoTotal+v[i].monto;
    minimo(v[i].monto,v[i].distancia,v[i].dia,min,minDia,minDist);
    vc[v[i].dia]:=vc[v[i].dia]+1;
    borrar(v,dimL);
  end;
  promedio:=montoTotal/dimL;
  writeln('El monto promedio transportado de los viajes realizados',promedio:2:2);
  writeln('La distancia y el día en que se realizó el viaje que transportó menos dinero',minDist:2:2,' ',minDia);
end;
procedure informar(vc:vcont);
var i:integer;
begin
  for i:=1 to 31 do 
    writeln('La cantidad de viajes realizados el dia:',i,' : ',vc[i]);
end;
procedure borrar(var v:vector;var dimL:integer);
var i:integer;
begin
  for i:=1 to dimL-1 do begin
    if(v[i].distancia=100)then begin
      v[i]:=v[i+1];
      dimL:=dimL-1;
    end;
  end;
end;
var
  v:vector;
  vc:vcont;
  dimL:integer;
begin
  dimL:=0;
  inicializar(vc);
  cargar(v,dimL);
  mostrarVector(v,dimL);  //para ver si se cargo en el vector
  recorrer(v,dimL,vc);
  informar(vc);
  mostrarVector(v,dimL);  //para verificar si se borro km=100
END. 
{
4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de 
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por 
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El 
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. 
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con 
datos leídos de teclado.
}
program catedra;
const
  dimF=1000;
type
  cadena=string[60];
  alumno=record
    num:integer;
    apeYnom:cadena;
    asistencia:integer;
  end;
  vector=array[1..dimF]of alumno;
procedure leer(var a:alumno);
begin
  writeln('Ingrese numero');
  readln(a.num);
  if(a.num<>0)then begin
   writeln('Ingrese apellido y nombre');
   readln(a.apeYnom);
   writeln('Ingrese la cantidad de asistencia');
   readln(a.asistencia);
  end;
end;
procedure cargar(var v:vector;var dimL:integer);
var a:alumno;
begin
  dimL:=0;
  leer(a);
  while(dimL<dimF)and(a.num<>0)do begin
    dimL:=dimL+1;
    v[dimL]:=a;
    leer(a);
  end;
end;
procedure mostrar(v:vector;dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do 
    writeln('Numero:',v[i].num,'Ape y nom:',v[i].apeYnom,'asistencia:',v[i].asistencia);
end;
function buscar(numero:integer;v:vector;dimL:integer):integer;
var pos:integer;
begin
  pos:=1;
  while(pos<=dimL)and(v[pos].num<numero)do begin
    pos:=pos+1;
    if(pos<=dimL)and(v[pos].num=numero)then
      buscar:=pos
    else
      buscar:=-1;
  end;
end;
procedure insertar(var v:vector;var dimL:integer;alu:alumno;pos:integer;var exito:boolean);
var i:integer;
begin
  exito:=false;
  if(dimL<dimF)and(pos>=1)and(pos<=dimL)then begin
    exito:=true;
    for i:=dimL downto pos do
      v[i+1]:=v[i];
    v[pos]:=alu;
    dimL:=dimL+1;
  end;
end;
procedure borrar(var v:vector;var dimL:integer;pos:integer;var exito:boolean);
var i:integer;
begin
  exito:=false;
  if(pos>=1)and(pos<=dimL)then begin
    exito:=true;
    for i:=pos+1 to dimL do
      v[i-1]:=v[i];
    dimL:=dimL-1;
  end;
end;
procedure borrarAlu(var v:vector;var dimL:integer;num:integer;var exito:boolean);
var pos:integer;
begin
  exito:=false;
  pos:=buscar(num,v,dimL);
  if(pos<>0)then
    borrar(v,dimL,pos,exito);
end;
procedure borrarAsist0(var v:vector;var dimL:integer;var exito:boolean);
var i:integer;
begin
  for i:=1 to dimL do begin
    if(v[i].asistencia=0)then begin
      borrarAlu(v,dimL,v[i].num,exito);
      if(exito)then
      writeln('Se borro el alumno:',v[i].num,' con asistencia 0');
    end;
  end;
end;
var
  v:vector;
  a:alumno;
  numero,dimL,pos,posBorrar,numAlu:integer;
  exito:boolean;
begin
  cargar(v,dimL);
  mostrar(v,dimL);
  writeln('Ingrese el numero a buscar');
  readln(numero);
  pos:=buscar(numero,v,dimL);
  writeln('El numero buscado esta en la posicion:',pos);
  writeln('Ingrese el alumno a insertar');
  leer(a);
  insertar(v,dimL,a,pos,exito);
  if(exito)then
    writeln('Se inserto con exito');
  writeln('Ingrese la posicion del alumno a eliminar');
  readln(posBorrar);
  borrar(v,dimL,posBorrar,exito);
  if(exito)then
    writeln('Se borro con exito');
  writeln('Ingrese un numero de alumno a eliminar');
  readln(numAlu);
  borrarAlu(v,dimL,numAlu,exito);
  if(exito)then
    writeln('Se borro el alumno:',numAlu);
  borrarAsist0(v,dimL,exito);
end.
{
5) La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más 
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo 
(entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual 
acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos 
primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una 
vez almacenados los datos, procesar dicha estructura para obtener:
1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
2) Cantidad de clientes para cada categoría de monotributo
3) Código de las 10 ciudades con mayor cantidad de clientes
4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
}  
program amazon;   
const
  dimF=3;  //500;
type
  rangoCate='A'..'F';
  rangoCod=1..2400;
  rangoDia=1..31;
  rangoMes=1..12;
  rangoAnio=2000..2022;
  fecha=record
    dia:rangoDia;
    mes:rangoMes;
    anio:rangoAnio;
  end;
  cliente=record
    fechaFirma:fecha;
    categoria:rangoCate;
    codigo:rangoCod;
    monto:real;
  end;
  maxDiez=record
    codigo:rangoCod;
    maxx:integer;
  end;
  vector=array[1..dimF]of cliente;
  vcate=array[rangoCate]of integer;
  vciud=array[rangoCod]of integer;
  vdiez=array[1..10]of maxDiez;
  
procedure leerFecha(var f:fecha);
begin
  writeln('Ingrese el dia');
  readln(f.dia);
  writeln('Ingrese el mes');
  readln(f.mes);
  writeln('Ingrese el anio');
  readln(f.anio);
end;
procedure leerCliente(var c:cliente);
begin
  leerFecha(c.fechaFirma);
  writeln('Ingrese la categoria');
  readln(c.categoria);
  writeln('Ingrese el codigo');
  readln(c.codigo);
  writeln('Ingrese el monto');
  readln(c.monto);
end;
procedure cargar(var v:vector);
var c:cliente;i:integer;
begin
  for i:=1 to dimF do begin
    leerCliente(c);
    v[i]:=c;
  end;
end;
procedure inicializarMaxDiez(var v:vdiez);
var i:integer;
begin
  for i:=1 to 10 do
    v[i].maxx:=-1;
end;
procedure inicializarCate(var v:vcate);
var i:rangoCate;
begin
  for i:='A' to 'F' do
    v[i]:=0;
end;
procedure inicializarCiud(var v:vciud);
var i:rangoCod;
begin
  for i:=1 to 2400 do
    v[i]:=0;
end;
procedure mayorFirma(anio:rangoAnio;cant:integer;var anioMax:rangoAnio;var max:integer);
begin
  if(cant>max)then begin
    max:=cant;
    anioMax:=anio;
  end;
end;
procedure maximo(vcid:vciud; var vmax:vdiez); //este es lo mismo que un insertar
var
	i,j,pos:integer;
begin
  for i:=1 to 2400 do begin
  pos:=1;
  while (pos<=10) and (vcid[i] < vmax[pos].maxx) do
	pos:=pos+1;
	if (pos<=10) then begin
		for j:=10 downto pos do begin
		  vmax[j].maxx:=vmax[j-1].maxx;
		  vmax[j].codigo:=vmax[j-1].codigo;
		end;
		vmax[pos].maxx:=vcid[i];
		vmax[pos].codigo:=i;
	end;
  end;
end;
function superanMonto(v:vector;promedio:real):integer;
var cant,i:integer;
begin
  cant:=0;
  for i:=1 to dimF do begin
    if(v[i].monto>promedio)then
      cant:=cant+1;
  end;
  superanMonto:=cant;
end;
procedure recorrer(v:vector;var vcat:vcate;var vcid:vciud;var vmax:vdiez);
var
  anioAct,mesAct,cantContratoAnio,cantContratoMes,max1,i:integer;
  anioMax:rangoAnio;
  montoTotal,promedio:real;
begin
  i:=1;
  max1:=-1;
  montoTotal:=0;
  inicializarCate(vcat);
  inicializarCiud(vcid);
  inicializarMaxDiez(vmax);
  while(i<dimF)do begin
    anioAct:=v[i].fechaFirma.anio;
    cantContratoAnio:=0;
    while(i<dimF)and(anioAct=v[i].fechaFirma.anio)do begin
      mesAct:=v[i].fechaFirma.mes;
      cantContratoMes:=0;
      while(i<dimF)and(anioAct=v[i].fechaFirma.anio)and(mesAct=v[i].fechaFirma.mes)do begin
        cantContratoMes:=cantContratoMes+1;
        vcat[v[i].categoria]:=vcat[v[i].categoria]+1;
        vcid[v[i].codigo]:=vcid[v[i].codigo]+1;
        montoTotal:=montoTotal+v[i].monto;
        i:=i+1;
      end;
      writeln('Mes: ',mesAct,' cantidad de contrato: ',cantContratoMes);
      cantContratoAnio:=cantContratoAnio+cantContratoMes;
    end;
    writeln('Anio: ',anioAct,' cantidad de contrato: ',cantContratoAnio);
    mayorFirma(anioAct,cantContratoAnio,anioMax,max1);
  end;
  writeln('Año en que se firmó la mayor cantidad de contratos',anioMax);
  promedio:=montoTotal/dimF;
  writeln('Cantidad de clientes que superan mensualmente el monto promedio',superanMonto(v,promedio));
  maximo(vcid,vmax);
end;
procedure mostrar(var vcat:vcate);
var i:rangoCate;
begin
  writeln('Cantidad de clientes para cada categoría de monotributo:');
  for i:='A' to 'F'do
    writeln('Categoria:',i,' cantidad:',vcat[i]);
end;
procedure mostrarDiez(var vmax:vdiez);
var i:integer;
begin
  writeln('Código de las 10 ciudades con mayor cantidad de clientes:');
  for i:= 1 to 10 do
    writeln('Codigo ',vmax[i].codigo,' cantidad de clientes:',vmax[i].maxx);
end;
var 
  v:vector;vcat:vcate;vcid:vciud;vmax:vdiez;
begin
  cargar(v);
  recorrer(v,vcat,vcid,vmax);
  mostrar(vcat);
  mostrarDiez(vmax);
end.

{  
1) La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para ello, 
debe realizar un programa que lea y almacene información sobre las computadoras con este sistema 
operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la versión de Ubuntu 
que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la cantidad de cuentas de usuario 
que poseen. La información debe almacenarse ordenada por código de computadora de manera 
ascendente. La lectura finaliza al ingresar el código de computadora -1, que no debe procesarse. Una vez 
almacenados todos los datos, se pide:
a) Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b) Informar el promedio de cuentas de usuario por computadora.
c) Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d) Eliminar la información de las computadoras con código entre 0 y 500.
}
program ubuntuLinux;
const
  dimF=10000;
type
  compu=record
    cod:integer;
    version:real;
    cantPaq:integer;
    cantCuenta:integer;
  end;
  vector=array[1..dimF]of compu;
procedure leer(var c:compu);
begin
  writeln('Ingrese el codigo');
  readln(c.cod);
  if(c.cod<>-1)then begin
   writeln('Ingrese la version de ubuntu');
   readln(c.version);
   writeln('Ingrese cantidad de paquetes instalados');
   readln(c.cantPaq);
   writeln('Ingrese la cantidad de cuenta de usuario');
   readln(c.cantCuenta);
  end;
end;
procedure cargar(var v:vector;var dimL:integer);
var c:compu;
begin
  leer(c);
  while(dimL<dimF)and(c.cod<>-1)do begin
    dimL:=dimL+1;
    v[dimL]:=c;
    leer(c);
  end;
end;
procedure ordenarAscendente(var v:vector;dimL:integer);
var 
  i,j,p:integer;
  item:compu;
begin
  for i:=1 to dimL-1 do begin
    p:=i;
    for j:=i+1 to dimL do  
      if(v[j].cod<v[p].cod)then
        p:=j;
    item:=v[p];
    v[p]:=v[i];
    v[i]:=item;
  end;
end;
procedure mostrar(v:vector;dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do
    writeln(v[i].cod,' ',v[i].version,' ',v[i].cantPaq,' ',v[i].cantCuenta);
end; 
function versiones(version:real):boolean;
begin
  versiones:=(version=18.04)or(version=16.04);
end;
procedure maximo(var max:integer;paquete:integer;var verMax:real;version:real);
begin
  if(paquete>max)then begin
    max:=paquete;
    verMax:=version;
  end;
end;
procedure borrar(var v:vector;var dimL:integer;var ok:boolean;codigo:integer);
var pos,i:integer;
begin
  pos:=1;ok:=false;
  while(pos<=dimL)and(not ok)do begin  //este codigo falla,borra algunos
    if(v[pos].cod=codigo)then begin
      for i:=pos to(dimL-1)do
        v[i]:=v[i+1];
      ok:=true;
      dimL:=dimL-1;
    end
    else pos:=pos+1;
  end;
end;
procedure recorrer(var v:vector;dimL:integer);
var cant,i,max,sumaUsuario:integer;
    verMax:real;
    ok:boolean;
begin
  max:=-1;verMax:=0;
  cant:=0;
  sumaUsuario:=0;
  for i:=1 to dimL do begin
    if(versiones(v[i].version))then
      cant:=cant+1;  //da cero porque no agarra bien los numeros en real,con integer si anda.
    sumaUsuario:=sumaUsuario+v[i].cantCuenta;
    maximo(max,v[i].cantPaq,verMax,v[i].version);
    if(v[i].cod>0)and(v[i].cod<=500)then
      borrar(v,dimL,ok,v[i].cod);
  end;
  writeln('Cantidad de computadoras que utilizan las versiones 18.04 o 16.04:',cant);
  writeln('Promedio de cuentas de usuario',sumaUsuario/dimL:2:2);
  writeln('Versión de Ubuntu con mayor cantidad de paquetes instalados',verMax:2:2);
end;
var
  v:vector;
  dimL:integer;
begin
  dimL:=0;
  cargar(v,dimL);
  ordenarAscendente(v,dimL);
  mostrar(v,dimL);  //para ver si se cargo
  recorrer(v,dimL);
  mostrar(v,dimL);  //para ver si se borro
  writeln ('Hello World')
end.
