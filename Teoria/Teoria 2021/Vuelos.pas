{Una compañía aérea desea analizar la información de los tickets vendidos a sus clientes.La empresa cuenta con
1200 servicios de vuelos diferentes,en adelante denominamos "vuelo".
De cada ticket se conoce el código de vuelo(entre 1 y 1200),DNI del cliente,país de origen,país de destino,y 
el valor de ticket.La información de los ticket se dispone en una estructura de datos adecuada, y se encuentra
ordenada por el DNI del cliente(un cliente puede haber comprado más de un ticket en distintos vuelos).Realizar
un programa que procese la información de los tickets y calcule:
- Cantidad de vuelos dentro de un mismo país que hayan tenido más de 50 pasajeros.
- Armar una estructura con los DNI y edad de los clientes que compraron 5 tickets
- DNI del cliente que más dinero gastó en tickets.
- Cantidad de clientes cuyo DNI terminen en 0 ó en 5.}


program vuelos;
const dimF = 1200;
type subrango = 1..dimF; cadena30 = string [30];  subrango2: 18..120;
     ticket = record
                cod: subrango;
                dni: integer;
                edad: subrango2;
                origen: cadena30;
                destino: cadena30;
                valor: real;
              end;
     lista = ^nodo;
     nodo = record
              datos: ticket;
              sig: lista;
            end;
     cliente5 = record
                  dni: integer;
                  edad: subrango2;
                end;
     lista5 = ^nodo5;
     nodo5 = record
               datos: cliente5;
               sig: lista5;
             end;
     vector = array [subrango] of integer;

procedure AgregarAdelante (var l: lista5; elem: cliente5);
var nue: lista5;
begin
  new (nue);
  nue^.datos:= elem;
  nue^.sig:= l;
  l:= nue;
end;

function Procesar (v: vector): integer;
var i: subrango; cant: integer;
begin
  cant:= 0;
  for i:= 1 to dimF do
    if (v[i] > 50) then cant:= cant + 1;
  Procesar:= cant;
end;

var lT: lista; l5: lista5; dniActual, cant, cant05, dniMax: integer; monto, maxMonto: real;
    cli5: cliente5;  v: vector;
begin
  CargarTickets (lT); { se dispone}
  InicializarVector (v);
  l5:= nil; cant05:= 0; maxMonto:= -1;
  while (lT <> nil)  do
  begin
    dniActual:= lT^.datos.dni; cant:= 0; monto:= 0; edadActual:= lT^.datos.edad;
    if (dniActual mod 5 = 0) then cant05:= cant05 + 1;
    while (lT <> nil) and (dniActual = lT^.datos.dni) do
    begin
      cant:= cant + 1;
      monto:= monto + lT^.datos.valor;
      if (lT^.datos.origen = lT^.datos.destino) then v [lT^.datos.cod]:= v [lT^.datos.cod] + 1;
      lT:= lT^.sig
    end;
    if (cant = 5) then
    begin
      cli5.dni:= dniActual;
      cli5.edad:= edadActual;
      AgregarAdelante (l5, cli5);
    end;
    if (monto > maxMonto) then
    begin
      maxMonto:= monto;
      dniMax:=dniActual;
    end;
  end;
  writeln ('Dni del cliente que mas gasto: ', dniMax);
  writeln ('Cantidad de clientes cuyo dni termina en 0 o 5: ', cant05);
  writeln ('Cantidad de vuelos dentro de un mismo pa﨎 que tengan m疽 de 50 pasajeros: ', Procesar (v));
end.
