unit Ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ConjuntosAVL, Vcl.StdCtrls;

Const MaxConjunto = 2000;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button8: TButton;
    Button7: TButton;
    Button9: TButton;
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C1, C2: Conjunto;
  Largo: Integer;

implementation

{$R *.dfm}

Function MostrarConjunto (Cm: Conjunto) : String;
var
  X: TipoElemento;
  i: Integer;
  S: String;
begin
  S:= ' ';
  for i := 1 to Cm.CantidadElementos do
  begin
    X:= Cm.Recuperar(i);
    S:= S + VarToStr (X.Clave)+ ' ';
  end;
 Result:= S;
end;

//------------------------------------------------------------------------------
//CARGAR CONJUNTO 1

Function ValidarEdit(S: String; Var Dato: String): Boolean;
begin

  Result:= true;
  if S = '' then
    result:= False;
  if S = ' ' then
    Result:= False;
  if Length(S) <> 1 then
    Result:= False;
  Dato:= S;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: String;
begin
  if (Largo <> 0) then begin
    if (not C1.EsLleno) then begin
      if (ValidarEdit(edit1.Text, Dato)) then begin
        X.Clave:= Dato;
        if (C1.Agregar(X) <> ClaveDuplicada) then
          memo1.Lines.Add(Dato + ' cargado con �xito en el conjunto 1')
        else
          memo1.Lines.Add(Dato + '  no se pudo cargar');
      end else
        memo1.Lines.Add('Error, dato inv�lido');
    end else
      memo1.Lines.Add('Conjunto 1 lleno');
  end else
    memo1.Lines.Add('La longitud indicada es 0 por lo que no se pueden agregar elementos');
end;


//------------------------------------------------------------------------------
//CARGAR CONJUNTO 2

procedure TForm1.Button2Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: String;
begin
  if (Largo <> 0) then begin
    if (not C2.EsLleno) then begin
      if (ValidarEdit(edit1.Text, Dato)) then begin
        X.Clave:= Dato;
        if (C2.Agregar(X) <> ClaveDuplicada) then
          memo1.Lines.Add(Dato + ' cargado con �xito en el conjunto 2')
        else
          memo1.Lines.Add(Dato + '  no se pudo cargar');
      end else
        memo1.Lines.Add('Error, dato inv�lido');
    end else
      memo1.Lines.Add('Conjunto 2 lleno');
  end else
    memo1.Lines.Add('La longitud indicada es 0 por lo que no se pueden agregar elementos');
end;


//------------------------------------------------------------------------------
//Union

procedure TForm1.Button3Click(Sender: TObject);
var
  CAux: Conjunto;
begin
  if (Largo <= (MaxConjunto / 2)) then begin
    CAux.Crear(C1.DatoDeLaClave, (C1.CantidadElementos + C2.CantidadElementos));
    if (not C1.EsVacio) and (not C2.EsVacio) then begin
      CAux:= C1.Union(C2);
      memo1.Lines.Add('C1 UNION C2: ' + MostrarConjunto(CAux));
    end else
      memo1.Lines.Add('Conuntos vacios');
  end else
    memo1.Lines.Add('No se puede hcaer union debido a la longitud de los conjuntos');
end;


//------------------------------------------------------------------------------
//Interseccion

procedure TForm1.Button4Click(Sender: TObject);
var
  CAux: Conjunto;
begin
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    CAux.Crear(Cadena, Largo*2);
    CAux:= C1.Interseccion(C2);
    memo1.Lines.Add('C1 Interseccion C2: ' + MostrarConjunto(CAux));
  end else
    memo1.Lines.Add('Conjuntos vacios');
end;


//------------------------------------------------------------------------------
//Diferencia

procedure TForm1.Button5Click(Sender: TObject);
var
  CAux: Conjunto;
begin
  CAux.Crear(Cadena, MaxConjunto);
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    CAux:= C1.Diferencia(C2);
    memo1.Lines.Add('C1 Diferencia C2: ' + MostrarConjunto(CAux));
  end else
    memo1.Lines.Add('Conjuntos vacios');
end;


//------------------------------------------------------------------------------
//Pertenencia

procedure TForm1.Button6Click(Sender: TObject);
var
  X: TipoElemento;
  Dato: String;
begin
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    if (ValidarEdit(edit2.Text, Dato)) then begin
      X.Clave:= Dato;
      if (C1.Pertenece(X)) and (C2.Pertenece(X)) then
        memo1.Lines.Add(Dato + ' pertenece a ambos conjuntos')
      else
        if (C1.Pertenece(X)) and (not C2.Pertenece(X)) then
          memo1.Lines.Add(Dato + ' pertenece al conjunto 1')
        else
          if (not C1.Pertenece(X)) and (C2.Pertenece(X)) then
            memo1.Lines.Add(Dato + ' pertenece al conjunto 2')
          else
            memo1.Lines.add(Dato + ' no pertenece a ning�n conjunto');
    end else
      memo1.Lines.Add('Error, ingrese dato correctamente');
  end else
    memo1.Lines.Add('Conjuntos vac�os');
end;


//------------------------------------------------------------------------------
//Mostrar

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    memo1.Lines.Add(' ');
    memo1.Lines.Add('Conjunto 1: ');
    memo1.Lines.Add(MostrarConjunto(C1));
    memo1.Lines.Add(' ');
    memo1.Lines.Add('Conjunto 2');
    memo1.Lines.Add(MostrarConjunto(C2));
    memo1.Lines.Add(' ');
  end else
    memo1.Lines.Add('Conjuntos vac�os');
end;


//------------------------------------------------------------------------------
//SETEAR CONJUNTOS

Function ValidarLargo(Edit: String): Boolean;
begin

  ValidarLargo:= True;
  if (Edit = '') then
    ValidarLargo:= False;
  if (Edit = ' ') then
    ValidarLargo:= False;
  if (not (TryStrToInt(Edit, Largo))) then
    ValidarLargo:= False;
  if (Largo < 0) or (Largo > MaxConjunto) then
    ValidarLargo:= False;

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if (ValidarLargo(edit3.Text)) then begin
    C1.Crear(Cadena, Largo);
    C2.Crear(Cadena, Largo);
    memo1.Lines.Add('Conjuntos creados con �xito');
    if largo = 0  then
      Memo1.Lines.Add('- EL LARGO INGRESADO NO PERMITE INGRESO DE DATOS.');
    if largo > 1000  then
      Memo1.Lines.Add('-AVISO : EL PROCEDIMIENTO " UNION " NO ADMITE UN LARGO MAYOR A 1000.');
  end else
    memo1.Lines.Add('Error, ingrese el largo correctamente');
end;

end.