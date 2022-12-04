program Ejercicio8;

uses
  Vcl.Forms,
  Ej8 in 'Ej8.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
