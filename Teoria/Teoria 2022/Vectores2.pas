{
Realizar un programa en el cual una concesionaria dispone de a lo sumo 60 autos. De cada auto se conoce marca,
modelo,kms y patente.
Se pide:
a.Realizar un módulo que reciba un nuevo auto para la concesionaria y lo agregue.
b.Realizar un módulo que reciba un nuevo auto y una posición en la cual se debe insertar el auto.
}
program uno;
Const
  cant = 60;
Type
  auto = record
   marca: string;
   modelo: string;
   kms: integer;
   patente: string;
  end;
 Autos = array[1..cant] of auto;
 
procedure agregarAuto(var c:autos;var dL:integer;a:auto;var ok:boolean);
Begin
  ok:= false;
  if(dL < cant)then
   Begin
     dL:= dL + 1;
     c[dL]:= a;
     ok:= true;
   End;
End;
procedure insertarAuto(var c:autos;var dL:integer;a:auto;pos:integer;var ok:boolean);
Var
  i:integer;
Begin
  ok:= false;
  if(dL < cant)and((pos>= 1)and(pos<= dL))then
   begin
    for i:= dL downto pos do
      c[i+1]:= c[i];
    dL:=dL + 1;
    c[pos]:= a;
    ok:= true;
   End;
End;
Var
  Conce:autos;
  dimL:integer;
  a:auto;
  Ok:boolean;
  
begin
  cargarAutos(conce,dimL);//se dispone
  leerAuto(a);
  agregarAuto(conce,dimL,a,ok);
  if (ok) then write('Se pudo agregar');
  else write('NO se pudo agregar');
  read(pos);
  leerAuto(a);
  insertarAuto(conce,dimL,a,pos,ok);
  if (ok) then write('Se pudo insertar');
  else write('NO se pudo insertar');
end.
