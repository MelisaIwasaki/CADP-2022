{
Un banco requiere el procesamiento de las cuentas de sus clientes. De cada cuenta se conoce el nro. de cuenta, nombre de sucursal, 
nombre y apellido del cliente, fecha de creación de la cuenta y saldo. 
El procesamiento finaliza con el nro. de cuenta -1 y los clientes se leen ordenados por nro. de cuenta. 
Como máximo el banco atiende 10000 clientes.

Escribir un programa que: 
a-Informe el nombre y apellido de los clientes cuyo saldo supera el promedio de los saldos de las cuentas del banco.
b-Informe la cantidad de cuentas abiertas en marzo de 2021.
c-Agregue una nueva cuenta con el nro. siguiente al ultimo nro. de cuenta ingresado, para el cliente Juan García
en la sucursal La Plata con saldo inicial en $100 en el día de la fecha.
d-Informe el nombre y apellido del cliente con nro. de cuenta 3500.
e-Informe el nombre y apellido del primer cliente almacenado de la sucursal Gonnet.
f-Sabiendo que el nro de cuenta 3300 no existe, inserte una nueva cuenta con ese nro para el cliente
 Ana Paus en la sucursal Ensenada con saldo inicial en $150 en el dia de la fecha
g- Eliminar el primer cliente almacenado con saldo 1000
 }
 
program vector1;
const dimF = 10000;
type rango = 0..dimF;
     fecha = record
               dia: 1..31;
               mes: 1..12;
               anio: 1900..2100;
             end;
     cadena20 = string[20];
     cuenta = record
                nro: integer;
                suc: cadena20;
                nom: cadena20;
                ape: cadena20;
                fechaC: fecha;
                saldo: real;
              end;
     vector = array [1..dimF] of cuenta;

procedure CargarCuentas (var v: vector; var dimL: rango);
    procedure LeerCuenta (var c: cuenta);
      procedure LeerFecha (var f: fecha);
      begin
        write ('   Ingrese dia: ');read (f.dia);
        write ('   Ingrese mes: ');read (f.mes);
        write ('   Ingrese anio: '); read (f.anio);
      end;
    Begin
       write ('Ingrese numero cuenta: '); readln (c.nro);
       if (c.nro <> -1) then
       begin
         write ('Ingrese sucursal: ');readln (c.suc);
         write ('Ingrese nombre: ');readln (c.nom);
         write ('Ingrese apellido: ');readln (c.ape);
         write ('Ingrese saldo: ');readln (c.saldo);
         writeln ('Ingrese fecha creacion: ');LeerFecha (c.fechaC);
 end;
end;

var c: cuenta;
begin
  LeerCuenta (c); dimL:= 0;
  while (c.nro <> -1 ) and (dimL < dimF) do
  begin
   dimL:= dimL + 1;
   v [dimL]:= c;
   if (dimL < dimF) then LeerCuenta (c);
  end;
end;

procedure PuntoA (v: vector; dimL: rango);
  function Promedio (v: vector; dimL: rango): real;
  var sumaSaldos: real; i: integer;
  begin
    sumaSaldos:= 0;
    For i:= 1 to dimL do
      sumaSaldos:= sumaSaldos + v [i].saldo;
    Promedio:= sumaSaldos / dimL;
  end;
    
var prom: real; i: integer;
begin
  writeln;
  writeln ('------- Clientes que superan el promedio --------');
  if (dimL = 0)
  then writeln ('No hay cuentas')
  else begin
        prom:= Promedio (v,dimL);
        for i:= 1 to dimL do
          if (v[i].saldo >= prom) then writeln (v[i].nom, ' ', v[i].ape)
       end;
end;  

procedure PuntoB (v: vector; dimL: rango);
var cant, i: integer;
begin
  writeln;
  writeln ('------- Cantidad de cuentas abiertas en marzo de 2021 --------');
  cant:= 0;
  for i:= 1 to dimL do
   if (v[i].fechaC.mes = 3) and (v[i].fechaC.anio = 2021) then cant:= cant +1;
  writeln (cant);
end;

procedure PuntoD (v: vector; dimL: rango);

  Function BuscoPosElemOrd (numC: integer; v:Vector; dimL: rango): rango;
  var pos : rango;
  begin
    pos:=1;
    while (pos <= dimL) and (numC > v[pos].nro) do
             pos:=pos+1;
    if ( pos > dimL ) or (numC < v [pos].nro) then pos:=0;
    BuscoPosElemOrd:= pos;
  end; 

