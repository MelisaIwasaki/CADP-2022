{
1. Dado el siguiente programa:
}
program Ejercicio3;
 procedure suma(num1: integer; var num2:integer); //num1=1;num2->x=10
 begin
 num2 := num1 + num2;   //num2= 1+10=11(11+2+3+4+5)
 num1 := 0;             //num1= 0
 end;
var
 i, x : integer;
begin
 read(x); { leo la variable x } //x=10
 for i:= 1 to 5 do              //i=1,i=2,i=3,i=4,i=5
 suma(i,x);                     
 write(x); { imprimo las variable x } //imprime 25
end.
{
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
//imprime 25
b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por: 
procedure suma(num1: integer; num2:integer);
//devuelve 10
c. ¿Qué sucede si se cambia el encabezado del procedure por: 
procedure suma(var num1: integer; var num2:integer);
//da ERROR,no puedo modificar el valor del indice for
}
{
2. Dado el siguiente programa:
}
Program ejercicio4;
procedure digParesImpares(num : integer; var par, impar : integer);
var
 dig: integer;
begin
 while (num <> 0) do begin  //250
 dig:= num mod 10;          //me quedo con 0,me quedo con 5,me quedo con 2
 if((dig mod 2)= 0) then    //0 es par,5 es impar,2 es par
 par := par + 1       //4 par
 else
 impar:= impar +1;    //4 impar
 num := num DIV 10; 
 end;
end;
var
 dato, par, impar, total, cant : integer;
begin
 par := 0;
 impar := 0;
 repeat
 read(dato);          //250,35,100
 digParesImpares(dato,par,impar);
 until (dato = 100);
 writeln(‘Pares: ’,par, ‘Ímpares:’, impar);
end.
{
a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100 
//impime 4 pares y 4 impares
}
{
3. Dado el siguiente programa, encontrar los 6 errores. Utilizar los comentarios entre llaves como guía, indicar 
en qué línea se encuentra cada error y en qué consiste:
}
1. program ejercicio5;
2. { suma los números entre a y b, y retorna el resultado en c }
3. procedure sumar(a, b, c : integer)//falta asignar c como parametro por referencia
4. var                    
5. suma : integer;      //falta declarar i
6. begin                //a y b hay que pasarlo por referencia
7.
8. for i := a to b do
9. suma := suma + i;
10. c := c + suma;      //la variable suma esta de mas c:=c+i
11. end;
12. var
13. result : integer;   //las variables a y b no estan declaradas
14. begin
15. result := 0;
16. readln(a); readln(b);
17. sumar(a, b, 0);     //sumar(a,b,result);pasar el result
18. write(‘La suma total es ‘,result);
19. { averigua si el resultado final estuvo entre 10 y 30}
20. ok := (result >= 10) or (result <= 30);
21. if (not ok) then
22. write (‘La suma no quedó entre 10 y 30’);
23. end.
{
4. El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en qué 
línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada 
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero 
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.
}
1. program programadores;
2. procedure leerDatos(var legajo: integer; salario : real);  //los parametros estan al reves de la invocacion
3. begin
4. writeln(‘Ingrese el nro de legajo y el salario”);     //no se usa doble comillas
5. read(legajo);
6. read(salario);
7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
9. var
10. maxSalario : real;
11. begin
12. if (nuevoLegajo > maxLegajo) then begin
13. maxLegajo:= nuevoLegajo; 
14. maxSalario := nuevoSalario
15. end;
16. end;
17. var
18. legajo, maxLegajo, i : integer;     //falta declarar sumaSalarios
19. salario, maxSalario : real;
20. begin
21. sumaSalarios := 0;                  //falta inicializar maxSalario y maxLegajo
22. for i := 1 to 130 do begin
23. leerDatos(salario, legajo);
24. actualizarMaximo(legajo, salario, maxLegajo); //falta enviar maxSalario
25. sumaSalarios := sumaSalarios + salario;
26. end;
27. writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
28. writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
29. end.
{
5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA. 

b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números 
hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en 
las que numB es el doble de numA. 
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).
}
program modulos;
function doble(numA,numB:integer):boolean;
begin
  doble:=( numB = numA*2 );
end;
var 
  num1,num2,cant,cantDoble:integer;
