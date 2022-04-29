{
1. Dado el siguiente programa:

a. Indicar qué hace el programa.
// Lee numero hasta que se ingrese 0 y lo carga en la lista. Luego imprime el contenido de la lista.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
// Se crea una lista de 4 elementos y va agregando hacia adelante. Quedaria 48 13 21 10.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada. 
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista. 
}
program JugamosConListas;
type
lista = ^nodo;  //Crea un puntero hacia un nodo
nodo = record   //crea un nodo
 num : integer; //asigna un valor al elemento
 sig : lista;   //puntero hacia el siguiente nodo
end; 
procedure armarNodo(var L: lista; v: integer); //arma el nodo
var
 aux : lista;   //crea un auxiliar para trabajar con el
begin
 new(aux);      //le asigna un espacio en memoria
 aux^.num := v; //le asigna el valor como parametro al elemento
 aux^.sig := L; //le asigna el valor como parametro al puntero apuntado al primer elemento de la lista
 L := aux;      //cambia la lista al auxiliar
end;            // en general,crea un espacio que luego va ser asignado a la lista que toma como parametro.
procedure imprimirLista(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.num);
    L:=L^.sig;
  end;
end;
procedure incrementar(var L:lista;dato:integer); 
begin
  while(L<>nil)do begin    
    writeln(L^.num+valor);                    //L^.num:=L^.num+dato; <--NO SE PUEDE HACER
    L:=L^.sig;
  end;
end;
var
 pri : lista;                   //declaro el puntero a nodo
 valor,dato: integer;           //declaro el valor
begin
 pri := nil;                    //asignacion nula a una variable puntero
 writeln('Ingrese un numero:'); 
 read(valor);                   //leo el valor
 while (valor <> 0) do begin    //creo un bucle que lea datos hasta recibir el 0 como valor
   armarNodo(pri, valor);       //llamo al modulo para ir agragando el valor en la lista
   writeln('Ingrese un numero');//se le otro valor
   read(valor);
 end;
 imprimirLista(pri);{ imprimir lista }
 writeln('Ingrese el valor a incrementar');
 readln(dato);
 incrementar(pri,dato);
 imprimir(pri);
end.
{
2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego 
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.
}
program ejercicio2;
type
 lista = ^nodo;  //esto va abajo de end de registro
 persona = record
 dni: integer;
 nombre: string;
 apellido: string;
 end;
 nodo = record
 dato: persona;
 sig: lista;
 end;
procedure leerPersona(p: persona);  //hay que pasar el parametro por referencia
begin
 read(p.dni);
 if (p.dni <> 0)then begin
 read(p.nombre);
 read(p.apellido);
 end;
end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
 p:nodo;                     //el parametro p tiene que ser de tipo persona
begin
 leerPersona(p);
 while (p.dni <> 0) do begin
 agregarAdelante(l,p);       //falta leerPersona despues del while
 end;
end;
procedure imprimirInformacion(var l:lista); //pasar el parametro por valor porque no se modifica
begin
 while (l <> nil) do begin
 writeln('DNI: ', l^.dato.dni, 'Nombre:', 
l^.nombre, 'Apellido:', l^.apellido);      //mal, es L^.dato.nombre y L^.dato.apellido
 l:= l^.sig;
 end;
end;
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); //la lista hay que pasarlo por referencia
var
 aux: lista;
begin
 aux^.dato:= p;  //falta new(aux)
 aux^.sig:= l;
 l:= aux;
end;
{Programa principal}
var
 l:lista;
begin
 generarLista(l);       //falta inicializar la lista en nil, L:=nil
 imprimirInformacion(l);
end.
{
3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron 
ingresados (agregar atrás).
}
program JugamosConListas;
type
lista = ^nodo;
nodo = record
 num : integer;
 sig : lista;
end; 
procedure armarNodoAgregarAlfinal(var pri: lista; v: integer);
var
 act,nue: lista;
begin
 new(nue);
 nue^.num := v;
 nue^.sig := nil;
 if (pri<>nil)then begin
   act:=pri;
   while(act^.sig<>nil)do 
     act:=act^.sig;
   act^.sig:=nue;
 end
 else
   pri:=nue;
end;
procedure imprimirLista(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.num);
    L:=L^.sig;
  end;
end;
 
