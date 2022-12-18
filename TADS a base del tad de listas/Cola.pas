unit Cola;

interface

uses ListPointer, Tipos;

Type
 Cola = Object
 Private
 Items: Lista;
 Public
     function crear(dato:TipoDatosClave; size:Longint):Errores;
     function esVacia():Boolean;
     function esLlena(): Boolean;
     function Encolar(elemento:TipoElemento):Errores;
     Function Desencolar();
     function Recuperar():TipoElemento;
     Function RetornarClaves(): String;
     Function InterCambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
     Function LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Errores;
     Function Frente(): PosicionCola;
     Function Final():PosicionCola;
     Function DatoDeLaClave():TipoDatosClave;
     Function SizeQueue(): LongInt;
     Function MaxSizeQueue(): LongInt;
 End;

implementation

  Function Cola.Crear(dato: TipoDatosClave; Size: LongInt): Errores;
  begin
    Crear:= Items.Crear(dato, Size);
  end;

  Function Cola.esVacia(): Boolean;
  begin
    esVacia:= items.esVacia;
  end;

  Function Cola.esLlena(): Boolean;
  begin
    esLlena:= items.esLlena;
  end;

  Function Cola.Encolar(elemento: TipoElemento): Errores;
  begin
    Encolar:= items.Agregar(elemento);
  end;

  Function Cola.Desencolar(): Errores;
  begin
    Desencolar:= Items.Eliminar(Items.Comienzo);
  end;

  Function Cola.Recuperar(): TipoElemento;
  begin
    Recuperar:= Items.Recuperar(Items.Comienzo);
  end;

  Function Cola.RetornarClaves(): String;
  begin
    RetornarClaves:= Items.RetornarClaves;
  end;

  Function Cola.Intercambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
  var
    Contador: LongInt;
  begin
    Contador:= 0;
    if (bCrearVacia) then
      Crear(CAux.DatoDeLaClave, CAux.SizeQueue);
    while (not CAux.esVacia) do begin
      if (Encolar(CAux.Recuperar) = OK) then
        Inc(Contador);
      CAux.Desencolar;
    end;
    InterCambiar:= Contador;
  end;

  Function Cola.LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Errores;
   Var
    X: TipoElemento;
  Begin
    Randomize;
    TDatoDeLaClave := Numero;
    If Crear(TDatoDeLaClave, alSize) <> OK Then Begin
      LlenarClavesRandom := CError;
      Exit;
    end;
    X.Inicializar(TDatoDeLaClave,'');
    While Not EsLLena() Do Begin
      X.Clave := RangoDesde + Random(RangoHasta);
      Apilar(X);
    end;
    LlenarClavesRandom := OK
  end;

  Function Cola.Frente(): PosicionCola;
  begin
    Frente:= Items.Comiezo;
  end;

  Function Cola.Final():PosicionCola;
  begin
    Final:= Items.Fin;
  end;

end.
