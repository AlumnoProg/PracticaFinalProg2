unit Ej7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    ButtonChinos: TButton;
    Memo1: TMemo;
    procedure ButtonChinosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Validar
Function Validar(Edit: String): Boolean;
var
  i: integer;
  Flag: Boolean;
begin
  Flag:= True;
  if (not(TryStrToInt(Edit, i))) or (i < 0)then
    Flag:= False;
  Validar:= Flag;
end;

//Delegacion
Function Delegacion(Nivel: LongInt):String;
var
  sAux: String;
  procedure mitadCarita(var S: String; Niv: LongInt);
  begin
    if (Niv > 0) then begin
      S:= '(-.' + S + '.-)';
      mitadCarita(S, (Niv - 1));
    end;
  end;
begin

  sAux:='(-.-)';
  mitadCarita(sAux, (Nivel - 1));
  Delegacion:= sAux;
end;


//BOTON
procedure TForm1.ButtonChinosClick(Sender: TObject);
begin
  if (Validar(edit1.Text)) then begin
    if (edit1.Text = '0') then
      memo1.Lines.Add('')
    else
      memo1.Lines.Add(Delegacion(StrToInt(edit1.Text)));
  end else
    memo1.Lines.Add('Error, ingrese un numero entero mayor o igual a cero');
end;

end.
