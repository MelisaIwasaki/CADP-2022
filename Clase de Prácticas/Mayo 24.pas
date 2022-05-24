program ej6;

const
dF = 7;

type

rango = 1..7;

str = string[20];

lista = ^nodo;

sonda =  record
	nombre: str; 
	duracion: real;
	costoConst: real;
	costoMensual: real;
	rangoEE: integer;

end;

nodo = record
	dato : sonda;
	sig: lista;
end;

vCont = array [rango] of integer;

procedure inicializarVec(var vc: vCont);
var
i: integer;
begin
	for i:= 1 to dF do
		vc[i]:= 0;
end;

procedure leer(var s: sonda);

begin 
 with s do begin 
	readln(nombre);
	readln(duracion);
	readln(costoConst);
	readln(costoMensual);
	readln(rangoEE);	
 end;
end;

procedure agregarAdelante (var l: lista; s: sonda);
var
aux: lista;
begin 
	new(aux);
	aux^.dato:= s;
	aux^.sig:= l;
	l:= aux;
end;

function promedio(total:real; sondaTot: integer ): real;
begin 
	promedio:= total/ sondaTot;
end;



procedure maxCostoSonda (s:sonda; var max: real; var: nom: str);
var 
costoMant, costo: real;
begin 
	costoMant:= s.costoMensual * s.duracion;
	costo:= s.costoConst + costoMant;
	if(costo > max) then begin
		max:= costo;
		nom:= s.nombre;
	end;
end;


procedure informarVector(vc: vCont); 
var
i: integer;
begin 
	for i:= 1 to dF do
		writeln('En el rango ', i, ' la cantidad de sondas que realizaran estudios seran ', vc[i]);
end;


procedure informar (l: lista; promDuracion, promCosto: real );
var
max:real;
nom: str;
vc: vCont;
cant: integer;
begin 
	max:= 0;
	cant:= 0;
	inicializarVec(vc);
	while (l <> nil ) do begin 
		maxCostoSonda(l^.dato, max, nom);
		vc[l^.dato.rangoEE]:= vc[l^.dato.rangoEE] + 1;
		if(l^.dato.duracion > promDuracion) then 
			cant:= cant + 1;
		if(l^.dato.costoConst > promCosto) then 
			writeln(l^.dato.nombre);
		l:= l^.sig;	
	end;
	writeln('la sonda mas costosa es ', nom);
	informarVector(vc);
	
end;


var
ls:lista;
so: sonda;
sondasTot: integer
costoTot,duracionTot promDuracion, promCosto:= real;
begin 
	sondasTot:= 0;
	duracionTot:= 0;
	costoTot:=0;
	ls:= nil;
	repeat 
		leer(so);
		sondasTot:= sondasTot + 1;
		duracionTot:= duracionTot + so.duracion;
		costoTot:= costoTot + so.costoConst;
		agregarAdelante(ls,so);
	until (ls^.dato.nombre = 'GAIA');
	promDuracion:= promedio(duracionTot, sondasTot);
	promCosto:= promedio(costoTot, sondasTot);
	informar(ls,promDuracion, promCosto );
end.






program ej10;

type
 
 lista = ^nodo;

 cliente= record
	dni:integer;
	nro:integer;
 end;
 

 nodo=record
	dato: cliente;
	sig: lista;
 end;


 procedure AgregarAtras (var l, lu: lista; c: cliente);
 var
 nue: lista;
 begin 
	new(nue); 
	nue^.dato:= c; 
	nue^.sig:=nil;
	if(l = nil) then begin
		l:= nue; lu:= nue;
	end
	else
		lu^.sig:= nue;
		lu= nue;
 end;


 procedure actualizarNum(var num);
 begin 
	num:= num + 1;
 end;


 procedure RecibirCliente(var l, lu: lista; dni:integer);
 var 
 c: cliente;
 num: integer;
 
 begin
	num:= 0;
	//actualizarNum();
	c.nro:= lu^.nro+1;
	c.dni:= dni;	
	agregarAtras(l,lu,c);
 end;
 
 
 procedure eliminar(var l:lista);
 var
	act: lista;
 begin 
	act:= l;
	l:= l^.sig;
	dispose(act);
 end;


 procedure atenderCliente (var l: lista;var c:cliente); // es por ref ???
 begin
		c:=l^.dato;
		eliminar(l);
 end;
 
 var
 l, lu: lista;
 dni: integer;
 cliAt:cliente;
 
 begin 
	l:= nil; lu:nil;
	readln(dni);
	while (dni <> 0) do begin 
		recibirCliente(l,lu,dni);
		readln(dni);
	end;
	while (l<>nil) do begin
		atenderCliente(l,cliAt);
		writeln('El cliente a ser atendido es ',cliAt.nro , ' con dni  ',cliAt.dni );
	end;
 end.
 
 
 
 
 
 
 
 program FIFA78;
type
	cadena=string[30]
	parti=[1..38];
	
	entrada=record
	numpart:parti;
	paisorig:cadena;
	end;
	
	parti2=record
	nump:parti
	estad:cadena;
	equipo1:cadena;
	equipo2:cadena;
	end;
	
	vector=array [parti] of parti2;
	vcont=array [parti] of integer;
	
	Lista=^nodo
	nodo=record
	dato:entrada;
	sig:Lista

procedure Leerparti2 (var parti:parti2);
begin
	readln(parti.nump, parti.estad, parti.esquipo1, parti.equipo2);
end;

procedure cargarvector (var v:vector);
var i:integer; p:parti2;
begin
	for i=1 to 38 do begin
		Leerparti2(p);
		v[i]:=p;
	end;
end;

procedure inicializar (var v:vcont)
var i: integer;
begin
	for i:=1 to 38 do
	v[i]:=0;
end;

procedure maxi ( max:integer; var nombre:cadena; var XXX:cadena);
begin
		if (max>max1)then begin
			max1:=max;
			XXX:=nombre;
	
procedure procesarlist (var L:lista, var v:vcont, vec:vector);
var 
cantpart:integer;
max:integer;
i: integer;
actual:cadena;
entrpais:integer;
XXX:cadena;
begin
cantpart:=0;
max:=-1;

	while (L<>nil) do begin
		actual:=L^.dato.paisorig;
		entrpais:=0;
		while (L<>nil) and (L^.dato.paisorig=actual)do begin
			v[L^.dato.numpart]:=v[L^.dato.numpart]+1;	
			entrpais:=entrpais+1
			
			L:=L^.sig;
		end;
		if (L^.dato.paisorig)=((vec[L^.dato.numpart].equipo1) or (vec[L^.dato.numpart].equipo2))then
				maxi(entrpais,actual,XXX);
	end;
	
	for i:= 1 to 38 do begin
	  if v[i]<30000 then
		cantpart:=cantpart+1;
	end;

writeln('La cantidad de partidos con menos de 30000 entradas vendidas es: ', cantpart);
writeln('El pais con mayor cantidad de entradas vendidas es: ', XXX);
	
var
v:vector;
vec:vcont;
L:lista;
begin
inicializar(vec);
cargarvector(v);
procesarlist(L,vec,v);
end.
