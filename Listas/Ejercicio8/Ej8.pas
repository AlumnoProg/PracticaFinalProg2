unit Ej8;

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
    Edit3: TEdit;
    Button3: TButton;
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
  edit2.Clear;
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
  edit3.Clear;
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
//SubLista

Function esSublista(L1Aux, L2Aux: Lista):Boolean;
var
  P1, P2: PosicionLista;
  X1, X2: TipoElemento;
  SubLista, Iguales: Boolean;
begin
  P1:= L1Aux.Comienzo;
  P2:= L2Aux.Comienzo;
  SubLista:= True;
  while (P2 <> NULO) and (SubLista) do begin
    X2:= L2Aux.Recuperar(P2);
    Iguales:= False;
    while ((P1 <> NULO) and (not Iguales)) do begin
      X1:= L1Aux.Recuperar(P1);
      if (X1.Clave = X2.Clave) then
        Iguales:= True;
      P1:= L1Aux.Siguiente(P1);
    end;
    if (Iguales = True) then begin
      P2:= L2Aux.Siguiente(P2);
      P1:= L1Aux.Comienzo;
    end else
      SubLista:= False;
  end;
  Result:= SubLista;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not L1.EsVacia) and (not L2.EsVacia) then begin
    if (esSubLista(L1, L2)) then begin
      memo1.Lines.Add('La lista 1 es sublista de la lista 2');
    end else
      memo1.Lines.Add('La lista 1 no es sublista de la lista 2');
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
