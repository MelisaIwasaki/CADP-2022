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
  
