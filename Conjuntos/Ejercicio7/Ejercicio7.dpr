program Ejercicio7;

uses
  Vcl.Forms,
  Ej7 in 'Ej7.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
