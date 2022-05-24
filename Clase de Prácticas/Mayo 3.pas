{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}
program Practica4Ej8;
const
dmf = 400;
type
nac = record
dia:integer;
mes:integer;
ao:integer;
end;

persona = record
nro:integer;
dni:integer;
apellido:string;
nombre:string;
fecha:nac;
end;
personas = array [1..dmf] of persona;

procedure  CargarVector(per:persona;var v:personas;f:nac);
var
i:integer;
begin
for i:=1 to dmf do
begin
write('Leer el Numero del Alumno:');
readln(per.nro);
v[i].nro:=per.nro;
write('Leer DNI:');
readln(per.dni);
v[i].dni:=per.dni;
write('Leer Apellido:');
readln(per.apellido);
v[i].apellido:=per.apellido;
write('Leer Nombre:');
readln(per.nombre);
v[i].nombre:=per.nombre;
write('leer Dia De Nacimiento:');
readln(f.dia);

end;
end;



var
per:persona;
v:personas;
f:nac;
begin
CargarVector(per,v,f);


end.
2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.

program arreglo2P4p2;
const
    dimf=500;
type
    str40=string[40];
    alumnos=array[1..dimf] of str40;
    
    procedure leer(var a:alumnos;var diml:integer);
    var
        aux:str40;
    begin
        diml:=0;
        read(aux);
        while(aux<>'zzz') and (diml<dimf) do begin
            diml:=diml+1;
            a[diml]:=aux;
            read(aux);
        end;
    end;
    procedure inserte(var a:alumnos;var diml:integer;var ok:boolean);
    var
        i:integer;
        nom:str40;
    begin
        
        ok:=false;
        if(diml+1<=dimf) and 4<=diml then begin
            read(nom);
            
            for i:= diml downto 4 do 
				a[i+1]:=a[i];
            
            a[4]:=nom;
            diml:=diml+1; 
            ok:=true;
        end;
    end;
    {d. Lea un nombre y lo agregue al vector.}
    procedure agregar(var a:alumnos; var diml:integer; var ok:boolean);
    var
        nom:str40;
    begin
        ok:=false;
        if(diml+1<=dimf) then begin
            ok:=true;
            diml:=diml+1;
            read(nom);
            a[diml]:=nom;
        end;
    end;
    {b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.}
    
    procedure eliminar(var v: vectorAlu; var dl: integer; n:str; var ok:boolean);
	var 
		pos, i: integer;
		encontro: boolean;
	begin 
		pos:= 1;
		encontro:= false;
		while(pos <= dl) and (not encontro) do begin 
			if (v[pos] = n) then begin
				encontro:= true;
				for i:= pos to (dl -1) do 
					v[i]:= v[i +1];
				dl:= dl -1; 
				writeln('se elimino del vector el num');
			end		
			else
				pos:= pos + 1;
			
		end;
		ok:=encontro;
	end;
	
end;
    
var
    a:alumnos;
    diml:integer;
    ok:boolean;
    nom:str40;
begin
    leer(a,diml);
    readln(n);
    ocurrencia(a,diml,ok,n);
    inserte(a,diml,ok,nom);
    
    if(ok) then writeln('se pudo insertar');
    
    agregar(a,diml,ok);
end;
10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados).

La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector.

Una vez finalizada la carga de datos se pide:

a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.

b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.

program arreglo10;
const
    dimf = 200;
    porcentaje=1.15;
type
    empleado=record
        legajo:integer;
        salario:real;
    end;
    ar=array[1..dimf]of empleado;
    
    procedure leer(var a:ar;var diml:integer);
        procedure leerEmpleados(var emp:empleado);
        begin
            read(emp.salario);
            if(em.salario<>0) then
                read(emp.legajo);
        end;
    
    var 
        i:integer;
    begin
        diml:=0;
        for i:= 1 to dimf do begin
          leerEmpleados(a[i]);
          if(a[i].salario<>0) then
            diml:=diml+1;
        end;
    end;
    
    {a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
        módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
        retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.}
    procedure incrementosalario(var a:ar;diml:integer;x:real);
    var 
        i:integer;
    begin
        for i:= 1 to diml do begin
            a[i].salario:=a[i].salario*x;
        end;
    end;  
    procedure imprime(a:ar;diml);
    var 
        i,suma:integer;
        prom:real;
    begin
        suma:=0;
        for i:= 1 to diml do begin
            suma:=suma+a[i].salario;
        end;
        prom:=suma/diml;
        writeln('el sueldo promedio de los empleados de la empresa es: ',prom);
    end;
    {b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}
var 
    a:ar;
    diml:integer;
    x:real;
begin
    leer(a,dimf);
    incrementosalario(a,diml,porcentaje);
    imprime(a,diml);
end;





program ejer14;

const
	totCod = 5;
	totProy= 1000;

type
	str20=String[20];
	
	rolDesarrollador = record
		cod:integer;
		rol:str20;
		valor:real;
	end;
	
	vTabla = array [1..totCod] of rolDesarrolador;
	
	participante=record
		pais:str20;
		codP:integer;
		nomP:str20;
		rol:integer;
		canths:integer;
	end;
	
	proyecto = record
		monto:real;
		cantArq:integer;
	end;
	

	vProyectos = array [1..totProy] of proyecto;	
	


procedure inicializarV(var p:vProyectos);
var 
	i:integer;
begin
	for i:=1 to 1000 do begin
		p[i].monto:=0;
		p[i].cantArq:=0;
	end;
end;

function ProyMenorMonto (vp:vProyectos): integer;
var
	i, minCod: integer;
	min: real;
	
begin 
	min:= 99999;
	for i := 1 to totProy do begin
		if(vp[i].monto < min ) then begin 
			min:= vp[i].monto;
			minCod:= i;
		end;
	end;
	ProyMenorMonto:= minCod;
end;

procedure leerP(var pa: participante);
begin
	readln(pa.codP);
	if(pa.codP <> -1) then begin
		readln(pa.pais);
		readln(pa.nombre);
		readln(pa.rol);
		readln(pa.canths);
	end;

end;

procedure imprimir(vp:vProyectos);
var
	i: integer;
begin
	for i := 1 to totProy do 
		writeln(' La cantidad de Arquitectos de software  del proy num ', i, ' es de ', vp[i].cantArq);
end;

var
	p:participante;
	proy:vProyectos;
	tabla:vTabla;
	totalArg:real;
	totalHsAd:integer;
	
begin
	totalArg:=0;
	totalHsAd:=0;
	inicializarV(proy);
	cargarVectorTabla(tabla);{se dispone}
	leer(p);
	while(p.codP<>-1) do begin
		
	{a}	if(p.pais='Argentina') then 
			totalArg:= totalArg + (p.canths * tabla[p.rol].valor );
			
	{b}	if(p.rol=3) then
			totalHsAd:= totalHsAd + p.canths
			else 
			{d}if (p.rol = 4) then 
				proy[p.codP].cantArq:= proy[p.codP].cantArq + 1;
			
	{c}	proy[p.codP].monto:= proy[p.codP].monto + (p.canths * tabla[p.rol].valor );
	
		
	leer(desa);
	end;
	
	//calculos de los proyectos
	writeln('el monto total invertido en desarrolladores de argentina es:',totalArg);
	writeln('la cantidad de horas trabajadas por adm BDD:',totalHsAd);
	writeln('el codigo del proyecto con menor monto:',ProymenorMonto(proy));
	imprimirArq(proy);
	
	
end;
