{Parcial 11-6-2022

Una panadería artesanal de La Plata vende productos de elaboración propia. La panadería agrupa a sus productos 
en 26 categorías( por ej: 1.Pan; 2.Medialunas; 3.Masas finas; etc.). Para cada categoría se conoce su nombre y 
el precio por kg del producto.
La panadería dispone de información de todas las compras realizadas en el último año. De cada compra se conoce 
el DNI del cliente, la categoría del producto( entre 1 y 26) y la cantidad de kg comprados. La información se 
encuentra ordenada por DNI del cliente.
a)Realizar un módulo que retorne la información de las categorías en una estructura de datos adecuada.
La información se lee por teclado sin ningún orden.De cada categoría se lee el nombre, el código(1 a 26) y el 
precio por kg.
b)Realizar un módulo que reciba la información de todas las compras, la información de las categorías, 
y retorne:
1.DNI del cliente que más compras ha realizado.
2.Monto total recaudado por cada categoría.
3.Cantidad total de compras de clientes con DNI compuesto por, al menos, 3 dígitos pares.
NOTA: Implementar el programa principal.}


program panaderia;
const
  PAN=26;
type
  cadena=string[30];
  rango=1..PAN;
  categoria=record
    nom:cadena;
    cod:rango;
    precio:real;
  end;
  vector=array[rango]of categoria;
  compra=record
    dni:integer;
    cate:rango;
    kg:real;
  end;
  lista=^nodo;
  nodo=record
    dato:compra;
    sig:lista;    //dispone
  end;            //ordenada por DNI del cliente
  vcont=array[rango]of real;

procedure leerCategoria(var c:categoria);
begin
  readln(c.nom);
  readln(c.cod);
  readln(c.precio);
end;
procedure cargarCategoria(var v:vector);
var c:categoria; i:rango;
begin
  for i:= 1 to PAN do begin
    leerCategoria(c);
    v[c.cod]:=c;
  end;
end;
procedure inicialiar(var vc:vcont);
var i:rango;
begin
  for i:= 1 to PAN do
    vc[i]:=0;
end;
procedure maximo(cantKg:real;dniActual:integer;var max:real;var maxDNI:integer);
begin
  if(cantKg>max)then begin
    max:=cantKg;
    maxDNI:=dniActual;
  end;
end;
fuction tresPares(dni:integer):boolean;
var dig,par:integer;
begin
  par:=0;
  while(dni<>0)and(par<3)do begin
    dig:=dni mod 10;
    if(dig mod 2 = 0)then
      par:=par+1;
    dni:=dni div 10;
  end;
  tresPares:=(par=3);  
end;
proedure procesar(L:lista; v:vector;var maxDNI;var vc:vcont;var cantTotal:integer);
var dniActual,maxDNI,cantCompras:integer;
    max:real;
begin
  max:=-1;cantTotal:=0;
  while(L<>nil)do begin
    dniActual:=L^.dato.dni;
    cantCompras:=0;
    while(L<>nil)and(dniActual=L^.dato.dni)do begin
      cantCompras:=cantCompras+ 1;    { cantidad de compras, no cant de kg }
      vc[v[L^.dato.cate].cod]:=vc[v[L^.dato.cate].cod]+(L^.dato.kg*v[L^.dato.cate].precio);
      if(tresPares(L^.dato.dni))then
        cantTotal:=cantTotal+ 1;     { cantidad de compras, no cant de kg }
      L:=L^.sig;
    end;
    maximo(cantKg,dniActual,max,maxDNI);
  end;
end;
var 
  L:lista;
  v:vector;
  vc:vcont;
  maxDNI:integer;
  cantTotal:integer;
begin
  cargarLista(L); //se dispone
  cargarCategoria(v);
  inicializar(vc);
  procesar(L,v,maxDNI,vc,cantTotal);
  end.  {Falta informar los datos que retorna}
