{
14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a 
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por 
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 
y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo 
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más 
de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de 
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte

Sin utilizar corte de control, solo con varios vectores.Complete de lo que habia hecho el profe.
}
program BecasYsubsidios; //me re maree
const
  ALU=3;//1300;
  MED=5;
type
  rangoAlu=-1..ALU;
  rangoMed=1..MED;
  rangoDia=1..31;
  cadena=string[30];
  rviaje=record
    cod:rangoAlu;
    dia:rangoDia;
    facu:cadena;
    medio:rangoMed; 
  end;
  lista=^nodo;
  nodo=record
    dato:rviaje;
    sig:lista;
  end;
  vViaje=array[rangoAlu]of lista;    //vector de lista de viajes de cada alumno
  vTabla=array[rangoMed]of real;     //se dispone los precios de viajes
  vMedios=array[rangoMed]of integer; //para sacar el medio mas utilizado
  vDias=array[rangoDia]of integer;   //a)
  vGasto=array[rangoDia]of real;     //b)
  vBici=array[rangoDia]of boolean;

procedure cargarPrecios(v:vTabla);
begin
  v[1]:=100;
  v[2]:=200;
  v[3]:=300;
  v[4]:=400;
  v[5]:=500;
end;
procedure inicializar(var v:vViaje);
var i:rangoAlu;
begin
  for i:= 1 to ALU do
    v[i]:=nil;
end;
procedure leerViaje(var v:rviaje);
begin
  writeln('Ingrese el codigo');
  readln(v.cod);
  if(v.cod<>-1)then begin
    writeln('Ingrese el dia');
    readln(v.dia);
    writeln('Ingrese la Facultad');
    readln(v.facu);
    writeln('Ingrese el medio');
    readln(v.medio);
  end;
end;
procedure agregarAdelante(var L:lista;v:rviaje);
var nue:lista;
begin
  new(nue);
  nue^.dato:=v;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarViaje(var v:vViaje);
var via:rviaje;
begin
  inicializar(v);
  leerViaje(via);
  while(via.cod<>-1)do begin
    agregarAdelante(v[via.cod],via);
    leerViaje(via);
  end;
end;
procedure inicializarMed(var v:vMedios);
var i:rangoMed;
begin
  for i:= 1 to MED do
    v[i]:=0;
end;
procedure iniciarlizarGastos(var v:vGasto);
var i:rangoDia;
begin
  for i:= 1 to 31 do
    v[i]:=0;
end;
procedure inicializarDia(var v:vDias);
var i:rangoDia;
begin
  for i:= 1 to 31 do
    v[i]:=0;
end;
procedure iniciarlizarBici(var v:vBici);
var i:rangoDia;
begin
  for i:= 1 to 31 do
    v[i]:=false;
end;
procedure calcularMaximos(medio:vMedios;var medioMax1,medioMax2:rangoMed;var max1,max2:integer);
var i:rangoMed;
begin
  for i:= 1 to MED do begin
    if(medio[i]>max1)then begin
      max2:=max1;
      max1:=medio[i];
      medioMax2:=medioMax1;
      medioMax1:=i;
    end
    else if(medio[i]>max2)then begin
           max2:=medio[i];
           medioMax2:=i;
    end;
  end;
end;
procedure inicializarTodo(var gastos:vGasto;var dias:vDias;var vectorBicis,vectorNoBicis:vBici);
begin
  inicializarDia(dias);
  iniciarlizarGastos(gastos);
  iniciarlizarBici(vectorBicis);
  iniciarlizarBici(vectorNoBicis);
end;
function promedioD(v:vdias):boolean;
var i:rangoDia;suma,total:integer;
begin
  suma:=0;total:=0;
  for i:=1 to 31 do begin
    suma:=suma+v[i];
    total:=total+1;
  end;
  promedioD:=((suma/total)> 6);
end;
function promedioG(v:vGasto):boolean;
var i:rangoDia;suma:real;total:integer;
begin
  suma:=0;total:=0;
  for i:=1 to 31 do begin
    suma:=suma+v[i];
    total:=total+1;
  end;
  promedioG:=((suma/total)> 80);
end;
function verdadero(v:vBici):boolean;
var i:rangoDia;ok:boolean;
begin
  i:=1;
  ok:=false;
  while(i < 31)and(not ok)do 
    i:=i+1;
  verdadero:=ok;
end;
procedure procesarViajes(L:lista;precios:vTabla;MasDe6,MasDe80,combinaBici:boolean;medios:vMedios);
var
  gastos:vGasto;dias:vDias;
  andaEnBici,andaEnOtroMedio:boolean;
  vectorBicis,vectorNoBicis:vBici;
  
begin
  
  andaEnBici:= false;andaEnOtroMedio:= false;combinaBici:= false;
  inicializarTodo(gastos,dias,vectorBicis,vectorNoBicis);
  while(L<>nil)do begin
    gastos[L^.dato.dia] := gastos[L^.dato.dia] + precios[L^.dato.medio];
    dias[L^.dato.dia]:= dias[L^.dato.dia] + 1;
    medios[L^.dato.medio]:= medios[L^.dato.medio] + 1;
    if (L^.dato.medio = 5) then vectorBicis[L^.dato.dia]:= true;
	if (L^.dato.medio <> 5) then vectorNoBicis[L^.dato.dia]:= true;
	L:=L^.sig;
  end;
  MasDe6:= (promedioD(dias));  //tiene que dar true o false
  MasDe80:= (promedioG(gastos));
  andaEnBici:= (verdadero(vectorBicis));
  andaEnOtroMedio:= (verdadero(vectorNoBicis));
  combinaBici:= andaEnBici and andaEnOtroMedio;
end;
procedure procesarAlumno(v:vViaje;precios:vTabla;var cantMas6,cantMas80,cantBici:integer;var medioMax1,medioMax2:rangoMed);
var medios:vMedios;
    i:rangoAlu;max1,max2:integer;
    MasDe6,MasDe80,combinaBici : boolean;
begin
  max1:=-1;
  MasDe6:= false;MasDe80:= false;combinaBici:= false;
  inicializarMed(medios);
  for i:= 1 to ALU do begin
    procesarViajes(v[i],precios,MasDe6,MasDe80,combinaBici,medios);
    if (MasDe6) then cantMas6 := cantMas6 + 1;
    if (MasDe80) then cantMas80 := cantMas80 + 1;
    if (combinaBici) then cantBici:= cantBici + 1;
  end;
  calcularMaximos(medios,medioMax1,medioMax2,max1,max2);
end;
procedure informar(cantMas6,cantMas80,cantBici:integer;medioMax1,medioMax2:rangoMed);
begin
  writeln('La cantidad de alumnos que realizan más de 6 viajes por día',cantMas6);
  writeln('La cantidad de alumnos que gastan en transporte más de $80 por día',cantMas80);
  writeln('Los dos medios de transporte más utilizados',medioMax1,medioMax2);
  writeln('La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte',cantBici);
end;
var  
  v:vViaje;
  precios:vTabla;
  cantMas6, cantMas80, cantBici : integer;
  medioMax1, medioMax2 : rangoMed;   
  begin
    cargarViaje(v);
    cargarPrecios(precios); //se dispone
    procesarAlumno(v,precios,cantMas6,cantMas80, cantBici,  medioMax1, medioMax2);
    informar(cantMas6,cantMas80,cantBici,medioMax1,medioMax2);    
  end.
