{La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título Relato de un
náufrago (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial Planeta Libros, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}

program Libros;
const dimF = 35;
type cadena30 = string [30];  subrango = 1..2050;  sunrango2 = 1.. dimF;
     vector = array [1..dimF] of cadena30;
     libro = record
                título: cadena30;
                nombreEditorial: cadena30;
                cantPáginas: integer;
                anioEdición: subrango;
                cantVecesVendido: integer;
                códAreaTemática: subrango2
              end;
      elemento = record
                   título: cadena30;
                   nombreAreaTemática: cadena30;
                   cantPáginas: integer;
                 end;
     lista = ^nodo;
     nodo = record
              datos: elemento;
              sig: lista;
            end;
     editorial = record
                   nombre: cadena30;
                   anioEdiciónMásAntiguo: subrango;
                   cantLibrosEditados: integer;
                   cantTotalVentas: integer;
                   detalle: lista;
                  end;

procedure ProcesarLibros (var e: editorial); { e --> 4
                                               elem -->  31  31  2 = 64
                                               l --> 31  31  2  2  2  2 = 70
                                               ME --> 4  64  70 = 138}
var l: libro;  elem: elemento;
begin
  e.nombre:= 'Planeta Libros';
  e.anioEdicionMasAntiguo:= 3000;
  e.cantLibrosEditados:= 0;
  e.cantTotalVentas:= 0;
  e.detalle:= nil;
  repeat
    LeerLibro (l);
    if (l.nombreEditorial = 'Planeta Libros')then
    begin
      e.cantLibrosEditados:= e.cantLibrosEditados  1;
      e.cantTotalVentas:= e.cantTotalVentas  l.cantVecesVendido;
      if (l.anioEdicion < e.anioEdicionMasAntiguo) then  e.anioEdicionMasAntiguo:= l.anioEdicion;
      if (l.cantVecesVendido > 250) then
      begin
        elem.titulo:= l.titulo;
        elem.nombreAreaTematica:= v [l.códAreaTemática];
        elem.cantPaginas:= l.cantPaginas;
        AgregarAdelante (e.detalle, elem)
      end;
   until (l.titulo = 'Relato de un náufrago');
end;

procedure Imprimir (e: editorial);
  procedure ImprimirLista (l: lista);
  begin
    while (l <> nil) do
    begin
      writeln (l^.datos.titulo)
      l:= l^.sig
    end;
  end;
begin
  writeln ('Nombre editorial: ', e.nombre);
  ImprimirLista (e.detalle)
end;
var edit: editorial;  v: vector;
begin
  CargarTabla (v); {se dispone}
  ProcesarLibros (edit, v);
  Imprimir (edit);
end.
