{Un centro de deportes quiere almacenar la información de sus clientes y de los 4 tipos de actividades que ofrece: 
1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre. 
Para ello, se debe leer el precio mensual de cada actividad y almacenarlo en un vector. 
De cada uno se conoce: código de cliente, DNI, apellido y nombre, fecha de ingreso, edad y el número de actividad elegida (1..4). 
Escribir un programa que invoque a módulos independientes para resolver cada inciso: 
a) Lea la información de los clientes y los almacene en una estructura de datos. La lectura finaliza con el código de cliente -1 y 
los clientes se leen ordenados por código de cliente. Como máximo el centro de deportes atiende a 1000 clientes.
b) Informe el nombre y apellido de los clientes cuya edad supera el promedio de las edades de los clientes del centro de deportes.
c) Agregar un nuevo cliente, con el código siguiente al último código de cliente ingresado, para el cliente Juan García con DNI 11111, 
de 20 años de edad y que eligió la actividad Libre, en el día de la fecha.
d) Informe el nombre y apellido del cliente con un código de cliente determinado.
e) Informe el nombre y apellido de los clientes con fecha de ingreso en un año determinado.
f) Sabiendo que el código de cliente 3300 no existe, inserte un nuevo cliente con ese código para el cliente Ana Paus  de 45 años y 
actividad elegida Musculación, en el día de la fecha.
g) Elimine el cliente correspondiente a un código que se lee. 
h) Elimine todos los clientes que realizan la actividad Spinning.
}

program ejerDeportes;
const cantAct = 4;
      dimF = 1000;
type vectorPrecios = array [1..cantAct] of real;
     cadena25 = string [25];
     subrangoEdad = 14..80;
     subrangoAct = 1..cantAct;
     fecha = record
               dia: 1..31;
               mes: 1..12;
               anio: 2000..2050;
             end;
     cliente = record
                  cod: integer;
                  dni: integer;
                  apellido: cadena25;
                  nombre: cadena25;
                  edad: subrangoEdad;
                  act: subrangoAct;
                  fechaIngreso: fecha;
                end;
     vectorClientes = array [1..dimF] of cliente;

procedure CargarClientes (var v: vectorClientes; var dimL: integer);

var c: cliente
begin
  LeerCliente (c); dimL:= 0;
  while (c.cod <> -1) and (dimL < dimF) do
  begin
    dimL:= dimL + 1;
    v [dimL]:= c;
    LeerCliente (c);
  end;
end;
  
procedure PuntoB (v: vectorClientes; dimL: integer);
 function Promedio (v: vectorClientes; dimL: integer): real;
 var sumaEdades, i: integer;
 begin
   sumaEdades:= 0;
   for i:= 1 to dimL do
     sumaEdades:= sumaEdades + v[i].edad;
   Promedio:= sumaEdades / dimL;
 end;
    
var prom: real; i: integer;
begin
  if (dimL = 0)
  then writeln ('Sin clientes para calcular promedio')
  else begin
         prom:= Promedio (v, dimL);
         for i:= 1 to dimL do
             if (v[i].edad > prom) then writeln (v[i].nombre, v[i].apellido);
       end;
end;

procedure PuntoC (var v: vectorClientes; var dimL: integer); 
{Agregar un nuevo cliente, con el código siguiente al último código de cliente ingresado, para el cliente 
Juan García con DNI 11111, de 20 años de edad y que eligió la actividad Libre, en el día de la fecha.}
var c: cliente;
begin
  if (dimL = dimF) then writeln ('No hay mas lugar')
  else Begin
         if (dimL = 0) then c.cod:= 1   {no hay clientes guardados}
                       else c.cod:= v[dimL].cod + 1;;
         c.dni:= 11111;
         c.apellido:= 'Garcia';
         c.nombre:= 'Juan';
         c.edad:= 20;
         c.act:= 4;
         c.fechaIngreso.dia:= 26;
         c.fechaIngreso.mes:= 4;
         c.fechaIngreso.anio:= 2021;
       end;
end;     

Function BuscoPosElemOrd (x: integer; v: vectorClientes; dimL: integer): integer;
  var pos : integer;
  begin
    pos:=1;
    while (pos <= dimL) and (x > v[pos].cod) do
             pos:=pos+1;
    if ( pos > dimL ) or (x < v [pos].cod) then pos:=0;
    BuscoPosElemOrd:= pos;
  end; 


