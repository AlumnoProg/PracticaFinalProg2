unit Ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinarios, QueuesPointer,
  Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Arbol;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//CREAR ARBOL

procedure TForm1.Button1Click(Sender: TObject);
begin
  A.Crear(Cadena, A.MaxSizeTree);
  memo1.Lines.Add('Arbol creado con éxito');
end;


//------------------------------------------------------------------------------
//CARGAR ARBOL

Function SinEspacios(S: String): Boolean;
Var Posicion: Integer;

Begin

  Posicion:= 1;
  SinEspacios:= False;

  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);

  if(Posicion>Length(S))then SinEspacios:= True;

End;

Function ValidarCadena(NCadena: TipoElemento): Boolean;
Begin

  ValidarCadena:= False;
  if(NCadena.Clave<>'')and(SinEspacios(NCadena.Clave))
  and(Length(NCadena.Clave)<=MaxCadena)then
    ValidarCadena:= True;

End;

Function ValidarCarga(): Boolean;
var
  Valido: Boolean;
  Procedure Buscar(PA: PosicionArbol);
  var
    X: TipoElemento;
  begin

    if (not A.RamaNula(PA)) then begin
      Buscar(PA^.HI);
      X:= A.Recuperar(PA);
      if (not ValidarCadena(X)) then
        Valido:= False;
      Buscar(PA^.HD);
    end;

  end;
begin

  Valido:= True;
  Buscar(A.Root);
  if (Valido) then
    ValidarCarga:= True
  else
    ValidarCarga:= False;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (A.CargarArbol = OK) then begin
    if (ValidarCarga) then begin
      memo1.Lines.Add('Arbol cargado con éxito');
    end else begin
      memo1.Lines.Add('Error, ingrese valores permitidos');
      A.Crear(Cadena, A.MaxSizeTree);
    end;
  end else
    memo1.Lines.Add('Error, no se pudo cargar el arbol');
end;


//------------------------------------------------------------------------------
//VER ARBOL

Procedure MostrarArbol(Cartel: String;Var A: Arbol; memo1: Tmemo);
begin

  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' || ');
  Memo1.Lines.Add(' ');
  if (not A.EsVacio) then begin
    Memo1.Lines.Add('Raíz: ' + A.Root.Datos.ArmarString);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' ' + A.InOrden);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add('Altura: ' + A.Altura.ToString);
    Memo1.Lines.Add(' ');
  end else
    memo1.Lines.Add('Arbol vacío');

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarArbol('Arbol binario', A, Memo1);
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//NODOS TERMINALES/HOJAS

Procedure MostrarCola(Cartel: String; Var C: Cola; Memo1: TMemo);
Var
  TeC: TipoElemento;
  CAux: Cola;
Begin
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' ||');
  if(Not C.EsVacia)then begin
    CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
    Memo1.Lines.Add(' ');
    while(Not C.EsVacia)do begin
      TeC:= C.Recuperar;
      Memo1.Lines.Add(' Elemento : '+VarToStr(TeC.Clave));
      CAux.Encolar(TeC);
      C.DesEncolar;
    end;
    C.InterCambiar(CAux, False);
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -COLA VACIA-');
  end;
End;

Function esHoja(PA: PosicionArbol): Boolean;
begin
  esHoja:= False;
  if ((A.HijoIzquierdo(PA) = NULO) and (A.HijoDerecho(PA) = NULO)) then
    esHoja:= True;
end;