begin
  cant:=0;
  cantDoble:=0;
  writeln('Ingrese pares de numeros');
  readln(num1);
  readln(num2);
  while(num1<>0)and(num2<>0)do begin
    cant:=cant+1;
    if(doble(num1,num2))then
      cantDoble:=cantDoble+1;
    writeln('Ingrese pares de numeros');
    readln(num1);
    readln(num2);
  end;
  writeln('cantidad total de pares de números leídos ',cant);
  writeln('cantidad de pares en las que numB es el doble de numA. ',cantDoble);
end.
{
8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto 
debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio
}  
program Hello;
const  MAX_PROD=5; //100 productos
type   cadena20=string[20];
procedure leerProducto(var precio:real;var codigo:integer;var tipo:cadena20);
begin
  write('Ingrese el precio:');
  readln(precio);
  write('Ingrese el codigo:');
  readln(codigo);
  write('Ingrese el tipo de ropa:');
  readln(tipo);
end;
procedure masBarato(precio:real;var min1,min2:real;codigo:integer;var codmin1,codmin2:integer);
begin
  if(precio<min1)then begin
    min2:=min1;
    codmin2:=codmin1;
    min1:=precio;
    codmin1:=codigo;
  end
  else if(precio<min2)then begin
         min2:=precio;
         codmin2:=codigo;
  end;
end;
procedure pantalonCaro(precio:real;var precioMax:real;codigo:integer;var codmax:integer;)
begin
  if(precio>precioMax)then begin
    precioMax:=precio;
    codmax:=codigo;
  end;
end;
var precio,precioMax,min1,min2,prom,suma:real;
    codigo,codmax,codmin1,codmin2,cont,i:integer;
    tipo:cadena20;
begin
  suma:=0;
  precioMax:=-1;
  min1:=999;
  min2:=999;
  for i:=1 to MAX_PROD do begin
    leerProducto(precio,codigo,tipo);
    suma:=suma+precio;
    masBarato(precio,min1,min2,codigo,codmin1,codmin2);
    if(tipo='pantalon')then
      pantalonCaro(precio,precioMax,codigo,codmax);
  end;
  prom:=suma/MAX_PROD;
  writeln('El producto mas barato:',codmin1);
  writeln('El segundo producto mas barato:',codmin2);
  writeln('El pantalon mas caro:',codmax);
  writeln('El precio promedio:',prom:2:2);
end.
{
9. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que 
posee y la suma de los mismos.

b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la 
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el 
cual debe procesarse.
}
program Hello;
procedure descomponer(num:integer;var cant,suma:integer); //inciso a)
var  dig:integer;
begin
  cant:=0;
  suma:=0;
  while(num<>0)do begin
    dig:=num mod 10;
    cant:=cant+1;
    suma:=suma+dig;
    num:=num div 10;
  end;
end;
var num,cant,suma,total:integer;   //inciso b)
begin
  total:=0;
  repeat
    write('Ingrese un numero:');
    readln(num);
    descomponer(num,cant,suma);
    writeln('Cantidad de digito que posee es:',cant);
    writeln('La suma de los digitos es:',suma);
  until(suma=10);
end.
{
10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega 
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos 
pares y la cantidad de dígitos impares que posee. 
}
program Hello;
procedure descomponer(num:integer;var sumaPares:integer;var cantImp:integer); //inciso a)
var  dig:integer;
begin
  sumaPares:=0;
  cantImp:=0;
  while(num<>0)do begin
    dig:=num mod 10;
    if(dig mod 2=0)then
      sumaPares:=sumaPares+dig
    else
      cantImp:=cantImp+1;
    num:=num div 10;
  end;
end;
var  num,pares,impares:integer;
begin
  write('Ingrese un numero:');
  readln(num);
  while(num<>123456)do begin
    descomponer(num,pares,impares);
    writeln('La suma de los digitos pares:',pares);
    writeln('La cantidad de digitos impares:',impares);
    write('Ingrese un numero:');
    readln(num);
  end;
end;
{
11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se 
lee: nro de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con nro de inscripción 
1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con nro de inscripción más chico.
● Nombre de los dos alumnos con nro de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.
}
program Hello;
type cadena20=string[20];
procedure leerAlumnos(var nroInscrip:integer;var apellido,nombre:cadena20);
begin
  write('Ingrese numero de inscripcion:');
  readln(nroInscrip);
  write('Ingrese apellido');
  readln(apellido);
  write('Ingrese nombre');
  readln(nombre);
