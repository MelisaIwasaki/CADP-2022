{Un criadero de conejos está analizando ciclos de reproducción. El criadero cuenta con conejas reproductoras y dispone de una estructura que contiene, 
para cada coneja, su código, año de nacimiento, nombre, cantidad de partos (entre 1 y 10) y cantidad de crías que tuvo en cada parto.

a) Realice un módulo que reciba la información de las conejas y retorne en una estructura adecuada el código, el nombre y el año de nacimiento de las 
conejas que tuvieron en promedio más de 5 crías por parto.
b) Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par, nacidas antes del año 2016.
c) Realice una función que reciba la información de las conejas y un código de coneja, y retorne la cantidad máxima de 
crías que tuvo la coneja con dicho código en alguno de sus partos (retornar -1 si la coneja no se encuentra en la estructura).
}

program criadero;
const dimF = 10
type subrango = 2000..2050; cadena = string [10];
     subrango2 = 1..dimF;
     vector = array [subrango2] of integer;
     coneja = record
                codigo: integer;
                anioNac: subrango;
                nombre: cadena;
                cantPartos: subrango2;
                partos: vector;
              end;
     lista = ^nodo;
     nodo = record
              datos: coneja;
              sig: lista;
            end;
     coneja5 = record
                 codigo: integer;
                 anioNac: subrango;
                 nombre: cadena;
               end;
     lista5 = ^nodo5;
     nodo5 = record
               datos: coneja5;
               sig: lista5;
             end;
             
function ModuloA (l: lista): lista5;
  function Promedio (v: vector; dimL: subrango2): real;
  var i, suma: integer;
  begin
    suma:= 0;
    for i:= 1 to dimL do
      suma:= suma + v[i];
    Promedio:= suma/dimL;
  end;
  procedure AgregarAdelante (var l: lista5; elem: coneja5);
  var nue: lista5;
  begin
    new (nue); nue^.datos:= elem;
    nue^.sig:= l;
    l:= nue;
  end;  
    
var l5: lista5; prom: real; c5: coneja5;
begin
  l5:= nil;
  while (l <> nil) do
  begin
    prom:= Promedio (l^.datos.partos, l^.datos.cantPartos);
    if (prom > 5) then begin
                         c5.codigo:= l^.datos.codigo;
                         c5.nombre:= l^.datos.nombre;
                         c5.anioNac:= l^.datos.anioNac;
                         AgregarAdelante (l5, c5);
                       end;
    l:= l^.sig;
  end;
end;

procedure ModuloB ( l: lista5);     
{Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par, nacidas antes del año 2016.}                    
begin
  while (l <> nil) do
  begin
    if (l^.datos.codigo MOD 2 = 0) and (l^.datos.anioNac < 2016)
    then writeln (l^.datos.nombre);
    l:= l^.sig;
  end;
end;

funtion ModuloC (l: lista; num: integer): integer;  
{Realice una función que reciba la información de las conejas y un código de coneja, y retorne la cantidad máxima de 
crías que tuvo la coneja con dicho código en alguno de sus partos (retornar -1 si la coneja no se encuentra en la estructura).
	  } 
var max: integer;	   
begin
  while(l<>nil)and (l^.datos.codConeja <> num) do
     l:= l^.sig;
  max:= -1;
  if (l <> nil) then begin { o invocar a la funcion Maximo (l^.datos.partos, l^.datos.cantPartos )}
                      for i:= 1 to l^.datos.cantPartos do
                         if(l^.datos.partos [i] > max)then max:= l^.datos.partos [i]
                     end;
  ModuloC:= max;
end;
	 
	 
	  
var lC: lista; l5: lista5;  cantMax, codConeja: integer;      
begin
  CargarConejas (lC); { se dispone }
  l5:= ModuloA (lC);
  ModuloB (l5);
  read (codConeja);
  cantMax:= ModuloC (lC, codConeja);
end.
