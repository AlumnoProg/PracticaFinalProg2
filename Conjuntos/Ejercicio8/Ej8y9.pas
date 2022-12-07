unit Ej8y9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ConjuntosAVL, Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxConjunto = 2000;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button6: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CA, CB: Conjunto;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
//DEFINIR CONJUNTOS

Function ValidarLongitud(AValidar: String; Var Validado: Integer): Boolean;
Begin

  ValidarLongitud:= False;
  if(TryStrToInt(AValidar, Validado))
  and((1<=Validado)and(Validado<=MaxConjunto))then
    ValidarLongitud:= True;

End;

procedure TForm1.Button1Click(Sender: TObject);
var
  Longitud: Integer;
begin
  if (ValidarLongitud(Edit1.Text, Longitud)) then begin
    CA.Crear(Cadena, Longitud);
    CB.Crear(Cadena, Longitud);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -CONJUNTOS SETEADOS/RESETEADOS- ');
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' Ingrese valor entero entre 1 y '+MaxConjunto.ToString+'. ');
  end;
end;


//------------------------------------------------------------------------------
//CARGAR CONJUNTO A

Function EsSinEspacios(S: String): Boolean;
Var Posicion: Integer;
Begin

  Posicion:= 1;
  EsSinEspacios:= False;
  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);
  if(Posicion>Length(S))then EsSinEspacios:= True;

End;

Function ValidarCadena(NCadena: String; Var Validado: String): Boolean;
Begin

  ValidarCadena:= False;

  if(Ncadena<>'')and(EsSinEspacios(NCadena)) and((1<=Length(NCadena))and(Length(NCadena)<=MaxCadena))then begin
    Validado:= NCadena;
    ValidarCadena:= True;

  end;

End;

Function CargarElemento(AListar: String; Var C: Conjunto): Boolean;
Var TeL: TipoElemento;
    ValidadoN: LongInt;
    ValidadoC: String;
Begin

  CargarElemento:= False;
  if(ValidarCadena(AListar, ValidadoC))then begin
    TeL.Clave:= ValidadoC;
    if(C.Agregar(TeL)<>ClaveDuplicada)then
        CargarElemento:= True;
  end;

End;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if(Not CA.EsLLeno)then begin
    if(CargarElemento(Edit2.Text, CA))then
      memo1.Lines.Add(edit2.Text + ' cargado en el conjunto A')
    else begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -INGRESE VALOR PERMITIDO- ');
    end;
  end else
    Memo1.Lines.Add(' -CONJUNTO A LLENO- ');
  edit2.Clear;
end;


//------------------------------------------------------------------------------
//CARGAR CONJUNTO B

procedure TForm1.Button3Click(Sender: TObject);
begin
  if(Not CB.EsLLeno)then begin
    if(CargarElemento(Edit3.Text, CB))then
      memo1.Lines.Add(edit3.Text + ' cargado en el conjunto B')
    else begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -INGRESE VALOR PERMITIDO- ');
    end;
  end else
    Memo1.Lines.Add(' -CONJUNTO B LLENO- ');
  edit3.Clear;
end;


//------------------------------------------------------------------------------
//VER CONJUNTOS

Procedure MostrarConjunto(Cartel: String; C: Conjunto; Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' ||');
  if(Not C.EsVacio)then begin
    Memo1.Lines.Add(C.RetornarClaves);
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -CONJUNTO VACIO- ');
  end;

End;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarConjunto('Conjunto A', CA, Memo1);
  memo1.Lines.Add(' ');
  MostrarConjunto('Conjunto B', CB, Memo1);
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//UNION FUERA TAD

Function Union (Var C1, C2: Conjunto): Conjunto;
var
  CR: Conjunto;
  X: TipoElemento;
  Posicion, MaxConjuntos: Integer;
begin
  CR.Crear(C1.DatoDeLaClave, C1.MaxSizeSet);
  MaxConjuntos:= C1.CantidadElementos;
  for Posicion := 1 to MaxConjuntos do begin
    X:= C1.Recuperar(Posicion);
    CR.Agregar(X);
  end;
  MaxConjuntos:= C2.CantidadElementos;
  for Posicion := 1 to MaxConjuntos do begin
    X:= C2.Recuperar(Posicion);
    CR.Agregar(X);
  end;
  Result:= CR;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  CUnion: Conjunto;
begin
  CUnion:= Union(CA, CB);
  memo1.Lines.Add(' ');
  MostrarConjunto('Union fuera TAD: ', CUnion, memo1);
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//Interseccion FUERA TAD

Function Buscar(Elemento: TipoElemento; C: Conjunto): Boolean;
var
  X: TipoElemento;
  Posicion, MaxConjuntos: Integer;
  Igual: Boolean;
begin
  Posicion:= 1;
  MaxConjuntos:= C.CantidadElementos;
  Igual:= False;
  while ((Posicion <= MaxConjuntos) and (not Igual)) do begin
    X:= C.Recuperar(Posicion);
    if (Elemento.Clave = X.Clave) then
      Igual:= True
    else
      Inc(Posicion);
  end;
  Result:= Igual;
end;

Function Interseccion(Var C1, C2: Conjunto): Conjunto;
var
  CR: Conjunto;
  X: TipoElemento;
  Posicion, MaxConjuntos: Integer;
begin
  CR.Crear(C1.DatoDeLaClave, C1.SizeSet);
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    MaxConjuntos:= C1.CantidadElementos;
    for Posicion := 1 to MaxConjuntos do begin
      X:= C1.Recuperar(Posicion);
      if (Buscar(X, C2)) then
        CR.Agregar(X);
    end;
  end;
  Result:= CR;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  CInterseccion: Conjunto;
begin
  CInterseccion:= Interseccion(CA, CB);
  MostrarConjunto('Conjunto interseccion', CInterseccion, Memo1);
  memo1.Lines.Add(' ');
end;

end.