end;
procedure minimo(nroInscrip:integer;apellido:cadena20;var min1,min2:integer;var minape1,minape2:cadena20);
begin
  if(nroInscrip<min1)then begin
    min2:=min1;
    minape2:=minape1;
    min1:=nroInscrip;
    minape1:=apellido;
  end
  else if(nroInscrip<min2)then begin
        min2:=nroInscrip;
        minape2:=apellido;
  end;
end;
procedure maximo(nroInscrip:integer;nombre:cadena20;var max1,max2:integer;var maxnom1,maxnom2:cadena20);
begin
  if(nroInscrip<max1)then begin
    max2:=max1;
    maxnom2:=maxnom1;
    max1:=nroInscrip;
    maxnom1:=nombre;
  end
  else if(nroInscrip<max2)then begin
        max2:=nroInscrip;
        maxnom2:=nombre;
  end;
end;
var  nroInscrip,cantAlumnos,alumnosPares,min1,min2,max1,max2:integer;
     apellido,nombre,minape1,minape2,maxnom1,maxnom2:cadena20;
     porcentajeAlu:real;
begin
  max1:=-1;max2:=-1;maxnom1:='';
  min1:=999;min2:=999;minape1:='';
  cantAlumnos:=0;
  alumnosPares:=0;
  repeat
    leerAlumnos(nroInscrip,apellido,nombre);
    cantAlumnos:=cantAlumnos+1;
    minimo(nroInscrip,apellido,min1,min2,minape1,minape2);
    maximo(nroInscrip,nombre,max1,max2,maxnom1,maxnom2);
    if(nroInscrip mod 2=0 )then
      alumnosPares:=alumnosPares+1;
  until(nroInscrip=1200);
  porcentajeAlu:=(alumnosPares*100/cantAlumnos);
  writeln('Apellido de los dos alumnos con nro de inscripción más chico:',minape1,' y ',minape2);
  writeln('Nombre de los dos alumnos con nro de inscripción más grande:',maxnom1,' y ',maxnom2);
  writeln('Porcentaje de alumnos con nro de inscripción par:',porcentajeAlu:2:2,'%');
end.
{
12. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón 
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió
}
program Profe;
function esVocal(c:char):boolean;
begin
  esVocal:=((c='a')or(c='e')or(c='i')or(c='o')or(c='u')or(c='A')or(c='E')or(c='I')or(c='O')or(c='U'));
end;
procedure cumpleA(var cumple:boolean);
var letra:char;
begin
  write('Ingrese la secuencia A:');
  readln(letra);
  while(letra<>'$')and(cumple)do begin
    if(not esVocal(letra))then
      cumple:=false
    else
      readln(letra);
  end;
end;
function esLetra(letra:char):boolean;
begin
  esLetra:=((letra>='a')and(letra<='z'))or((letra>='A')and(letra<='Z'));
end;
procedure cumpleB(var cumple:boolean);
var letra:char;
begin
  write('Ingrese la secuencia B:');
  readln(letra);
  while(letra<>'#')and(cumple)do begin
    if(not esVocal(letra))and(esLetra(letra))then
      readln(letra)
    else
      cumple:=false;
  end;
end;
var  cumple:boolean;
begin
  cumple:=true;
  cumpleA(cumple);
  if(cumple)then begin
    cumpleB(cumple);
    if(cumple)then 
      writeln('Cumple con la secuencia.')
    else
      writeln('No cumple con B.');
    end
  else writeln('No cumple con A.');
end.

program YoMisma;
function letrasVocales(c:char):boolean;
begin
  letrasVocales:=(c='a')or(c='e')or(c='i')or(c='o')or(c='u')or(c='A')or(c='E')or(c='I')or(c='O')or(c='U');
end;
procedure secuenciaA(var ok:boolean);
var car:char;
begin
  ok:=true;
  writeln('Ingrese la secuencia A');
  readln(car);
  while(car<>'$')and(ok)do begin
    if(letrasVocales(car))then begin
      writeln('Ingrese la secuencia A');
      readln(car);
    end
    else
      ok:=false;
  end;
