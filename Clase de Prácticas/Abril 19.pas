programa  ejer3prac3 ;
constante
	unesco = 23.435 ;

type
	str30 = string[30];
	escuela = record
		cue:integer;
		nombre:str30;
		cantDoc:integer;
		cantAlu:integer;
		localidad:str30;
	fin ;
	
	regMin = record
		cue:integer;
		nombre:str30;
		minRel:real;
	end;
	
procedure leerEscuela(var reg:escuela);
Begin
	writeln('ingrese el cue:');
	readln(reg.cue);
	readln(reg.nombre);
	readln ( reg . cantDoc );
	readln(reg.cantAlu);
	readln(reg.localidad);
End;

procedure calcularMinimos(reg:escuela;relacionEsc:real;var m1,m2:regMin);
Begin
	if(relacionEsc<m1.minRel) then 
	begin
		m2.minRel:=m1.minRel;
		m2.ecu:=m1.ecu;
		m2.nombre:=m1.nombre;
		m1.minRel:=relacionEsc;
		m1.ecu:=reg.ecu;
		m1.nombre:=reg.nombre;
	
	end
	else 
		if(relacionEsc<m2.minRel) then 
		begin
			m2.minRel:=relacionEsc;
			m2.ecu:=reg.ecu;
			m2.nombre:=reg.nombre;
		end;
End;

function calcularRelacion(cantA,cantD:integer):real;
Begin
	calcularRelacion : =  cantA / cantD ;
fin ;

var 
	datosEsc:escuela;
	i,cantBuenaRelacion:integer;
	relacionEsc:real
	min1,min2:regMin;

BEGIN
	min1.minRel=9999;
	min1.ecu=-1;
	min1.nombre='';
	min2.minRel=9999;
	
	cantBuenaRelacion:=0;
	for i:=1 to 2400 do begin
		leerEscuela(datosEsc);
		relacionEsc:=calcularRelacion(datosEsc.cantAlu,datosEsc.cantDoc);
		if(relacionEsc>unesco and datosEsc.localidad = 'La Plata') then 
			cantBuenaRelacion:=cantBuenaRelacion+1;
		calcularMinimos(datosEsc,relacionEsc,min1,min2);
	end;
	
	//writes
	
END.


{Realizar un programa que lea información de autos que están a la venta en una concesionaria.
De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” 
que no debe procesarse.
La información se ingresa ordenada por marca. 
Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program ejer5prac3;
const
	unesco=23.435;

type
	str30 = string[30];
	auto = record
		marca:str30;
		modelo:str30;
		precio:real;
	end;
	
procedure leerAuto(var reg:auto);
Begin
	writeln('ingrese el marca:');
	readln(reg.marca);
	if (reg.marca <>'ZZZ') then
	begin
		readln(reg.modelo);
		readln(reg.precio);
	end;
	
End;

function calcularPromedio(cantau:integer;prectot:real):real;
Begin
	calcularPromedio:=prectot/cantau;
end;


var 
	datosAuto:auto;
	marcaAct:str30;
	cantAuMarca:integer;
	totPrecMarca:real;

BEGIN
	
	leerAuto(datosAuto);
	while (datosAuto.marca<>'ZZZ') do 
	begin
		cantAuMarca:=0;
		totPrecMarca:=0;
		marcaAct:= datosAuto.marca;
		while((datosAuto.marca = marcaAct) and (datosAuto.marca<>'ZZZ')) do
		begin
			cantAuMarca:=cantAuMarca+1;
			totPrecMarca:=totPrecMarca+datosAuto.precio;
			leerAuto(datosAuto);
			
		end;
		//calcular precio promedio de la marca
		writeln('El precio promedio de la marca ',marcaAct,
				' es: ', calcularPromedio(cantAuMArca,totPrecMarca));
	end;
	
	//informar auto mas caro
