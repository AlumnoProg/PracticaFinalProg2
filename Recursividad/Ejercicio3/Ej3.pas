unit Ej3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
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

//Validacion
Function Validar(Edit: String): Boolean;
var
  i: integer;
  Flag: Boolean;
begin

  Flag:= True;
  if (not(TryStrToInt(Edit, i))) then
    Flag:= False;
  Validar:= Flag;

end;

//Multiplicacion
Function MultiplicacionRecursiva(M, N: LongInt): LongInt;
begin

  if ((M = 0) and (N = 0)) then begin
    result:= 0;
  end else
    if (M = 1) then
      result:= N
    else
      if (N = 1) then
        result:= M
      else
        if (N = 2) then
          result:= M + M
        else
          result:= M + MultiplicacionRecursiva(M, (N - 1));

end;


//BOTON
procedure TForm1.Button1Click(Sender: TObject);
var
  N1, N2: integer;
begin

  if (Validar(edit1.Text)) and (Validar(edit2.Text)) then begin
    N1:= StrToInt(edit1.Text);
    N2:= StrToInt(edit2.Text);
    if ((N1 < 0) and (N2 < 0)) then begin
      N1:= N1 * -1;
      N2:= N2 * -1;
      memo1.Lines.Add((MultiplicacionRecursiva(N1, N2)).toString);
    end else begin
      if (N1 < 0) then begin
        N1:= N1 * -1;
        memo1.Lines.Add((MultiplicacionRecursiva(N1, N2) * -1).ToString);
      end else
        if (N2 < 0) then begin
          N2:= N2 * -1;
          memo1.Lines.Add((MultiplicacionRecursiva(N1, N2) * -1).ToString);
      end else
        memo1.Lines.Add(MultiplicacionRecursiva(N1, N2).ToString);
    end;
  end else
    memo1.lines.Add('Error, solo se permiten ingresar numero');
end;

end.
