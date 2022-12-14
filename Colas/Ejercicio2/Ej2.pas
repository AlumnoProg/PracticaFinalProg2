unit Ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, QueuesArray, Vcl.StdCtrls;

Const MaxCadena = 255;
      MaxCola = 2000;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit4: TEdit;
    Button7: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    Button8: TButton;
    Edit7: TEdit;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C1, C2: Cola;
  QAux: Integer;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//DEFINIR COLAS

Function ValidarLongitud(AValidar: String; Var Validado: Integer): Boolean;
Begin

  ValidarLongitud:= False;
  if(TryStrToInt(AValidar, Validado))and(1<=Validado)and(Validado<=MaxCola)then
    ValidarLongitud:= True;

End;

procedure TForm1.Button1Click(Sender: TObject);
var
  Longitud: Integer;
begin

  if(ValidarLongitud(Edit1.Text, Longitud))then begin
    if(C1.MaxSizeQueue=MaxCola)then begin
      C1.Crear(Cadena, Longitud);
      C2.Crear(Cadena, Longitud);
      QAux:= 0;
    end else begin
      C1.Crear(Cadena, Longitud+1);
      C2.Crear(Cadena, Longitud+1);
      QAux:= 0;
    end;
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -COLAS DEFINIDAS- ');
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' Ingrese valor entero entre 1 y '+MaxCola.ToString+'. ');
  end;
end;


//------------------------------------------------------------------------------
//CARGAR COLA 1

Function SinEspacios(S: String): Boolean;
Var Posicion: Integer;

Begin

  Posicion:= 1;
  SinEspacios:= False;
  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);
  if(Posicion>Length(S))then SinEspacios:= True;

End;

Function ValidarEdit(Edit: String): Boolean;
begin

  ValidarEdit:= False;
  if(Edit<>'')and(SinEspacios(Edit)) and (1<=Length(Edit))and(Length(Edit)<=MaxCadena)then
    ValidarEdit:= True;

end;

Function CargarCola(Edit: String; Var C: Cola): Boolean;
var
  X: TipoElemento;
begin

  CargarCola:= False;
  if (ValidarEdit(Edit)) then begin
    X.Clave:= Edit;
    if (C.Encolar(X) = OK) then
      CargarCola:= True;
  end;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (not C1.EsLlena) then begin
    if (CargarCola(edit2.Text, C1)) then begin
      Inc(QAux);
      memo1.Lines.Add(edit2.Text + ' cargado en la cola 1');
    end else
      memo1.Lines.Add('Error, ingrese los datos correctamente');
  end else
    memo1.Lines.Add('Cola 1 llena');
end;


//------------------------------------------------------------------------------
//CARGAR COLA 2

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (not C2.EsLlena) then begin
    if (CargarCola(edit3.Text, C2)) then begin
      memo1.Lines.Add(edit3.Text + ' cargado en la cola 2');
    end else
      memo1.Lines.Add('Error, ingrese los datos correctamente');
  end else
    memo1.Lines.Add('Cola 2 llena');
end;


//------------------------------------------------------------------------------
//MOSTRAR COLAS

Procedure MostrarCola(Cartel: String; Var C: Cola; Memo1: TMemo);
Var TeC: TipoElemento;
    CAux: Cola;
    Posicion: Integer;

Begin

  Posicion:= 1;

  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' ||');
  if(Not C.EsVacia)then begin

    CAux.Crear(C.DatoDeLaClave, C.SizeQueue);

    Memo1.Lines.Add(' ');
    while(Not C.EsVacia)do begin

      TeC:= C.Recuperar;
      Memo1.Lines.Add(' Posicion : '+Posicion.ToString+' | Elemento : '+VarToStr(TeC.Clave));
      CAux.Encolar(TeC);
      C.DesEncolar;
      Inc(Posicion);

    end;

    C.InterCambiar(CAux, False);

  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -COLA VACIA-');

  end;

End;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarCola('Cola 1',C1, memo1);
  memo1.Lines.Add(' ');
  MostrarCola('Cola 2',C2, memo1);
end;


//------------------------------------------------------------------------------
//Concatenar colas

