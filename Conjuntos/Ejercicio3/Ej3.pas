unit Ej3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ConjuntosAVL, Vcl.StdCtrls;

Const MaxConjunto = 2000;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    Button6: TButton;
    Button7: TButton;
    procedure Button6Click(Sender: TObject);
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
  C,C2,C3: Conjunto;
  Largo: Integer;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//Cargar conjunto 1

Function ValidarEdit (S: String; Var Dato: string) : Boolean;
begin
  Result:= true;
  if S = '' then
    result:= False;
  if S = ' ' then
    Result:= False;
  if Length(S) <> 1 then
    Result:= False;
  Dato:= S;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: string;
begin
if Largo = 0  then
  Begin
    Memo1.Lines.Add('- NO ES POSIBLE AGREGAR ELEMENTOS A UN CONJUNTO DE LONGITUD 0. -');
  End
  else
  begin
    if C.EsLLeno then
     Memo1.Lines.Add('- CONJUNTO 1 LLENO. -')
      else
      begin
        if ValidarEdit (Edit1.Text, Dato) then
          begin
            X.Clave:= Dato;
            If C.Agregar(X) <> ClaveDuplicada Then
              Memo1.Lines.Add('- DATO : " '+ Dato +' " CARGADO CON EXITO EN EL CONJUNTO 1. -')
                Else Memo1.Lines.Add('-EL DATO : " '+ Dato +' " YA FUE INGRESADO EN EL CONJUNTO 1. -');
          end
          else
            begin
              Memo1.Lines.Add('- ERROR, DATOS INVALIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('- VALORES PERMITIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('_ CUALQUIER VALOR NO VACIO DE 1 DIGITO.');
            end;
      end;
  end;
end;


//------------------------------------------------------------------------------
//Cargar conjunto 2

procedure TForm1.Button2Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: string;
begin
Memo1.Clear;
if Largo = 0  then
  Begin
    Memo1.Lines.Add('- NO ES POSIBLE AGREGAR ELEMENTOS A UN CONJUNTO DE LONGITUD 0. -');
  End
  else
  begin
    if C2.EsLLeno then
     Memo1.Lines.Add('- CONJUNTO 2 LLENO. -')
      else
      begin
        if ValidarEdit (Edit1.Text, Dato) then
          begin
            X.Clave:= Dato;
            If C2.Agregar(X) <> ClaveDuplicada Then
              Memo1.Lines.Add('- DATO : " '+ Dato +' " CARGADO CON EXITO EN EL CONJUNTO 2. -')
                Else Memo1.Lines.Add('-EL DATO : " '+ Dato +' " YA FUE INGRESADO EN EL CONJUNTO 2. -');
          end
          else
            begin
              Memo1.Lines.Add('- ERROR, DATOS INVALIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('- VALORES PERMITIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('_ CUALQUIER VALOR NO VACIO DE 1 DIGITO.');
            end;
      end;
  end;
end;


//------------------------------------------------------------------------------
//Cargar conjunto 3

procedure TForm1.Button3Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: string;
begin
Memo1.Clear;
if Largo = 0  then
  Begin
    Memo1.Lines.Add('- NO ES POSIBLE AGREGAR ELEMENTOS A UN CONJUNTO DE LONGITUD 0. -');
  End
  else
  begin
    if C3.EsLLeno then
     Memo1.Lines.Add('- CONJUNTO 3 LLENO. -')
      else
      begin
        if ValidarEdit (Edit1.Text, Dato) then
          begin
            X.Clave:= Dato;
            If C3.Agregar(X) <> ClaveDuplicada Then
              Memo1.Lines.Add('- DATO : " '+ Dato +' " CARGADO CON EXITO EN EL CONJUNTO 3. -')
                Else Memo1.Lines.Add('-EL DATO : " '+ Dato +' " YA FUE INGRESADO EN EL CONJUNTO 3. -');
          end
          else
            begin
              Memo1.Lines.Add('- ERROR, DATOS INVALIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('- VALORES PERMITIDOS. -');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('_ CUALQUIER VALOR NO VACIO DE 1 DIGITO.');
            end;
      end;
  end;
end;


//------------------------------------------------------------------------------
//Union

Function MostrarConjunto (Cm: Conjunto) : String;
var
  X: TipoElemento;
  i: Integer;
  S: String;
begin
  S:= ' ';
  for i := 1 to Cm.CantidadElementos do
  begin
    X:= Cm.Recuperar(i);
    S:= S + VarToStr (X.Clave)+ ' ';
  end;
 Result:= S;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  CAux, CAux2: Conjunto;
begin

  if (MaxConjunto <= (Largo * 3)) then begin
    CAux.Crear(Cadena, Largo*2);
    CAux2.Crear(Cadena, Largo*3);
    if (not C.EsVacio) and (not C2.EsVacio) and (not C3.EsVacio) then begin
      CAux:= C.Union(C2);
      CAux2:= CAux.Union(C3);
      memo1.Lines.Add('Union: ' + MostrarConjunto(CAux2));
    end else
      memo1.Lines.Add('Conjuntos vacios');
  end else
    memo1.Lines.Add('No se puede hacer union debido al largo de los conjuntos');
end;


//------------------------------------------------------------------------------
//Interseccion

procedure TForm1.Button5Click(Sender: TObject);
var
  CAux, CAux2: Conjunto;
begin

if C.EsVacio and C2.EsVacio and C3.EsVacio Then
    begin
      Memo1.Lines.Add(' - Interseccion C1 i C2 i C3 : Conjunto Vacio. -  ');
      Abort;
    end;


    CAux.Crear(Cadena, MaxConjunto);
    Caux2.Crear(Cadena, MaxConjunto);

    Caux:= C.Interseccion(C2);
    Caux2:= Caux.Interseccion(C3);
      if CAux2.EsVacio then
        Memo1.Lines.Add('Interseccion C1 i C2 i C3 : Conjunto Vacio.')
          else Memo1.Lines.Add('Interseccion C1 i C2 i C3: '+ MostrarConjunto(CAux2));


 if C.EsVacio then
      begin
        Memo1.Lines.Add(' ');
        Memo1.Lines.Add('Conjunto 1 vacio.  ');
      end;
    if C2.EsVacio then
      begin
        Memo1.Lines.Add(' ');
        Memo1.Lines.Add('Conjunto 2 vacio.  ');
      end;
    if C3.EsVacio then
      begin
        Memo1.Lines.Add(' ');
        Memo1.Lines.Add('Conjunto 3 vacio.  ');
      end;

end;


//------------------------------------------------------------------------------
//Crear conjuntos

Function ValidarLargo (S: String) : Boolean;
var
  I: Integer;
begin
  Result:= true;
  if (S = '')  or (S = ' ') then
   begin
     Result:= False;
   end
   else
   begin
    if Not TrystrToint (S,I) then
      Result:= False;
    if I > MaxConjunto then
      Result:= False;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if ValidarLargo (Edit2.Text) then
    begin
      Largo:= StrToint (Edit2.Text);
      C.Crear(Cadena,Largo);
      C2.Crear(Cadena,Largo);
      C3.Crear(Cadena,Largo);
      Memo1.Clear;
      Memo1.Lines.Add('- CONJUNTOS SETEADOS CON EXITO. -');
      Memo1.Lines.Add(' ');
      if largo = 0  then
        Memo1.Lines.Add('- EL LARGO INGRESADO NO PERMITE INGRESO DE DATOS.');
      if ( Largo > (MaxConjunto/3) ) then
        Memo1.Lines.Add('-AVISO : EL PROCEDIMIENTO " UNION " NO ADMITE UN LARGO MAYOR A (MAXSIZE / 3) .');
      Button1.Enabled:= True;
      Button2.Enabled:= True;
      Button3.Enabled:= True;
      Button4.Enabled:= True;
      Button5.Enabled:= True;
      Button7.Enabled:= True;
    end
      Else
        begin
          Memo1.Lines.Add('- LARGO INVALIDO. -');
          Memo1.Lines.Add('');
          Memo1.Lines.Add('- VALORES PERMITIDOS. -');
          Memo1.Lines.Add('');
          Memo1.Lines.Add('- ENTEROS ENTRE 0 Y '+MaxConjunto.ToString+'. -');
        end;
end;

end.