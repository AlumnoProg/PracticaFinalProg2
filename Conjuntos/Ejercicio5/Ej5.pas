unit Ej5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ConjuntosAVL, Vcl.StdCtrls;

Const
  MaxConjunto = 2000;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C1, C2:Conjunto;
  Largo:Integer;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//BOTON DE CREAR / RESETEAR CONJUNTOS

Function ValidarLargo(S:String):Boolean;
begin

  Result:= true;
  if S = '' then
    result:= False;
  if S = ' ' then
    Result:= False;
  if not TryStrToint(S, Largo) then
    Result:= False;
  if (Largo < 0) or (Largo > MaxConjunto) then
    Result:= FAlse;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ValidarLargo(edit1.Text) then begin
    C1.Crear(Cadena, Largo);
    C2.Crear(Cadena, Largo);
    memo1.Lines.Add('Conjutnos creados con �xito');
    if Largo = 0 then
      memo1.Lines.Add('El largo ingresado no permite el ingreso de datos');
    if Largo > 1000 then
      memo1.Lines.Add('El largo ingresado no permite el procedimiento de union');
  end
  else
    memo1.Lines.Add('Error, ingrese el largo nuevamente');
end;


//------------------------------------------------------------------------------
//BOTON DE CARGA CONJUNTO A

Function ValidarEdit (S: String; Var Dato: string) : Boolean;
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

procedure TForm1.Button2Click(Sender: TObject);
var
  X:TipoElemento;
  Dato:String;
begin
  if Largo <> 0 then begin
    if not C1.EsLLeno then  begin
      if ValidarEdit(edit2.Text, Dato) then begin
        X.Clave:=Dato;
        if C1.Agregar(X) <> ClaveDuplicada then begin
          memo1.Lines.Add(Dato + ' agregado con �xito al conjunto A');
        end
        else
          memo1.Lines.Add(Dato + ' ya fue ingresado al conjunto A');
      end
      else
        memo1.Lines.Add('Error, ingrese el dato correctamente');
    end
    else
      memo1.Lines.Add('El conjunto A est� lleno');
  end
  else
    memo1.Lines.Add('Conjunto A de longitud 0');
end;


//------------------------------------------------------------------------------
//BOTON DE CARGA CONJUNTO B

procedure TForm1.Button3Click(Sender: TObject);
var
  X:TipoElemento;
  Dato:String;
begin
  if Largo <> 0 then begin
    if not C2.EsLLeno then  begin
      if ValidarEdit(edit3.Text, Dato) then begin
        X.Clave:=Dato;
        if C2.Agregar(X) <> ClaveDuplicada then begin
          memo1.Lines.Add(Dato + ' agregado con �xito al conjunto B');
        end
        else
          memo1.Lines.Add(Dato + ' ya fue ingresado al conjunto B');
      end
      else
        memo1.Lines.Add('Error, ingrese el dato correctamente');
    end
    else
      memo1.Lines.Add('El conjunto B est� lleno');
  end
  else
    memo1.Lines.Add('Conjunto B de longitud 0');
end;


//------------------------------------------------------------------------------
//BOTON DE MOSTRAR CONJUNTOS

Function MostrarConjunto (C:Conjunto):String;
var
  S:String;
  X:TipoElemento;
  i:Integer;
begin

  S:='';
  for i := 1 to C.CantidadElementos do begin
    X:=C.Recuperar(i);
    S:= S + VarToStr(X.Clave) + ' ';
  end;
  MostrarConjunto:=S;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (not C1.EsVacio) and (not C2.EsVacio) then begin
    memo1.Lines.Add(' ');
    memo1.Lines.Add('Conjunto A: ' + MostrarConjunto(C1));
    memo1.Lines.Add(' ');
    memo1.Lines.Add('Conjunto B: ' + MostrarConjunto(C2));
    memo1.Lines.Add(' ');
  end
  else begin
    if (C1.EsVacio) and (not C2.EsVacio) then
      memo1.Lines.Add('El conjunto A est� vac�o')
    else
      if (not C1.EsVacio) and (C2.EsVacio) then
        memo1.Lines.Add('El conjunto B est� vac�o')
      else
        if C1.EsVacio and C2.EsVacio then
          memo1.Lines.Add('Conjuntos A y B vac�os');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Clear;
end;


//------------------------------------------------------------------------------
//BOTON DE SUBCONJUNTO


Function sonIguales(var C1, C2: Conjunto): Boolean;
var
  CR: Conjunto;
begin

  sonIguales:= False;
  if (C1.esVacio) and (C2.esVacio) then
    sonIguales:= True
  else begin
    if (not C1.EsVacio) and (not C2.EsVacio) then begin
      if (C1.CantidadElementos = C2.CantidadElementos) then begin
        CR:= C1.Interseccion(C2);
        if (not CR.EsVacio) and (CR.CantidadElementos = C1.CantidadElementos) then
          sonIguales:= True;
      end;
    end;
  end;

end;

Function esSubConjuntoPropio(var C1, C2: Conjunto): Boolean;
var
  CR: Conjunto;
begin
  Result:= False;
  if (C1.EsVacio) and (not C2.EsVacio) then
    Result:= True
  else begin
    if (not sonIguales(C1, C2)) then begin
      CR:= C1.Interseccion(C2);
      if (not CR.EsVacio) and (CR.CantidadElementos = C1.CantidadElementos) then
        esSubConjuntoPropio:= True;
    end;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if EsSubconjuntoPropio(C1, C2) then
    memo1.Lines.Add('El Conjunto A es Subconjunto Propio del Conjunto B')
  else
    memo1.Lines.Add('El Conjunto a no es Subconjunto Propio del Conjunto B');
end;

end.