var pos: rango;
begin
  writeln;
  writeln ('------- Cliente con numero de cuenta 3500 --------');
  pos:= BuscoPosElemOrd (3500, v, dimL);
  if pos = 0 then writeln ('No existe el cliente con numero de cuenta 3500')
  else writeln (v[pos].nom, ' ', v[pos].ape)
end;
  
procedure PuntoE (v: vector; dimL: rango);
  Function BuscarPosElem (x: cadena20; v: vector; dimL: rango): rango;
  var pos: rango; exito: boolean;
  Begin
    pos:=1;
    exito:= false;
    while (pos <= dimL) and (not exito) do
      if (x = v[pos].suc) then exito:= true
                          else pos:=pos+1;
    if (exito = false) then pos:=0;
    BuscarPosElem := pos;
  end;

  var pos: rango;
begin
  writeln;
  writeln ('------- Primer cliente almacenado de la sucursal Gonnet --------');
  pos:= BuscarPosElem ('Gonnet', v, dimL);
  if pos = 0 then writeln ('No existe')
  else writeln (v[pos].nom, ' ', v[pos].ape)
end;

procedure PuntoF (var v: vector; var dimL: rango);
   Function BuscarPosicion ( x: integer;  v: vector; dimL: rango): rango;
     var pos : rango;                            {        1       2       3     4      5       6          }
    begin                                        { v->   1000    1500    3300   4000   5200   8000     dimL-> 6 }
        pos:=1;                                  { pos->  3   j-> 5 -> 4 -> 3}
        while (pos<=dimL) and (x > v[pos].nro) do 
          pos:=pos+1;
        BuscarPosicion:= pos;
      end; 

  Procedure Insertar (var v:vector; var dimL: rango; pos: rango; elem: cuenta);
    var j: rango;
    begin
        for j:= dimL downto pos do 
          v [ j +1 ] := v [ j ] ;
        v [ pos ] := elem; 
        dimL := dimL + 1;
    End;

var elem: cuenta; pos: rango;
begin
  writeln;
  writeln ('------- Insertar cuenta --------');
  if (dimL < dimF)
  then begin
          pos:= BuscarPosicion (3300, v, dimL);
          elem.nro:= 3300; elem.nom:= 'Ana'; elem.ape:= 'Paus';
          elem.saldo:= 150; elem.suc:= 'Ensenada'; 
          elem.fechaC.dia:= 20; elem.fechaC.mes:= 9; elem.fechaC.anio:= 2021;
          Insertar (v, dimL, pos, elem);
          writeln ('Cuenta insertada')
       end
  else writeln ('No se puede insertar porque no hay espacio');
end;

procedure PuntoG (var v: vector; var dimL: rango);
  Function BuscarPosElem (x: real; v: vector; dimL: rango): rango;
  var pos: rango; exito: boolean;
  Begin
    pos:=1;
    exito:= false;
    while (pos <= dimL) and (not exito) do
      if (x = v[pos].saldo) then exito:= true
                          else pos:=pos+1;
    if (exito = false) then pos:=0;
    BuscarPosElem := pos;
  end;
  Procedure BorrarPosModif (var v:vector; var dimL: rango; pos:rango);
  var i: rango;
  begin
    for i:= pos + 1  to   dimL  do                {        1       2       3     4      5       6          }
       v [ i - 1 ]  :=  v [ i] ;                  { v->   1500    800    2200   400   8800     8800     dimL-> 6 -> 5 }
    dimL := dimL - 1 ;                            { pos -> 4   i->  5 ->  6          } 
  end;

var pos: rango;  
begin
  writeln;
  writeln ('------- Eliminar cuenta --------');
  pos:= BuscarPosElem (1000, v, dimL);
  if pos <> 0 then begin
                    BorrarPosModif (v, dimL, pos);
                    writeln ('Cuenta eliminada')
                   end
  else writeln ('No se encontro cuenta con saldo 1000');
end;

var v: vector; dimL: rango;
begin
  CargarCuentas (v, dimL);
  write ('Dimension logica: ', dimL);
  PuntoA (v, dimL);
  PuntoB (v, dimL);
  PuntoD (v, dimL);
  PuntoE (v, dimL);
  PuntoF (v, dimL);
  PuntoG (v, dimL);
end.
               
