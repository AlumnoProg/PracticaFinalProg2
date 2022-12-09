unit Ej8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinarios, QueuesPointer,
  Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label5: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
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
  A: Arbol;
  Q: Integer;

implementation

{$R *.dfm}

Procedure MostrarArbol(Cartel: String; Var A: Arbol; Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' || ');
  Memo1.Lines.Add(' ');
  if(Not A.EsVacio)then begin

    Memo1.Lines.Add(' Raiz : '+A.Root.Datos.ArmarString);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' '+A.InOrden);
    Memo1.Lines.Add(' ');

  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -ARBOL VACIO- ');

  end;

End;

//------------------------------------------------------------------------------
//CREAR ARBOL

procedure TForm1.Button1Click(Sender: TObject);
begin
  A.Crear(Cadena, A.MaxSizeTree);
  memo1.Lines.Add('Arboles creado con éxito');
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//CARGAR ARBOL 1

Function SinEspacios(S: String): Boolean;
Var Posicion: Integer;

Begin

  Posicion:= 1;
  SinEspacios:= False;

  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);

  if(Posicion>Length(S))then SinEspacios:= True;

End;

Function ValidarCadena(NCadena: TipoElemento): Boolean;
Begin

  ValidarCadena:= False;
  if(NCadena.Clave<>'')and(SinEspacios(NCadena.Clave))
  and(Length(NCadena.Clave)<=MaxCadena)then
    ValidarCadena:= True;

End;

Function ValidarCarga(Var A: Arbol): Boolean;
var
  Valido: Boolean;
  Procedure Buscar(PA: PosicionArbol);
  Var
    TeA: TipoElemento;
  Begin

    If(Not A.RamaNula(PA))Then begin
      Buscar(PA^.HI);
      TeA:= A.Recuperar(PA);
      if(Not ValidarCadena(TeA))then
          Valido:= False;
      Buscar(PA^.HD);
    end;

  End;
begin

  Valido:= True;
  Buscar(A.Root);
  if(Valido)then
    ValidarCarga:= True
  else ValidarCarga:= False;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (A.CargarArbol = OK) then begin
    if (ValidarCarga(A)) then
      memo1.Lines.Add('Arbol cargado con éxito')
    else
      memo1.Lines.Add('Error, ingrese valores permitidos');
  end else
    memo1.Lines.Add('No se pudo cargar el arbol');
end;


//------------------------------------------------------------------------------
//Altura

Procedure AlturaArbol(memo1: Tmemo);
var
  Alt, AltAux: Integer;
  PA: PosicionArbol;
  Procedure Altura(Var Altu: Integer; PA: PosicionArbol);
  begin
    if (not A.RamaNula(A.HijoIzquierdo(PA))) then begin
      Inc(AltAux);
      Altura(Alt, A.HijoIzquierdo(PA));
    end;
    if (AltAux > Altu) then
      Altu:= AltAux;
    if not A.RamaNula(A.HijoDerecho(A.HijoIzquierdo(PA))) then
      PA:=A.HijoIzquierdo(PA);
  end;
begin
  Alt:= 0;
  AltAux:= 0;
  PA:= A.Root;
  if (not A.RamaNula(PA)) then begin
    Altura(Alt, PA);
    memo1.Lines.Add('La altura es: ' + IntToStr(Alt + 1));
  end else
    memo1.Lines.Add('La altura es: 0');

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (not A.EsVacio) then
    AlturaArbol(memo1)
  else
    memo1.lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//Nodos interiores

