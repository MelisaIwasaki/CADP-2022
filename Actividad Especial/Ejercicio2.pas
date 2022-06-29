program FisicaYQuimica;
const
  ATO=3;  //son 30,el 3 es para probar;
  elementos=3; //son 119,el 3 es para probar;
  proton=1.0;
  electron=0.000555556;
  neutron=1.0005;
type
  rango=1..elementos;
  cadena=string[100];
  cadena5=string[5];
  atomo=record
    nombre:cadena;
    protones:integer;     
    electrones:integer;
    neutrones:integer;
  end;
  tablaPeriodica=record
    simbolo:cadena;                   
    atomoB:atomo; 
  end;
  vector=array[rango]of tablaPeriodica; //vector de la tabla periodica
  vcont=array[rango]of integer;
  
procedure leerAtomo(var a:atomo);
begin
  writeln('Ingrese el nombre');
  readln(a.nombre);
  writeln('Ingrese la cantidad de protones');
  readln(a.protones);
  writeln('Ingrese la cantidad de electrones');
  readln(a.electrones);
  writeln('Ingrese la cantidad de neutrones');
  readln(a.neutrones);
end;
procedure leerTabla(var t:tablaPeriodica);
begin
  writeln('Ingrese el simbolo');
  readln(t.simbolo);
  writeln('Ingrese el atomo');
  leerAtomo(t.atomoB);
end;
procedure cargar(var v:vector);
var i:rango;t:tablaPeriodica;
begin
  for i:=1 to elementos do begin
    leerTabla(t);
    v[t.atomoB.protones]:= t;
  end;
end;
procedure mostrarTabla(v:vector);  //para probar
var i:rango;
begin
  for i:=1 to elementos do 
    writeln(v[i].simbolo,' ',v[i].atomoB.nombre,' ',v[i].atomoB.protones,' ',v[i].atomoB.electrones,' ',v[i].atomoB.neutrones);
end;
function calcularMasa(a:atomo):real;
begin
  calcularMasa:= a.protones*proton + a.electrones*electron + a.neutrones*neutron; 
end;
function calcularCarga(a:atomo):integer;
begin
  if(a.protones = a.electrones)then
    calcularCarga:=0
  else
    if(a.protones > a.electrones)then
      calcularCarga:=1
    else
      calcularCarga:=-1;
end;
function calcularMasico(a:atomo):real;
begin
  calcularMasico:= a.protones + a.neutrones;
end;
function calcularIsotopo(atomoA,atomoB:atomo):integer;
begin
  if(atomoA.protones <> atomoB.protones)then
     calcularIsotopo:=0 //protones distintos
  else
    if(atomoA.neutrones <> atomoB.neutrones)then 
      calcularIsotopo:=1  //configuracion natural
    else
      calcularIsotopo:=-1; //isotopo
end;
procedure mayorMasa(var max1,max2:real;var nom1,nom2:cadena;masa:real;nom:cadena);
begin
  if(masa > max1)then begin
    max2:=max1;
    max1:=masa;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(masa > max2)then begin
         max2:=masa;
         nom2:=nom;
  end;
end;
procedure inicializar(var aMin:atomo);
begin
  aMin.nombre:='';
  aMin.protones:=0;
  aMin.electrones:=0;
  aMin.neutrones:=0;
end;
procedure minimoMasico(a:atomo;var aMin:atomo;var min:real;masico:real); 
begin
  if(masico < min)then begin
    min:=masico;
    aMin:=a;
  end;
end;
procedure recorrerAtomos(); 
var
  aMin:atomo;a:atomo;
  i,carga,cantPositivo,cantNagativo:integer;
  masa,masico,max1,max2,min:real;
  nom1,nom2:cadena;
begin  
  min:=9999;
  max1:=-1;nom1:='';
  inicializar(aMin);
  cantPositivo:=0;
  cantNagativo:=0;
  for i:= 1 to ATO do begin
    leerAtomo(a);
    masa:=calcularMasa(a);
    carga:=calcularCarga(a);
    masico:=calcularMasico(a);
    if(carga = 1)then
      cantPositivo:=cantPositivo + 1
    else 
		if(carga = -1)then
			cantNagativo:=cantNagativo + 1
		else
		    writeln('Tiene carga neutra');
    mayorMasa(max1,max2,nom1,nom2,masa,a.nombre);
    minimoMasico(a,aMin,min,masico);
  end;
  writeln('La cantidad de átomos que son iones positivos ',cantPositivo);
  writeln(' y la cantidad que son iones negativos ',cantNagativo);
  writeln('El nombre de los dos átomos de mayor masa ',nom1,' y ',nom2);
  writeln('Atomo con menor número másico ',aMin.nombre,' ',aMin.protones,' ',aMin.electrones,' ',aMin.neutrones);
