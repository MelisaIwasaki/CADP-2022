de Asignatura 07 - CADP a Todos los participantes:

program registros;
type
   lugar = record
            ciudad : string;
            provincia : string;
            pais: string;
        end;    
   termo = record
            capacidad : real;
            marca : string;
            color : string;
            fueVendidoLP : boolean;
            lugarDeFabricacion : lugar;
            lugarDeVenta : lugar;
         end;
    procedure leerLugar(var L :lugar);
    begin
       readln(L.ciudad);
       readln(L.provincia);
       readln(L.pais);
    end;
    
    procedure leerTermo(var t  : termo);
    begin
       readln(t.color);
       readln(t.capacidad);
       readln(t.marca);
       leerLugar(t.lugarDeVenta);
    end;    
    
    function fueVendidoEnLP(str : string) : boolean;
    begin
        fueVendidoEnLP := (str = 'La Plata');
    end;
    function fueVendidoEnLP2(unLugar : lugar) : boolean;
    begin
        fueVendidoEnLP2 := (unLugar.ciudad = 'La Plata');
    end;    
    function fueVendidoEnLP3(unTermo : termo) : boolean;
    begin
        fueVendidoEnLP3 := (unTermo.lugarDeVenta.ciudad = 'La Plata');
    end;
        
    var
      t1, t2 : termo;
      unLugar : lugar;


begin
       leerTermo(t1);
       leerTermo(t2);
       
       leerLugar(t1.lugarDeFabricacion);
       leerLugar(t2.lugarDeFabricacion);
       
       if (t1.lugarDeVenta.ciudad = 'La Plata') then 
         t1.fueVendidoLP := true;
         
       t1.fueVendidoLP:= fueVendidoEnLP(t1.lugarDeVenta.ciudad);
       t2.fueVendidoLP:= fueVendidoEnLP2(t2.lugarDeVenta);
       t1.fueVendidoLP := fueVendidoEnLP3(t1); 
end.         
