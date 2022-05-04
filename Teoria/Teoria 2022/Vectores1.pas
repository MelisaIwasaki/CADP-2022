{
Realizar un programa que lea 20 autos que están a la venta en una concesionaria.De cada auto se conoce marca,
modelo,kms y patente.
Informar la cantidad de autos cuyos kms superen el romedio de los kms de los autos que estan en la venta.
Ahora al programa agregar los siguientes módulos:
a.Retornar el primer auto cuya marca sea 'Fiat'(seguro existe).
b.Retornar la posición en donde se encuentra el auto con patente'AZ687BA'(puede no existir).
c.Retornar la cantidad de autos con al menos 20.000 kms.
d.Retornar los autos con kms par.
e.Informar la cantidad de autos con kms par de marca 'Fiat'.
}
program uno;
const
  cant=20;
type
  auto=record
   marca:string;
   modelo:string;
   kms:integer;
   patente:string;
  end;
 Autos=array[1..cant]of auto;
 
function patente(c:autos;pat:string):integer;  //b.Retornar la posición en donde se encuentra el auto con patente'AZ687BA'(puede no existir).
Var
  i:integer;
Begin
  i:=1;
  while(i < cant)and(c[i].patente <> pat)do 
    i:= i + 1;
  if(i <= cant)then
    patente:= i
  else
    patente:=-1;
End;
Procedure autosKmPar(c:autos;var c2:autos;var dL:integer);   //d.Retornar los autos con kms par.
Var
  i:integer;
Begin
  dL:=0;
  for i:=1 to cant do
    if(c[i].kms MOD 2 = 0)then
      Begin
        dL:=dL+1;
        c2[dL]:=c[i];
      End;
End;
Function patenteParFiat(c:autos;dL:integer):integer;  //e.Informar la cantidad de autos con kms par de marca 'Fiat'.
Var
  i,cantidad:integer;
Begin
  cantidad:=0;
  for i:= 1 to dL do
    if(c[i].marca='Fiat')then
      cantidad:=cantidad+1;
      
  patenteParFiat:=cantidad;
End;
var
  Conce,autosP:autos;
  Prom:real;
  dimL:integer;
  pat:string;
  a:auto;
begin
  cargarAutos(conce);
  prom:=promedio(conce);
  write(superan(conce,prom));
  primer(conce,a);
  read(pat);
  write(patente(conce,'AZ687BA'));
  write(cant2000(conce));
  autosKmPar(conce,autosP,dimL);
  write(patenteParFiat(autosP,dimL));
End.
{
Forma correcta:
c[i].marca = 'Fiat'; --> c:vector,i:posicion,marca:campo

Forma incorrecta:
c.marca[i] = 'Fiat'; --> c:reg,marca:vector,i:pos

c[i.marca] = 'Fiat'; --> c:vector,i:reg,marca:campo

c[i.marca = 'Fiat']; --> c:vector de boolean
}
