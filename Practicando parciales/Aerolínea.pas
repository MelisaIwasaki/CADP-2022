{
Parcial 2021 Segunda Fecha

Una aerolínea dispone de una estructura de datos con información de todos los pasajes vendidos durante los años 
2003 a 2014 por sus 6700 agencias oficiales. De cada pasaje se conoce el país de destino, el mes de la 
venta(1 a 12),el año,el número de agencia (entre 1 y 6700) y el costo de pasaje. La información se encuentra 
ordenada por número de agencia.
a)Realizar un módulo que retorne en una estructura de datos la información de las agencias.De cada agencia se 
conoce su código(entre 1 y 6700),razón social y localidad.La información se ingresa por teclado sin ningún 
orden en particular.
b)Realizar un módulo que reciba la información de los pasajes vendidos, la información de las  agencias oficiales
y el código de una agencia(que podría no existir), y retorne una estructura de datos con nombre de la agencia,
razón social, localidad, monto total vendido, y mes,año y valor de cada pasaje vendido por dicha agencia.
Esta información debe estar ordenada por el valor de cada pasaje.
Nota:Incluir el P.P. donde se invoquen los módulos implementados.
}
program Aerolinea; //para que ande el programa, hay que acomodar los registros y modulos.
const              //no lo hice porque asi es mas facil de entender,tampoco lo voy a probar si anda.
  AGE=6700;
type
  rango=1..AGE;
  rangoMes=1..12;
  cadena=string[30];
  pasaje=record
    pais:cadena;
    mes:rangoMes;
    anio:integer;
    numero:rango;
    costo:real;
  end;
  lista=^nodo;
  nodo=record     //se dispone
    dato:pasaje;  //ordenada por número de agencia
    sig:lista;
  end;
  agencia=record
    codigo:rango;
    social:cadena;
    localidad:cadena;
  end;
  vagencia=array[rango]of agencia; 
  
  regAge=record
    nombre:cadena;
    social:cadena;
    localidad:cadena;
    montoTotal:real;
    detalle:listaDet;
  end;
  regPas=record
    mes:rangoMes;
    anio:integer;
    valor:real;
  end;
  listaDet=^nodoDet;
  nodoDet=record
    dato:regPas;
    sig:listaDet;
  end;

procedure cargarPasaje(var L:lista);//se dispone

procedure leerAgencia(var a:agencia); 
begin
  readln(a.codigo);
  readln(a.social);
  readln(a.localidad);
end;
procedure cargarAgencia(var v:vagencia); //se ingresa por teclado sin ningún orden en particular.
var  a:agencia;i:rango;                  //retorne en una estructura de datos la información de las agencias
begin
  for i:= 1 to AGE do begin
    leerAgencia(a);
    v[a.codigo]:= a;
  end;
end;
{b)Realizar un módulo que reciba la información de los pasajes vendidos, la información de las  agencias oficiales
y el código de una agencia(que podría no existir), y retorne una estructura de datos con nombre de la agencia,
razón social, localidad, monto total vendido, y mes,año y valor de cada pasaje vendido por dicha agencia.
Esta información debe estar ordenada por el valor de cada pasaje.
}
procedure incisoB(L:lista;v:vagencia;codAge:integer;var rAge:regAge);
var  rPas:regPas;
begin
  while(L<>nil)and(L^.dato.numero<>codAge)do begin //si no se encontro avanza 
    L:=L^.sig;                                     //si L=nil o encontro el valor, sale del while
    
  if(L<>nil)then begin //si no se termino la lista
    rAge.nombre:=L^.dato.codigo; //no existe campo nombre en el registro agencia, asi que le pase el codigo.
    rAge.social:=L^.dato.social;
    rAge.localidad:=L^.dato.localidad;
    rAge.montoTotal:=0;
    rAge.detalle:=nil;
    while(L<>nil)and(L^.dato.numero=codAge)do begin //si no se termino la lista y encontro el valor
      rAge.montoTotal:=rAge.montoTotal+L^.dato.costo;
      rPas.mes:=L^.dato.mes;
      rPas.anio:=L^.dato.anio;
      rPas.valor:=L^.dato.costo;
      insertarOrdenado(rAge.detalle,rPas);
    end;
  end;
end;
procedure insertarOrdenado(var L:lista;rPas:regPas);
var nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=rPas;
  ant:=L;
  act:=L;
  while(act<>nil)and(act^.dato.valor<rPas.valor)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    L:=nue;
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;
var
  L:lista;
  v:vagencia;
  codAge:integer;
  rAge:regAge;
begin
  L:=nil; //se dispone
  cargarPasaje(L); //se dispone
  cargarAgencia(v);
  incisoB(L,v,codAge,rAge);
end.
