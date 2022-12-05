unit Ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, StackArray, Vcl.StdCtrls;

  Const MaxPila = 2000;
      MaxEntero = 9999999;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    Edit5: TEdit;
    Button4: TButton;
    Edit6: TEdit;
    Button5: TButton;
    Edit7: TEdit;
    Memo1: TMemo;
    Button6: TButton;
    Edit8: TEdit;
    Button7: TButton;
    Button8: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Tamanio: Integer;
  P: Pila;

implementation

{$R *.dfm}



Procedure MostrarPila(Cartel: String; Var P: Pila; memo1: Tmemo);
var
  X: TipoElemento;
  PAux: Pila;
  Posicion: Integer;
begin

  Posicion:= 1;
  memo1.Lines.Add(' ');
  memo1.Lines.Add('---|| ' + Cartel + ' ||---');
  if (not P.EsVacia) then begin
    PAux.Crear(P.DatoDeLaClave, P.SizeStack);
    memo1.Lines.Add(' ');
    while (not P.EsVacia) do begin
      X:= P.Recuperar;
      memo1.Lines.Add('Posicion:' + Posicion.ToString + '          Dato: ' + VarToStr(X.Clave));
      PAux.Apilar(X);
      P.DesApilar;
      Inc(Posicion);
    end;
    P.InterCambiar(PAux, False);
  end else
    memo1.lines.Add('Pila vac�a');

end;


//------------------------------------------------------------------------------
//BOTON DE CREAR / RESETEAR PILA

Function ValidarTamanio(Edit: String; Var Validado: Integer): Boolean;
begin

  ValidarTamanio:= False;
  if (TryStrToInt(Edit, Validado)) and (Validado >= 1) and (Validado <= 2000) then
    ValidarTamanio:= True;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (ValidarTamanio(edit1.Text, Tamanio)) then begin
    P.Crear(Numero, Tamanio);
    memo1.Lines.Add('Pila creada con �xito');
  end else
    memo1.lines.Add('Error, ingrese valores permitidos');
end;


//------------------------------------------------------------------------------
//BOTON DE CARGAR ELEMENTO MANUALMENTE

Function ValidarEdit(S: String): Boolean;
var
  i: Integer;
begin

  if (TryStrToInt(S, i)) then
    ValidarEdit:= True
  else
    ValidarEdit:= False;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X: TipoElemento;
begin

  if (ValidarEdit(edit2.Text)) then begin
    if (not P.EsLlena) then begin
      X.Clave:= StrToInt(edit2.Text);
      P.Apilar(X);
      memo1.Lines.Add(edit2.Text + ' apilado con �xito');
    end else
      memo1.Lines.Add('Pila llena');
  end else
    memo1.Lines.Add('Error, ingrese un numero entero');
end;


//------------------------------------------------------------------------------
//BOTON DE CARGAR PILA RANDOM

Procedure CargarPilaRandom(Cant: Integer; Desde, Hasta: LongInt; Var P: Pila);
var
  X: TipoElemento;
  Seguir: Boolean;
  Posicion: Integer;
begin

  Posicion:= 1;
  Seguir:= True;
  Randomize;
  while (Posicion <= Cant) and (Seguir) do begin
    X.Clave:= Desde + Random((Hasta - Desde) + 1);
    if (P.Apilar(X) <> OK) then
      Seguir:= False;
    Inc(Posicion);
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Desde, Hasta: LongInt;
  CantidadElementos: Integer;
begin

  if (ValidarEdit(edit3.Text)) and (ValidarEdit(edit4.Text)) and (ValidarEdit(edit5.Text)) then begin
    if (StrToInt(edit5.Text) <= Tamanio) then begin
      Desde:= StrToInt(edit3.Text);
      Hasta:= StrToInt(edit4.Text);
      CantidadElementos:= StrToInt(edit5.Text);
      if (Desde < Hasta) then begin
        CargarPilaRandom(CantidadElementos, Desde, Hasta, P);
        memo1.Lines.Add('Pila cargada aleatoriamente con �xito');
      end else
        memo1.Lines.Add('el valor de Desde tiene que ser menor al valor de hasta');
    end else
      memo1.Lines.Add('La cantidad de elementos no puede ser mayor al tamanio de la pila');
  end else
    memo1.Lines.Add('Error, ingrese numeros enteros');
end;


//------------------------------------------------------------------------------
//BOTON DE BUSCAR CLAVE

Function BuscarElemento(Elemento: Integer; Var P: Pila): Pila; var
  X: TipoElemento;
  PAux, PR: Pila;
  Posicion: Integer;
