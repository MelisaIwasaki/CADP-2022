{
1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5
}
program Hello;
var i,numero,suma,esMayor:integer;
begin
  suma:=0;
  esMayor:=0;
  for i:=1 to 10 do begin
    write('Ingrase un numero:');
    readln(numero);
    suma:=suma+numero;
    if(numero>5)then       //inciso a)
      esMayor:=esMayor+1;
  end;
  writeln('Suma total de los numeros leidos:',suma);
  writeln('Cantidad de numeros mayores a 5:',esMayor);
end.
{
2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”
}
program Hello;
var  i,numero,max,posicion:integer;  //inciso a)
begin
  max:=-999;
  for i:=1 to 10 do begin
    write('Ingrese un numero:');
    readln(numero);
    if(numero>max)then
      max:=numero;
      posicion:=i;
  end;
  writeln('El mayor numero fue:',max,' en la posicion ',posicion);
end.
{
3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota
}
program Hello;
type cadena30=string[30];
     notaEPA=1..10;
var  nota:notaEPA;
     nombre:cadena30;
     cantApb,cantSiete:integer;
begin
  cantApb:=0;
  cantSiete:=0;
  repeat
    write('Ingrese e nombre:');
    readln(nombre);
    write('Ingrese la nota:');
    readln(nota);
    if(nota>=8)then
      cantApb:=cantApb+1
    else
    if(nota=7)then
      cantSiete:=cantSiete+1;
  until(nombre='Zidane Zinedine');
  writeln('La cantidad de alumnos aprobados:',cantApb);
  writeln('La cantidad de alumnos que obtuvieron un 7:',cantSiete);
end.
{
4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
}
program Hello;
var i,numero,min1,min2:integer;
begin
  min1:=999; min2:=999;
  for i:=1 to 3 do begin  //1000 numeros
    write('Ingrese un numero:');
    readln(numero);
    if(numero<min1)then begin
      min2:=min1;
      min1:=numero;
    end
    else if(numero<min2)then
           min2:=numero;
  end;
  writeln('Los dos numeros minimos son:',min1,' y ',min2);
end.
{
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
}    
program Hello;
var i,numero,min1,min2:integer;
begin
  min1:=999; min2:=999;
  repeat                         //1000 numeros
    write('Ingrese un numero:');
    readln(numero);
    if(numero<min1)then begin
      min2:=min1;
      min1:=numero;
    end
    else if(numero<min2)then
           min2:=numero;
  until(numero=0);
  writeln('Los dos numeros minimos son:',min1,' y ',min2);
end.
{
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse
}    
program Hello;
var i,numero,min1,min2:integer;
begin
  min1:=999; min2:=999;
  write('Ingrese un numero:');
  readln(numero);
  while(numero<>0)do begin
    if(numero<min1)then begin
      min2:=min1;
      min1:=numero;
    end
    else if(numero<min2)then
           min2:=numero;
    write('Ingrese un numero:');
    readln(numero);
  end;
  writeln('Los dos numeros minimos son:',min1,' y ',min2);
end. 
{ 
5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.
} 
program Hello;
var numero,max,min,sumaTotal:integer;
begin
  max:=-999;
  min:=999;
  sumaTotal:=0;
  repeat
    write('Ingrese un numero:');
    readln(numero);
    if(numero>max)then
      max:=numero;
    if(numero<min)then
      min:=numero;
    sumaTotal:=sumaTotal+numero;
  until(numero=100);
  writeln('El número máximo leído:',max);
  writeln('El número mínimo leído:',min);
  writeln('La suma total de los números leídos:',sumaTotal);
end.
{
6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.
}
program Hello;
type  rango=1..200;
var   codigo,cod1,cod2:rango;
      precio,min1,min2:real;
      i,cantidad:integer;
begin
  min1:=999; min2:=999;
  cantidad:=0;
  for i:=1 to 3 do begin //200 productos
    write('Ingrese el codigo del producto:');
    readln(codigo);
    write('Ingrese el precio del producto:');
    readln(precio);
    if(precio<min1)then begin
      min2:=min1;
      min1:=precio;
      cod2:=cod1;
      cod1:=codigo;
    end 
    else if(precio<min2)then begin
           min2:=precio;
           cod2:=codigo;
    end;
    if(precio>16)and((codigo mod 2)=0)then
      cantidad:=cantidad+1;
  end;
  writeln('Los códigos de los dos productos más baratos:',cod1,' y ',cod2);
  writeln('La cantidad de productos de más de 16 pesos con código par:',cantidad);
end.    
{
7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
}
program Hello;
type cadena30=string[30];
var  nombre,nomMin1,nomMin2,nomMax1,nomMax2:cadena30;
     tiempo,min1,min2,max1,max2:real;
     i:integer;
begin
  min1:=999; min2:=999;
  max1:=-999; max2:=-999;
  nomMin1:='';nomMin2:='';nomMax1:='';nomMax2:='';
  for i:=1 to 5 do begin //100 autos
    write('Ingrese el nombre del piloto:');
    readln(nombre);
    write('Ingrese el tiempo total:');
    readln(tiempo);
    if(tiempo<min1)then begin
      min2:=min1;
      nomMin2:=nomMin1;
      min1:=tiempo;
      nomMin1:=nombre;
    end
    else if(tiempo<min2)then begin
           min2:=tiempo;
           nomMin2:=nombre;
    end;
    if(tiempo>max1)then begin
      max2:=max1;
      nomMax2:=nomMax1;
      max1:=tiempo;
      nomMax1:=nombre;
    end
    else if(tiempo>max2)then begin
           max2:=tiempo;
           nomMax2:=nombre;
    end;   //end del if
  end;     //end del for
  writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos:',nomMin1,' y ',nomMin2);
  writeln('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos:',nomMax1,' y ',nomMax2);
end.
{
8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
}
program Hello;
const ultDia=3; //son 31 dias
var   i,cantVentasXDia:integer;
      monto,montoTotalXmes:real;
begin
  montoTotalXmes:=0;
  for i:=1 to ultDia do begin
    cantVentasXDia:=0;
    write('Ingrese el monto:');
    readln(monto);
    while(monto<>0)do begin
      cantVentasXDia:=cantVentasXDia+1;
      montoTotalXmes:=montoTotalXmes+monto;
      write('Ingrese el monto:');
      readln(monto);
    end;
    writeln('Cantidad de ventas para el dia ',i,' es ',cantVentasXDia);
  end;
  writeln('Monto total acumulado en ventas de todo el mes:',montoTotalXmes:2:2);
end.
{
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.
}    
program Hello;
const ultDia=3; //son 31 dias
var   i,cantVentasXDia,max,pos:integer;
      monto,montoTotalXmes:real;
begin
  montoTotalXmes:=0;
  for i:=1 to ultDia do begin
    cantVentasXDia:=0;
    write('Ingrese el monto:');
    readln(monto);
    while(monto<>0)do begin
      cantVentasXDia:=cantVentasXDia+1;
      montoTotalXmes:=montoTotalXmes+monto;
      if(cantVentasXDia>max)then begin
        max:=cantVentasXDia;
        pos:=i;
      end;
      write('Ingrese el monto:');
      readln(monto);
    end;
    writeln('Cantidad de ventas para el dia ',i,' es ',cantVentasXDia);
  end;
  writeln('Monto total acumulado en ventas de todo el mes:',montoTotalXmes:2:2);
end.
