unit Ej4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListArray, Tipos, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L1, L2: Lista;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
//CREAR LISTA

Function ValidarTamanio(Tamanio: String):Boolean;
var
  i:integer;
begin

  if (not(TryStrToInt(Tamanio, i))) or (i < 1) or (i > 2000) then
    ValidarTamanio:= False
  else
    ValidarTamanio:= True;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Tamanio: String;
begin
  Tamanio:= edit1.Text;
  if (ValidarTamanio(Tamanio)) then begin
    L1.Crear(Numero, StrToInt(Tamanio));
    L2.Crear(Numero, StrToInt(Tamanio));
    memo1.Lines.Add('Listas creadas con �xito');
  end else
    memo1.Lines.Add('Error, ingrese un numero entero entre 1 y 2000');
end;


//------------------------------------------------------------------------------
//CARGAR LISTA 1

Function ValidarEdit(Edit: String):Boolean;
var
  i: integer;
begin

  if (not(TryStrToInt(Edit, i))) then
    ValidarEdit:= False
  else
    ValidarEdit:= True;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X: TipoElemento;
  Numero: String;
begin
  Numero:= edit2.Text;
  if (L1.EsLLena = False) then begin
    if (ValidarEdit(Numero)) then begin
      X.Clave:= StrToInt(Numero);
      L1.Agregar(X);
      memo1.Lines.Add(Numero + ' cargado con �xito en la lista 1');
    end else
      memo1.Lines.Add('Error, ingrese un numero entero');
  end else
    memo1.Lines.Add('Lista 1 llena');
end;


//------------------------------------------------------------------------------
//CARGAR LISTA 2

procedure TForm1.Button3Click(Sender: TObject);
var
  X: TipoElemento;
  Numero: String;
begin
  Numero:= edit3.Text;
  if (L2.EsLLena = False) then begin
    if (ValidarEdit(Numero)) then begin
      X.Clave:= StrToInt(Numero);
      L2.Agregar(X);
      memo1.Lines.Add(Numero + ' cargado con �xito en la lista 2');
    end else
      memo1.Lines.Add('Error, ingrese un numero entero');
  end else
    memo1.Lines.Add('Lista 2 llena');
end;


//------------------------------------------------------------------------------
//MOSTRAR LISTAS

procedure TForm1.Button4Click(Sender: TObject);
begin
  if L1.EsVacia=False then begin
   memo1.Lines.add('--------------------------');
   memo1.Lines.add('Lista 1:');
   memo1.Lines.add(L1.RetornarClaves);
   memo1.Lines.Add('---------------------------');
  end
  else begin
    memo1.Lines.Add('---------------------------');
    memo1.Lines.add('La lista 1 est� vacia.');
  end;

  if L2.EsVacia=false then begin
    memo1.Lines.add('---------------------------');
    memo1.Lines.add('Lista 2:');
    memo1.Lines.add(L2.RetornarClaves);
    memo1.Lines.add('---------------------------');
  end
  else  begin
    memo1.Lines.Add('---------------------------');
    memo1.Lines.add('La lista 2 est� vacia.');
  end;
end;


//------------------------------------------------------------------------------
//Verificar igualdad

Function esIgual(L1Aux, L2Aux: Lista): Boolean;
var
  P1, P2: PosicionLista;
  X1, X2: TipoElemento;
  Iguales, Iguales2: Boolean;
begin
  P1:= L1Aux.Comienzo;
  P2:= L2Aux.Comienzo;
  Iguales:= True;
  while (P1 <> NULO) and (Iguales) do begin
    X1:= L1Aux.Recuperar(P1);
    Iguales2:= False;
    while (P2 <> NULO) and (not Iguales2) do begin
      X2:= l2Aux.Recuperar(P2);
      if (X1.Clave = X2.Clave) then begin
        Iguales2:= True;
      end;
      P2:= L2Aux.Siguiente(P2);
    end;
    if (Iguales2) then begin
      P1:= L1Aux.Siguiente(P1);
      P2:= L2Aux.Comienzo;
    end else
      Iguales:= False;
  end;
  Result:= Iguales;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not L1.EsVacia) and (not L2.EsVacia) then begin
    if (esIgual(L1, l2)) and (esIgual(L2, L1)) then begin
      memo1.Lines.Add('Las listas son iguales');
    end else
      memo1.Lines.Add('Las listas no son iguales');
  end else begin
    if(Not L1.EsVacia)and(L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTA 2 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las lista 2 para evaluarlas. ');
    end;
    if(L1.EsVacia)and(Not L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTA 1 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las lista 1 para evaluarlas. ');
    end;
    if(L1.EsVacia)and(L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTAS VACIAS- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las listas para evaluarlas. ');
    end;
  end;
end;


//------------------------------------------------------------------------------
//Iguales Recursivo

Procedure RecorrerL2(P: PosicionLista; Elemento: TipoElemento;Var Iguales: Boolean);
var
  X: TipoElemento;
begin
  if (P <> NULO) and (not Iguales) then begin
    X:= L2.Recuperar(P);
    if (X.Clave = Elemento.Clave) then
      Iguales:= True;
    P:= L2.Siguiente(P);
    RecorrerL2(P, Elemento, Iguales);
  end;
end;

Function esIgualRec(): Boolean;
var
  P1, P2: PosicionLista;
  Iguales: Boolean;
  Procedure RecorrerL1(P1, P2: PosicionLista; Var Flag: Boolean);
  var
    X: TipoElemento;
    Iguales2: Boolean;
  begin
    if (P1 <> NULO) and (Flag) then begin
      X:= L1.Recuperar(P1);
      Iguales2:= False;
      RecorrerL2(P2, X, Iguales2);
      if (not Iguales2) then
        Flag:= False;
      P1:= L1.Siguiente(P1);
      P2:= L2.Comienzo;
      RecorrerL1(P1, P2, Flag);
    end;
  end;
begin
  Iguales:= True;
  P1:= L1.Comienzo;
  P2:= L2.Comienzo;
  RecorrerL1(P1, P2, Iguales);
  Result:= Iguales;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (not L1.EsVacia) and (not L2.EsVacia) then begin
    if (esIgualRec) and (esIgualRec) then begin
      memo1.Lines.Add('Las listas son iguales');
    end else
      memo1.Lines.Add('Las listas no son iguales');
  end else begin
    if(Not L1.EsVacia)and(L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTA 2 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las lista 2 para evaluarlas. ');
    end;
    if(L1.EsVacia)and(Not L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTA 1 VACIA- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las lista 1 para evaluarlas. ');
    end;
    if(L1.EsVacia)and(L2.EsVacia)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -LISTAS VACIAS- ');
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' Ingrese valores en las listas para evaluarlas. ');
    end;
  end;
end;

end.
