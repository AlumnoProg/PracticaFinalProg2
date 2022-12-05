program Ejercicio5;

uses
  Vcl.Forms,
  Ej5 in 'Ej5.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