var
 pri : lista;
 valor : integer;
begin
 pri := nil;
 writeln('Ingrese un numero'); 
 read(valor);
 while (valor <> 0) do begin
 armarNodoAgregarAlfinal(pri, valor);
 writeln('Ingrese un numero');
 read(valor);
 end;
 imprimirLista(pri);
end.
{
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron 
ingresados, manteniendo un puntero al último ingresado
}
program JugamosConListas;
type
lista = ^nodo;
nodo = record
 num : integer;
 sig : lista;
end; 
procedure armarNodoAgregarAlFinal2(var pri,ult: lista; v: integer);
var
 nue : lista;
begin
 new(nue);
 nue^.num := v;
 nue^.sig := nil;
 if(pri<>nil)then
   ult^.sig:=nue
 else
   pri:=nue;
 ult:=nue;
end;
procedure imprimirLista(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.num);
    L:=L^.sig;
  end;
end;
var
 pri,ult : lista;
 valor : integer;
begin
 pri := nil;
 writeln('Ingrese un numero'); 
 read(valor);
 while (valor <> 0) do begin
 armarNodoAgregarAlFinal2(pri,ult, valor);
 writeln('Ingrese un numero');
 read(valor);
 end;
 imprimirLista(pri);
end.
{
4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la 
lista que son múltiplos de A.
}
program JugamosConListas;
type
lista = ^nodo; 
nodo = record   
 num : integer; 
 sig : lista;   
end; 
procedure armarNodo(var L: lista; v: integer); 
var
 aux : lista;   
begin
 new(aux);      
 aux^.num := v; 
 aux^.sig := L; 
 L := aux;      
end; 
procedure cargarLista(var L:lista);
var valor:integer;
begin
  writeln('Ingrese un numero:'); 
  readln(valor); 
  while (valor <> 0) do begin    
    armarNodo(L, valor);  
    writeln('Ingrese un numero');
    read(valor);
  end;
end;
procedure imprimirLista(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.num);
    L:=L^.sig;
  end;
end;
procedure incrementar(var L:lista;dato:integer); 
begin
  while(L<>nil)do begin
    writeln('valor incrementado',L^.num+dato); //L^.num:=L^.num+dato; <--NO SE PUEDE HACER
    L:=L^.sig;
  end;
end;
function maximo(L:lista):integer;
var max:integer;
begin
  max:=-1;
  while(L<>nil)do begin
    if(L^.num>max)then
      max:=L^.num;
    L:=L^.sig;
  end;
  maximo:=max;
end;
function minimo(L:lista):integer;
var min:integer;
begin
  min:=999;
  while(L<>nil)do begin
    if(L^.num<min)then
      min:=L^.num;
    L:=L^.sig;
  end;
  minimo:=min;
end;
function multiplos(L:lista;valorA:integer):integer;
var cant:integer;
begin
  cant:=0;
  while(L<>nil)do begin
    if(L^.num mod valorA= 0)then
      cant:=cant+1;
    L:=L^.sig;
  end;
  multiplos:=cant;
end;
var
 L : lista;
 dato,valorA,cant,max,min:integer;
begin
 L := nil;
 cargarLista(L);
 //imprimirLista(L);
 //writeln('Ingrese el valor a incrementar');
 //readln(dato);
 writeln('Ingrese un multiplo');
 readln(valorA);
 //incrementar(L,dato);
 max:=maximo(L);
 min:=minimo(L);
 cant:=multiplos(L,valorA);
 writeln('El maximo ',max);
 writeln('El minimo ',min);
 writeln('Cantidad de multiplo de:',valorA,' : ',cant);
end.
{
5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada 
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa 
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}
program Hello;                    //En este programa nunca se cargo el precio,pero por defecto tenia cargado 4.9406564584124654E-324
type  cadena50=string[50];        //Para verificar le agregue el proceso mostrar para ver el contenido del L^.dato.precio.
      producto=record
        cod:integer;
        descrip:cadena50;
        stockAct:integer;
        stockMin:integer;
        precio:real;
      end;
      lista=^nodo;
      nodo=record
        dato:producto;
        sig:lista;
      end;
