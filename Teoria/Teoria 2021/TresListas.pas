{ Leer nombre y edad de personas (hasta leer la edad -1) y armar 3 listas: agregando adelante, agregando atrás e 
insertando por edad.
Luego imprimir las tres listas.
Eliminar de la lista ordenada, la persona correspondiente a una edad que se lee. Imprimir la lista }


program listas;

type cadena20 = string[20];
     rango = -1..150;
     persona = record
                 nom: cadena20;
                 edad: rango;
               end;
     lista = ^nodo;
     nodo = record
              datos: persona;
              sig: lista;
            end;
            
procedure LeerPersona (var per: persona);
begin
  write ('Ingresar edad: ');
  readln (per.edad);
  if (per.edad <> -1) then begin
                              write ('Ingresar nombre: ');
  						      readln (per.nom);
  						   end;
end;

Procedure AgregarAdelante (var L:lista; per:persona);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=per;
  nue^.sig:=L;
  L:=nue;
End;
 						   
procedure AgregarAlFinal2 (var pri, ult: lista; per: persona); 
var  nue : lista;
begin 
 new (nue);
 nue^.datos:= per;
 nue^.sig := NIL;
 if pri <> Nil then 
                 ult^.sig := nue
               else 
                 pri := nue;
 ult := nue;
end;

Procedure InsertarElemento ( var pri: lista; per: persona);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := per;
  act := pri;
  {Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.edad < per.edad) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (act = pri)  then pri := nue   {el dato va al principio}
                  else ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

procedure ImprimirLista (l:lista);
begin
  while (l <> nil) do
  begin
     writeln (l^.datos.nom, '     ', l^.datos.edad);
     l:=l^.sig;
  end;
end;  

Procedure BorrarElemento (var pri:lista; edad: rango; var exito: boolean);
var ant, act: lista;
begin 
  exito := false;
  act := pri;
  {Recorro mientras no se termine la lista y no encuentre el elemento}
  while  (act <> NIL)  and (act^.datos.edad < edad) do begin
      ant := act;
      act := act^.sig
  end;   
  if (act <> NIL) and (act^.datos.edad = edad) then begin
												 	 exito := true; 
													 if (act = pri) then  pri := act^.sig
																    else  ant^.sig:= act^.sig;
                                                     dispose (act);
                                                    end;
 end;
 
var LAdelante, LAtras, LOrdenada, ult: lista; p: persona; edad: rango;
    exito: boolean;
begin
  LAdelante:= nil; LAtras:= nil; LOrdenada:= nil;
  LeerPersona (p);
  while (p.edad <> -1) do
  begin
    AgregarAdelante (LAdelante, p);
    AgregarAlFinal2 (LAtras, ult, p);
    InsertarElemento (LOrdenada, p);
    LeerPersona (p);
  end;
  writeln ('--------------- Lista adelante -------------------');
  ImprimirLista (LAdelante);
  writeln ('--------------- Lista atras -------------------');
  ImprimirLista (LAtras);
  writeln ('--------------- Lista ordenada -------------------');
  ImprimirLista (LOrdenada);
  writeln;
  write ('Ingresar edad a eliminar: ');
  readln (edad);
  BorrarElemento (LOrdenada, edad, exito);
  if (exito) then begin
                     writeln ('Lista ordenada sin edad ', edad);
                     ImprimirLista (LOrdenada);
                  end
             else writeln ('No se puede eliminar porque no existe una persona con edad ', edad);
end.
