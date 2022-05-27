{Vectores multidimencionales o matrices
Se admiten Multidimensional arrays como [x..y, z..t] y así sucesivamente.

Ejemplo de matriz:}

type
  matriz = array [0..5, 1..3] of extended;

{Acceso a los elementos
Para acceder al elemento de un vector debe indicarse el índice entre corchetes [] después del nombre de la variable del tipo array.
Luego ese elemento puede utilizarce como una variable común.}

Var
   vector  : array [1..3] of Integer;
   matriz  : array[1..5,1..5] of Integer;
   unvalor : Integer;
...
begin
   vector[2] := 4 + 2;
   matriz[2,3] := 7;
   ...
   unvalor := vector[2]; // 6
   unvalor := matriz[2,3]; // 7
end.



{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ONU;
const
  LUG = 2; //100; para probar con 2
  anioI= 2021; //1972; para probar con 2
  anioF= 2022; //uso constante de anio porque tengo que informar el anio
type
  rango= anioI..anioF;
  vector = array[rango, 1..LUG]of real; 

procedure cargar(var v:vector);
var  temperatura:real;
     anio,punto:integer;
begin
  for anio:= anioI to anioF do begin  
    for punto:= 1 to LUG do begin
      writeln('Ingrese la temperatura promedio anual');
      readln(temperatura);
      v[anio,punto]:= temperatura;  
    end;
  end;
end;
procedure maximo(promedio:real;var max:real;var anioMax:integer;anio:integer);
begin
  if(promedio>max)then begin
    max:= promedio;
    anioMax:= anio;
  end;
end;
procedure mayor(temp:real;var maxTemp:real;anio:integer;var anioMayor:integer);
begin
  if(temp>maxTemp)then begin
    maxTemp:= temp;
    anioMayor:= anio;
  end;
end;
procedure mostrar(v:vector);
begin
  writeln(v[2021,1]:2:2,' ',v[2021,2]:2:2,' ',v[2022,1]:2:2,' ',v[2022,2]:2:2);
end;
procedure recorrer(v:vector);
var anio,punto,anioMax,anioMayor,anioAct:integer;
    suma,promedio,max,maxTemp:real;
begin
  max:=-1;maxTemp:=-1;
  for anio:= anioI to anioF do begin  
    suma:= 0;
    anioAct:= anio;
    for punto:= 1 to LUG do begin  //100 puntos diferentes del planeta
      suma:= suma + v[anio,punto];
      mayor(v[anio,punto],maxTemp,anioAct,anioMayor);
    end;
    promedio:= suma / LUG;
    maximo(promedio,max,anioMax,anioAct);
  end;
  writeln('El año con mayor temperatura promedio a nivel mundial: ',anioMax);
  writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años: ',anioMayor);
end;
var
  v:vector;
begin
  cargar(v);
  mostrar(v);//para probar
  recorrer(v);
end.
