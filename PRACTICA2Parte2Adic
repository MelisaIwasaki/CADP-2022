{
1. Dado el siguiente programa:
}
program Ejercicio1_ad;
 procedure intercambio(var num1,num2 : integer);
 var
 aux : integer;
 begin
 aux := num1;
 num1 := num2;
 num2 := aux;
 end;
 procedure sumar(num1 : integer; var num2 : integer); 
 begin
 num2 := num1 + num2;
 end;
var
 i, num1, num2 : integer;
begin
 read(num1);
 read(num2);
 for i := 1 to 3 do begin
 intercambio(num1,num2);
 sumar(i,num1);
 end;
 writeln(num1);
end.
{
a. ¿Qué imprime si se leen los valores num1=10 y num2=5 ? 
Imprime 9
b. ¿Qué imprime si se leen los valores num1=5 y num2=10 ?
Imprime 14
}
{
2. Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de números, 
la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)
}
program Hello;
procedure sumaYProd(x,y:integer;var suma,producto:integer);
var i:integer;
begin
   suma:=0;
   producto:=1;
   for i:=x to y do begin
     suma:=suma+i;
     producto:=producto+i;
    end;
end;
var i,numX,numY,suma,prod:integer;
begin
   for i:=1 to 10 do begin
     write('Ingrese un numero:');
     readln(numX);
     write('Ingrese otro numero:');
     readln(numY);
     sumaYProd(numX,numY,suma,prod);
     writeln('La suma es:',suma);
     writeln('El producto es:',prod);
    end; 
end.
{
3. Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada 
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.
}
program Hello;
type rango:1..200;
procedure prodMasBarato(precio:real;codigo:rango;var min1,min2:real;var codMin1,codMin2:rango);
begin
    min1:=999;min2:=999;
    if(precio<min1)then begin
       min2:=min1;
       codMin2:=codMin1;
       min1:=precio;
       codMin1:=codigo;
    end
    else if(precio<min2)then begin
       min2:=precio;
       codMin2:=codigo;
    end;
end;
var cantidad16:integer;
    i,codigo,codMin1,codMin2:rango;
    precio,min1,min2:real;
begin
    cantidad16:=0;
    for i:=1 to 200 do begin
      write('Ingrese el codigo:');
      readln(codigo); 
      write('Ingrese el precio:');
      readln(precio);
      prodMasBarato(precio,codigo,min1,min2,codMin1,codMin2);
      if((precio>16)and(codigo mod 2=0))then
         cantidad16:=cantidad16+1;
    end;
    writeln('Los codigos de los dos productos mas baratos',codMin1,'y',codMin2);
    writeln('La cantidad de productos de mas de 16 pesos co codigo par:', cantidad16);
end.
{
4. a. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su 
perímetro.
b. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenidas del 
Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia 
(medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse. 
Informar:
● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700 
km) y mayor o igual que el de Marte (6.780 km).
● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).
}
program Hello;
const pi:=3.14;
type cadena20=string[20];
procedure leerPlaneta(var nombre:cadena20; radio,distancia:real);
begin
   write('Ingrese radio:');
   readln(radio);
   if (radio<>0)then begin
     write('Ingrese el nombre de planeta:');
     readln(nombre);
     write('Ingrese la distancia');
     readln(distancia);
   end;
end;
procedure diamYPerimetro(radio:real;var diam,per:real);
begin
   diam:=radio*radio;
   per:=pi*diam;
end;
var radio,diametro,perimetro,distancia:real;
    nombre:cadena20;
    cantSupJupiter:integer;
begin
   cantSupJupiter:=0;
   leerPlaneta(nombre,radio,distancia);
   while(radio<>0)do begin
     diamYPerimetro(radio,diametro,perimetro);
     if(diametro <=12700)and(diametro>=6780)then
       writeln('Planeta:',nombre,'distancia:',distancia);
     if(perimetro>439264)then
       cantSupJupiter:=cantSupJupiter+1;
     leerPlaneta(nombre,radio,distancia);
   end;
   writeln ('Cntidad de planeta con perimetro superior al de Jupiter:',cantSupJupiter);
end.
