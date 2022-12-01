program Ejercicio2;

uses
  Vcl.Forms,
  Ej2 in 'Ej2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
