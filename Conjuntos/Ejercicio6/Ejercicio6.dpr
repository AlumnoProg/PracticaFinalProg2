program Ejercicio6;

uses
  Vcl.Forms,
  Ej6 in 'Ej6.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
