{Para que no haya confusiones:primero hice el ejercicio,luego el profesor me lo corrigió y después lo volví a arreglar.
Dejé los comentarios del profesor para que no me olvidara mi error.}

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
procedure leerTabla(var t:tablaPeriodica);
begin
  writeln('Ingrese el simbolo');
  readln(t.simbolo);
  writeln('Ingrese el atomo');
  leerAtomo(t.atomoB);
end;
procedure cargar(var v:vector);
var i:rango;t:tablaPeriodica;
begin
  for i:=1 to elementos do begin
    leerTabla(t);
    v[t.atomoB.protones]:= t;
  end;
end;
{ 2. Realice un módulo que lea el nombre y todos los átomos que componen una molécula, y los
almacene en una estructura de datos adecuada. La lectura de átomos de la molécula
finaliza al ingresar un átomo sin protones.}
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
procedure mostrarTabla(v:vector);  //para probar
var i:rango;
begin
  for i:=1 to elementos do 
    writeln(v[i].simbolo,' ',v[i].atomoB.nombre,' ',v[i].atomoB.protones,' ',v[i].atomoB.electrones,' ',v[i].atomoB.neutrones);
end;
function calcularMasa(a:atomo):real;
begin
  calcularMasa:= a.protones*proton + a.electrones*electron + a.neutrones*neutron;
end;
function calcularCarga(a:atomo):integer;
begin
  if(a.protones = a.electrones)then
    calcularCarga:=0
  else
    if(a.protones > a.electrones)then
      calcularCarga:=1
    else
      calcularCarga:=-1;
end;
function calcularMasico(a:atomo):real;
begin
  calcularMasico:= a.protones + a.neutrones;
end;
function calcularIsotopo(atomoA,atomoB:atomo):integer;
begin
  if(atomoA.protones <> atomoB.protones)then
     calcularIsotopo:=0 //protones distintos
  else
    if(atomoA.neutrones <> atomoB.neutrones)then 
      calcularIsotopo:=1  //configuracion natural
    else
      calcularIsotopo:=-1; //isotopo
end;
procedure mayorMasa(var max1,max2:real;var nom1,nom2:cadena;masa:real;nom:cadena);
begin
  if(masa > max1)then begin
    max2:=max1;
    max1:=masa;
    nom2:=nom1;
    nom1:=nom;
  end
  else if(masa > max2)then begin
         max2:=masa;
         nom2:=nom;
  end;
end;
procedure inicializar(var aMin:atomo);
begin
  aMin.nombre:='';
  aMin.protones:=0;
  aMin.electrones:=0;
  aMin.neutrones:=0;
end;
procedure minimoMasico(a:atomo;var aMin:atomo;var min:real;masico:real);
begin
  if(masico < min)then begin
    min:=masico;
    aMin:=a;
  end;
end;
procedure recorrerAtomos(); 
var
  aMin:atomo;a:atomo;
  i,carga,cantPositivo,cantNagativo:integer;
  masa,masico,max1,max2,min:real;
  nom1,nom2:cadena;
begin  
  min:=9999;
  max1:=-1;nom1:='';
  inicializar(aMin);
  cantPositivo:=0;
  cantNagativo:=0;
  for i:= 1 to ATO do begin
    leerAtomo(a);
    masa:=calcularMasa(a);
    carga:=calcularCarga(a);
    masico:=calcularMasico(a);
    if(carga = 1)then
      cantPositivo:=cantPositivo + 1
    else
		if(carga = -1)then
			cantNagativo:=cantNagativo + 1
		else
		    writeln('Tiene carga neutra');
    mayorMasa(max1,max2,nom1,nom2,masa,a.nombre);
    minimoMasico(a,aMin,min,masico);
  end;
  writeln('La cantidad de átomos que son iones positivos ',cantPositivo);
  writeln(' y la cantidad que son iones negativos ',cantNagativo);
  writeln('El nombre de los dos átomos de mayor masa ',nom1,' y ',nom2);
  writeln('Atomo con menor número másico ',aMin.nombre,' ',aMin.protones,' ',aMin.electrones,' ',aMin.neutrones);
end;
procedure inicializarTabla(var tabla:tablaPeriodica);
begin
  tabla.simbolo:=' ';
  tabla.atomoB.nombre:=' ';
  tabla.atomoB.protones:= 0;
  tabla.atomoB.electrones:= 0;
  tabla.atomoB.neutrones:= 0;
