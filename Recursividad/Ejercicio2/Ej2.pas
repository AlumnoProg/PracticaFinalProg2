unit Ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//ValidarEdit
Function ValidarEdit(edit: String): Boolean;
var
  Flag: Boolean;
  i: Integer;
begin

  Flag:= True;
  if (not (TryStrToInt(edit, i))) then begin
    if (StrToInt(edit) < 0) then
      Flag:= False;
  end;
  ValidarEdit:= Flag;

end;

//Maximo Comun Divisor
Function MaximoComunDivisor(a, b: LongInt): LongInt;
begin
  if (a = 0) then begin
    result:= b;
  end else
    if (b = 0) then begin
      result:= a;
    end else begin
      MaximoComunDivisor:= MaximoComunDivisor(b, (a mod b));
    end;
end;

//Minimo Comun Multiplo
Function MinimoComunMultiplo(a, b: LongInt): LongInt;
begin
  result:= (a * b) div MaximoComunDivisor(a, b);
end;


//BOTON

procedure TForm1.Button1Click(Sender: TObject);
var
  Resultado: Integer;
begin

  if (ValidarEdit(edit1.Text) and ValidarEdit(edit2.Text)) then begin
    Resultado:= MinimoComunMultiplo(StrToInt(edit1.Text), StrToInt(edit1.Text));
  end;

end;

end.