procedure leerProductos(var prod:producto);
begin
  with prod do begin
    writeln('Ingrese el codigo:');
    readln(cod);
    if(cod<>-1)then begin
      writeln('Ingrese la descripcion:');
      readln(descrip);
      writeln('Ingrese el stock actual:');
      readln(stockAct);
      writeln('Ingrese el stock minimo:');
      readln(stockMin);
    end;
  end;
end;
procedure agregarAdelante(var l:lista;prod:producto);
var aux:lista;
begin
  new(aux);
  aux^.dato:=prod;
  aux^.sig:=l;
  l:=aux;
end;
procedure generarLista(var pri:lista);
var prod:producto;
begin
  leerProductos(prod);
  while(prod.cod<>-1)do begin
    agregarAdelante(pri,prod);
    leerProductos(prod);
  end;
end;
procedure mostrar(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.dato.cod,' ',L^.dato.descrip,' ',L^.dato.stockAct,' ',L^.dato.stockMin,' ',L^.dato.precio);
    L:=L^.sig;
  end;
end;
procedure dosMasEconomicos(precioActual:real;codActual:integer;var min1,min2:real;var cod1,cod2:integer);
begin
  if(precioActual<min1)then begin
    min2:=min1;
    cod2:=cod1;
    min1:=precioActual;
    cod1:=codActual;
  end
  else
  if(precioActual<min2)then begin
    min2:=precioActual;
    cod2:=codActual;
  end;
end;
function calcularPorcentaje(cantidad,total:integer):real;
begin
  calcularPorcentaje:=cantidad*100/total;
end;
procedure informar(pri:lista;Porcentaje:real;cod1,cod2:integer);
begin
  writeln('Porcentaje de productos con stock actual por debajo de su stock minimo:',Porcentaje:2:2,'%');
  writeln('Los codigos de los dos productos mas económicos:', cod1,' y ',cod2);
end;
procedure digitosPares(num:integer;descrip:cadena50);
var dig,cantPares:integer;
begin
  cantPares:=0;
  while(num<>0)and(cantPares<3)do begin
    dig:=num mod 10;
    if(dig mod 2=0)then
      cantPares:=cantPares+1;
    num:=num div 10;
  end;
  if(cantPares>=3)then
    writeln('Descripcion de productos con codigo compuesto por al menos 3 digitos pares:',descrip);
end;
function cantStockActMenor(actual,minimo:integer):integer;
begin
  if(actual<minimo)then
    cantStockActMenor:=1
  else
    cantStockActMenor:=0;
end;
procedure recorrerLista(pri:lista;var porcentaje:real;var cod1,cod2:integer);
var min1,min2:real;
    cantStock,totalProductos:integer;
begin
  min1:=999;cod1:=0;
  cantStock:=0;
  totalProductos:=0;
  while(pri<>nil)do begin
    totalProductos:=totalProductos+1;
    cantStock:=cantStock+cantStockActMenor(pri^.dato.stockAct,pri^.dato.stockMin);
    digitosPares(pri^.dato.cod,pri^.dato.descrip);
    dosMasEconomicos(pri^.dato.precio,pri^.dato.cod,min1,min2,cod1,cod2);
    pri:=pri^.sig;
  end;
  porcentaje:=calcularPorcentaje(cantStock,totalProductos);
end;
var L:lista;
    porcentaje:real;
    cod1,cod2:integer;
begin
  L:=nil;
  generarLista(L);
  mostrar(L);
  recorrerLista(L,porcentaje,cod1,cod2);
  informar(L,porcentaje,cod1,cod2);
end.

{ Volvi hacer el programa de nuevo pero sin el informar y, con la lectura del precio agregado. Ahora si anda perfectamente }

program supermercado;
type
  cadena=string[50];
  productos=record
    codigo:integer;
    descripcion:cadena;
    stockActual:integer;
    stockMinimo:integer;
    precio:real;
  end;
  lista=^nodo;
  nodo=record
    dato:productos;
    sig:lista;
  end;
procedure leer(var p:productos);
begin
  writeln('Ingrese el codigo');
  readln(p.codigo);
  if(p.codigo<>-1)then begin
    writeln('Ingrese la descripcion');
    readln(p.descripcion);
    writeln('Ingrese el stock actual');
    readln(p.stockActual);
    writeln('Ingrese el stock minimo');
    readln(p.stockMinimo);
    writeln('Ingrese el precio');
    readln(p.precio);
  end;
