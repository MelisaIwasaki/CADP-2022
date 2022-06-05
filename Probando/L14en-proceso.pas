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

Ordenarlo con 2 condiciones

Prueba:       Dio:
cod2 dia4   cod1 dia3
cod1 dia7   cod1 dia7
cod2 dia9   cod2 dia9-->aca hay problema
cod1 dia3   cod2 dia4
}
program BecasYsubsidios;
const
  ALU=3;//1300;
  MED=5;
type
  rangoAlu=-1..ALU;
  rangoMed=1..MED;
  rangoDia=1..31;
  cadena=string[30];
  viaje=record
    cod:rangoAlu;
    dia:rangoDia;
    facu:cadena;
    medio:rangoMed; 
  end;
  lista=^nodo;
  nodo=record
    dato:viaje;
    sig:lista;
  end;
  vprecios=array[rangoMed]of real;
  vcont=array[rangoMed]of integer;
  vBici=array[rangoDia]of boolean;
  
  
procedure leerViaje(var v:viaje);
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
procedure insertarOrdenado(var L:lista;v:viaje); //algo falla pero no lo pude resolver...
var nue,ant,act:lista;                           
begin
  new(nue);
  nue^.dato:=v;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.cod< v.cod)and(act^.dato.dia< v.dia)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    L:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarViaje(var L:lista);
var v:viaje;
begin
  leerViaje(v);
  while(v.cod<>-1)do begin
    insertarOrdenado(L,v);
    leerViaje(v);
  end;
end;
procedure verContenido(L:lista); //para probar
begin
  writeln('Ver si se ordeno por codigo y por dia:');
  while(L<>nil)do begin
    writeln('Cod:',L^.dato.cod,'Dia:',L^.dato.dia);
    L:=L^.sig;
  end;
end;

procedure cargarPrecio(var vp:vprecios); //se dispone pero lo cargo para probar
begin
  vp[1]:=70;
  vp[2]:=80;
  vp[3]:=60;
  vp[4]:=40;
  vp[5]:=20;
end;
procedure inicializar(var vc:vcont);
var i:rangoMed;
begin
  for i:= 1 to MED do
    vc[i]:=0;
end;
procedure maximo(var max1,max2,medio1,medio2:integer;vc:vcont);
var i:rangoMed;
begin
  for i:= 1 to MED do begin
    if(vc[i]>max1)then begin
      max2:=max1;
      max1:=vc[i];
      medio2:=medio1;
      medio1:=i;
    end
    else if(vc[i]>max2)then begin
            max2:=vc[i];
            medio2:=i;
    end;
  end;
end;
procedure recorrerViaje(L:lista;vp:vprecios;var cant6,cant8,medio1,medio2,cantBici:integer);
var
  codActual,diaActual,viaPorDia,max1,max2:integer;
  masDeOcho:real;
  vc:vcont;
  ok6,ok8,combinan,BiciSi,BiciNo:boolean;
begin
  max1:=-1;
  ok6:=false;ok8:=false;combinan:=false;
  viaPorDia:=0;masDeOcho:=0;cant6:=0;
  inicializar(vc);
  while(L<>nil)do begin
    codActual:=L^.dato.cod;
    while(L<>nil)and(codActual=L^.dato.cod)do begin //donde cambia el codigo
      diaActual:=L^.dato.dia;
      while(L<>nil)and(codActual=L^.dato.cod)and(diaActual=L^.dato.dia)do begin //donde cambia el dia
        viaPorDia:=viaPorDia+1;
        masDeOcho:=masDeOcho+vp[L^.dato.medio];
        vc[L^.dato.medio]:=vc[L^.dato.medio]+1;
        if(L^.dato.medio=5)then
          BiciSi:=true 
        else
          BiciNo:=true; 
        L:=L^.sig;
      end;
      if(viaPorDia>6)then
        ok6:=true;    //si algunos de los dias es mayor a 6.
      if(masDeOcho>80)then
        ok8:=true;
      combinan:=(BiciSi)and(BiciNo);  
    end;
    if(ok6)then    //si en algunos de los dias de un alumno viajo mas de 6.
      cant6:=cant6+1;
    if(ok8)then
      cant8:=cant8+1;
    if(combinan)then
      cantBici:=cantBici+1;
  end;
  maximo(max1,max2,medio1,medio2,vc);
end;
procedure informar(cant6,cant8,medio1,medio2,cantBici:integer);
begin
  writeln('La cantidad de alumnos que realizan más de 6 viajes por dia:',cant6);
  writeln('La cantidad de alumnos que gastan en transporte más de $80 por día:',cant8);
  writeln('Los dos medios de transporte más utilizados:',medio1,' y ',medio2);
  writeln('La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte:',cantBici);
end;
var  
  L:lista;
  vp:vprecios;
  cant6,cant8,medio1,medio2,cantBici:integer;
begin
  L:=nil;
  cargarPrecio(vp); //se dispone
  cargarViaje(L);
  verContenido(L);
  recorrerViaje(L,vp,cant6,cant8,medio1,medio2,cantBici);
  informar(cant6,cant8,medio1,medio2,cantBici);
end.
var L:lista;
begin
  L:=nil;
  cargarViaje(L);
  verContenido(L);
end.
