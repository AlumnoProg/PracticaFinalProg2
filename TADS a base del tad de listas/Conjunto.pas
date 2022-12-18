unit Conjunto;

interface

uses ListPointer, Tipos;

Type
 Conjunto = Object
 Private
 Items: Lista;
 Public
      Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
      Function EsVacio(): Boolean;
      Function EsLLeno(): Boolean;
      Function Agregar(X:TipoElemento): Errores;
      Function Borrar(X:TipoElemento):Errores;
      Function BorrarPosicion(PLogica: Integer):Errores;
      Function Recuperar(PLogica: Integer): TipoElemento;
      Function RetornarClaves(): String;
      // operaciones tipicas de conjuntos
      Function Interseccion(Var C: Conjunto): Conjunto;
      Function Union(Var C: Conjunto): Conjunto;
      Function Diferencia(Var C: Conjunto): Conjunto;
      Function Pertenece(X:TipoElemento): Boolean;
      // operaciones generales
      Function LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Errores;
      Function CantidadElementos: LongInt;
      Function DatoDeLaClave: TipoDatosClave;
      Function SizeSet(): LongInt;
      Function MaxSizeSet(): LongInt;
      // Ordenar
      Procedure Sort();
 End;

implementation

Function Conjunto.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
Begin

  Crear := items.Crear(avTipoClave, alSize);

End;

// control de conjunto vacio
Function conjunto.EsVacio(): Boolean;
Begin
  EsVacio := items.EsVacia;
End;

// control de conjunto lleno
Function conjunto.EsLLeno() : Boolean;
Begin
  EsLLeno := items.EsLLena;
End;

Function Conjunto.Agregar(X: TipoElemento): Errores;
begin
  if (Items.Buscar(X) <> NULO) then begin
    Agregar:= ClaveDuplicada;
    exit;
  end;
  Agregar:= Items.Agregar(X);
end;

Function Conjunto.Borrar(X:TipoElemento):Errores;
begin
  Borrar:= Items.Eliminar(X);
end;

Function Conjunto.BorrarPosicion(PLogica: Integer):Errores;
var
  Q: PosicionLista;
begin
  Q:= Items.Ordinal(PLogica);
  BorrarPosicion:= Items.Eliminar(Q);
end;

Function Recuperar(PLogica: Integer): TipoElemento;
var
  Q: PosicionLista;
  X: TipoElemento;
begin
  Recuperar:= X.TipoElementoVacio;
  Q:= Items.Ordinal(PLogica);
  Recuperar:= Items.Recuperar(Q);
end;

Function Conjunto.RetornarClaves(): String;
begin
  RetornarClaves := items.RetornarClaves;
end;

Function Conjunto.Interseccion(Var C: Conjunto): Conjunto;
var
  Q: PosicionLista;
  CI: Conjunto;
  X: TipoElemento;
begin
  CI.Crear(DatoDeLaClave, SizeSet);
  if (CI.esVacio) or (C.esVacio) then
    Interseccion:= CI
  else begin
    Q:= Items.Comienzo;
    while (Q <> NULO) do begin
      X:= Items.Recuperar(Q);
      if (C.Pertenece(X)) then begin
        CI.Agregar(X);
      end;
      Q:= Items.Siguiente(Q);
    end;
  end;
  Interseccion:= CI;
end;

Function Conjunto.Union(Var C: Conjunto): Conjunto;
var
  Q: PosicionLista;
  X: TipoElemento;
  CU: Conjunto;
begin
  CU.Crear(DatoDeLaClave, (Items.SizeList + C.SizeSet));
  Q:= Items.Comienzo;
  while (Q <> NULO) do begin
    X:= Items.Recuperar(Q);
    CU.Agregar(X);
    Q:= Items.Siguiente(Q);
  end;
  Q:= C.Items.Comienzo;
  while (Q <> NULO) do begin
    X:= C.Items.Recuperar(Q);
    CU.Agregar(X);
    Q:= C.Items.Siguiente(Q);
  end;
  Union:= CU;
end;

Function conjunto.Diferencia(Var C: Conjunto): Conjunto;
Var
  Q : PosicionLista;
  CD: Conjunto;
  X : TipoElemento;
begin
  CD.Crear(DatoDeLaClave, SizeSet);
  if (Items.esVacia) then
    Diferencia:= CD
  else begin
    Q:= Items.Comienzo;
    while (Q <> NULO) do begin
      X:= Items.Recuperar(Q);
      if (not C.Pertenece(X)) then
        CD.Agregar(X);
      Q:= Items.Siguiente(Q);
    end;
  end;
  Diferencia:= CD;
end;

end.