end;
procedure agregarAdelante(var L:lista;p:productos);
var nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=L;
  L:=nue;
end;
procedure cargarLista(var L:lista);
var p:productos;
begin
  leer(p);
  while(p.codigo<>-1)do begin
    agregarAdelante(L,p);
    leer(p);
  end;
end;
procedure mostrarListaCargada(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.dato.codigo,' ',L^.dato.descripcion,' ',L^.dato.stockActual,' ',L^.dato.stockMinimo,' $',L^.dato.precio:2:2);
    L:=L^.sig;
  end;
end;
function porDebajo(stockAct,stockMin:integer):integer;
begin
  if(stockAct<stockMin)then
    porDebajo:=1
  else
    porDebajo:=0;
end;
procedure tresDigitosPares(codigo:integer;descripcion:cadena);
var dig,pares:integer;
begin
  pares:=0;
  while(codigo<>0)and(pares<3)do begin
    dig:=codigo mod 10;
    if(dig mod 2 = 0)then
      pares:=pares+1;
    codigo:=codigo div 10;
  end;
  if(pares>=3)then
    writeln('Descripción de productos con código compuesto por al menos tres dígitos pares ',descripcion);
end;
procedure masEconomico(codigo:integer;precio:real;var cod1,cod2:integer;var min1,min2:real);
begin
  if(precio<min1)then begin
    min2:=min1;
    min1:=precio;
    cod2:=cod1;
    cod1:=codigo;
  end
  else if(precio<min2)then begin
         min2:=precio;
         cod2:=codigo;
  end;
end;
procedure recorrer(L:lista);
var pocasMercaderias,totalProductos,cod1,cod2:integer;
    porcentaje,min1,min2:real;
begin
  cod1:=0;min1:=999;
  pocasMercaderias:=0;
  totalProductos:=0;
  while(L<>nil)do begin
    totalProductos:=totalProductos+1;
    pocasMercaderias:=pocasMercaderias+porDebajo(L^.dato.stockActual,L^.dato.stockMinimo);
    tresDigitosPares(L^.dato.codigo,L^.dato.descripcion);
    masEconomico(L^.dato.codigo,L^.dato.precio,cod1,cod2,min1,min2);
    L:=L^.sig;
  end;
  porcentaje:=pocasMercaderias*100/totalProductos;
  writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo ',porcentaje:2:2,'%');
  writeln('Código de los dos productos más económicos ',cod1,' y ',cod2);
end;
var
  L:lista;
begin
  L:=nil;
  cargarLista(L);
  mostrarListaCargada(L);
  recorrer(L);
END.
{
6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas 
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad 
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del 
espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías: 
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al 
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez
} 
program Hello;
const tam=7;
type  rango=1..tam;
      cadena20=string[20];
      sonda=record
        nom:cadena20;
        duracion:integer;
        costoConst:real;
        costoMant:real;
        espectro:rango;
      end;
      vector=array[rango]of integer;
      lista=^nodo;
      nodo=record
        dato:sonda;
        sig:lista;
      end;
      lista_nombre=^nodo2;
      nodo2=record
        nombre:cadena20;
        sig:lista_nombre;
      end;
procedure leerSonda(var s:sonda);
begin
  write('Nombre:');
  readln(s.nom);
  write('Duracion:');
  readln(s.duracion);
  write('Costo de construccion:');
  readln(s.costoConst);
  write('Costo de mantenimiento:');
  readln(s.costoMant);
  write('Rango del espectro electromagnético:');
  readln(s.espectro);
end;
procedure agregarAdelante(var L:lista;s:sonda);
var nue:lista;
begin
  new(nue);
  nue^.dato:=s;
  nue^.sig:=L;
  L:=nue;
end;
procedure generarLista(var L:lista;var promedio:real;var costoPromedio:real);
var s:sonda;totalDuracion,cantSondas:integer;totalCosto:real;
begin
  cantSondas:=0;
  totalDuracion:=0;
  totalCosto:=0;
  repeat
    leerSonda(s);
    agregarAdelante(L,s);
    cantSondas:=cantSondas+1;
    totalDuracion:=totalDuracion+s.duracion;
    totalCosto:=totalCosto+s.costoConst;
  until(s.nom='GAIA');
  promedio:=(totalDuracion/cantSondas);
  costoPromedio:=(totalCosto/cantSondas);
