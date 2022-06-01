program FisicaYQuimica;
const
  ATO=30;  
  elementos=119; 
  proton=1.0;
  electron=0.000555556;
  neutron=1.0005;
type
  rango=1..elementos;
  cadena=string[100];
  atomo=record
    nombre:cadena;
    protones:integer;     
    electrones:integer;
    neutrones:integer;
  end;
  tablaPeriodica=record
    simbolo:cadena;                   
    atomoB:atomo; 
  end;
  vector=array[rango]of tablaPeriodica; 
  vcont=array[rango]of integer;
  lista=^nodo;  
  nodo=record
    dato:atomo;
    sig:lista;
  end;
  molecula=record //como es una sola molecula, lo cargo en un registro
    nom:cadena;
    atomos:lista;
  end;

procedure leerAtomo(var a:atomo);
begin
  writeln('Ingrese el nombre');
  readln(a.nombre);
  writeln('Ingrese la cantidad de protones');
  readln(a.protones);
  writeln('Ingrese la cantidad de electrones');
  readln(a.electrones);
  writeln('Ingrese la cantidad de neutrones');
  readln(a.neutrones);
end;
procedure agregarAdelante(var L:lista;a:atomo);
var nue:lista;
begin
  new(nue);
  nue^.dato:=a;
  nue^.sig:=L;
  L:=nue;
end;
procedure inicializarM(var m:molecula);
begin
  writeln('Ingrese el nombre de la molecula');
  readln(m.nom);
  m.atomos:=nil;
end;
procedure cargarMolecula(var m:molecula);
var a:atomo;
begin
  inicializarM(m);
  writeln('Ingrese un atomo');
  leerAtomo(a);
  while(a.protones <> 0)do begin
    agregarAdelante(m.atomos,a);
    writeln('Ingrese un atomo');
    leerAtomo(a);
  end;
end;
function calcularMasa(a:atomo):real;
begin
  calcularMasa:= a.protones*proton + a.electrones*electron + a.neutrones*neutron;
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:= 1 to elementos do
    v[i]:=0;
end;

procedure borrar(var L:lista; prot:integer; var exito:boolean);
var ant,act:lista;
begin 
  exito:=false;
  act:=L;
  while(act<>nil)and(act^.dato.protones <> prot)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    exito:=true;
    if(act=L)then  
		L:=act^.sig
    else
		ant^.sig:=act^.sig;
    dispose(act);
  end;
end;
procedure inicializarMacro(var moleA,moleB,moleUnion:molecula;var LA,LB:lista);
begin
  moleUnion.nom:='macromolecula';
  moleUnion.atomos:=nil;
  LA:= moleA.atomos;
  LB:= moleB.atomos;
end;
procedure recorrerAyB(L:lista;var moleUnion:molecula);
begin
  while(L<>nil)do begin
      agregarAdelante(moleUnion.atomos,L^.dato);
      L:=L^.sig;
  end;
end;
procedure recorrerMole(m,moleA,moleB,M2:molecula;elemE:atomo;var vec:vcont;var moleUnion:molecula);
var
  masaTotal:real;
  cant:integer;
  LA, LB ,L: lista;
  ok:boolean;
begin
  masaTotal:= 0;cant:= 0;
  inicializar(vec);
  inicializarMacro(moleA,moleB,moleUnion,LA,LB);
  L:= m.atomos;
  M2:= m;
  while(L<>nil)do begin
    masaTotal:= masaTotal + calcularMasa(L^.dato);
    if(elemE.protones = L^.dato.protones)then
      cant:= cant + 1;
    vec[L^.dato.protones]:= vec[L^.dato.protones] + 1; 
    recorrerAyB(LA,moleUnion);
    recorrerAyB(LB,moleUnion);
    if(L^.dato.protones = elemE.protones)then 
      borrar(L,elemE.protones,ok);
    if(L^.dato.protones = elemE.protones)then
      agregarAdelante(M2.atomos,elemE);
    L:=L^.sig;
  end;
end;
var
  v:vector;
  m,moleA,moleB,M2,moleUnion:molecula;
  elemE:atomo;
  vec:vcont;
begin
  cargarMolecula(m);
  recorrerMole(m,moleA,moleB,M2,elemE,vec,moleUnion);
END.