end;
procedure secuenciaB(var ok:boolean);
var  car:char;
begin
  ok:=true;
  writeln('Ingrese la secuencia B');
  readln(car);
  while(car<>'#')and(ok)do begin
    if(not letrasVocales(car))then begin
      writeln('Ingrese la secuencia B');
      readln(car);
    end
    else
      ok:=false;
  end;
end;

var ok:boolean;
begin
  secuenciaA(ok);
  if(ok)then begin
   secuenciaB(ok);
   if(ok)then
     writeln('Se cumplio la secuencia')
   else
     writeln('No se cumple con B');
  end
  else
    writeln('No se cumple con A');
end.
{
13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón 
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo 
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}
program Hello;
procedure cumpleA(var ok:boolean;var longA:integer);
var c:char;
begin
  longA:=0;
  write('Ingrese la primer secuencia de caracteres:');
  readln(c);
  while(c<>'%')and(ok)do begin
    if(c='$')then
      ok:=false
    else begin
      longA:=longA+1;
      readln(c);
    end;
  end;
end;
procedure cumpleB(var ok:boolean;longA:integer);
var c:char;
    arroba:integer;
begin
  arroba:=0;
  longA:=0;
  write('Ingrese la segunda secuencia de caracteres:');
  readln(c);
  while(c<>'*')and(ok)do begin
    longA:=longA-1;
    if(c='@')then 
      arroba:=arroba+1;
    if((longA>=0)or(arroba<=3))then
      readln(c)
    else
      ok:=false;
  end;
end;
var  car:char;
     ok:boolean;
     longA:integer;
begin 
  ok:=true;
  cumpleA(ok,longA);
  if(ok)then begin
    cumpleB(ok,longA);
    if(ok)then
      writeln('Se cumplio la secuencia.')
    else
      writeln('No se cumplio la secuencia B.');
    end
  else writeln('No se cumplio la secuencia A.');
end.
{
14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe 
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar, 
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha 
plantación. 
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
1  6 toneladas por ha
2  2,6 toneladas por ha
3  1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la 
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona 
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio 
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.
}
program Hello;
type cadena30=string[30];
procedure leerDatos(var localidad:cadena30;var hectareas,zona:integer);
begin
  write ('Ingrese localidad:');
  readln(localidad);
  write('Ingrese hectareas plantadas:');
  readln(hectareas);
  write('Ingrese la zona:');
  readln(zona);
end;
function rendimiento(hectareas,zona:integer;precio:real):real;
begin
  case zona of
  1:rendimiento:=hectareas*6*precio;
  2:rendimiento:=hectareas*2.6*precio;
  3:rendimiento:=hectareas*1.4*precio;
  else 
    writeln('No existe esa zona');
  end;
end;
proedure maximosYMinimos(localidad:cadena30; rendimiento:real;var max,min:real;var campMin,campMax:cadena30);
begin
  if (rendimiento<min)then begin
    min:=rendimiento;
    campMin:=localidad;
  end;
  if(rendimiento>max)then begin
    max:=rendimiento;
    campMax:=localidad;
  end;
end;
var 
    localidad,campMin,campMax:cadena30;
    hectareas,zona,cantCampos,campo3F:integer;
    aux,rendimientoTotal,max,min:real;
begin
    cantCampos:=0;
    campo3F:=0;
    rendimientoTotal:=0;
    max:=-1;
    min:=999;
    campMax:="";
    campMin:="";
    repeat
      leerDatos(localidad,hectareas,zona);
      cantCampos:=cantCampos+1;
      aux:=rendimiento(hectareas,zona,320);
      writeln('Este campo gana $',aux:4:2);
      if(localidad='Tres de Febrero')and(aux>10000)then
        campo3F:=campo3F+1;
      maximosYMinimos(localidad,aux,max,min,campMin,campMax);
      rendimientoTotal:=rendimientoTotal+aux;
    until((localidad='Saladillo')and(hectareas=900));
    writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S10000 es:',campo3F);
    writeln('La localidad de camo con mayor rendimiento economico:',campMax);
    writeln('La localidad de camo con menor rendimiento economico:', campMin);
    writeln('Rendimiento economico promedio:',(rendimientoTotal/cantCampos):4:2);
end.
