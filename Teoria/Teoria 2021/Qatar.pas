{ La FIFA está analizando la información de las entradas vendidas para los 52 partidos del mundial de fútbol Qatar 2022. 
Para ello, para cada partido se leen las ventas realizadas. De cada venta se conoce fecha de venta, 
nombre del país del comprador y cantidad de entradas compradas. 
La lectura de las ventas de cada partido finaliza con cantidad de entradas -1.
Realizar un programa que informe:
  Cantidad de entradas vendidas para cada partido.
  --Los dos números de partidos que tienen mayor cantidad de entradas vendidas.
  Cantidad total de entradas vendidas.
  Cantidad total de entradas compradas por argentinos. }
  
program ejercicioClase1;
const totalPartidos = 52;
type cadena8 = string [8];
     cadena25 = string [25];
     subrango = 1..totalPartidos;
var fechaVen: cadena8;
    nombrePais: cadena25;
    cantE, cantVendida, cantTotal, cantArg, max1, max2: integer;
    i, num1, num2: subrango;
    
begin
  cantTotal:= 0; cantArg:= 0; max1:= -1;
  for i:= 1 to totalPartidos do
  begin
    writeln ('-------- Partido ', i, '---------');
    writeln;
    cantVendida:= 0;
    write ('Ingrese cantidad de entradas: ');
    readln (cantE);
    while (cantE <> -1) do
    begin
      cantVendida:= cantVendida +cantE;
      {write ('Ingrese fecha de venta: ');
      readln (fechaVen);}
      write ('Ingrese nombre pais: ');
      readln (nombrepais);
      if (nombrePais = 'Argentina') then cantArg := cantArg + cantE;  
      write ('Ingrese cantidad de entradas: ');
      readln (cantE);
    end;
    cantTotal:= cantTotal + cantVendida;
    if (cantVendida > max1)  {max1--> 10 --> 15    max2--> 5 --> 10 -->12     cantVendida--> 5}
    then begin
           max2:=max1; num2:= num1; 
           max1:= cantVendida; num1:= i
         end
    else if (cantVendida > max2) 
         then begin
               max2:= cantVendida; num2:= i;
              end;
    writeln ('La cantidad de entradas vendidas para el partido ', i, ' es ', cantVendida);  
    writeln;
  end; {for}
  writeln;
  writeln ('Cantidad total de entradas vendidas: ', cantTotal);
  writeln ('Cantidad total de entradas compradas por argentinos: ', cantArg);
  writeln ('El partido ', num1, ' tuvo la mayor cantidad de entradas vendidas: ', max1);
  writeln ('El partido ', num2, ' tuvo la segunda mayor cantidad de entradas vendidas: ', max2);
end.
