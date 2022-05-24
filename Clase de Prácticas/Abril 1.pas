un Prac1Ej9;
var
	operador: char;
	num, resultado: integer;
begin
	write ('Ingrese el operador deseado: ');
	read (operador);
	if (operador = '+') or (operador = '-') then begin
		write ('Ingrese la secuencia de numeros: ');
		read (num);
		resultado := num;
		while (num <> 0) do begin
		read (num);
			if (operador = '+') then
				resultado := resultado + num
			else
				resultado := resultado - num
		end;
		write ('El resultado de la secuencia de numeros es: ',resultado);
		end else
			write ('El operador es incorrecto')
end.

/************************************************************************/
//Practica 1 parte 2

program cinco;

var
	num, max, min, suma: integer;

begin

	max:= -999;
	min:= 999;
	suma:= 0;

	repeat
		readln (num);
		if (num > max) then
			max:= num;
		
		if (num< min) then
			min:= num;
		
		suma:= suma + num;
		
	until (num = 100);

	writeln ('El numero mayor fue el ', max, ' , el numero menor fue el ', min, ' y la suma de todos los numeros da ', suma);

end.

/**********************************************************
program pt2eje6;

var
	cod,i,cod_min,cod_min2,cant:integer;
	pre,min,min2:real;
begin
	min:= 9999;
	cod_min:=-1;
	cant:=0;
	
	for i:=1 to 200 do begin 
		writeln('Ingrese un codigo');
		readln(cod);
		writeln('ingrese precio');
		readln (pre);
		if (pre < min) then begin
			cod_min2:= cod_min;
			min2 := min;
			cod_min:= cod;
			min := pre;
		end
		else 
			if(pre < min2) then begin
				cod_min2:=cod;
				min2:= pre;
			end; 
		
		if((cod mod 2 = 0 ) and (pre > 16)) then cant := cant +1;
		
	end;
  
	writeln ('Los productos mas baratos son:',cod_min,'y', cod_min2);
	writeln ('Los productos de mas de 16 pesos son:',cant);
  
end.
/************************************************************************************************************/
program ejercicio7;

type
  cadena30 = String[30];

var
  nombreganador,nombresegundo,nombrepil,nombreultimo,nombrepenultimo:cadena30;
  tfinc,mintfc1,mintfc2:real;
  i: integer;
  {-variables de los ultimos dos pilotos}
  maxtfc1,maxtfc2:real;
begin
  mintfc1:=9999;
  mintfc2:=9999;
  maxtfc1:=-1;
  maxtfc2:=-1;
  nombreganador:=' ';
  nombreultimo:= ' ';
  
  for i:= 1 to 100 do
    begin
          write('nombre del piloto');
          readln(nombrepil);
          write('tiempo de fin de carrera');
          readln(tfinc);
          {- los nombres de los dos pilotos que finalizaron en los dos primeros puestos.}
      if (tfinc<mintfc1)then
        begin
          nombresegundo:=nombreganador;
          mintfc2:=mintfc1;
          nombreganador:=nombrepil;
          mintfc1:=tfinc;
        end
      else
			if(tfinc<mintfc2) then
			begin
				nombresegundo:=nombrepil;
				mintfc2:=tfinc;
			end;
          
    {- los nombres de los pilotos que finalizaron en los últimos dos puestos.}
	  if (tfinc>maxtfc1)then
		begin
		  nombrepenultimo:= nombreultimo;
		  maxtfc2:=maxtfc1;
		  nombreultimo:=nombrepil;
		  maxtfc1:=tfinc;
		end
	  else
			if(tfinc>maxtfc2) then
			begin
				nombrepenultimo:=nombrepil;
				maxtfc2:=tfinc;
			end;
    end;
    writeln('los nombres delos dos primeros pilotos que finalizaron en los dos primeros puestos son: ',nombreganador, ' y ',nombresegundo);
    writeln('los nombres de los dos pilotos que finalizaron en los dos ultimos puestos son: ',nombrepenultimo,' y ',nombreultimo);
  
end.

/************************************************************************************************/
program ejercicio8;
var
  monto,totalMes,totalDia:real;
  i,diaMax,cantVentasDia,cantVentasDiaMax:integer;
begin
  cantVentasDiaMax:=-1;
  totalMes:=0;
  for i:= 1 to 31 do
    begin
		totalDia:=0;
		cantVentasDia:=0;
		readln(monto);
		while(monto<>0) do
			begin
				cantVentasDia:= cantVentasDia + 1;
				totalDia:= totalDia + monto;
				readln(monto);
			end;
		
		if(cantVentasDia>cantVentasDiaMax)then 
			begin
				diaMax:=i;
				cantVentasDiaMax:= cantVentasDia;
			end;
		
		totalMes:= totalMes + totalDia;
		writeln('la cantidad de ventas del dia ',i,':',cantVentasDia);
    end;
   writeln('el monto total del mes fue:', totalMes);
   writeln('el dia del mes con mas ventas fue el:', diaMax, 'con ', cantVentasDiaMax,' ventas.');
    
end.