Procedure Concatenar(var C1, C2: Cola);
var
  X: TipoElemento;
  CAux: Cola;
begin
  CAux.Crear(C2.DatoDeLaClave, C2.SizeQueue);
  while (not C2.EsVacia) do begin
    X:= C2.Recuperar;
    C1.Encolar(X);
    CAux.Encolar(X);
    C2.DesEncolar;
  end;
  C2.InterCambiar(CAux, False);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not C1.EsVacia) and (not C2.EsVacia) then begin
    if (((C1.SizeQueue) + (C2.SizeQueue)) <= MaxCola) then begin
      Concatenar(C1, C2);
      memo1.Lines.Add(' ');
      MostrarCola('Cola 1 Concantenada:', C1, memo1);
    end else
      memo1.Lines.Add('El tamanio de las dos colas es mayor al maximo permitido');
  end else begin
    if(Not C1.EsVacia)and(C2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -COLA 2 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en la cola 2 para evaluarla. ');
    end;
    if(C1.EsVacia)and(Not C2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -COLA 1 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en la cola 1 para evaluarla. ');
    end;
    if(C1.EsVacia)and(C2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -COLAS VACIAS- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las colas para evaluarlas. ');
    end;
  end;
end;


//------------------------------------------------------------------------------
//BUSCAR ELEMENTO

Function Buscar(Dato: TipoElemento; var Posicion: String): Boolean;
var
  CAux: Cola;
  X: TipoElemento;
  i: Integer;
begin
  CAux.Crear(C1.DatoDeLaClave, C1.SizeQueue);
  Buscar:= False;
  i:= 1;
  while (not C1.EsVacia) do begin
    X:= C1.Recuperar;
    if (X.Clave = Dato.Clave) then begin
      Buscar:= True;
      Posicion:= IntToStr(i);
    end;
    Inc(i);
    CAux.Encolar(X);
    C1.DesEncolar;
  end;
  C1.InterCambiar(CAux, False);
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
  Edit, Posicion: String;
  Dato: TipoElemento;
begin
  if (not C1.EsVacia) then begin
    if (ValidarEdit(edit4.Text)) then begin
      Edit:= edit4.Text;
      Dato.Clave:= Edit;
      if (Buscar(Dato, Posicion)) then begin
        memo1.Lines.Add(Edit + ' encontrado en la cola 1 en la posici?n ' + Posicion);
      end else
        memo1.Lines.Add(Edit + ' no se encontro en la cola 1');
    end else
      memo1.Lines.Add('Error, ingrese los datos correctamente');
  end else
    memo1.Lines.Add('Cola 1 vac?a');
end;


//------------------------------------------------------------------------------
//ARGEGAR ELEMENTO

Function ValidarPosicion(Pos: String): Boolean;
var
  i: Integer;
begin

  ValidarPosicion:= False;
  if (TryStrToInt(Pos, i)) and (i <= C1.SizeQueue) and (i <= (QAux + 1)) then
    ValidarPosicion:= True;

end;

Procedure Insertar(Dato: TipoElemento; Posicion: Integer; Var C: Cola);
var
  X: TipoElemento;
  CAux: Cola;
  i: Integer;
begin
  CAux.Crear(C1.DatoDeLaClave, C1.SizeQueue);
  i:= 1;
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    if (i = Posicion) then begin
      CAux.Encolar(Dato);
      CAux.Encolar(X);
      C.DesEncolar;
      Inc(i);
    end else begin
      CAux.Encolar(X);
      C.DesEncolar;
      Inc(i);
    end;
  end;
  if (Posicion = QAux + 1) then
    CAux.Encolar(Dato);
  C.InterCambiar(CAux, False);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Posicion: Integer;
  Dato: TipoElemento;
begin

  if (not C1.EsLlena) then begin
    if (ValidarEdit(edit6.Text)) and (ValidarPosicion(edit5.Text)) then begin
      Dato.Clave:= edit6.Text;
      Posicion:= StrToInt(edit5.Text);
      Insertar(Dato, Posicion, C1);
      Inc(QAux);
      memo1.Lines.Add(edit6.Text + ' agregado con exito en la posici?n ' + edit5.Text);
    end else
      memo1.Lines.Add('Error, ingrese los datos correctamente');
  end else
    memo1.Lines.Add('Cola 1 llena');
end;


//------------------------------------------------------------------------------
//Eliminar Elemento

Procedure EliminarOcurrencias(Elemento: TipoElemento; var C: Cola);
var
  X: TipoElemento;
  CAux: Cola;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    if (X.Clave = Elemento.Clave) then begin
      C.DesEncolar;
      QAux:= QAux - 1;
    end else begin
      CAux.Encolar(X);
      C.DesEncolar;
    end;
  end;
  C.InterCambiar(CAux, False);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  Elemento: TipoElemento;
  P: String;
begin

  if (not C1.EsVacia) then begin
    if (ValidarEdit(edit7.Text)) then begin
      Elemento.Clave:= edit7.Text;
      if (Buscar(Elemento, P)) then begin
        EliminarOcurrencias(Elemento, C1);
        memo1.Lines.Add(edit7.text + ' eliminado de la cola 1');
      end else
        memo1.Lines.Add('El elemento no se encuentra en la cola');
    end else
      memo1.Lines.Add('Error, ingrese el dato correctamente');
  end else
    memo1.Lines.Add('Cola vac?a');
end;


//------------------------------------------------------------------------------
//CANTIDAD DE ELEMENTOS

Function CantidadElementos(Var C: Cola): Integer;
var
  CAux: Cola;
  X: TipoElemento;
  Cant: Integer;
begin

  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  Cant:= 0;
  while (not C.EsVacia) do begin
    Inc(Cant);
    X:= C.Recuperar;
    CAux.Encolar(X);
    C.DesEncolar;
  end;
  C.InterCambiar(CAux, False);

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  //memo1.Lines.Add('Cantidad de elementos: ' + CantidadElementos(C1).ToString);
  memo1.Lines.Add('Cantidad de elementos: ' + QAux.ToString);
end;


//------------------------------------------------------------------------------
//Crear Copia

Function CopiarCola(Var C: Cola): Cola;
var
  CAux, CR: Cola;
  X: TipoElemento;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  CR.Crear(C.DatoDeLaClave, C.SizeQueue);
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    CR.Encolar(X);
    CAux.Encolar(X);
    C.DesEncolar;
  end;
  C.InterCambiar(CAux, False);
  Result:= CR;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  CAux: Cola;
begin
  CAux.Crear(C1.DatoDeLaClave, C1.SizeQueue);
  CAux:= CopiarCola(C1);
  memo1.Lines.Add(' ');
  MostrarCola('Cola 1:', C1, memo1);
  memo1.Lines.Add(' ');
  MostrarCola('Cola Copiada:', CAux, memo1);
end;


//------------------------------------------------------------------------------
//Invertir cola

Function Invertir(Var C: Cola): Cola;
Var
  X: TipoElemento;
  CAux, CAux2, CFinal: Cola;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  CAux2.Crear(C.DatoDeLaClave, C.SizeQueue);
  CFinal.Crear(C.DatoDeLaClave, C.SizeQueue);
  while (not C.EsVacia) do begin
    X:= C.Recuperar;
    if(CAux.EsVacia)then begin
      CAux.Encolar(X);
      CAux.InterCambiar(CAux2, False);
    end else
    if(CAux2.EsVacia)then begin
      CAux2.Encolar(X);
      CAux2.InterCambiar(CAux, False);
    end;
    CFinal.Encolar(X);
    C.DesEncolar;
  end;
  C.InterCambiar(CFinal, False);
  if(Not CAux.EsVacia)then
    Invertir:= CAux
  else Invertir:= CAux2;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  CInvertida: Cola;
begin
  if (not C1.EsVacia) then begin
    CInvertida.Crear(C1.DatoDeLaClave, C1.SizeQueue);
    CInvertida:= Invertir(C1);
    memo1.Lines.Add(' ');
    MostrarCola('Cola invertida: ', CInvertida, memo1);
  end else
    memo1.Lines.Add('Cola vac?a');
end;

end.
