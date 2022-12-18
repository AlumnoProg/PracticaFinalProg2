unit Pila;

interface

uses ListPointer, Tipos;

Type
 Pila = Object
 Private
 Items: Lista;
 Public
     function crear(dato:TipoDatosClave; size:Longint):Errores;
     function esVacia():Boolean;
     function esLlena(): Boolean;
     function Apilar(elemento:TipoElemento):Errores;
     Function Desapilar(): Errores;
     function Recuperar():TipoElemento;
     Function RetornarClaves(): String;
     Function InterCambiar(Var PAux: Pila; bCrearVacia: Boolean): LongInt;
     Function LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Errores;
     Function Tope():PosicionPila;
     Function DatoDeLaClave():TipoDatosClave;
     Function SizeStack(): LongInt;
     Function MaxSizeStack(): LongInt;
 End;

implementation

  Function Pila.Crear(tipo: TipoDatosClave; Size: LongInt): Errores;
  begin
    Crear:= items.Crear(tipo, Size);
  end;

  Function Pila.esVacia(): Boolean;
  begin
    esVacia:= items.esVacia;
  end;

  Function Pila.esLlena(): Boolean;
  begin
    esLlena:= items.esLlena;
  end;

  function Pila.Apilar(elemento:TipoElemento):Errores;
  begin
    Apilar:= items.Agregar(elemento);
  end;

  Function Pila.Desapilar(): Errores;
  begin
    Desapilar:= Items.Eliminar(Items.Fin);
  end;

  Function Pila.Recuperar():TipoElemento;
  begin
    Recuperar:= Items.Recuperar(Items.Fin);
  end;

  Function Pila.RetornarClaves(): String;
  begin
    RetornarClaves:= Items.RetornarClaves;
  end;

  Function Pila.InterCambiar(Var PAux: Pila; bCrearVacia: Boolean): LongInt;
  var
    i, elementos: LongInt;
  begin
    elementos:= 0;
    if (bCrearVacia) then
      Crear(PAux.Items.DatoDeLaClave, PAux.Items.SizeList);
    for i := 1 to PAux.Items.SizeList do begin
      if (Apilar(PAux.Recuperar) = OK) then
        Inc(elementos);
    end;
    InterCambiar:= elementos;
  end;

  Function Pila.LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Errores;
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

  Function Pila.Tope():PosicionPila;
  begin
    Tope:= Items.Fin;
  end;

  Function Pila.DatoDeLaClave():TipoDatosClave;
  begin
    DatoDeLaClave:= Items.DatoDeLaClave;
  end;

  Function Pila.SizeStack(): LongInt;
  begin
    SizeStack:= Items.SizeList;
  end;

  Function Pila.MaxSizeStack(): LongInt;
  begin
    MaxSizeStack:= Items.MaxSizeList;
  end;

end.
