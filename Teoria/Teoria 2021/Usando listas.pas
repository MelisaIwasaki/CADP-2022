program usandoListas;

type cadena50 = string [50];
     persona = record
                nom: cadena50;
                edad: integer
               end;
     lista = ^nodo;
     nodo = record
         datos: persona;
         sig : lista;
        end; 


procedure LeerPersona (var per:persona);
begin
  write ('Ingrese edad: '); readln (per.edad);
  if (per.edad <> 0) then begin
  write ('Ingrese nombre: '); readln (per.nom);
 end;
 end;

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

Procedure AgregarAdelante (var L:lista; per:persona);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=per;
  nue^.sig:=L;
  L:=nue;
End;

Procedure InsertarElemento ( var L: lista; per: persona);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := per;
  act:= L;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.nom < per.nom) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (act = L)  then L := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   writeln (pri^.datos.nom, '  ', pri^.datos.edad) ;
   pri:= pri^.sig
 end
end;

Procedure BorrarElemento (var L:lista; nom:cadena50; var exito:boolean);
Var act, ant: lista; 
Begin
  exito:= false;
  act:= L;
  while (act <> nil) and (act^.datos.nom <> nom) do begin
    ant:= act;
    act:= act^.sig;
  end;
  if (act <> nil) then begin
                         exito:= true;
                         if (L = act) then L:= L^.sig { L:= act^.sig }
                                      else ant^.sig:= act^.sig; 
                         dispose (act)
                        end;
end;

Procedure BorrarElemento2 (var L:lista; nom:cadena50; var exito:boolean);
Var act, ant: lista; 
Begin
  exito:= false;
  act:= L;
  while (act <> nil) and (act^.datos.nom < nom) do begin
    ant:= act;
    act:= act^.sig;
  end;
  if (act <> nil) and (act^.datos.nom = nom)
                   then begin
                         exito:= true;
                         if (L = act) then L:= L^.sig { L:= act^.sig }
                                      else ant^.sig:= act^.sig; 
                         dispose (act)
                        end;
end;
var lAdelante, lAtras, lOrdenada, ult: lista;
    p: persona; nomABorrar: cadena50; exito: boolean;

Begin {prog. ppal}
  lAdelante:=nil; lAtras:= nil; lOrdenada:= nil;
  leerPersona (p);
  While (p.edad <> 0) do begin
     AgregarAlFinal2 (lAtras, ult, p);
     AgregarAdelante (lAdelante, p);
     InsertarElemento (lOrdenada, p);
     leerPersona (p);
  End;
  writeln ('--- Lista agregando al final ---');
  ImprimirLista (lAtras);
  writeln;
  writeln ('--- Lista agregando adelante ---');
  ImprimirLista (lAdelante);
  writeln;
  writeln ('--- Lista ordenada ---');
  ImprimirLista (lOrdenada);
  write ('Ingrese nombre a borrar: '); readln (nomABorrar);
  BorrarElemento(LAdelante, nomABorrar, exito);
  if exito 
  then begin
         writeln ('Se elimino');
         writeln ('--- Lista agregando adelante con elemento eliminado ---');
         ImprimirLista (lAdelante);
       end
   Else writeln ('No existe'); 
   BorrarElemento(LAtras, nomABorrar, exito);
  if exito 
  then begin
         writeln ('Se elimino');
         writeln ('--- Lista agregando atras con elemento eliminado ---');
         ImprimirLista (lAtras);
       end
   Else writeln ('No existe'); 
   BorrarElemento2(LOrdenada, nomABorrar, exito);
   if exito 
   then begin
         writeln ('Se elimino');
         writeln ('--- Lista ordenada con elemento eliminado ---');
         ImprimirLista (lOrdenada);
       end
   Else writeln ('No existe'); 

end.