Function MostrarNodosInternos(A: Arbol): String;
var
  S: String;
  Procedure NodosInteriores(PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (PA <> NULO) then begin
      if ((PA <> A.Root) and (PA^.HI <> NULO)) then
        if (Length(S) = 0) then
          S:= VarToStr(PA.Datos.Clave)
        else
          S:= S + ' ' + VarToStr(PA.Datos.Clave);
      NodosInteriores(PA^.HI);
      NodosInteriores(PA^.HD);
    end;
  end;
begin
  S:= '';
  NodosInteriores(A.Root);
  if (S <> '') then
    MostrarNodosInternos:= 'Nodos Internos: ' + S +'.'
  else
    MostrarNodosInternos:='Nodos Internos: no se encontraron nodos internos';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (not A.EsVacio) then
    memo1.Lines.Add(MostrarNodosInternos(A))
  else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//Nivel Hojas

Function esHoja(PA: PosicionArbol): Boolean;
begin
  esHoja:= False;
  if ((A.HijoIzquierdo(PA) = NULO)) then
    esHoja:= True;
end;

Function Nivel(Nodo: String): Integer;
var
  X: TipoElemento;
  PA: PosicionArbol;
  Encontre: Boolean;
  Nive: Integer;
  Procedure NivelNodo(NNodo: Integer; X: TipoElemento; PA: PosicionArbol);
  var
    X1: TipoElemento;
  begin

    if (not A.RamaNula(PA)) and (not Encontre) then begin
      X1:= PA.Datos;
      if (X.Clave = X1.Clave) then begin
        Nive:= NNodo;
        Encontre:= True;
      end;
      NivelNodo((NNodo + 1), X, A.HijoIzquierdo(PA));
      NivelNodo(NNodo , X, A.HijoDerecho(PA));
    end;

  end;
begin
  Encontre:= False;
  X.Clave:= Nodo;
  PA:= A.Root;
  NivelNodo(0, X, PA);
  if (not Encontre) then
    Nivel:= -1
  else
    Nivel:= Nive;
end;

Function esNivel(Niv: Integer): Boolean;
  Procedure CH(PA: PosicionArbol; Var N: Integer);
  var
    X, Y: TipoElemento;
  begin

    if (not A.RamaNula(PA)) then begin
      if (esHoja(PA)) then begin
        X:= A.Recuperar(PA);
        if ((Nivel (VArTostr(X.Clave))) <> N) then
          N:= -1;
      end;
      CH (A.HijoIzquierdo(PA), N);
      CH (A.HijoDerecho(PA),N);
    end;

  end;
var
  i: Integer;
begin

  i:= Niv;
  CH(A.Root, i);
  if (i = -1) then
    esNivel:= False
  else
    esNivel:= True;

end;

Function NivelHojas(): Boolean;
var
  Flag: Boolean;
  Procedure NH(PA: PosicionArbol; Var Flag: Boolean);
  var
    Niv: Integer;
    X: TipoElemento;
  begin
    if (not A.RamaNula(PA) and (Flag)) then begin
      if (esHoja(PA)) then begin
        X:= A.Recuperar(PA);
        Niv:= Nivel(VarToStr(X.Clave));
        if (not esNivel(Niv)) then
          Flag:= False;
      end;
      NH(A.HijoIzquierdo(PA), Flag);
      NH(A.HijoDerecho(PA), Flag);
    end;
  end;
begin
  Flag:= True;
  NH(A.Root, Flag);
  Result:= Flag;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not A.EsVacio) then begin
    if (NivelHojas) then
      memo1.Lines.Add('Las hojas están al mismo nivel')
    else
      memo1.Lines.Add('Las hojas no están la mismo nivel');
  end else
    memo1.Lines.Add('Arbol vacío');
end;


//------------------------------------------------------------------------------
//NIVEL NODO

procedure TForm1.Button6Click(Sender: TObject);
var
  X: TipoElemento;
begin
  if (not A.EsVacio) then begin
    X.Clave:= edit1.Text;
    if (ValidarCadena(X)) then begin
      if (Nivel(edit1.Text) = -1) then begin
        memo1.Lines.Add('No se encontro el nodo');
      end else
        memo1.Lines.Add('El nivel del nodo ' + edit1.Text + ' es: ' + Nivel(edit1.Text).ToString);
    end else
      memo1.Lines.Add('Error, ingrese un nodo válido');
  end else
    memo1.Lines.Add('Arbol vacío');
end;

end.
