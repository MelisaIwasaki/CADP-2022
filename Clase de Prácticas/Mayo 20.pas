program lista14;
type
    str=string[40];
    alumno=-1..1300;
    diaM=1..31;
    transpor=1..5;
    transporte=array[transpor]of real;
    
    alumno=record
        codAlumno:alumno;
        diadelmes:diaM;
        facultadPerte:str;
        medioTra:transpor;
    end;
    
    lista=^nodo
    nodo=record
        elem:alumno;
        sig:lista;
    end;
    
    vAlum = array [1..1300] of lista;
    
    procedure crear(var l:lista);
    begin
        l:=nil;
    end;
    procedure leerEst(var estudiante:alumno);
    begin
        with estudiante do begin
            read(codAlumno);
            if (codAlumno<>-1) then begin
                read(diadelmes);
                read(facultadPerte);
                read(medioTra);
            end;
        end;
    end;
    procedure inicializarA(var al:vAlum);
    var
		i:integer;
    begin
		for i:=1 to 1300 do begin
			al[i]:=nil;
		end;
    end;
    procedure cargarOrdenado(var l:lista; estudiante:alumno);
    var
        nuevo,ant,act:lista;
    begin
        new(nuevo);nuevo^.elem:=estudiante;nuevo^.sig:=nil;
        if(l=nil) then
            l:=nuevo
        else begin
            ant:=l;act:=l;
            while((act<>nil)and(estudiante.diadelmes>act^.elem.diadelmes))
                ant:=act;
                act:=act^.sig;
            end;
            ant:=nuevo;
        end;
    end;
    procedure cargarDatos(var alumnos:vAlum);
    var
        estudiante:alumno;
    begin
        leerEst(estudiante);
        while(estudiante.codAlumno<>-1) then begin
            cargarOrdenado(alumnos[estudiante.codAlumno],estudiante);
        leerEst(estudiante);
        end;
            
    end;
    
    var 
        aux:lista;
    begin
        aux:=l;
        while(aux<>nil) do begin
            
            
            
            aux:=aux^.sig;
    end;
    
var 
    
    precio:transporte;
    l,lc:lista;
    
begin
    crear(l);
    cargaPrecio(precio);// se dispone
    cargarLista(l);
    ordenarLista(l);
    l2:=l;
    while(lc<>nil) do begin
        
    
    
        lc:=lc^.sig;
         function estaOrdenado(l:lista):boolean;
    var
        ant,act:lista;
    begin
        ant:=l;act:=l;
        while(act<>nil) and (ant<act) do begin
            ant:=act;
            act:=act^.sig;
        end;
        estaOrdenado:=act=nil;
    end;
    
    
    
    
    
    
    program ej6;

const
dF = 7;

type

rango = 1..7;

str = string[20];

lista = ^nodo;

sonda =  record
	nombre: str; 
	duracion: real;
	costoConst: real;
	costoMensual: real;
	rangoEE: integer;

end;

nodo = record
	dato : sonda;
	sig: lista;
end;

vCont = array [rango] of integer;

procedure inicializarVec(var vc: vCont);
var
i: integer;
begin
	for i:= 1 to dF do
		vc[i]:= 0;
end;

procedure leer(var s: sonda);

begin 
 with s do begin 
	readln(nombre);
	readln(duracion);
	readln(costoConst);
	readln(costoMensual);
	readln(rangoEE);	
 end;
end;

procedure agregarAdelante (var l: lista; s: sonda);
var
aux: lista;
begin 
	new(aux);
	aux^.dato:= s;
	aux^.sig:= l;
	l:= aux;
end;

function promedio(total:real; sondaTot: integer ): real;
begin 
	promedio:= total/ sondaTot;
end;



procedure maxCostoSonda (s:sonda; var max: real; var: nom: str);
var 
costoMant, costo: real;
begin 
	costoMant:= s.costoMensual * s.duracion;
	costo:= s.costoConst + costoMant;
	if(costo > max) then begin
		max:= costo;
		nom:= s.nombre;
	end;
end;


procedure informarVector(vc: vCont); 
var
i: integer;
begin 
	for i:= 1 to dF do
		writeln('En el rango ', i, ' la cantidad de sondas que realizaran estudios seran ', vc[i]);
end;


procedure informar (l: lista; promDuracion, promCosto: real );
var
max:real;
nom: str;
vc: vCont;
cant: integer;
begin 
	max:= 0;
	cant:= 0;
	inicializarVec(vc);
	while (l <> nil ) do begin 
		maxCostoSonda(l^.dato, max, nom);
		vc[l^.dato.rangoEE]:= vc[l^.dato.rangoEE] + 1;
		if(l^.dato.duracion > promDuracion) then 
			cant:= cant + 1;
		if(l^.dato.costoConst > promCosto) then 
			writeln(l^.dato.nombre);
		l:= l^.sig;	
	end;
	writeln('la sonda mas costosa es ', nom);
	informarVector(vc);
	
end;


var
ls:lista;
so: sonda;
sondasTot: integer
costoTot,duracionTot promDuracion, promCosto:= real;
begin 
	sondasTot:= 0;
	duracionTot:= 0;
	costoTot:=0;
	ls:= nil;
	repeat 
		leer(so);
		sondasTot:= sondasTot + 1;
		duracionTot:= duracionTot + so.duracion;
		costoTot:= costoTot + so.costoConst;
		agregarAdelante(ls,so);
	until (ls^.dato.nombre = 'GAIA');
	promDuracion:= promedio(duracionTot, sondasTot);
	promCosto:= promedio(costoTot, sondasTot);
	informar(ls,promDuracion, promCosto );
end.