end;
procedure inicializarVector(var v:vector);
var i:integer;
begin
  for i:=1 to tam do 
    v[i]:=0;
end;
function verificoSiEsMayor(duracion,duracProm:real):integer;
begin
  if(duracion>duracProm)then
    verificoSiEsMayor:=1
  else
    verificoSiEsMayor:=0;
end;
procedure masCostosa(nombre:cadena20;costoConst,costoMant:real;var max:real;var nomMax:cadena20);
var total:real;
begin
  total:=costoMant+costoConst;
  if(total>max)then begin
    max:=total;
    nomMax:=nombre;
  end;
end;
procedure recorrerVecContador(v:vector);
var i:integer;
begin
  for i:=1 to tam do 
    writeln('Cantidad de sondas para el espectro ', i,' es ',v[i]);
end;
procedure agragarAdelanteNombre(var L2:lista_nombre;nom:cadena20);
var nue:lista_nombre;
begin
  new(nue);
  nue^.nombre:=nom;
  nue^.sig:=L2;
  L2:=nue;
end;
procedure recorrerLista(L:lista;var v:vector;duracProm,costoPromedio:real);
var max:real;
    nombreCostosa:cadena20;
    L2:lista_nombre;
    cantSondas:integer;
begin
  L2:=nil;
  max:=-1;
  cantSondas:=0;
  while(L<>nil)do begin
    masCostosa(L^.dato.nom,L^.dato.costoConst,L^.dato.costoMant,max,nombreCostosa);
    v[L^.dato.espectro]:=v[L^.dato.espectro]+1;
    cantSondas:=cantSondas+verificoSiEsMayor(L^.dato.duracion,duracProm);
    if(L^.dato.costoConst>costoPromedio)then
      agragarAdelanteNombre(L2,L^.dato.nom);
    L:=L^.sig;
  end;
  writeln('El nombre de la sonda mas costosa:',nombreCostosa);
  recorrerVecContador(v);
  writeln('Cantidad de sondas cuya duracion estimada supera la duracion promedio:',cantSondas);
end;
var L:lista;
    v:vector;
    prom,costoPromedio:real;
begin
  L:=nil;
  inicializarVector(v);
  generarLista(L,prom,costoPromedio);
  recorrerLista(L,v,prom,costoPromedio);
end.
{
7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos 
de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han 
determinado los siguientes criterios:
-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la 
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar 
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos 
criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y 
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no 
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo 
total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice 
el módulo realizado en b.
}
program Hello;
const tam=7;
type  rango=1..tam;
      cadena20=string[20];
      sonda=record
        nom:cadena20;
        duracion:integer;
        costoConst:real;
        costoMant:real;
        espectro:rango;
      end;
      vector=array[rango]of integer;
      lista=^nodo;
      nodo=record
        dato:sonda;
        sig:lista;
      end;
      
procedure leerSonda(var s:sonda);
begin
  write('Nombre:');
  readln(s.nom);
  write('Duracion:');
  readln(s.duracion);
  write('Costo de construccion:');
  readln(s.costoConst);
  write('Costo de mantenimiento:');
  readln(s.costoMant);
  write('Rango del espectro electromagnético:');
  readln(s.espectro);
end;
procedure agregarAtras(var pri,ult:lista;s:sonda);
var nue:lista;
begin
  new(nue);
  nue^.dato:=s;
  nue^.sig:=nil;
  if(pri=nil)then
    pri:=nue
  else
    ult^.sig:=nue;
  ult:=nue;
end;
procedure cargarLista(var L:lista);
var s:sonda;ult:lista;
begin
  repeat 
    leerSonda(s);
    agregarAtras(L,ult,s);
  until(s.nom='GAIA');
end;
function cumpleRequisitos(s:sonda):boolean;
begin
  cumpleRequisitos:=(s.espectro<>1)and(s.costoMant<s.costoConst);
end;
procedure recorrerLista(L:lista;var si,no:lista);
var ult,ultNo:lista;
begin
  while(L<>nil)do begin
    if(cumpleRequisitos(L^.dato))then begin
      writeln('El proyecto ',L^.dato.nom,' cumple con los nuevos criterios H2020.');
      agregarAtras(si,ult,L^.dato);
    end
    else begin
      writeln('El proyecto ',L^.dato.nom,' no cumple con los nuevos criterios H2020.');
      agregarAtras(no,ultNo,L^.dato);
    end;
    L:=L^.sig;
  end;
