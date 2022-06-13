{
La plataforma YouTube está analizando algunos de sus principales canales de video.Para eso YouTube cuenta con
una tablacon el nombre de las 60 categorías que utilizan para clasificar los videos(música,educación y ciencia,
hogar,deportes,etc).De cada video se conoce su título,nombre del canal donde fué publicado, duración en segundos,
año de publicación,cantidades de visualizaciones y el código de categoría a la que pertenece el video(1..60).
Realizar un programa que:
A)Invoque a un módulo.Que lea la información de los videos hasta ingresar un video de duración -1(que no debe 
procesarse)y devuelva en una estructura de datos adecuada para el canal "Paulina Cocina",la siguiente información:
-Nombre de canal de videos publicados.
-Cantidad total de visualizaciones entre todos los videos.
-Detalle del título,nombre de la categoría y duración de todos los videos con más de 1000 visualizaciones.
B)Invoque a un módulo que reciba a estructura generada en A) e imprima nombre del canal y el título de cada 
video con más de 1000 visualizaciones.
}
program YouTube;
const
  dimF=60;
type
  rango=1..dimF;
  cadena=string[30];
  tabla=array[rango]of cadena; //se dispone
  video=record
    titulo:cadena;
    nombre:cadena;
    duracion:real;
    anio:integer;
    cantVis:integer;
    codigo:rango;
  end;
  detalleVideo=record
    titulo:cadena;
    nomCat:cadena;
    duracion:real;
  end;
  lista=^nodo;
  nodo=record
    dato:detalleVideo;
    sig:lista;
  end;
  canal=record
    nombre:cadena;
    cantTotalVis:integer;
    detalle:lista;
  end;
  
procedure leerVideo(var v:video);
begin
  writeln('Duracion:');
  readln(v.duracion);
  if(v.duracion <> -1)then begin
    writeln('Titulo:');
    readln(v.titulo);
    writeln('Nombre:');
    readln(v.nombre);
    writeln('Anio:');
    readln(v.anio);
    writeln('Cantidad de visualizaciones:');
    readln(v.cantVis);
    writeln('Codigo');
    readln(v.codigo);
  end;
end;
procedure agregarAdelante(var L:lista;det:detalleVideo);
var nue:lista;
begin
  new(nue);
  nue^.dato:= det;
  nue^.sig:= L;
  L:= nue;
end;
procedure inicializarCanal(var c:canal);
begin
  c.nombre:= 'Paulina Cocina';
  c.cantTotalVis:= 0;
  c.detalle:= nil;
end;
procedure cargar(var c:canal;var L:lista;vt:tabla);
var  
     det:detalleVideo;
     v:video;
begin
  inicializarCanal(c);
  leerVideo(v);
  while(v.duracion <> -1)do begin
    if(v.nombre = 'Paulina Cocina')then begin
      c.cantTotalVis:= c.cantTotalVis + v.cantVis;  
      if(v.cantVis > 1000)then begin
        det.titulo:= v.titulo;
        det.nomCat:= vt[v.codigo];
        det.duracion:= v.duracion;
        agregarAdelante(c.detalle,det); //c.datalle= L
      end;
    end;
  end;
end;
procedure imprimir(L:lista;c:canal);
begin
  while(L<>nil)do begin
    writeln('Canal y el título de cada video con más de 1000 visualizaciones');
    writeln(c.nombre,L^.dato.titulo);
    L:= L^.sig;
  end;
end;
var
  L:lista;
  c:canal;
  vt:tabla;
begin
  cargarTabla(vt); //se dispone
  cargar(c,L,vt);
  imprimir(L,c);
end.
