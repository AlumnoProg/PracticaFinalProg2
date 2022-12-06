program Ejercicio3;

uses
  Vcl.Forms,
  Ej3 in 'Ej3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