end;

procedure buscar(v:vector;prot:integer;var tabla:tablaPeriodica); 
begin
  //inicializarTabla(tabla);     {NICO: No hace falta inicializar, se va a sobreescribir}
  //  if(prot = v[prot].atomoB.protones)then {NICO: No es necesario, es siempre verdadero}
       tabla:=v[prot];  //guardo en el registro tabla 
end;
function isotopo(a:atomo;v:vector):boolean; 
var tabla:tablaPeriodica;iso:integer;
begin
   buscar(v,a.protones,tabla);
   iso:=calcularIsotopo(a,tabla.atomoB);
   if(iso=1)then 
     isotopo:=true
   else
     isotopo:=false;
end;
procedure inicializarDifeAto(var difeAto:atomo);
begin
  difeAto.nombre:=' ';
  difeAto.protones:= 0;
  difeAto.electrones:= 0;
  difeAto.neutrones:= 0;
end;
procedure diferencias(v:vector;var difeAto:atomo; a:atomo); 
var tabla:tablaPeriodica;
begin
  inicializarDifeAto(difeAto);
  buscar(v,a.protones,tabla);  //se sabe que tienen la misma cant de protones
  difeAto.nombre:= tabla.atomoB.nombre;
  difeAto.protones:= tabla.atomoB.protones;
  difeAto.electrones:= tabla.atomoB.electrones - a.electrones;
  difeAto.neutrones:= tabla.atomoB.neutrones - a.neutrones;
end;
procedure mostrarDiferencia(difeAto:tablaPeriodica);
begin
  writeln('Mostrar diferencias:');
  writeln(difeAto.simbolo,' ',difeAto.atomoB.nombre,' ', difeAto.atomoB.protones,' ',difeAto.atomoB.electrones,' ',difeAto.atomoB.neutrones);
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:= 1 to elementos do
    v[i]:=0;
end;
procedure secuenciaConOrden(var v:vcont);
var a:atomo;
    protActual:integer;
begin
  writeln('Ingresar ordenada por cant de protones:');
  inicializar(v);
  leerAtomo(a);
  while(a.protones <> 0)do begin
    protActual:=a.protones;
    while(protActual = a.protones)do begin 
      v[protActual]:= v[protActual] + 1;
      leerAtomo(a);
    end;
  end;
end;
procedure informar(v:vcont); //para probar
var i:rango;
begin
  for i := 1 to elementos do
    writeln('Atomo: ',i,' aparece ',v[i],' veces ');
end;
procedure secuenciaSinOrden(var v:vcont);
var a:atomo;
begin
  writeln('Ingresar sin orden:');
  leerAtomo(a);
  while(a.protones <> 0)do begin
    v[a.protones]:=v[a.protones] + 1;
    leerAtomo(a);
  end;
end;
procedure vectores(var v:vector);
var 
  a,difeAto:atomo;
  prot:integer;
  vc1,vc2:vcont;
  tabla:tablaPeriodica;
begin
  cargar(v);
  //mostrarTabla(v); //para saber si se cargo bien
  inicializar(vc1);
  inicializar(vc2);
  writeln('Ingrese el numero atomico a buscar');
  readln(prot);
  buscar(v,prot,tabla);
  writeln('La informacion del elemento buscado es:',tabla.simbolo,' ',tabla.atomoB.nombre,' ',tabla.atomoB.protones,'  ',tabla.atomoB.electrones,' ',tabla.atomoB.neutrones);
  leerAtomo(a);
  if(isotopo(a,v))then
    writeln('se trata de un elemento en su configuración natural más habitual')
  else
    writeln('se trata de un isótopo del dicho elemento');
    
  writeln('Ingrese atomo para ver las diferencias:');
  leerAtomo(a);
  diferencias(v,difeAto,a);
  //mostrarDiferencia(difeAto);//para probar si se cargo
  secuenciaConOrden(vc1);
  informar(vc1); //para probar
  secuenciaSinOrden(vc2);
  informar(vc2);  //para probar
end;
{3. Realice un módulo que retorne la masa total de una molécula, calculada (de manera
simplificada) como la suma de las masas de todos sus átomos}

