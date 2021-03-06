{
1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”
}
program Hello;
var  num1,num2:integer;
begin
  write('Ingrese un numero:');
  readln(num1);
  write('Ingrese un numero:');
  readln(num2);
  if(num1>num2)then
    writeln('El primer numero es mas grande.')
  else
  if(num1>num2)then
    writeln('El segundo numero es mas grande.')
  else
    writeln('Los numeros leidos son iguales.');
end.
{
2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero
}
program Hello;
var  numero,valorAbs:integer;
begin
  write('Ingrese un numero:');
  readln(numero);
  if(numero>=0)then
    valorAbs:=numero
  else
    valorAbs:=numero*(-1);
  writeln('El valor absoluto de ',numero,' es:','|',valorAbs,'|');
end.
{
3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10
}
program Hello;
var 
    num1,num2,num3:integer;
begin
    writeln('Ingrese un numero');
    readln(num1);
    writeln('Ingrese un numero');
    readln(num2);
    writeln('Ingrese un numero');
    readln(num3);
    if(num1>num2)and(num1>num3)then begin
      if(num2>num3)then
        writeln(num1,num2,num3)
      else
        writeln(num1,num3,num2);
    end
    else
        if(num2>num1)and(num2>num3)then begin
          if(num1>num3)then
            writeln(num2,num1,num3)
          else
            writeln(num2,num3,num1);
        end
        else
            if(num3>num1)and(num3>num2)then begin
              if(num1>num2)then
                writeln(num3,num1,num2)
              else
                writeln(num3,num2,num1);
            end;
end.
{
4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)
}
program Hello;
var 
  numx,numy:real;
begin
  writeln ('Ingrese un numero real x');
  readln(numx);
  writeln('Ingrese un numero real');
  readln(numy);
  while(numy<>numx*2)do begin
    writeln('Ingrese un numero real');
    readln(numy);
  end;
  writeln('Se ingreso el doble de x');
end.  
{
5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
}
program Hello;
var 
  numx,numy:real;
  contador:integer;
begin
  contador:=0;
  writeln ('Ingrese un numero real x');
  readln(numx);
  writeln('Ingrese un numero real');
  readln(numy);
  contador:=contador+1;
  while(numy<>numx*2)and(contador<10)do begin
    writeln('Ingrese un numero real');
    readln(numy);
    contador:=contador+1;
  end;
  if(numy<>num*2)then
  writeln('No se ha ingresado el doble de X');
end.  
{
6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).
}  
program Hello;
var 
    legajo,cantAlu,cantSeis,aluDest:integer;
    promedio,porcentaje:real;
begin
    cantAlu:=0;
    cantSeis:=0;
    aluDest:=0;
    writeln('Ingrese el legajo');
    readln(legajo);
    while(legajo<>-1)do 
    begin
      writeln('Ingrese el promedio');
      readln(promedio);
      cantAlu:=cantAlu+1;
      if(promedio>6.5)then
        cantSeis:=cantSeis+1;
      if(promedio>8.5)and(legajo<2500)then
        aluDest:=aluDest+1;
      writeln('Ingrese el legajo');
      readln(legajo);
    end;
    porcentaje:=aluDest*100/cantAlu;
    writeln ('La cantidad de alumnos leída',cantAlu);
    writeln('La cantidad de alumnos cuyo promedio supera 6.5: ',cantSeis);
    writeln('El porcentaje de alumnos destacados ',porcentaje:2:2,'%');
end.
{
7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leido, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”
}
program Hello;
var
    codigo:integer;
    precioAct,precioNew:real;
begin
    repeat
      writeln('Ingrese el codigo');
      readln(codigo);
      writeln('Ingrese el precio actual');
      readln(precioAct);
      writeln('Ingrese el nuevo precio');
      readln(precioNew);
      if(precioAct*1.1<precioNew)then
        writeln('El aumento de precio del producto ',codigo,' es superior al 10%')
      else
        writeln('El aumento de precio del producto ',codigo,' no supera el 10%');
    until(codigo=32767);
end.

program ejer;
var
codigo: integer;
precioActual, precioNuevo, porcentajeDiez:real;

BEGIN
	repeat
	   read(codigo);
	   read(precioActual);
	   read(precioNuevo);
	   porcentajeDiez := (10*precioActual)/100;
	   if (precioNuevo > precioActual+porcentajeDiez) then 
		  write('El precio del producto aumentó más de un 10 por ciento')
		  else
			write ('El precio del producto no aumentó más de un 10 por ciento');
	until(codigo=32767);
	 
END.
{
8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
}
program Hello;
var
    car1,car2,car3:char;
    voc1,voc2,voc3:boolean;
begin
    writeln('Ingrese un caracter');
    readln(car1);
    writeln('Ingrese un caracter');
    readln(car2);
    writeln('Ingrese un caracter');
    readln(car3);
    voc1:=(car1='a')or(car1='e')or(car1='i')or(car1='o')or(car1='u');
    voc2:=(car2='a')or(car2='e')or(car2='i')or(car2='o')or(car2='u');
    voc3:=(car3='a')or(car3='e')or(car3='i')or(car3='o')or(car3='u');
    if(voc1 and voc2 and voc3)then
      writeln('Los tres son vocales')
    else
      writeln('Al menos un carácter no era vocal');
end.
{
9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
}
program Hello;
var car:char;
    num,total:integer;
    primeraVez:boolean;
begin
  total:=0;
  primeraVez:=true;
  write('Ingrese un caracer de suma o resta:');
  readln(car);
  if((car='+')or(car='-'))then begin
    write('Ingresar un numero:');
    readln(num);
    while(num<>0)do begin
      if(car='+')then
        total:=total+num
      else 
        if(primeraVez)then begin
           total:=num;
           primevaVez:=false;
        end
        else
           total:=total-num;
      write('Ingresar un numero:');
      readln(num);
    end;
    writeln('El resultado final es:',total);
  end
  else writeln('ERROR!ingresaste otro caracter!');
end.
