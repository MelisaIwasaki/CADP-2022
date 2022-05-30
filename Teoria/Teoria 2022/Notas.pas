//Calcular un maximo en una lista
//Precondicion: la lista esta ordenada de mayor a menor

if(L<>nil) do begin
  max:= L^.dato;

//Precondicion: la lista esta ordenada de menor a mayor

function maximo(L:lista):integer;
var
  max:integer;
  ant:lista;
begin
  ant:= L;
  while(L<>nil)do begin
    ant:= L;
    L:= L^.sig;
  end;
  if(ant<>nil)then
    maximo:= ant^.dato
  else
    maximo:= -9999;
end;




for i:= 1 to 1500 do
  v[i]:= abs(random(100));
 
 
 
 
{DE LA CLESE DE TEORIA}

program prueba;  //Parece que en GDB no tiene 255 caracteres.
type
  ascii = array[0..255] of char;
var
  i:integer;
  v:ascii;
begin
  for i:= 0 to 255 do 
    v[i]:= chr(i);
  
  for i:= 0 to 255 do
    writeln(v[i]);
end.

program prueba;  
type
  ascii = array[0..255] of char;
var
  j,i:integer;
  v:ascii;
begin
  for i:= 0 to 255 do 
    v[i]:= chr(i);
  
  for j:= 1 to 4 do 
  begin
    for i:= 1 to 10 do
      write(v[i + 65] , ' -');
    writeln('');
  end;
end.
