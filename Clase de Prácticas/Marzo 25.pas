program Practica1Ej5;
{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

var
y,x,doble:real;
cant:integer;

begin
  cant:=0;
  write('leer un numero');
  read(x);
  doble:=x*2;
  write('leer un numero');
  read(y);
  cant:=cant+1;
  while(doble <> y) and (cant < 10) do
  begin
    write('leer un numero');
    read(y);
    cant:=cant+1;
  end;

  if( y <> doble)then
  	write('no se ha ingresado el doble de X')

end.


program seis;

var
legajo, cantalumnos, cantvip, cantdest: integer;
promedio, porcentaje: real;

begin
cantalumnos:=0;
cantvip:=0;
cantdest:=0;

writeln ('Ingrese un legajo: ');
readln (legajo);

while (legajo <> -1) do begin
	writeln ('Ingrese un promedio');
	readln (promedio);
	cantalumnos:= cantalumnos + 1;
	
	if (promedio > 6.5) then
		cantvip:= cantvip + 1; 
		
	If (promedio > 8.5) and (legajo < 2500) then
		cantdest:= cantdest + 1;
	
	writeln ('Ingrese un legajo: ');
	readln (legajo);
end;

writeln ('La cantidad de alumnos leida es de ', cantalumnos);
writeln ('La cantidad de alumnos que supera 6.5 es de ', cantvip);

porcentaje:= cantdest*100 / cantalumnos;
writeln ('El porcentaje de alumnos destacados es de 5', porcentaje:2:2, '%');
end.




//Ejercicio 7

program ejer;
var
codigo, precioActual, precioNuevo, porcentaje: integer;
BEGIN
porcentaje := 0
read(codigo);
while (codigo <> 32767) do begin
   read(codigo);
   read(precioActual);
   read(precioNuevo)
   porcentaje := (precioNuevo*PrecioActual)/100
   if (porcentaje > 10) then 
      write('El precio del producto aumentó más de un 10 por ciento');
      else
      write ('El precio del producto no aumentó más de un 10 por ciento');
      end;
end;      
END.