function masaMolecula(m:molecula):real;
var masa,masaTotal:real;L:lista;
begin
  L:= m.atomos;
  masaTotal:= 0; {NICO: Falta inicializar masaTotal}
  while(L<>nil)do begin
    masa:= calcularMasa(L^.dato);
    masaTotal:= masaTotal + masa;
    L:=L^.sig;
  end;  
  masaMolecula:= masaTotal;
end;

{ 4. Realice un módulo que reciba una molécula M y un elemento químico E, e indique la
cantidad de veces que el elemento E aparece en la molécula M.}

function vecesQueAparece(m:molecula;a:atomo):integer;
var cant:integer;L:lista;
begin
  L:= m.atomos;
  cant:= 0; {NICO: Falta inicializar cant}
  while(L<>nil)do begin
    if(a.protones = L^.dato.protones)then
      cant:= cant + 1;
    L:=L^.sig;
  end;
  vecesQueAparece:=cant;
end;

{ 5. Realice un módulo que reciba una molécula y retorne la cantidad de veces que se repite
cada elemento. Por ejemplo, si se ingresa una molécula de agua, debería retornar (en una
estructura de datos adecuada) que el hidrógeno está dos veces, y el oxígeno una vez.}

procedure ocurrencias(m:molecula;var vec:vcont);  //No olvidar que hay 3 vectores de vcont
var L:lista;
begin 
  L:= m.atomos;
  inicializar(vec);{NICO: Deberia inicializar vec en 0}
  while(L<>nil)do begin
    vec[L^.dato.protones]:= vec[L^.dato.protones] + 1; {NICO: Ok, tambien podria retornar una lista con atomo - cantidad, para no tener toda la tabla mayormente en 0}
    L:=L^.sig;
  end;
end;
{ 6. Realice un módulo que reciba dos moléculas A y B, y retorne una nueva molécula,
resultante de la unión de A y B (macromolécula).}
procedure macromolecula(moleA,moleB:molecula;var moleUnion:molecula);  
var
	LA, LB : lista;{NICO: Falta declarar listas auxiliares}
begin  
  moleUnion.nom:='macromolecula';
  LA:= moleA.atomos;  //LA,LB,LU -> puntero q apunta el primero de la lista
  LB:= moleB.atomos;
  moleUnion.atomos:=nil; {NICO: Para agregar no necesitamos auxiliar}
  {main.pas(352,40) Error: Incompatible type for arg no. 2: Got "lista", expected "atomo"}
  {NICO: Debe recorrer LA agregando cada elemento a moleUnion.atomos}
  while(LA<>nil)do begin
    agregarAdelante(moleUnion.atomos,LA^.dato);
    LA:=LA^.sig;
  end;
  while(LB<>nil)do begin
    agregarAdelante(moleUnion.atomos,LB^.dato);
    LB:=LB^.sig;
  end;
end;

{ 7. Realice un módulo que reciba una molécula M y un elemento E, y retorne la molécula M a la
que se le han quitado todos los átomos de E.}

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
procedure borrarAtomoE(var m:molecula;a:atomo);
var L:lista;ok:boolean;
begin
  L:= m.atomos;
  while(L<>nil)do begin
    if(L^.dato.protones = a.protones)then {NICO: Debe borrar todos los atomos que corresponda, no solo uno}
      borrar(L,a.protones,ok);
    L:=L^.sig;
  end;
end;

{ 8. Realice un módulo que reciba una molécula M y un elemento E, y retorne una copia de la
molécula M (o sea, una nueva molécula M2 o submolécula) con una copia de todos los
átomos de M hasta el elemento E inclusive. El elemento E podría no existir}

procedure hacerCopia(m:molecula;elemE:atomo;var M2:molecula);
var L:lista;                   {NICO: Deberia recorrer la lista de m.atomos hasta encontrar elemE (o terminar) agregando cada uno a M2.atomos}
begin
  M2:= m;
  L:=m.atomos;
  while(L<>nil)and(L^.dato.protones <> elemE.protones)do 
    L:=L^.sig;  
  if(L<>nil)and(L^.dato.protones = elemE.protones)then
    agregarAdelante(M2.atomos,elemE);  //si lo encontro
  else
    agregarAdelante(M2.atomos,elemE);  //si llego al final de la lista
end;
var
  v:vector;
  m:molecula;
begin
  cargarMolecula(m);
  recorrerAtomos();
  vectores(v);
END.