end;
procedure noFinanciacion(L:lista);
var cantTotal:integer;costoSonda,costoTotal:real;
begin
  costoTotal:=0;cantTotal:=0;
  while(L<>nil)do begin
    cantTotal:=cantTotal+1;
    costoSonda:=L^.dato.costoConst+L^.dato.costoMant;
    costoTotal:=costoTotal+costoSonda;
    writeln('Proyecto:',L^.dato.nom,' no financiado tiene un costo total de:',costoSonda:2:2);
    L:=L^.sig;
  end;
  writeln('Son ',cantTotal,' los proyectos no financiados.');
  writeln('El costo total de todos los proyectos no financiado es:',costoTotal:2:2);
end;
var L,siCumple,noCumple:lista;
begin
  L:=nil;
  siCumple:=nil;
  noCumple:=nil;
  cargarLista(L);
  recorrerLista(L,siCumple,noCumple);
  noFinanciacion(noCumple);
end.
{
8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista 
queden ordenados de manera ascendente (insertar ordenado)                           
}
program JugamosConListas;
type
lista = ^nodo;  //Crea un puntero hacia un nodo
nodo = record   //crea un nodo
 num : integer; //asigna un valor al elemento
 sig : lista;   //puntero hacia el siguiente nodo
end; 
procedure armarNodo(var L: lista; v: integer); 
var
 ant,act,nue: lista;   
begin
 new(nue);     
 nue^.num := v; 
 ant:=L;
 act:=L;
 while(act<>nil)and(act^.num<v)do begin
   ant:=act;
   act:=act^.sig;
 end;
 if(ant=act)then
   L:=nue
 else
   ant^.sig:=nue;
 nue^.sig:=act;
end;
 
procedure imprimirLista(L:lista);
begin
  while(L<>nil)do begin
    writeln(L^.num);
    L:=L^.sig;
  end;
end;
procedure incrementar(var L:lista;var dato:integer);
var aux:lista;
begin
  aux:=L;
  while(aux<>nil)do begin
    aux^.num:=aux^.num + dato;
    L:=L^.sig;
  end;
end;
var
 pri : lista;   //declaro el puntero a nodo
 valor: integer; //declaro el valor
begin
 pri := nil;    //asignacion nula a una variable puntero
 writeln('Ingrese un numero:'); 
 read(valor);  //leo el valor
 while (valor <> 0) do begin    //creo un bucle que lea datos hasta recibir el 0 como valor
   armarNodo(pri, valor);       //llamo al modulo para ir agragando el valor en la lista
   writeln('Ingrese un numero');//se le otro valor
   read(valor);
 end;
 imprimirLista(pri);{ imprimir lista }
end.
{
9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en 
caso contrario.
}
function EstaOrdenada(L:lista):boolean;
var ordenada:boolean; act,ant:integer;
begin
  ordenada:=true;
  act:=-999;
  while(L<>nil)and(ordenada)do begin
    ant:=act;
    act:=L^.num
    if(ant>act)then
      ordenada:=false;
    L:=L^.sig;
  end;
  EstaOrdenada:=ordenada;
end;

b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: 
la lista podría no estar ordenada.

procedure Eliminar(var L:lista;valor:integer);
var ant,act:lista;
begin
  act:=L;
  while((act<>nil)and(act^.num<>valor))do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    if(act=L)then
      L:=L^.sig;
    else
      ant^.sig:=act^.sig;
    dispose(act);
    writeln('El valor se elimino de la lista.');
  end
  else writeln('El valor no se encontraba en la lista.');
end;
{
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos 
los elementos de la lista L mayores que A y menores que B.
}
procedure sublista(L:lista;valorA,valorB:integer;var lista2:lista);
var aux:lista;
begin
  while(L<>nil)do begin
    if((L^.num>valorA)and(L^.num<valorB))then
      armarNodo(lista2,L^.num);
    L:=L^.sig;
  end;
