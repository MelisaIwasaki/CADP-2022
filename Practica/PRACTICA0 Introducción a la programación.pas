{
1. Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4 .
}
program Hello;
var  num1,num2:integer;
begin
  write('Ingrese un numero:');
  readln(num1);
  write('Ingrese otro numero:');
  readln(num2);
  writeln('Se ingresaron los valores:',num2,' y ',num1);
end.
{
2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional
}
program Hello;
var  num1,num2,suma:integer;
begin
  write('Ingrese un numero:');
  readln(num1);
  write('Ingrese otro numero:');
  readln(num2);
  suma:=num1+num2;
  writeln('La suma de ambos numeros:',suma);       //a
  writeln('La suma de ambos numeros:',num1+num2);       //b
end.
{
3. Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
Recuerde que para imprimir en pantalla números reales puede utilizar la notación:
writeln(X:Y:Z) donde X es el número a imprimir, Y es el ancho (en cantidad de caracteres) que
debe ocupar la impresión, y Z es la cantidad de decimales. Por ejemplo, sea el número
pi=3.141592654 :
3.14 => writeln(pi:1:2);
3.14 => writeln(pi:8:2); (hay 4 espacios delante del 3, para completar 8 caracteres de ancho)
3,1415 => writeln(pi:1:4);
}
program Hello;
var num1,num2,resultado:real;
begin
  write('Ingrese un numero real:');
  readln(num1);
  write('Ingrese otro numero real:');
  readln(num2);
  resultado:=num1/num2;
  writeln('El resutado de dividir ',num1,' por ',num2,' es:',resultado:2:2);
end.
{
4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)
}
program Hello;
const PI=3.1415;
var   diametro,radio,area,perimetro:real;
begin
  write('Ingrese el diametro:');
  readln(diametro);
  radio:=diametro/2;
  area:=PI*(radio*radio);
  perimetro:=PI*radio*2;
  writeln('Radio:',radio:2:2);
  writeln('Area:',area:2:2);
  writeln('Peimetro:',perimetro:2:2);
end.
{
5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,
}
program Hello;
const  caramelo=1.60;
var    cantidad,clientes:integer;
       operacion,resto,precio:real;
begin
  write('Ingrese la cantidad de caramelos: ');
  readln(cantidad);
  write('Ingrese la cantidad de clientes: ');
  readln(clientes);
  operacion:=cantidad div clientes;
  resto:=cantidad mod clientes;
  precio:=operacion*caramelo;
  writeln('Cantidad de caramelos para cada cliente:',operacion:2:2);
  writeln('Cantidad de caramelos que se quedara para si mismo:',resto:2:2);
  writeln('El kiosquero debera cobrar:',precio:2:2,' a cada cliente. Que son ',cantidad*caramelo,' en total.');
end.
{
6. Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%).
}
program Hello;
var 
    dolar,valor,comision,pesos,transaccion:real;
    
begin
    writeln('Ingrese el monto total en dolares de la transaccion:');
    readln(dolar);
    writeln('Ingrese el valor del dólar al día de la fecha :');
    readln(valor);
    writeln('Ingrese la comision en pesos:');
    readln(comision);
    pesos:=dolar*valor;
    transaccion:=pesos+(pesos*comision/100);
    writeln('Valor de la transaccion:',transaccion:2:2);
   
end.