procedure PuntoD (v: vectorClientes; dimL: integer);
{Informe el nombre y apellido del cliente con un código de cliente determinado.}
var codigo: integer;
begin
  read (codigo);
  pos:= BuscarPosElemOrd (codigo, v, dimL);
  if (pos = 0) then writeln ('No existe cliente con codigo: ', codigo)
               else writeln (v[pos].nombre, v[pos].apellido);
end;

procedure PuntoE (v: vectorClientes; dimL: integer);
{Informe el nombre y apellido de los clientes con fecha de ingreso en un año determinado.}
var i, anio: integer;
begin
  read (anio);
  for i:= 1 to dimL do
     if (v[i].fechaIngreso.anio = anio) then writeln (v[i].nombre, v[i].apellido);
end;

procedure PuntoF (var v: vectorClientes; var dimL: integer); 
{Sabiendo que el código de cliente 3300 no existe, inserte un nuevo cliente con ese código para el cliente Ana Paus con DNI 22222
de 45 años y actividad elegida Musculación, en el día de la fecha.}

 Procedure InsertarElemOrd (var v: vectorClientes; var dimL: integer; elem : cliente; var exito: boolean);

  Function DeterminarPosicion ( x: integer;  v:Vector; dimL: integer): integer;
     var pos : Indice;
    begin
        pos:=1;
         while (pos<=dimL) and (x > v[pos].cod) do 
          pos:=pos+1;
        DeterminarPosicion:= pos;
      end; 

  Procedure Insertar (var v:vectorClientes; var dimL: integer; pos: integer; elem: cliente);
    var j: indice;
    begin
        for j:= dimL downto pos do 
          v [ j +1 ] := v [ j ] ;
        v [ pos ] := elem; 
        dimL := dimL + 1;
    End;

 var pos: indice;
 Begin
   exito := false;  
   if (dimL < dimF) then begin
                           pos:= DeterminarPosicion (elem, v, dimL);
                           Insertar (v, dimL, pos, elem);
                           exito := true;
                         end;
 end;
var c: cliente; exito: boolean;
begin
         c.cod:= 3300;
         c.dni:= 22222;
         c.apellido:= 'Paus';
         c.nombre:= 'Ana';
         c.edad:= 45;
         c.act:= 1;
         c.fechaIngreso.dia:= 26;
         c.fechaIngreso.mes:= 4;
         c.fechaIngreso.anio:= 2021;
         InsertarElemOrd (v, dimL, c; exito);
         if exito then writeln ('Ana Paus fue insertada exitosamente')
                  else writeln ('Ana Paus no pudo se insertada');
end;

Procedure BorrarPosModif (var v:vectorClientes; var dimL:integer; pos: integer);
     var i: integer; 
     begin
      for i:= pos + 1  to   dimL  do
         v [ i - 1 ]  :=  v [ i] ;
      dimL := dimL - 1 ;         
     end;
     
procedure PuntoG (var v: vectorClientes; var dimL: integer); 
{Elimine el cliente correspondiente a un código que se lee.  }  
   Procedure BorrarElem (var v: vectorClientes;  var dimL: integer; elem : integer; var exito: boolean);
   var pos: integer;
   Begin
     exito:= False;
     pos:= BuscarPosElemOrd (elem, v, dimL);
     if pos <> 0 then begin
                        BorrarPosModif (v, dimL, pos);
                        exito:= true;
                 end;
end;
var codigo: integer;
begin
  read (codigo);
  BorrarElem (v, dimL, codigo, exito);
  if exito then writeln ('El cliente con codigo ', codigo, 'fue eliminado')
           else writeln ('El cliente con codigo ', codigo, 'no existe entonces no se pudo eliminar');
end;
 
procedure PuntoH (var v: vectorClientes; var dimL: integer); 
{Elimine todos los clientes que realizan la actividad Spinning.}
var pos: integer;
begin
  pos:= 1;
  while (pos <= dimL) do
  begin
     if (v[pos].act = 2) then BorrarPosModif (v, dimL, pos);
                         else pos:= pos + 1;
  end;
end;                    

  
procedure CargarPrecios (var v: vectorPrecios);
var i: subrangoAct;
begin
  for i:= 1 to cantAct do
    read ( v[i]);
end;

var v: vectorClientes; vP: vectorPrecios;
    dimL: integer;
Begin
  CargarPrecios (vP);
  CargarClientes (v, dimL);
  PuntoB (v, dimL);
  PuntoC (v, dimL);
  PuntoD (v, dimL);
  PuntoE (v, dimL);
  PuntoF (v, dimL);
  PuntoG (v, dimL);
  PuntoH (v, dimL);
end.