end;
procedure inicializarTabla(var tabla:tablaPeriodica);
begin
  tabla.simbolo:=' ';
  tabla.atomoB.nombre:=' ';
  tabla.atomoB.protones:= 0;
  tabla.atomoB.electrones:= 0;
  tabla.atomoB.neutrones:= 0;
end;
procedure buscar(v:vector;prot:integer;var tabla:tablaPeriodica); //3 de vectores
var i:rango;
begin
  inicializarTabla(tabla);     
    if(prot = v[prot].atomoB.protones)then 
       tabla:=v[prot];  //guardo en el registro tabla 
end;
function isotopo(a:atomo;v:vector):boolean; //4 de vectores
var tabla:tablaPeriodica;iso:integer;
begin
   buscar(v,a.protones,tabla);
   iso:=calcularIsotopo(a,tabla.atomoB);
   if(iso=1)then 
     isotopo:=true
   else
     isotopo:=false;
end;
procedure inicializarDifeAto(var difeAto:atomo);
begin
  difeAto.nombre:=' ';
  difeAto.protones:= 0;
  difeAto.electrones:= 0;
  difeAto.neutrones:= 0;
end;
procedure diferencias(v:vector;var difeAto:atomo; a:atomo); //5 de vectores
var tabla:tablaPeriodica;
begin
  inicializarDifeAto(difeAto);
  buscar(v,a.protones,tabla);  //se sabe que tienen la misma cant de protones
  difeAto.nombre:= tabla.atomoB.nombre;
  difeAto.protones:= tabla.atomoB.protones;
  difeAto.electrones:= tabla.atomoB.electrones - a.electrones;
  difeAto.neutrones:= tabla.atomoB.neutrones - a.neutrones; 
end;
procedure mostrarDiferencia(difeAto:tablaPeriodica);
begin
  writeln('Mostrar diferencias:');
  writeln(difeAto.simbolo,' ',difeAto.atomoB.nombre,' ', difeAto.atomoB.protones,' ',difeAto.atomoB.electrones,' ',difeAto.atomoB.neutrones);
end;
procedure inicializar(var v:vcont);//6 de vectores
var i:rango;
begin
  for i:= 1 to elementos do
    v[i]:=0;
end;
procedure secuenciaConOrden(var v:vcont);//6
var a:atomo;
    protActual:integer;
begin
  writeln('Ingresar ordenada por cant de protones:');
  inicializar(v);
  leerAtomo(a);
  while(a.protones <> 0)do begin
    protActual:=a.protones;
    while(protActual = a.protones)do begin 
      leerAtomo(a);
    end;
  end;
end;
procedure informar(v:vcont); //para probar
var i:rango;
begin
  for i := 1 to elementos do
    writeln('Atomo: ',i,' aparece ',v[i],' veces ');
end;
procedure secuenciaSinOrden(var v:vcont);//7 de vectores
var a:atomo;
begin
  writeln('Ingresar sin orden:');
  leerAtomo(a);
  while(a.protones <> 0)do begin
    v[a.protones]:=v[a.protones] + 1;
    leerAtomo(a);
  end;
end;
procedure vectores(var v:vector);
var 
  a,difeAto:atomo;
  prot:integer;
  vc1,vc2:vcont;
  tabla:tablaPeriodica;
begin
  cargar(v);
  //mostrarTabla(v); //para saber si se cargo bien
  inicializar(vc1);
  inicializar(vc2);
  writeln('Ingrese el numero atomico a buscar');
  readln(prot);
  buscar(v,prot,tabla);
  writeln('La informacion del elemento buscado es:',tabla.simbolo,' ',tabla.atomoB.nombre,' ',tabla.atomoB.protones,'  ',tabla.atomoB.electrones,' ',tabla.atomoB.neutrones);
  leerAtomo(a);
  if(isotopo(a,v))then
    writeln('se trata de un elemento en su configuración natural más habitual')
  else
    writeln('se trata de un isótopo del dicho elemento');
    
  writeln('Ingrese atomo para ver las diferencias:');
  leerAtomo(a);
  diferencias(v,difeAto,a);
  //mostrarDiferencia(difeAto);//para probar si se cargo
  if(difeAto.neutrones = 0)then
    writeln('No posee neutrones,es Protio.')
  else if(difeAto.neutrones = 1)then
    writeln('Posee un neutron,es Deuterio.')
  else if(difeAto.neutrones = 2)then
    writeln('Posee dos neutrones,es Tritio.');
  if(difeAto.protones <> difeAto.electrones)then
    if(difeAto.protones > difeAto.electrones)then
        writeln('Posee mas protones que electrones:Cationes.')
    else
        writeln('Posee mas electrones que protones:Aniones.');
  secuenciaConOrden(vc1);
  informar(vc1); //para probar
  secuenciaSinOrden(vc2);
  informar(vc2);  //para probar
end;
var
  v:vector;
begin
  recorrerAtomos();
  vectores(v);
end.
