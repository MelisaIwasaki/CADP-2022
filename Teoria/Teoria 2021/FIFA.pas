{La FIFA está analizando la información de las entradas vendidas para los 52 partidos del mundial de fútbol Qatar 2022. Para ello, 
se lee la información de todas las entradas vendidas. De cada venta se conoce el número de partido (entre 1 y 52), el país del comprador 
y la cantidad de entradas compradas. La información se encuentra ordenada por el país del comprador y la lectura finaliza cuando 
se lee cantidad de entradas -1.
Además, se dispone de los datos de los 52 partidos. De cada partido se conoce el nombre del estadio,  fecha  y los equipos participantes. 

Realizar un programa que informe:
-Para cada país la cantidad de entradas vendidas 
-El nombre del país con mayor cantidad de entradas compradas.
-Cantidad de partidos con más de 30.000 entradas vendidas
-Número de partido y estadio con menor cantidad de entradas vendidas.
}

program FIFA;
const dimF = 52;
type cadena20 = string [20];
     rango = 1..dimF;
     venta = record
               numP: rango;
               paisC: cadena20;
               cant: integer;
             end;
     partido = record
                 nomE: cadena20;
                 dia: 1..31;
                 eq1: cadena20;
                 eq2: cadena20
               end;
     vectorPartidos = array [rango] of partido;
     vectorContador = array [rango] of integer;
     
procedure CargarPartidos (var vP: vectorPartidos);
begin
end;

procedure ProcesarVentas (var vC: vectorContador);
  procedure LeerVenta (var v: venta);
  begin
  end;
var v: venta; paisActual, maxPais: cadena20; cant, maxE: integer;
begin
  LeerVenta (v); maxE:= -1;
  while (v.cant <> -1) do
  begin
    paisActual:= v.paisC;  cant:= 0;
    while (v.cant <> -1) and (paisActual= v.paisC) do
    begin
       cant:= cant + v.cant;
       vC [v.numP]:= vC [v.numP ] + v.cant;
       LeerVenta (v);
    end;
    writeln ('Pais: ', paisActual, ' cantidad de entradas vendidas: ', cant);
    if (cant > maxE) then
    begin
      maxE:= cant;
      maxPais:= paisActual;
    end;
  end;
  writeln ('Nombre del país con mayor cantidad de entradas compradas: ', maxPais)
 end;   
 
procedure ProcesarPartidos (vC: vectorContador; vP: vectorPartidos);
var mas30000, min: integer; i, minNumPartido: rango; 
begin
  mas30000:=0; min:= 32000;
  for i:= 1 to dimF do 
  begin 
    if (vC[i] > 30000) then mas30000:= mas30000 + 1;
    if (vC[i] < min) then
    begin
      min:= vC[i];
      minNumPartido:= i
    end;
  end;
  writeln ('Cantidad de partidos con más de 30.000 entradas vendidas: ', mas30000);
  writeln ('Numero de partido con menos cantidad de entradas: ', minNumPartido, ' y el estado es: ', vP[minNumPartido].nomE);
end;
    
var vP: vectorPartidos; vC: vectorContador;
Begin
  CargarPartidos (vP); { se dispone }
  ProcesarVentas (vC);
  ProcesarPartidos (vC, vP);
end.