Function BuscarNodosTerminales(Var A: Arbol): Cola;
var
  C: Cola;
  Procedure BuscarPreOrden(Var C: Cola; PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (not A.RamaNula(PA)) then begin
      if (esHoja(PA)) then begin
        X:= A.Recuperar(PA);
        C.Encolar(X);
      end else begin
        BuscarPreOrden(C, PA^.HI);
        BuscarPreOrden(C, PA^.HD);
      end;
    end;
  end;
begin
  C.Crear(A.DatoDeLaClave, A.SizeTree);
  BuscarPreOrden(C, A.Root);
  Result:= C;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  NodosT: Cola;
begin
  if (not A.EsVacio) then begin
    NodosT:= BuscarNodosTerminales(A);
    memo1.Lines.Add(' ');
    if (not NodosT.EsVacia) then begin
      MostrarCola('Nodos Terminales:', NodosT, memo1);
      memo1.Lines.Add(' ');
    end else
      memo1.Lines.Add('No hay nodos terminales/hojas');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//NODOS INTERIORES

Function BuscarNodosInteriores(Var A: Arbol): Cola;
var
  C: Cola;
  Procedure BuscarPreOrden(Var C: Cola; PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (not A.RamaNula(PA)) then begin
      if (not esHoja(PA)) and (PA <> A.Root) then begin
        X:= A.Recuperar(PA);
        C.Encolar(X);
      end else begin
        BuscarPreOrden(C, PA^.HI);
        BuscarPreOrden(C, PA^.HD);
      end;
    end;
  end;
begin
  C.Crear(A.DatoDeLaClave, A.SizeTree);
  BuscarPreOrden(C, A.Root);
  Result:= C;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  NodosI: Cola;
begin
  if (not A.EsVacio) then begin
    NodosI:= BuscarNodosInteriores(A);
    memo1.Lines.Add(' ');
    if (not NodosI.EsVacia) then begin
      MostrarCola('Nodos interiores', NodosI, Memo1);
      memo1.Lines.Add(' ');
    end else
      memo1.Lines.Add('No hay nodos interiores');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//HOJAS AL MISMO NIVEL

Function NivelHojasIguales(Var C: Cola): Boolean;
var
  Nivel: Integer;
  Iguales: Boolean;
  Procedure VerNiveles(Var Nivel: Integer; PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (not A.RamaNula(PA)) then begin
      if (esHoja(PA)) then begin
        if (Nivel <> A.Nivel(PA)) then begin
          Iguales:= False;
        end else begin
          X:= A.Recuperar(PA);
          X.Valor1:= Nivel;
          C.Encolar(X);
        end;
      end else begin
        VerNiveles(Nivel, PA^.HI);
        VerNiveles(Nivel, PA^.HD);
      end;
    end;
  end;
begin
  Nivel:= A.Altura - 1;
  Iguales:= True;
  VerNiveles(Nivel, A.Root);
  Result:= Iguales;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  CI: Cola;
begin
  if (not A.EsVacio) then begin
    CI.Crear(A.DatoDeLaClave, A.SizeTree);
    memo1.Lines.Add(' ');
    if (NivelHojasIguales(CI)) then begin
      memo1.Lines.Add(' ');
      MostrarCola('Hojas al mismo nivel', CI, memo1);
    end else
      memo1.Lines.Add('Las hojas estan en diferentes niveles');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//Hojas iterativas

Function esHojaIT(Dato: TipoElemento): Boolean;
begin
  esHojaIT:= False;
  if (A.HijoIzquierdo(Dato.Valor2) = NULO) and (A.HijoDerecho(Dato.Valor2) = NULO) then
    esHojaIT:= True;
end;

Function BuscarNodosTerminalesIterativo(Var A: Arbol): Cola;
var
  C, CR: Cola;
  X: TipoElemento;
  PA: PosicionArbol;
begin
  C.Crear(A.DatoDeLaClave, A.SizeTree);
  CR.Crear(A.DatoDeLaClave, A.SizeTree);
  PA:= A.Root;
  while (PA <> NULO) or (not C.EsVacia) do begin
    while (PA <> NULO) do begin
      X:= A.Recuperar(PA);
      X.Valor2:= PA;
      C.Encolar(X);
      PA:= A.HijoIzquierdo(X.valor2);
    end;
    if (PA = NULO) and (not C.EsVacia) then begin
      X:= C.Recuperar;
      if (esHojaIT(X)) then
        CR.Encolar(X);
      C.DesEncolar;
      PA:= A.HijoDerecho(X.Valor2);
    end;
  end;
  Result:= CR;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  NodosT: Cola;
begin
  if (not A.EsVacio) then begin
    NodosT:= BuscarNodosTerminalesIterativo(A);
    memo1.Lines.Add(' ');
    if (not NodosT.EsVacia) then begin
      MostrarCola('Nodos Terminales:', NodosT, memo1);
      memo1.Lines.Add(' ');
    end else
      memo1.Lines.Add('No hay nodos terminales/hojas');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//Nodos interiores

Function BuscarNodosInterioresIterativo(var A: Arbol): Cola;
var
  C, CR: Cola;
  X: TipoElemento;
  PA: PosicionArbol;
begin
  C.Crear(A.DatoDeLaClave, A.SizeTree);
  CR.Crear(A.DatoDeLaClave, A.SizeTree);
  PA:= A.Root;
  while (PA <> NULO) or (not C.EsVacia) do begin
    while (PA <> NULO) do begin
      X:= A.Recuperar(PA);
      X.Valor2:= PA;
      C.Encolar(X);
      PA:= A.HijoIzquierdo(X.Valor2);
    end;
    if (PA = NULO) and (not C.EsVacia) then begin
      X:= C.Recuperar;
      if (not esHojaIT(X)) and (X.Valor2 <> A.Root) then
        CR.Encolar(X);
      C.DesEncolar;
      PA:= A.HijoDerecho(X.Valor2);
    end;
  end;
  Result:= CR;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  NodosI: Cola;
begin
  if (not A.EsVacio) then begin
    NodosI:= BuscarNodosInterioresIterativo(A);
    memo1.Lines.Add(' ');
    if (not NodosI.EsVacia) then begin
      MostrarCola('Nodos interiores', NodosI, Memo1);
      memo1.Lines.Add(' ');
    end else
      memo1.Lines.Add('No hay nodos interiores');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//Hojas mismo nivel

Function NivelHojasIgualesIT(var C: Cola): Boolean;
var
  Nivel: Integer;
  X: TipoElemento;
  Iguales: Boolean;
  PA: PosicionArbol;
  CAux: Cola;
begin
  Nivel:= A.Altura - 1;
  PA:= A.Root;
  Iguales:= True;
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  while (PA <> NULO) or (not CAux.EsVacia) do begin
    while (PA <> NULO) do begin
      X:= A.Recuperar(PA);
      X.Valor2:= PA;
      CAux.Encolar(X);
      PA:= A.HijoIzquierdo(X.Valor2);
    end;
    if (PA = NULO) and (not CAux.EsVacia) then begin
      X:= CAux.Recuperar;
      if (esHojaIT(X)) then begin
        if (Nivel <> a.Nivel(X.Valor2)) then
          Iguales:= False
        else
          C.Encolar(X);
      end;
      CAux.DesEncolar;
      PA:= A.HijoDerecho(X.Valor2);
    end;
  end;
  Result:= Iguales;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  CI: Cola;
begin
  if (not A.EsVacio) then begin
    CI.Crear(A.DatoDeLaClave, A.SizeTree);
    memo1.Lines.Add(' ');
    if (NivelHojasIgualesIT(CI)) then begin
      memo1.Lines.Add(' ');
      MostrarCola('Hojas al mismo nivel', CI, memo1);
    end else
      memo1.Lines.Add('Las hojas estan en diferentes niveles');
  end else
    memo1.Lines.Add('Arbol vacío');
end;

end.
