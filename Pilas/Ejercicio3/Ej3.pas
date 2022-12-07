unit Ej3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, StackArray, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P1, P2, PAux:Pila;
  Tamanio:String;
  Cant1, Cant2:Integer;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//boton que define el tamaño de las pilas

Function SinEspacios(S: String): Boolean;
Var Posicion: Integer;
Begin
  Posicion:= 1;
  SinEspacios:= False;
  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);
  if(Posicion>Length(S))then SinEspacios:= True;
End;

function ValidarTamanio (S:String):Boolean;
var
  i:integer;
  Resultado: Boolean;
begin
    if (TryStrToInt(S, i) = True) then begin
      if (StrToInt(S)>= 0) and (StrToInt(S) <= 2000) then
        Resultado:=True
      else
        Resultado:=False;
    end
    else
      Resultado:=False;
    ValidarTamanio:=Resultado;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Tamanio:=edit1.text;
  if (SinEspacios(Tamanio)=True) then begin
    if ValidarTamanio(tamanio) = true then begin
      Cant1:=0;
      Cant2:=0;
      P1.Crear(cadena, StrToInt(tamanio));
      P2.Crear(cadena, StrToInt(tamanio));
      PAux.Crear(cadena, (StrToInt(tamanio)*2));
      memo1.Lines.Add('Pilas creadas con éxito');
    end else
      Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
  end else
    Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
end;


//------------------------------------------------------------------------------
//boton de cargar pila 1

Function ValidarEdit(Edit: String): Boolean;
begin

  if (Edit = '') or (not SinEspacios(Edit)) or (Length(Edit) > 255) then
    ValidarEdit:= False
  else
    ValidarEdit:= True;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dato: String;
  X: TipoElemento;
begin

  Dato:= edit2.Text;
  if (not P1.EsLlena) then begin
    if (ValidarEdit(Dato)) then begin
      X.Clave:= Dato;
      P1.Apilar(X);
      Inc(Cant1);
      memo1.Lines.Add(Dato + ' cargado exitosamente en la pila 1');
    end else
      memo1.Lines.Add('Error, ingrese datos permitidos');
  end else
    memo1.Lines.Add('Pila 1 llena');
end;


//------------------------------------------------------------------------------
//boton de cargar pila 2

procedure TForm1.Button3Click(Sender: TObject);
var
  Dato: String;
  X: TipoElemento;
begin

  Dato:= edit3.Text;
  if (not P2.EsLlena) then begin
    if (ValidarEdit(Dato)) then begin
      X.Clave:= Dato;
      P2.Apilar(X);
      Inc(Cant2);
      memo1.Lines.Add(Dato + ' cargado exitosamente en la pila 2');
    end else
      memo1.Lines.Add('Error, ingrese datos permitidos');
  end else
    memo1.Lines.Add('Pila 2 llena');
end;


//------------------------------------------------------------------------------
//Verificar si las pilas son iguales

Function SonIguales2(): Boolean;
var
  X1, X2: TipoElemento;
begin
  while (not PAux.EsVacia) do begin
    X1:= PAux.Recuperar;
    X2:= PAux.Recuperar;
    P1.Apilar(X1);
    P2.Apilar(X2);
    PAux.DesApilar;
  end;
end;

Function SonIguales(): Boolean;
var
  X1, X2: TipoElemento;
  Seguir: Boolean;
begin
  Seguir:= True;
  while (not P1.EsVacia) and (Seguir) do begin
    X1:= P1.Recuperar;
    X2:= P2.Recuperar;
    if (X1.Clave = X2.Clave) then begin
      PAux.Apilar(X1);
      P1.DesApilar;
      P2.DesApilar;
    end else
      Seguir:= False;
  end;
  SonIguales2();
  Result:= Seguir;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not P1.EsVacia) and (not P2.EsVacia) then begin
    if (Cant1 = Cant2) then begin
      if (SonIguales()) then begin
        memo1.Lines.Add('Las pilas son iguales');
      end else
        memo1.Lines.Add('Las pilas no son iguales');
    end else
      memo1.Lines.Add('Las pilas tienen una cantidad de elementos distinta por lo tanto no son iguales');
  end
    else begin
    if (P1.EsVacia=true)and (P2.EsVacia=true) then begin
      memo1.Lines.Add('ambas Pilas están vacías')
    end
    else
      if P1.EsVacia=true then
        memo1.Lines.Add('Pila 1 está vacía, por lo que no son iguales')
      else
        if P2.EsVacia=true then
          memo1.Lines.Add('Pila 2 está vacía, por lo que no son iguales');
  end;
end;


//------------------------------------------------------------------------------
//Boton de mostrar Pilas

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Lines.Add('----------------------------------');
  memo1.Lines.Add('Pila 1');
  memo1.Lines.Add(P1.RetornarClaves);
  memo1.Lines.Add('----------------------------------');
  memo1.Lines.Add('Pila 2');
  memo1.Lines.Add(P2.RetornarClaves);
  memo1.Lines.Add('----------------------------------');
end;


//------------------------------------------------------------------------------
//Son iguales recursivo

Function SonIgualesRec():Boolean;
var
  Seguir: Boolean;
  Procedure Recorrer(Var P: Pila; Var Seguir: Boolean);
  var
    X1, X2: TipoElemento;
  begin
    if (not P1.EsVacia) and (Seguir) then begin
      X1:= P1.Recuperar;
      X2:= P2.Recuperar;
      if (X1.Clave = X2.Clave) then begin
        P.Apilar(X1);
        P1.DesApilar;
        P2.DesApilar;
      end else
        Seguir:= False;
      Recorrer(P, Seguir);
    end;
  end;
begin
  Seguir:= True;
  PAux.Crear(P1.DatoDeLaClave, P1.SizeStack);
  Recorrer(PAux, Seguir);
  SonIguales2();
  Result:= Seguir;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (not P1.EsVacia) and (not P2.EsVacia) then begin
    if (Cant1 = Cant2) then begin
      if (SonIgualesRec()) then begin
        memo1.Lines.Add('Las pilas son iguales');
      end else
        memo1.Lines.Add('Las pilas no son iguales');
    end else
      memo1.Lines.Add('Las pilas tienen una cantidad de elementos distinta por lo tanto no son iguales');
  end
    else begin
    if (P1.EsVacia=true)and (P2.EsVacia=true) then begin
      memo1.Lines.Add('ambas Pilas están vacías')
    end
    else
      if P1.EsVacia=true then
        memo1.Lines.Add('Pila 1 está vacía, por lo que no son iguales')
      else
        if P2.EsVacia=true then
          memo1.Lines.Add('Pila 2 está vacía, por lo que no son iguales');
  end;
end;

end.
