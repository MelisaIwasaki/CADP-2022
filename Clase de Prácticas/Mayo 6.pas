// preguntar sobre modulo insertar, el booleano!
program arreglo4P4p2;
const
    dimfAlum=1000;
type
    str20=string[20];
    alumno=record
        nroAlu:integer;
        apellido:str20;
        nombre:str20;
        asistencias:integer;
    end;
    alumnos[1..dimfAlum] of alumno;
    {le das un nro de alumno y te da la posición, cuando el alumno seguro existe}
    procedure retornePosAlum(a:alumnos;nroAlumno:integer;var posAlum:integer);
    var
        i:integer;
    begin
        i:=0;
        repear
            i:=i+1;
            if(a[i].nroAlu=nroAlumno) then
                posAlum:=i;
        until a[i].nroAlu=nroAlumno;
    end;
    
    procedure leer(var a:alumno);
    begin
        read(a.nroAlu);
        read(a.apellido);
        read(a.nombre);
        read(a.asistencia);
    end;
    
    {le das un alumno y lo inserta en el vector}
    procedure insertar(var a:alumnos;var diml:integer;al:alumno;var ok:boolean);
    var
        i,nroAlumnoAinsertar,lugarCorrecto:integer;
    begin
        ok:=true;
        nroAlumnoAinsertar:=al.nroAlu;
        if(diml+1<=dimfAlum) then begin
            ok:=true;
            lugarCorrecto:=1;
            while(lugarCorrecto < diml) and (a[lugarCorrecto].nroAlu < nroAlumnoAinsertar) do 
                lugarCorrecto:= lugarCorrecto+1;
                
            for i:= diml downto lugarCorrecto do 
                a[i+1]:=a[i];
            a[lugarCorrecto]:=al;
            diml:=diml+1;
        end;
    end;
    
    {le das un posición en el vector y elimina el valor de dicha posición}
    procedure eliminar(var a:alumnos;var diml:integer;pos:integer;var ok:boolean);
    var
        i:integer;
    begin
        ok:=false;
        if(pos > 1) and (pos <= diml) then begin
            ok:=true;
            for i:= pos to (diml-1) do
                a[i]:=a[i+1];
            diml:=diml-1;
        end;
    end;
    
    procedure recibeposYelimina(var a:alumnos;var diml:integer;nroDalumno:integer;var ok:boolean);
    var
        i,pos:integer;
        genial:boolean;
    begin
        i:=0;
        genial:=false;
        repeat
            i:=i+1;
            if(a[i].nroAlu=nroDalumno) then begin
                pos:=i;genial:=true;
            end;
        until (genial) or (i=diml);
        if(genial) then
            eliminar(a,diml,pos,ok);
                
    end;
    
    procedure chauAsistencia0(var a:alumnos;var diml:integer;var ok:boolean);
    var
        i:integer;
    begin
        for i:= 1 to diml do 
            if(a[i].asistencias=0) then
                eliminar(a,diml,i,ok);
    end;
    
var
    a:alumnos;
    alumn:alumno;
    nroAlumno,nroDalumno,posAlum,diml,posicion2,posDalumno:integer;
    ok:boolean;
begin
    leerAlumn(a,diml);
    read(nroAlum);
    {le das un nro de alumno y te da la posición}
    retornePosAlum(a,nroAlumno,posAlum);{excelente}
    leer(alumn);
    {le das un alumno y lo inserta en el vector}
    insertar(a,diml,alumn,ok);
    read(posicion2);
    {le das un posición en el vector y elimina el valor de dicha posición}
    eliminar(a,diml,posicion2,ok);
    read(nroDalumno);
    recibeposYelimina(a,diml,nroDalumno,ok);
    chauAsistencia0(a,diml,ok);
end;
/**************************************************************************************/
Fernandez
program ejercicio4;
const
	dimF=1000;
	
type
	cadena=string[20];
	infoAlumno=record;
			nroAlumno:integer;
			apellido:cadena;
			nombre:cadena;
			asistencia:integer;
			end;

 vector= array[1..dimF] of infoAlumno;

