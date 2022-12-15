program Ejercicio12;

uses
  Vcl.Forms,
  Ej12 in 'Ej12.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
