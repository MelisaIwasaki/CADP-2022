{
1. Dado el siguiente programa, indicar qué imprime.
}
program alcance1;
var a,b: integer;
procedure uno;
var b: integer;
begin
 b := 3;
 writeln(b);    //imprime 3
end;
begin
 a:= 1;
 b:= 2;
 uno;
writeln(b, a);  //imprime 2,1
end.
{
2. Dado el siguiente programa, indicar qué imprime.
}
program alcance2;
var a,b: integer;
procedure uno;
begin
 b := 3;
 writeln(b);    //imprime 3
end;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a); //imprime 3,1
end.
{
3. Dado el siguiente programa, indicar cuál es el error y su causa.
}
program alcance3;
var a: integer;
procedure uno;
var b: integer;
begin
 b:= 2;
 writeln(b);
end;
begin         //no esta declarada b
 a:= 1;
 uno;
 writeln(a, b);  //ERROR quieren imprimir en el P.P.una variable local al procedimiento
end.
{
4. Dado los siguientes programas, explicar la diferencia.
}
program alcance4a;
var a,b: integer;  //posee 2 variables globales
procedure uno;
begin
 a := 1;
 writeln(a);       //imprime 1
end;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);    //imprime 2,1
end.

program alcance4b;
procedure uno;     //no tiene variables globales
begin
 a := 1;
 writeln(a);       //no esta declarara la variable a,no imprime nada.
end;
var a,b: integer;  //tiene variables locales en el P.P.
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);    //imprime 2,1
end.
{
5. Dado el siguiente programa, indicar cuál es el error.
}
program alcance4;
function cuatro: integer;
begin
 cuatro:= 4;
end;
var a: integer;
begin
 cuatro;        //mal la invocacion a:=cuatro
 writeln(a);    //la variable a no esta inicializado,el valor de retorno de la funcion
end.
{
6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la 
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto. 
b. Implemente un programa que invoque al módulo del inciso a.
}
procedure modulo();
var numero,max:integer;
begin
  max:=-1;
  write('Ingrese un numero:');
  readln(numero);
  while(numero>0)do begin
    if(numero mod 2 =0)and(numero>max)then
      max:=numero;
    end;
    write('Ingrese un numero:');
    readln(numero);
  end;
  writeln('El numero par mas alto es:',max);
end;
begin
  modulo();
end.
{ 
7. Dado el siguiente programa:
}
program alcanceYFunciones;
var
 suma, cant : integer;
 function calcularPromedio : real
 var
 prom : real;
 begin
 if (cant <> 0) then         //if(cant=0)then
 prom := -1
 else
 prom := suma / cant;
 end;
begin { programa principal }
 readln(suma);               //suma=48
 readln(cant);               //cant=6
 if (calcularPromedio <> -1) then begin  //falta enviarle los parametros
 cant := 0;
 writeln(‘El promedio es: ’ , calcularPromedio)  //calcularPromedio:2:2
 end;
 else
 writeln(‘Dividir por cero no parece ser una buena idea’);
end.
{
a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero 
parece incompleta. ¿qué debería agregarle para que funcione correctamente?
//Falta retornar el resultado de la funcion--> calcularPromedio:=prom
b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse. 
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
//Invocar en una variable--> c:=calcularPromedio
c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el programa? 
Considere las tres posibilidades:
i) El programa original 
//da error,no imprime nada.
ii) El programa luego de realizar la modificación del inciso a)
//Imprime -1.Porque inicializa cant a cero e invoca nuevamente al calculo.
iii) El programa luego de realizar las modificaciones de los incisos a) y b).
//Imprime 8.
}

{
8 Dado el siguiente programa:
}
program anidamientos;
 procedure leer;
 var
 letra : char;
 function analizarLetra : boolean
 begin
 if (letra >= ‘a’) and (letra <= ‘z’) then
 analizarLetra := true;
 else
 if (letra >= ‘A’) and (letra <= ‘Z’) then
 analizarletra := false;                   //analizarletra:=true
 end; { fin de la funcion analizarLetra }
 begin
 readln(letra);
 if (analizarLetra) then
 writeln(‘Se trata de una minúscula’)
 else
 writeln(‘Se trata de una mayúscula’);
 end; { fin del procedure leer}
var
 ok : boolean; 
begin { programa principal }
 leer;
 ok := analizarLetra;
 if ok then
 writeln(‘Gracias, vuelva prontosss’); 
end.
{
a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto puede
traer problemas en el código del programa principal.
i) ¿qué clase de problema encuentra?
//No se puede acceder a la funcion analizarLetra fuera del procedure leer.
ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
//Invocar a la funcion ok:=analizarLetra dentro del procedure leer.
b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
iii) ¿Cómo se puede resolver este problema?
//Porque if (letra >= ‘A’) and (letra <= ‘Z’) then tiene que dar verdadera.
//Se resuelve con analizarletra:=true.
}
