program becasysubsidios;
const
  maxAlumnos = 1300;
  maxMedios = 5;
type
  rangoAlumnos = 1..maxAlumnos;
  rangoMedios = 1..maxMedios;  
  tablaPrecios = array[rangoMedios] of real;
  
  viaje = record
     alumno : rangoAlumnos;
     dia : integer;
     facultad : string;
     medio : rangoMedios;
     end;
  lista = ^nodo;
  nodo = record
     dato : viaje;
     sig : lista;
     end;
  vectorViajes = array[rangoAlumnos] of lista;   
  vectorMedios = array[rangoMedios] of integer;
  vectorDias = array[1..31] of integer;
  vectorGastosDias = array[1..31] of real;
  
  procedure leerViaje(var v : viaje);
  begin
     readln(v.alumno);
     readln(v.dia);
     readln(v.facultad);
     readln(v.medio);
  end;   
  procedure inicializarVector(var v : vectorViajes);
  var
    i : rangoAlumnos;
  begin
    for i :=1 to maxAlumnos do
      v[i] := nil;
  end;  
  procedure cargarViajes (var v : vector);
  var
    via : viaje;
  begin
    inicializarVector(v);
    leerViaje(via);
    while (via.alumno <> -1) do 
    begin
      agregarAdelante( v[via.codAlumno] , via);
      leerViaje(via);
    end;
  end;
  procedure agregarAdelante (var L : lista; dato : viaje);
  var
    aux : lista;
  begin
    new(aux); 
    aux^.dato := dato;
    aux^.sig := L; 
    L := aux;
  end;  
  
  
  procedure procesarDatos(v : vectorViajes; precios : tablaPrecios;
						var  cantMas6,cantMas80, cantBici : integer; 
						var medioMax1, medioMax 2 : rangoMedios)
  var
     medios : vectorMedios;
     i : rangoAlumnos;
     hizoMasDe6, gastoMasDe80,combinaBici : boolean;
  begin
     inicializarMedios(medios);
     cantMax6 := 0; cantMas80 := 0; cantBici := 0;
     medioMax1 := 1; medioMax2 := 1;
     
     for i:= 1 to maxAlumnos do 
     begin
        procesarAlumno(v[i],precios, hizoMasDe6, gastoMasDe80, combinaBici,medios);
        if (hizoMasDe6) then cantMax6 := cantMax6 + 1;
        if (gastoMasDe80) then cantMas80 := cantMas80 + 1;
        if (combinaBici) then cantBici:= cantBici + 1;
     end;
     calcularMaximos(medio,medioMax1,medioMax2);    
  end;						
  procedure procesarAlumno(L : lista; precios : tablaPrecios; 
						var hizoMasDe6, gastoMasDe80, combinaBici : boolean;
						var medios : vectorMedios);
	var
	   gastos : vectorGastosDias;
	   andaEnBici,andaEnOtroMedio : boolean;
	begin
	  hizoMasDe6 := false;
	  gastoMasDe80 := false;
	  combinaBici := false;
	  andaEnBici := false; 
	  andaEnOtroMedio := false;
	  iniciarlizarGastos(gastos);
	  while (L<>nil) do begin
	     gastos[L^.dato.dia] := gastos[L^.dato.dia] + precios[L^.dato.medio];
	     
	     if (L^.dato.medio = 5) then vectorBicis[L^.dato.dia] := true
	     if (L^.dato.medio <> 5) then vectorNoBicis[L^.dato.dia] := true;
	     
	     L:= L^.sig;
	  end;
     gastoMasDe80 := (promedio(gastos) > 80);
	  combinaBici := andaEnBici and andaEnOtroMedio;
	end;					
  
  
  var
     v : vectorViajes;
     precios : tablaPrecios;
     cantMas6, cantMas80, cantBici : integer;
     medioMax1, medioMax 2 : rangoMedios;   
  begin
     cargarViajes(v);
     cargarPrecios(precios); //se dispone
     
     procesarDatos(v,precios,cantMas6,cantMas80, cantBici,  medioMax1, medioMax2);
     writeln(...);     
  end.
  
