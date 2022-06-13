{Un centro de deportes quiere almacenar la información de sus clientes y de los 4 tipos de actividades que ofrece:
1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre. 
Para ello, se debe leer el precio mensual de cada actividad y almacenarlo en un vector. 
Además, se debe leer y almacenar la información de los clientes (a lo sumo 1000). 
De cada uno se conoce: código de cliente, DNI, apellido, nombre, edad y el número de actividad elegida (1..4). La lectura 
finaliza cuando llega el DNI 0. 
Se pide:
 - Generar la estructura de datos que almacene los clientes del centro de deportes.
 - Leer los datos de un cliente e insertarlo en una posición que también se lee.
 - Eliminar de la estructura el cliente de una posición que se lee.
 - Calcular e informar el monto total a recaudar por cada actividad. 
}

program ejerDeportes;
const cantAct = 4;
      dimF = 1000;
type vectorPrecios = array [1..cantAct] of real;
     cadena25 = string [25];
     subrangoEdad = 14..80;
     subrangoAct = 1..cantAct;
     cliente = record
                  cod: integer;
                  dni: integer;
                  apellido: cadena25;
                  nombre: cadena25;
                  edad: subrangoEdad;
                  act: subrangoAct;
                end;
     vectorClientes = array [1..dimF] of cliente;
     vectorContador = array [subrangoAct] of integer;

procedure CargarPrecios (var v: vectorPrecios);
var i: subrangoAct;
begin
  for i:= 1 to cantAct do
    read ( v[i]);
end;

procedure Informar (vC: vectorContador; v: vectorPrecios);
var i: subrangoAct;
begin
  for i:= 1 to cantAct do
    write ( vC [i] * v[i]);
end;

procedure InicializarVector (var vC: vectorContador);
var i: subrangoAct;
begin
  for i:= 1 to cantAct do
    vC [i] := 0;
end;

procedure LeerCliente (var c: cliente);
begin
  read (c.dni);
  if (c.dni <> 0) then begin
                            read (c.cod); 
                            read (c.apellido);
                            read (c.nombre);
                            read (c.edad);
                            read (c.act);
                       end;
end;

procedure Generar (var vClientes: vectorClientes; var dimL: integer; var vContador: vectorContador);
var cli: cliente;
begin
  dimL:= 0;
  LeerCliente (cli);
  while (dimL < dimF) and (cli.dni <> 0) do
  begin
    dimL:= dimL + 1;
    vClientes [dimL] := cli;
    vContador [cli.act] := vContador [cli.act] + 1;
    LeerCliente (cli);
  end;
end;

Procedure INSERTARPOS (var v:vectorClientes; var dimL: integer; elemento: cliente; pos: integer; var exito: boolean);
var i : integer;
Begin
 exito:= false;
 if (dimL < dimF) and (pos>=1) and (pos<= dimL)
     then begin      
            exito:= true;
            for  i:= dimL downto pos do
              v [ i + 1 ] := v [ i ] ;
            v [pos] := elemento;     
            dimL := dimL + 1;
          end;
end;

Procedure BorrarPos (var v: vectorClientes; var dimL: integer; pos: integer; var exito: boolean);
var i: integer; 
 begin
  exito := false;
  if (pos >=1) and (pos <= dimL) 
     then begin
           exito := true;    
           for i:= pos + 1  to   dimL  do
              v [ i - 1 ]  :=  v [ i ] ;
           dimL := dimL - 1 ;         
          end;
 end;     
     
var vPrecios: vectorPrecios;
    vClientes: vectorClientes; dimL: integer;
    cli: cliente; pos: integer;
    exito: boolean;
    vContador: vectorContador;
begin
  CargarPrecios (vPrecios);
  InicializarVector (vContador);
  Generar (vClientes, dimL, vContador);
  Informar (vContador, vPrecios);
  LeerCliente (cli); read (pos);
  InsertarPos (vClientes, dimL, cli, pos, exito);
  if (exito) then writeln ('Cliente insertado')
             else writeln ('Cliente no insertado');
  read (pos);
  BorrarPos (vClientes, dimL, pos, exito);
  if (exito) then writeln ('Cliente eliminado')
             else writeln ('Cliente no eliminado');
end.
  