procedure leer( var info:infoAlumno);
begin
	writeln('ingrese el numero de alumno);
	readln(info.nroAlumno);
	writeln('ingrese el nombre del alumno');
	readln (info.nombre);
	writeln('ingrese el apellido del alumno');
	readln(info.apellido);
	writeln('ingrese la cantidad de asistencia que tuvo');
	readln(info.asistencia);
end;

procedure cargarVector( var v:vector ; var dimL:integer);
var
	i,dimL:integer;
	info:infoAlumno;
begin
	dimL:=0;
	for i:=1 to dimF do begin
		leer(info);
		v[i]:=info;
		dimL:=dimL+1;
	end;
end;

{a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por
 parámetro. El alumno seguro existe.}

function BuscarRetornarPosicion ( v:vector; numAlu:integer, dimL:integer):integer;
var
	pos:integer;
begin
	pos:=1;
	while (pos<= dimL) and (v[pos].nroAlumno <numAlu) do begin 
		pos:=pos+1;
	end;
	if ((pos<=dimL) and (v[pos].nroAlumno = numAlu)) then 
		BuscarRetornarPosicion:=pos;
end;
{b. Un módulo que reciba un alumno y lo inserte en el vector.}

procedure insertarAlumno (var v:vector; var dimL:integer ; var pude:boolean; nuevoAlu:infoAlumno);
begin
	pude:=false;
	if ((dimL+1) <= dimF) then begin
		pude:=true;
		dimL:=dimL+1;
		a[dimL]:=nuevoAlu;
	end;
end;

//c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.

procedure borrar( var v:vector; var dimL:integer; var pude:boolean ; pos:integer);
begin
	pude:=false;
	if ((pos>=1) and (pos<=dimL) then begin
			for i:= pos to (dimL-1) do
					a[i]:= a[i+1];
			pude:=true;
			dimL:=dimL-1;
	end;
end;
//d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector

procedure eliminarAlumno(var v : vector; var dimL:integer;num : integer;);
var
i : integer;
	ok:boolean;
begin
	{for i:=1 to dimL do
	begin
		if (v[i].nroAlumno = num)then
			v[i] := v[i+1];
		dimL:= dimL-1;
	end;}
	pos:=BuscarRetornarPosicion(v,dimL,num);
	borrar(v,dimL,ok,pos);
end;

{e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias 
en 0.} 

procedure borrarMenosAsistencia( var v:vector ; var dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		posAct:=i;
		if (v[i].asistencia =0 ) then begin
			{for i:=posAct to (dimL-1) do
					v[i]:=v[i+1];
			pude:=true;
			dimL:=dimL-1;}
			borrar(v,dimL,i);
			
	end;
end;

var
	dimL,numAlu,pos,num:integer
	v:vector;
	info:infoAlumno;
	pude:boolean
begin
	cargarVector(v,dimL);{se dispone}
  writeln('ingrese el numero de alumno para retornar su posicion'); 
	readln(numAlu);
	BuscarRetornarPosicion ( v,numAlu,dimL);		
	insertarAlumno (v,dimL,pude,info);
	writeln('inngrese una posicion para eliminar el contenido de la misma');
	readln(pos);
	borrar(v,dimL,pos);
	write('Ingrese un numero de alumno para eliminar su posicion ');read(num);
	eliminarAlumno(v,dimL,num);
	borrarMenosAsistencia(v,dimL,info);
end.

**********************************************************************************************
Program Pra4Par2Eje5;
const
	dimF=500;
	dimFM='F';
	dimFC=2400; 
	DimFMD=10;
type
	str30= string[30];
	ranMonotributo='A'..dimFM;
	ranCodCiudad=1..dimFC;
	ranMes=1..12;
	ranAnio=1950..2100;
	
	rFecha=record
		mes:ranMes;
		anio:ranAnio;
	end;
	
	rCliente=record
		firma:rFecha;
		monotributo:ranMonotributo;
		ciudad:ranCodCiudad;
		monto:real;
	end;
	
	rMaxDiez=record
		maxDiez:integer;
		codCiudad:ranCodCiudad;
	end;
	
	vClientes=array[1..dimF] of rCliente;
	vMonotributos=array[ranMonotributo] of integer;
	vClientesXciudad=array[ranCodCiudad] of integer;
	vMaxDiez=array[1..DimFMD] of rMaxDiez;

	
	//Inicio el vector contador de Monotributos en cero
	procedure IniciarMonotributos(var vM:vMonotributos);
	var
		i:char;
	begin
		for i:='A' to dimFM do
			vM[i]:=0;
	end;

	
	//Inicio el vector contador de Clientes por ciudad en cero
	procedure IniciarClienteXciudad(var vC:vClientesXciudad);
	var
		i:integer;
	begin
		for i:=1 to dimFC do
			vC[i]:=0;
	end;

	
	//Inicio el vector de los mayores Diez de Clientes por ciudad en -1
	procedure IniciarMayoresDiez(var vMD:vMaxDiez);
	var
		i:integer;
	begin
		for i:=1 to DimFMD do
			vMD[i].maxDiez:=-1;
	end;

	
	//Leo el registro Cliente
	procedure LeerCliente(var rC:rCliente);
		//Leo el registro fecha
		procedure LeerFecha(var rF:rFecha);
		begin
			with rf do begin
				writeln('Fecha Contrato');
				write('   Mes [1..12]: ');readln(mes);
				write('   Anio [1950..2022]: ');readln(anio);
			end;
		end;
	var 
		rF:rFecha;
	begin
		with rC do begin
			LeerFecha(rF);
			firma:=rF;
			write('Categoria Monotributo [A..F]: ');readln(monotributo);
			write('Codigo Ciudad [1..2400]: ');readln(monotributo);
			write('Monto: ');readln(monto);
		end;
	end;

	
	//Cargo el el vector los registro de cliente
	procedure CargarClientes(var vC:vClientes);
	var
		rC:rCliente;
		i:integer;
	begin
		for i:=1 to dimF do begin
			LeerCliente(rC);
			vC[i]:=rC;
		end;
	end;


	procedure procesar(vC:vClientes; var maxAnio:ranAnio; var vMD:vMaxDiez; var ClienteSupProm:integer);
		//Devuelve el año en que se fimaron la mayor cantidad de contratos
		procedure MayorCantContratos(anioAct:ranAnio; contratos:integer; var maxAnio:ranAnio; var maxContratos:integer);
		begin
			if (contratos>maxContratos) then begin
				maxContratos:=contratos;
				maxAnio:=anioAct;
			end;
		end;
		//Devuelve un vector con el codigo de las 10 ciudades con mayor cantidad de clientes
		procedure MaxDiez(vCxC:vClientesXciudad; var vMD:vMaxDiez);
		var
			i,j,pos:integer;
		begin
			for i:=1 to dimFC do begin
				pos:=1;
				while (pos<=dimFMD) and (vCxC[i]<vMD[pos].maxDiez) do
					pos:=pos+1;
				if (pos<=dimFMD) then begin
					for j:=dimFMD downto pos do begin
						vMD[j].maxDiez:=vMD[j-1].maxDiez;
						vMD[j].codCiudad:=vMD[j-1].codCiudad;
					end;
					vMD[pos].maxDiez:=vCxC[i];
					vMD[pos].codCiudad:=i;
				end;
			end;
		end;	
		//Devuelve la cantidad de clientes que superan el monto promedio 
		function ClienteSupMontoProm(vC:vClientes;MontoPromedio:real):integer;
		var
			i,cont:integer;
		begin
			cont:=0;
			for i:=1 to dimF do
				if vC[i].monto>MontoPromedio then
					cont:=cont+1;
			ClienteSupMontoProm:=cont;
		end;
	var
		anioAct,mesAct,i:integer;
		contMes,contAnio,maxContratos:integer;
		vM:VMonotributos;
		vCxC:vClientesXciudad;
		sumaMontos,MontoPromedio:real;
	begin
		sumaMontos:=0;
		maxContratos:=-1;
		i:=1;
		IniciarMonotributos(vM);
		IniciarClienteXciudad(vCxC);
		IniciarMayoresDiez(vMD);
		while (i<=dimF) do begin
			anioAct:=vC[i].firma.anio;
			contAnio:=0;
			while (i<=dimF) and (anioAct=vC[i].firma.anio) do begin
				mesAct:=vC[i].firma.mes;
				contMes:=0;
				while (i<=dimF) and (anioAct=vC[i].firma.anio) and (mesAct=vC[i].firma.mes) do begin
					contMes:=contMes+1;
					vM[vC[i].monotributo]:=vM[vC[i].monotributo]+1;
					vCxC[vC[i].ciudad]:=vCxC[vC[i].ciudad]+1;
					sumaMontos:=sumaMontos+vC[i].monto;
					i:=i+1;
				end;
				writeln('Para el Mes [',mesAct,'] del anio [',anioAct,'] hay ',contMes,' contratos firmados');
				contAnio:=contAnio+contMes;
			end;
			writeln('El total de contratos firmados para el anio [',anioAct,'] son: ',contAnio);
			MayorCantContratos(anioAct,contAnio,maxAnio,maxContratos);
		end;
		MaxDiez(vCxC,vMD);
		MontoPromedio:=sumaMontos/dimF;
		ClienteSupProm:=ClienteSupMontoProm(vC,MontoPromedio);
	end;


	//Imprime el vector con el codigo de las 10 ciudades con mayor cantidad de clientes
	procedure ImprimirMaxDiez(v:vMaxDiez);
	var 
		i:integer;
	begin
		for i:=1 to DimFMD do
			writeln('Cod Ciudad: [',v[i].codCiudad,'] - Cantidad: [',v[i].maxDiez,']');
	end;


{*********** PROGRAMA PRINCIPAL **********}
var 
	vC:vClientes;
	vMD:vMaxDiez;
	maxAnio:ranAnio;
	ClienteSupProm:integer;
begin
	CargarClientes(vC);
	procesar(vC,maxAnio,vMD,ClienteSupProm);
	writeln('Anio en que se firmo la mayor cantidad de contratos [',maxAnio,'] ');
	ImprimirMaxDiez(vMD);
	writeln('Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes [',ClienteSupProm,'] ');
end.

*******************************************************************************************************************
