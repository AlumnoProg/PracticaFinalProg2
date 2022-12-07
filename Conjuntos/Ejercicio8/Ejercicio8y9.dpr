program Ejercicio8y9;

uses
  Vcl.Forms,
  Ej8y9 in 'Ej8y9.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
