{
1. Ejercicios para trabajar los temas de registros y modularización
1. Defina un tipo de datos apropiado para representar un átomo de cualquier elemento
2. Realice un módulo que permita ingresar y almacenar un átomo leído por teclado. De cada
átomo se lee su nombre, y la cantidad de protones, electrones y neutrones
3. Realice un módulo que reciba un átomo y retorne su masa
4. Realice un módulo que reciba un átomo y retorne su carga (positiva, negativa o neutra)
5. Realice un módulo que reciba un átomo y retorne su número másico
6. Realice un módulo que reciba un átomo A y un átomo B y retorne si B es isótopo de A o si
se trata de otro elemento.
Utilizando los módulos ya definidos, realice un programa que lea la información de 30 átomos e
imprima:
● La cantidad de átomos que son iones positivos y la cantidad que son iones negativos
● El nombre de los dos átomos de mayor masa
● La información (nombre, protones, electrones y neutrones) del átomo con menor número
másico
}
program FYQ;
const
  ATO=3;  //30;
type
  cadena=string[30];
  atomo=record
    nombre:cadena;
    protones:integer;
    electrones:integer;
    neutrones:integer;
  end;
procedure leer(var a:atomo);
begin
  writeln('Ingrese el nombre');
  readln(a.nombre);
  writeln('Ingrese la cantidad de protones');
  readln(a.protones);
  writeln('Ingrese la cantidad de electrones');
  readln(a.electrones);
  writeln('Ingrese la cantidad de neutrones');
  readln(a.neutrones);
end;
function calcularMasa(a:atomo):real;
begin
  calcularMasa:=a.protones*1.0+a.electrones*0.000555556+a.neutrones*1.0005;
end;
function calcularCarga(a:atomo):integer;
begin
  if(a.protones=a.electrones)then
    calcularCarga:=0
  else
    if(a.protones>a.electrones)then
      calcularCarga:=1
    else
      calcularCarga:=-1;
end;
function calcularMasico(a:atomo):real;
begin
  calcularMasico:=a.protones+a.neutrones;
end;
function isotopo(atomoA,atomoB:atomo):boolean;
begin
  isotopo:=(atomoA.protones=atomoB.protones)and(atomoA.neutrones<>atomoB.neutrones);
end;
procedure mayorMasa(var max1,max2:real;var nom1,nom2:cadena;masa:real;nom:cadena);
begin
  if(masa>max1)then begin
    max2:=max1;
    max1:=masa;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(masa>max2)then begin
         max2:=masa;
         nom2:=nom;
  end;
end;
procedure inicializar(var aMin:atomo);
begin
  aMin.nombre:='';
  aMin.protones:=0;
  aMin.electrones:=0;
  aMin.neutrones:=0;
end;
procedure minimoMasico(a:atomo;var aMin:atomo;min,masico:real);
begin
  if(masico<min)then begin
    min:=masico;
    aMin:=a;
  end;
end;
var
  a,aMin:atomo;
  i,carga,cantPositivo,cantNagativo:integer;
  masa,masico,max1,max2,min:real;
  nom1,nom2:cadena;
begin
  min:=9999;
  max1:=-1;nom1:='';
  inicializar(aMin);
  cantPositivo:=0;
  cantNagativo:=0;
  for i:=1 to ATO do begin
    leer(a);
    masa:=calcularMasa(a);
    carga:=calcularCarga(a);
    masico:=calcularMasico(a);
    if(carga=1)then
      cantPositivo:=cantPositivo+1;
    if(carga=-1)then
      cantNagativo:=cantNagativo+1;
    mayorMasa(max1,max2,nom1,nom2,masa,a.nombre);
    minimoMasico(a,aMin,min,masico);
  end;
  writeln('La cantidad de átomos que son iones positivos ',cantPositivo);
  writeln(' y la cantidad que son iones negativos ',cantNagativo);
  writeln('El nombre de los dos átomos de mayor masa ',nom1,' y ',nom2);
  writeln('Atomo con menor número másico ',aMin.nombre,' ',aMin.protones,' ',aMin.electrones,' ',aMin.neutrones);
end.
