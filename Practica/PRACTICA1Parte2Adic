{
Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:

Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71

Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74

Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34

(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000.
}

program Hello;
var  codigo,cantInv,codMax,cant5,i:integer;
     promedio,monto,montoTotal,max:real;
begin
  codMax:=0;
  cant5:=0;
  max:=-999;
  repeat
    montoTotal:=0;
    write('Ingrese el codigo:');
    readln(codigo);
    write('Ingrese la cantidad de inversiones:');
    readln(cantInv);
    for i:=1 to cantInv do begin
      write('Ingrese el monto:');
      readln(monto);
      montoTotal:=montoTotal+monto;
    end;
    promedio:=montoTotal/cantInv;
    if(montoTotal>max)then begin
      max:=montoTotal;
      codMax:=codigo;
    if(montoTotal>50000)then
      cant5:=cant5+1;
    writeln('Empresa ',codigo,' Monto Promedio ',promedio:5:2);
    end;
  until(codigo=100);
  writeln('La empresa ',codMax,' es la que mayor dinero invertido posee:',max:2:2);
  writeln('Hay ',cant5,' empresas con inversiones por mas de $50000.');
end.

{
Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.
}
program Hello;
type
  cadena1=string[1];
var
  legajo,i,aluI,aluR,presente,cantIparcial,cantRparcial,todas,cantProm65,cantCero,totalAlu:integer;
  nota0,notaDiez,notaCero,codDies1,codDies2,codCero1,codCero2,maxD1,maxD2,maxC1,maxC2:integer;
  condicion:cadena1;
  nota,notaTotal,promedio:real;
begin
  aluI:=0;aluR:=0;cantIparcial:=0;cantRparcial:=0;todas:=0;cantProm65:=0;cantCero:=0;totalAlu:=0;
  
  writeln('Ingrese el legajo');
  readln(legajo);
  while(legajo<>-1)do begin
    presente:=0;notaTotal:=0;promedio:=0;notaDiez:=0;notaCero:=0;
    totalAlu:=totalAlu+1;
    writeln('Ingrese I para INGRESANTE, R para RECURSANTE');
    readln(condicion);
    for i:=1 to 5 do begin
      writeln('Ingrese la nota de autoevaluacion ',i);
      readln(nota);
      notaTotal:=notaTotal+nota;
      if(nota<>-1)and(nota>=4)then          //condiciones de rendir el parcial:
        presente:=presente+1;               //“Presente” en almenos el 75% del total de las ae
      if(nota=10)then                       //presente>4
        notaDiez:=notaDiez+1;               //presente:en tiempo y forma y con al menos el 40% de respuestas correctas
      if(nota=0)then                        //presente<>-1 nota>4
        notaCero:=notaCero+1;
    end;
    if(condicion='I')then begin
      aluI:=aluI+1;
      if(presente>3.75)then                  //75%-x  100%-5 -->75*5/100=3.75 -->4
        cantIparcial:=cantIparcial+1;
    end
    else begin
      aluR:=aluR+1;
      if(presente>3.75)then
        cantRparcial:=cantRparcial+1;
    end;
    promedio:=notaTotal/5;
    if(presente=5)then
      todas:=todas+1;
    if(promedio>6.5)then   //promedio>6.5
      cantProm65:=cantProm65+1;
    if(notaCero>=1)then
      cantCero:=cantCero+1;
    if(notaDiez>maxD1)then begin
      maxD2:=maxD1;
      maxD1:=notaDiez;
      codDies2:=codDies1;
      codDies1:=legajo;
    end
    else
    if(notaDiez>maxD2)then begin
      maxD2:=notaDiez;
      codDies2:=legajo;
    end;
    if(notaCero>maxC1)then begin
      maxC2:=maxC1;
      maxC1:=notaCero;
      codCero2:=codCero1;
      codCero1:=legajo;
    end
    else
    if(notaCero>maxC2)then begin
      maxC2:=notaCero;
      codCero2:=legajo;
    end;
    writeln('Ingrese el legajo');
    readln(legajo);    
  end;
  
  writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones ',todas);
  writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos ',cantProm65);
  writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación ',cantCero);
  writeln('Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 ',codDies1,codDies2);
  writeln('Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 ',codCero1,codCero2);
  writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial ',cantIparcial);
  writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial ',cantRparcial);
  writeln('Porcentaje sobre el total de alumnos INGRESANTES',aluI*100/totalAlu:2:2,'%');
  writeln('Porcentaje sobre el total de alumnos RECURSANTES',aluR*100/totalAlu:2:2,'%');
end.

{
Actividad 3: Ventas de tanques de agua
Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos
}  
 program Hello;
const
  pi=3.14;
var
  ancho,largo,alto,radio,volumenR,volumenC,max1,max2,totalR,totalC:real;
  tanque:char;
  tanqueR,tanqueS,cantAlto,cantVol:integer;
begin
  tanqueR:=0;tanqueS:=0;cantAlto:=0;cantVol:=0;totalR:=0;totalC:=0;max1:=-1;max2:=-1;
  writeln('Ingrese R para tanques rectangulares, C para cilíndricos y Z para finalizar');
  readln(tanque);
  while(tanque<>'Z')do begin
    if(tanque='R')then begin
      writeln('Ingrese ancho');
      readln(ancho);
      writeln('Ingrese largo');
      readln(largo);
      writeln('Ingrese alto');
      readln(alto);
      tanqueR:=tanqueR+1;
    end
    else
    if(tanque='C')then begin
      writeln('Ingrese radio');
      readln(radio);
      writeln('Ingrese alto');
      readln(alto);
      tanqueS:=tanqueS+1;
    end;
    volumenR:=ancho*largo*alto;
    volumenC:=pi*radio*radio*alto;
    totalR:=totalR+volumenR;
    totalC:=totalC+volumenC;
    if(volumenR>max1)then begin
      max2:=max1;
      max1:=volumenR;
    end
    else
    if(volumenR>max2)then
      max2:=volumenR;
    
    if(volumenC>max1)then begin
      max2:=max1;
      max1:=volumenC;
    end
    else
    if(volumenC>max2)then
      max2:=volumenC;
    if(alto<1.4)then
      cantAlto:=cantAlto+1;
    if(volumenC<800)or(volumenR<800)then
      cantVol:=cantVol+1;
    
    writeln('Ingrese R para tanques rectangulares, C para cilíndricos y Z para finalizar');
    readln(tanque);
  end;
  writeln('Volumen de los dos mayores tanques vendidos ',max1:2:2,max2:2:2);
  writeln('Volumen promedio de todos los tanques cilíndricos vendidos ',totalR/tanqueR:2:2);
  writeln('Volumen promedio de todos los tanques rectangulares vendidos ',totalC/tanqueS:2:2);
  writeln('Cantidad de tanques cuyo alto sea menor a 1.40 metros ',cantAlto);
  writeln('Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos ',cantVol);
end. 
