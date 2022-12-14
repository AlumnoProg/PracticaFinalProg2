unit Ej5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, QueuesArray, Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxCola = 2000;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C, CCopia: Cola;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//DEFINIR COLA

Function ValidarLongitud(AValidar: String; Var Validado: Integer): Boolean;
Begin

  ValidarLongitud:= False;
  if(TryStrToInt(AValidar, Validado))and(Validado>=1)and(Validado<=MaxCola)then
    ValidarLongitud:= True;

End;

procedure TForm1.Button1Click(Sender: TObject);
var
  Longitud: Integer;
begin

  if (ValidarLongitud(edit1.Text, Longitud)) then begin
    if(C.MaxSizeQueue=MaxCola)then begin
      C.Crear(Numero, Longitud);
      CCopia.Crear(Numero, Longitud);
    end else begin
      C.Crear(Numero, Longitud+1);
      CCopia.Crear(Numero, Longitud+1);
    end;
    Memo1.Lines.Add(' -COLA DEFINIDA- ')
  end else
    memo1.Lines.Add('Error, ingrese datos v?lidos');
end;


//------------------------------------------------------------------------------
//CARGAR COLA

Function Buscar(Dato: String): Boolean;
var
  X, Elemento: TipoElemento;
  CAux: Cola;
  i: Integer;
begin

  Elemento.Clave:= Dato;
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  Buscar:= False;
  i:= 1;
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    if (X.Clave = Elemento.Clave) then begin
      Buscar:= True;
    end;
    Inc(i);
    CAux.Encolar(X);
    C.DesEncolar;
  end;
  C.InterCambiar(CAux, False);

end;

Function SinEspacios(S: String): Boolean;
Var Posicion: Integer;
Begin

  Posicion:= 1;
  SinEspacios:= False;
  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);
  if(Posicion>Length(S))then SinEspacios:= True;

End;

Function ValidarNumero(NCadena: String): Boolean;
var
  Validado: Integer;
Begin

  ValidarNumero:= False;
  if(TryStrToInt(NCadena, Validado)) and (Validado >= 2) and (not (Buscar(NCadena))) then
    ValidarNumero:= True;

End;

Function CargarNumero(Numero: String; Var C: Cola):Boolean;
var
  X: TipoElemento;
begin

  CargarNumero:= False;
  if (ValidarNumero(Numero)) then begin
    X.Clave:= StrToInt(Numero);
    C.Encolar(X);
    CCopia.Encolar(X);
    CargarNumero:= True;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (not C.EsLlena) then begin
    if (CargarNumero(edit2.Text, C)) then begin
      memo1.Lines.Add(edit2.Text + ' cargado en la cola con ?xito');
    end else
      memo1.Lines.Add('Error, ingrese datos v?lidos');
  end else
    memo1.Lines.Add('Cola llena');
  edit2.Clear;
end;


//------------------------------------------------------------------------------
//MOSTRAR COLA

Procedure MostrarCola(Cartel: String; Var C: Cola; Memo1: TMemo);
Var TeC: TipoElemento;
    CAux: Cola;
    Posicion: Integer;
Begin

  Posicion:= 1;
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' ||');
  if(Not C.EsVacia)then begin
    CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
    Memo1.Lines.Add(' ');
    while(Not C.EsVacia)do begin
      TeC:= C.Recuperar;
      Memo1.Lines.Add(' Posicion : '+Posicion.ToString+' | Elemento : '+VarToStr(TeC.Clave));
      CAux.Encolar(TeC);
      C.DesEncolar;
      Inc(Posicion);
    end;
    C.InterCambiar(CAux, False);
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -COLA VACIA-');
  end;

End;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarCola('Cola', C, Memo1);
end;


//----------------------------------------------------------------------------
//DIVISORES

Function Divisor(Var C2: Cola; Elemento: TipoElemento): Boolean;
Var
  X: TipoElemento;
  CAux: Cola;
  Flag: Boolean;
begin
  CAux.Crear(C2.DatoDeLaClave, C2.SizeQueue);
  Flag:= True;
  while (not C2.EsVacia) do begin
    X:= C2.Recuperar;
    if ((X.Clave mod Elemento.Clave) <> 0) then
      Flag:= False;
    CAux.Encolar(X);
    C2.DesEncolar;
  end;
  C2.InterCambiar(CAux, False);
  Result:= Flag;
end;

Function DivisoresTotales(Var C, CCopia: Cola;Var S: String): Cola;
Var
  CAux, CR: Cola;
  X: TipoElemento;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  CR.Crear(C.DatoDeLaClave, C.SizeQueue);
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    if (Divisor(CCopia, X)) then begin
      CR.Encolar(X);
    end;
    CAux.Encolar(X);
    C.DesEncolar;
  end;
  C.InterCambiar(CAux, False);
  Result:= CR;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  S: String;
  CDivisores: Cola;
begin

  if (not C.EsVacia) then begin
    CDivisores.Crear(C.DatoDeLaClave, C.SizeQueue);
    CDivisores:= DivisoresTotales(C, CCopia, S);
    if (not CDivisores.EsVacia) then begin
      memo1.Lines.Add(' ');
      MostrarCola('Divisores Totlaes: ', CDivisores, memo1);
    end else
      memo1.Lines.Add('No se encontr? ning?n divisor total');
  end else
    memo1.Lines.Add('Cola vac?a');
end;


//------------------------------------------------------------------------------
//Divisores recursivos

Function DivisoresTotalesRec(Var C, CCopia: Cola; Var S: String): Cola;
var
  CAux, CR: Cola;
  Procedure Recorrer(Var CAux, CR: Cola);
  var
    X: TipoElemento;
  begin
    if (not C.EsVacia) then begin
      X:= C.Recuperar;
      if (Divisor(CCopia, X)) then
        CR.Encolar(X);
      CAux.Encolar(X);
      Recorrer(CAux, CR);
    end;
  end;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  CR.Crear(C.DatoDeLaClave, C.SizeQueue);
  Recorrer(CAux, CR);
  C.InterCambiar(CAux, False);
  Result:= CR;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  S: String;
  CDivisores: Cola;
begin
  if (not C.EsVacia) then begin
    CDivisores.Crear(C.DatoDeLaClave, C.SizeQueue);
    CDivisores:= DivisoresTotalesRec(C, CCopia, S);
    if (not CDivisores.EsVacia) then begin
      memo1.Lines.Add(' ');
      MostrarCola('Divisores Totlaes: ', CDivisores, memo1);
    end else
      memo1.Lines.Add('No se encontr? ning?n divisor total');
  end else
    memo1.Lines.Add('Cola vac?a');
end;

end.