begin
  PAux.Crear(p.DatoDeLaClave, p.SizeStack);
  PR.Crear(P.DatoDeLaClave, P.SizeStack);
  Posicion:= 1;
  while (not P.EsVacia) do begin
    X:= P.Recuperar;
    if (X.Clave = Elemento) then begin
      X.Valor1:= Posicion;
      PR.Apilar(X);
    end;
    PAux.Apilar(X);
    P.DesApilar;
    Inc(Posicion);
  end;
  P.InterCambiar(PAux, False);
  Result:= PR;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Numero: Integer;
  PAux: Pila;
begin

  if (not P.EsVacia) then begin
    if (ValidarEdit(edit6.Text)) then begin
      Numero:= StrToInt(edit6.Text);
      PAux:= BuscarElemento(Numero, P);
      if (not PAux.EsVacia) then
        memo1.Lines.Add('El elemento ' + Numero.ToString + ' existe en la pila')
      else
        memo1.Lines.Add('El elemento ' + Numero.ToString + ' no existe en la pila');
    end else
      memo1.Lines.Add('Error, ingrese un numero entero');
  end else
    memo1.Lines.Add('Pila vac�a');
end;


//------------------------------------------------------------------------------
//BOTON COLOCAR FONDO

Function CantidadElementos(var P: Pila): Integer;
var
  X: TipoElemento;
  PAux: Pila;
  Cantidad: Integer;
  Seguir: Boolean;
begin

  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  Cantidad:= 0;
  Seguir:= True;
  while (not P.EsVacia) and (Seguir) do begin
    X:= P.Recuperar;
    if (not X.EsTEVacio) then begin
      PAux.Apilar(X);
      P.DesApilar;
      Inc(Cantidad);
    end else
      Seguir:= False;
  end;
  P.InterCambiar(PAux, False);
  CantidadElementos:= Cantidad;

end;

Function ColocarAlFinal(Elemento: String; var P: Pila): Boolean;
var
  X: TipoElemento;
  PAux: Pila;
begin
  if (not P.EsLlena) then begin
    PAux.Crear(P.DatoDeLaClave, P.SizeStack);
    PAux.InterCambiar(P, False);
    X.Clave:= StrToInt(Elemento);
    if (P.Apilar(X) = OK) then begin
      Result:= True;
    end else begin
      Result:= False;
    end;
    P.InterCambiar(PAux, False);
  end else
    Result:= False;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Numero: String;
begin

  if (CantidadElementos(P) < 2000) then begin
    if (ValidarEdit(edit7.Text)) then begin
      Numero:= edit7.Text;
      if (ColocarAlFinal(Numero, P)) then begin
        memo1.Lines.Add('Elemento cargado al final con �xito');
      end else
        memo1.Lines.Add('No se pudo cargar el elemento');
    end else
      memo1.Lines.Add('Error, ingrese un numero entero');
  end else
    memo1.Lines.Add('Pila llena');
end;


//------------------------------------------------------------------------------
//BOTON DE ELIMINAR TODAS LAS OCURRENCIAS

Function BuscarElementoBoolean(Elemento: Integer; Var P: Pila): Boolean;
var
  X: TipoElemento;
  PAux: Pila;
  Encontrado: Boolean;
begin

  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  Encontrado:= False;
  while (not P.EsVacia) and (not Encontrado) do begin
    X:= P.Recuperar;
    if (X.Clave = Elemento) then begin
      Encontrado:= True;
    end else begin
      PAux.Apilar(X);
      P.DesApilar;
    end;
  end;
  P.InterCambiar(PAux, False);
  BuscarElementoBoolean:= Encontrado;

end;

Procedure EliminarTodaOcurrencia(Elemento: Integer; Var P: Pila);
var
  PAux: Pila;
  X: TipoElemento;
begin
  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  while (not P.EsVacia) do begin
    X:= P.Recuperar;
    if (X.Clave = Elemento) then begin
      P.DesApilar;
    end else begin
      PAux.Apilar(X);
      P.DesApilar;
    end;
  end;
  P.InterCambiar(PAux, False);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Edit: Integer;
begin

  if (not P.EsVacia) then begin
    if (ValidarEdit(edit8.Text)) then begin
      Edit:= StrToInt(edit8.Text);
      if (BuscarElementoBoolean(Edit, P)) then begin
        EliminarTodaOcurrencia(Edit, P);
        memo1.Lines.Add('Elemento Eliminado con �xito');
      end else
        memo1.Lines.Add('No se encontraron ocurrencias del elemento ' + edit8.Text);
    end else
      memo1.Lines.Add('Error, ingrese un numero entero');
  end else
    memo1.Lines.Add('Pila vac�a');