end;
{
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera 
ascendente.
}
procedure sublista(L:lista;valorA,valorB:integer;var lista2:lista);
var aux:lista;
begin
  while(L<>nil)and(L^.num<valorB)do begin
    if((L^.num>valorA))then
      armarNodo(lista2,L^.num);
    L:=L^.sig;
  end;
end;
{
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera 
descendente.
}
procedure sublista(L:lista;valorA,valorB:integer;var lista2:lista);
var aux:lista;
begin
  while(L<>nil)and(L^.num>valorA)do begin
    if(L^.num<valorB)then
      armarNodo(lista2,L^.num);
    L:=L^.sig;
  end;
end;
{
10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su 
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número 
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número, 
en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes 
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna 
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista 
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos 
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por 
vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}
program Hello;
type cliente=record
        DNI:integer;
        numero:integer;
     end;
     lista=^nodo;
     nodo=record
        dato:cliente;
        sig:lista;
     end;
procedure agregarAtras(dni,num:integer;var L,ult:lista);
var nue:lista;
begin
  new(nue);
  nue^.dato.DNI:=dni;
  nue^.dato.numero:=num;
  nue^.sig:=nil;
  if(L<>nil)then ult^.sig:=nue
            else L:=nue;
  ult:=nue;
end;
procedure RecibirCliente(var L,ult:lista;dni:integer);
begin
  if(L=nil)then
    agregarAtras(dni,1,L,ult)
  else  
    agregarAtras(dni,ult^.dato.numero+1,L,ult);
end;
procedure cargarListaClientes(var L,ult:lista);
var cli:cliente;
begin
  write('Ingrese su DNI:');
  readln(cli.DNI);
  while(cli.DNI<>0)do begin
    RecibirCliente(L,ult,cli.DNI);
    write('Ingrese su DNI:');
    readln(cli.DNI);
  end;
end;
procedure AtenderCliente(var L:lista;var c:cliente);
var aux:lista;
begin
  c.DNI:=L^.dato.DNI;
  c.numero:=L^.dato.numero;
  aux:=L;
  L:=L^.sig;
  dispose(aux);
end;
procedure recorrerLista(L:lista);
var cli:cliente;
begin
  while(L<>nil)do begin
    AtenderCliente(L,cli);
    writeln('Cliente:',cli.DNI,' con numero asignado ',L^.dato.numero);
    L:=L^.sig;
  end;
end;
var L,ult:lista;
begin
  L:=nil;
  ult:=nil;
  cargarListaClientes(L,ult);
  recorrerLista(L);
end.
{
11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les 
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el 
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse. 
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados 
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor 
a menor).
}
program Hello;
const dimF=10;
type  rango=1..dimF;
      cadena20=string[20];
      alumno=record
        numero:integer;
        apellido:cadena20;
        promedio:real;
      end;
      lista=^nodo;
      nodo=record
        dato:alumno;
        sig:lista;
      end;
procedure leerAlumno(var alu:alumno);
begin
  with alu do begin
    write('Ingrese numero de alumno:');
    readln(numero);
    if(numero<>0)then begin
      write('Ingrese el apellido de alumno:');
      readln(apellido);
      write('Ingrese el promedio de alumno:');
      readln(promedio);
    end;
  end;
end;
procedure insertarOrdenado(var L:lista;alu:alumno);
var ant,act,nue:lista;
begin
  new(nue);
  nue^.dato:=alu;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.promedio>alu.promedio)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then L:=nue
             else ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure cargarAlumnos(var L:lista);
var alu:alumno;
begin
  leerAlumno(alu);
  while(alu.numero<>0)do begin
    insertarOrdenado(L,alu);
    leerAlumno(alu);
  end;
end;
procedure imprimirLista(L:lista);
var i:integer;
begin
  i:=0;
  while(L<>nil)and(i<10)do begin
    writeln('Apellido con buen promedio:',L^.dato.apellido);
    writeln('Numero del alumno:',L^.dato.numero);
    L:=L^.sig;
    i:=i+1;
  end;
end;
var L:lista;
begin
  L:=nil;
  cargarAlumnos(L);
  imprimirLista(L);
end.
{
12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de 
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android 
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La 
información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la 
información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.
}
program Hello;
type  celular=record
        version:real;
        tam:integer;
        RAM:real;
      end;
      lista=^nodo;
      nodo=record
        dato:celular;
        sig:lista;
      end;
