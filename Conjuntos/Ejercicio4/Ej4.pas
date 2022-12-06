unit Ej4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ConjuntosAVL, Vcl.StdCtrls, ListPointer;

Const
  MaxConjunto = 26;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C: Conjunto;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
//CREAR CONJUNTO

Function ValidarLongitud(Edit: String;Var Longitud: Integer): Boolean;
begin

  ValidarLongitud:= False;
  if (TryStrToInt(Edit, Longitud)) and (Longitud >= 1) and (Longitud <= MaxConjunto) then
    ValidarLongitud:= True;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Longitud: Integer;
begin
  if (ValidarLongitud(edit1.Text, Longitud)) then begin
    C.Crear(Cadena, Longitud);
    memo1.Lines.Add('Conjunto creado con �xito');
  end else
    memo1.Lines.Add('Error, ingrese un numero entero como logitud, m�ximo: 26');
end;


//------------------------------------------------------------------------------
//CARGAR CONJUNTO

Function sinEspacios(Edit: String): Boolean;
var
  Posicion: Integer;
begin

  Posicion:= 1;
  sinEspacios:= False;
  while (Posicion <= Length(Edit)) and (Edit[Posicion] <> ' ') do
    Inc(Posicion);
  if (Posicion > Length(Edit)) then
    sinEspacios:= True;

end;

Function esLetra(Edit: String): Boolean;
begin

  esLetra:= False;
  if ((Edit >= 'a') and (Edit <= 'z')) or ((Edit >= 'A') and (Edit <= 'Z')) then
    esLetra:=  True;

end;

Function ValidarCaracter(Edit: String): Boolean;
begin

  ValidarCaracter:= False;
  if (Edit <> '') and (esLetra(Edit)) and (sinEspacios(Edit)) and (Length(Edit) = 1) then
    ValidarCaracter:= True;

end;

Function CargarElementos(Edit: String): Boolean;
var
  X: TipoElemento;
begin

  CargarElementos:= False;
  if (ValidarCaracter(Edit)) then begin
    X.Clave:= Edit;
    if (C.Agregar(X) <> ClaveDuplicada) then
      CargarElementos:= True;
  end;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (not C.EsLLeno) then begin
    if (CargarElementos(edit2.Text)) then begin
      memo1.Lines.Add(edit2.Text + ' cargado con �xito en el conjunto');
    end else
      memo1.Lines.Add('Error, ingrese valores correctos');
  end else
    memo1.Lines.Add('Conjunto lleno');
  edit2.Clear;
end;


//------------------------------------------------------------------------------
//CARGAR CONJUNTO ALEATORIO

Function CargaAleatoria(): Errores;
var
  X: TipoElemento;
begin

  C.Crear(C.DatoDeLaClave, C.SizeSet);
  Randomize;
  while (not C.EsLLeno) do begin
    X.Clave:= char(65 + Random((90 - 65) + 1));
    while (C.Pertenece(X)) do
      X.Clave:= char(65 + Random((90 - 65) + 1));
    C.Agregar(X);
  end;
  CargaAleatoria:= OK;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (CargaAleatoria = OK) then begin
    memo1.Lines.Add('Conjunto cargado con exito');
  end else
    memo1.Lines.Add('Error, no se pudo cargar el conjunto');
end;


//------------------------------------------------------------------------------
//MOSTRAR CONJUNTO

Procedure MostrarConjunto(Cartel: String; C: Conjunto; memo1: Tmemo);
begin

  memo1.Lines.Add(' ');
  memo1.Lines.Add('|| ' + Cartel + ' ||');
  memo1.Lines.Add(' ');
  if (not C.EsVacio) then begin
    memo1.Lines.Add(C.RetornarClaves);
  end else
    memo1.Lines.Add('Conjunto vac�o');

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarConjunto('Conjunto', C, Memo1);
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//SEPARAR VOCALES Y CONJUNTOS

Procedure SepararVocales(Var CC, CV: Conjunto);
var
  X: TipoElemento;
begin
  CC:= CC.Union(C);
  X.Clave:= 'A';
  if (CC.Pertenece(X)) then begin
    CV.Agregar(X);
    CC.Borrar(X);
  end;
  X.Clave:= 'E';
  if (CC.Pertenece(X)) then begin
    CV.Agregar(X);
    CC.Borrar(X);
  end;
  X.Clave:= 'I';
  if (CC.Pertenece(X)) then begin
    CV.Agregar(X);
    CC.Borrar(X);
  end;
  X.Clave:= 'O';
  if (CC.Pertenece(X)) then begin
    CV.Agregar(X);
    CC.Borrar(X);
  end;
  X.Clave:= 'U';
  if (CC.Pertenece(X)) then begin
    CV.Agregar(X);
    CC.Borrar(X);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  CV, CC: Conjunto;
begin
  if (not C.EsVacio) then begin
    CC.Crear(C.DatoDeLaClave, C.SizeSet);
    CV.Crear(C.DatoDeLaClave, C.SizeSet);
    SepararVocales(CV, CC);
    MostrarConjunto('Vocales: ', CV, memo1);
    MostrarConjunto('Consonsantes: ', CC, memo1);
  end else
    memo1.Lines.Add('Conjunto vac�o');
end;

end.