end;


//------------------------------------------------------------------------------
//Intercambiar valores de Tope y Fondo de la pila

Procedure IntercambiarTopeFondo(var P: Pila);
var
  Tope, Fondo: TipoElemento;
  PAux: Pila;
begin
  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  Tope:= P.Recuperar;
  P.DesApilar;
  PAux.InterCambiar(P, False);
  Fondo:= PAux.Recuperar;
  PAux.DesApilar;
  P.Apilar(Tope);
  P.InterCambiar(PAux, False);
  P.Apilar(Fondo);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (not P.EsVacia) then begin
    if (CantidadElementos(P) > 1) then begin
      IntercambiarTopeFondo(P);
      memo1.Lines.Add('Tope y fondo intercambiados exitosamente');
    end else
      memo1.Lines.Add('No es posible realiza esta accio�n ya que la Pila solo tiene un elemento');
  end else
    memo1.Lines.Add('Pila vac�a');
end;


//------------------------------------------------------------------------------
//Duplicar contenido de una pila

Function CopiarPila(P: Pila): Pila;
var
  X: TipoElemento;
  PCopia, PAux: Pila;
begin
  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  PCopia.Crear(P.DatoDeLaClave, P.SizeStack);
  PAux.InterCambiar(P, False);
  while (not PAux.EsVacia) do begin
    X:= PAux.Recuperar;
    P.Apilar(X);
    PCopia.Apilar(X);
    PAux.DesApilar;
  end;
  Result:= PCopia;
end;

Function DuplicarPila(var P: Pila): Pila;
var
  X: TipoElemento;
  PAux1, PAux2, PR: Pila;
begin
  PAux1.Crear(P.DatoDeLaClave, P.SizeStack);
  PAux2.Crear(P.DatoDeLaClave, P.SizeStack);
  PR.Crear(P.DatoDeLaClave, P.SizeStack*2);
  while (not P.EsVacia) do begin
    X:= P.Recuperar;
    PAux1.Apilar(X);
    PAux2.Apilar(X);
    P.DesApilar;
  end;
  PR.InterCambiar(PAux1, False);
  PR.InterCambiar(PAux2, False);
  Result:= PR;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  PCopiada, PDuplicada: Pila;
begin

  if (not P.EsVacia) then begin
    if (CantidadElementos(P) <= 1000) then begin
      PCopiada:= CopiarPila(P);
      PDuplicada:= DuplicarPila(PCopiada);
      MostrarPila('Pila Duplicada ', PDuplicada, memo1);
    end else
      memo1.Lines.Add('La pila no se puede duplicar porque exceder�a la cantidad de elementos posibles');
  end else
    memo1.Lines.Add('Pila vac�a');
end;


//------------------------------------------------------------------------------
//Es Palindromo

Function EsPalindromo(var P: Pila): Boolean;
var
  X1, X2: TipoElemento;
  P2, PAux: Pila;
  Iguales: Boolean;
begin
  PAux.Crear(P.DatoDeLaClave, P.SizeStack);
  P2.Crear(P.DatoDeLaClave, P.SizeStack);
  while (not P.EsVacia) do begin
    X1:= P.Recuperar;
    PAux.Apilar(X1);
    P2.Apilar(X1);
    P.DesApilar;
  end;
  P.InterCambiar(PAux, False);
  Iguales:= True;
  while ((not P.EsVacia) and (Iguales)) do begin
    X1:= P.Recuperar;
    X2:= P2.Recuperar;
    if (X1.Clave = X2.Clave) then begin
      PAux.Apilar(X1);
      P.DesApilar;
      P2.DesApilar;
    end else
      Iguales:= False;
  end;
  P.InterCambiar(PAux, False);
  Result:= Iguales;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (not P.EsVacia) then begin
    if (EsPalindromo(P)) then
      memo1.Lines.Add('La pila es pal�ndromo')
    else
      memo1.Lines.Add('La pila no es pal�ndromo');
  end else
    memo1.Lines.Add('Pila vac�a');
end;


//------------------------------------------------------------------------------
//Contar elementos de una pila

procedure TForm1.Button10Click(Sender: TObject);
begin
  if (not P.EsVacia) then begin
    memo1.Lines.Add('La cantidad de elementos en la pila es: ' + CantidadElementos(P).ToString);
  end else
    memo1.Lines.Add('La cantidad de elementos en la pila es 0');
end;

end.