procedure leerCelular(var c:celular);              //se dispone
procedure insertarOrdenado(var L:lista;c:celular); //se dispone
procedure cargarCelulares(var L:lista);            //se dispone

function cumpleCondiciones(valor1,valor2,cond1,cond2:integer):boolean;
begin
  cumpleCondiciones:=((valor1>cond1)and(valor2>cond2));
end;
procedure recorrerLista(L:lista;var cantCond:integer;var promPantallas:real);
var auxVersion:real;
    cantTotal,tamTotal,cantVersion:integer;
begin
  cantTotal:=0;
  tamTotal:=0;
  cantCond:=0;
  while(L<>nil)do begin
    auxVersion:=L^.dato.version;
    cantVersion:=0;
    while(L<>nil)and(L^.dato.version=auxVersion)do begin
      cantVersion:=cantVersion+1;
      cantTotal:=cantTotal+1;
      tamTotal:=tamTotal+L^.dato.tam;
      if(cumpleCondiciones(L^.dato.RAM,L^.dato.tam,3,5))then
        cantCond:=cantCond+1;
      L:=L^.sig;
    end;
    writeln('Son ',cantVersion,' los dispositivos con version ',auxVersion);
  end;
  promPantallas:=tamTotal/cantTotal;
end;
var L:lista;
    tamProm:real;
    cantCond:integer;
begin
  L:=nil;
  cargarCelulares(L);  //se dispone
  recorrerLista(L,cantCond,tamProm);
  writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas:',cantCond);
  writeln('El tamaño promedio de las pantallas de todos los dispositivos:',tamProm:2:2);
end.
{
13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de 
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario 
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de 
días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista 
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal
}
program Hello;
const dimF=3600;
type  rangoRol=1..4;
      rangoVEc=1..dimF;
      cadena20=string[20];
      usuario=record
        email:cadena20;
        rol:rangoRol;
        revistaPart:cadena20;
        cantDiasUltAcc:integer;
      end;
      vec_usuarios=array[rangoVEc]of usuario;
      vec_roles=array[rangoRol]of integer;
      lista=^nodo;
      nodo=record
        dato:usuario;
        sig:lista;
      end;
procedure inicializarVector(var vr:vec_roles);
var i:integer;
begin
 for i:=1 to 4 do
   vr[i]:=0;
end;
procedure insertarOrdenado(var L:lista;u:usuario);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=u;
  ant:=L;
  act:=L;
  while((act<>nil)and(act^.dato.cantDiasUltAcc<u.cantDiasUltAcc))do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act=ant)then L:=nue
             else ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure actualizarMaximos(email:cadena20;cantDias:integer;var max1,max2:integer;var email1,email2:cadena20);
begin
  if(cantDias>max1)then begin
    max2:=max1;
    max1:=cantDias;
    email2:=email1;
    email1:=email;
  end
  else
  if(cantDias>max2)then begin
    max2:=cantDias;
    email2:=email;
  end;
end;
procedure recorrerVector(v:vec_usuarios;var L:lista;vr:vec_roles);
var i,max1,max2:integer;email1,email2:cadena20;
begin
  max1:=-1;max2:=-1;
  for i:=1 to dimF do begin
    if(v[i].revistaPart='Economia')then
      insertarOrdenado(L,v[i]);
    vr[v[i].rol]:=vr[v[i].rol]+1;
    actualizarMaximos(v[i].email,v[i].cantDiasUltAcc,max1,max2,email1,email2);
  end;
  writeln('Los emails de los dos usuarios que hace más tiempo que no ingresan al portal:',email1,' y ',email2);
end;
procedure informar(L:lista;vr:vec_roles);
var i:integer;
begin
  while(L<>nil)do begin
    writeln('El usuario ',L^.dato.email,'ingreso por ultima vez hace ',L^.dato.cantDiasUltAcc);
    L:=L^.sig;
  end;
  for i:=1 to 4 do 
    writeln('Para el rol ',i,' hubo ',vr[i],'usuarios.');
end;
var L:lista;
    vec:vec_usuarios;
    vr:vec_roles;
begin
  L:=nil;
  cargarVector(v);    //se dispone
  inicializarVector(vr);
  recorrerVector(vec,L,vr);
  informar(L,vr);
end.