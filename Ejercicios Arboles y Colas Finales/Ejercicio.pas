unit Ejercicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinarios, QueuesPointer,
  Vcl.StdCtrls;

Const MaxCadena = 255;
      MaxCola = 2000;
      MaxEntero = 9999999;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Arbol;
  C: Cola;

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
    if(C.MaxSizeQueue=MaxCola)then begin
      C.Crear(Cadena, Longitud);
    end else begin
      C.Crear(Cadena, Longitud+1);
    end;
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -COLA DEFINIDA- ');
  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' Ingrese valor entero entre 1 y '+MaxCola.ToString+'. ');

  end;
end;


//------------------------------------------------------------------------------
//CARGAR COLA

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
  if (not C.EsLlena) then begin
    if (CargarCola(edit2.Text, C)) then begin
      memo1.Lines.Add(edit2.Text + ' cargado en la cola');
    end else
      memo1.Lines.Add('Error, ingrese los datos correctamente');
  end else
    memo1.Lines.Add('Cola llena');
end;


//------------------------------------------------------------------------------
//Mostrar cola

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

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add(' ');
  MostrarCola('Cola: ',C, memo1);
end;

//------------------------------------------------------------------------------
//Verificar cola ordenada recursivo

Function fprocesarColaEnteros(var C: Cola): Boolean;
var
  CAux: Cola;
  Ordenada: Boolean;
  Anterior: TipoElemento;
  procedure RecorrerCola(Var Anterior: TipoElemento; Var CAux: Cola; Var Flag: Boolean);
  var
    Actual: TipoElemento;
  begin
    if (not C.EsVacia) and (Flag) then begin
      Actual:= C.Recuperar;
      if (Actual.Clave < Anterior.Clave) then
        Flag:= False;
      CAux.Encolar(Actual);
      Anterior:= Actual;
      C.DesEncolar;
      RecorrerCola(Anterior, CAux, Flag);
    end;
  end;
begin
  CAux.Crear(C.DatoDeLaClave, C.SizeQueue);
  Ordenada:= True;
  Anterior:= C.Recuperar;
  CAux.Encolar(Anterior);
  C.DesEncolar;
  RecorrerCola(Anterior, CAux, Ordenada);
  C.InterCambiar(CAux, False);
  Result:= Ordenada;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (not C.EsVacia) then begin
    if (fprocesarColaEnteros(C)) then begin
      memo1.Lines.Add('La cola esta ordenada');
    end else
      memo1.Lines.Add('La cola no esta ordenada');
  end else
    memo1.Lines.Add('Cola vac�a');
end;


//------------------------------------------------------------------------------
//Crear Arbol

procedure TForm1.Button5Click(Sender: TObject);
begin
  A.Crear(Cadena, A.MaxSizeTree);
  memo1.Lines.Add('Arbol creado con �xito');
  memo1.Lines.Add(' ');
end;


//------------------------------------------------------------------------------
//Cargar arbol

Function SinEspacios2(S: String): Boolean;
Var Posicion: Integer;

Begin

  Posicion:= 1;
  SinEspacios2:= False;

  while(Posicion<=Length(S))and(S[Posicion]<>' ')do
    Inc(Posicion);

  if(Posicion>Length(S))then SinEspacios2:= True;

End;

Function ValidarCadena(NCadena: TipoElemento): Boolean;
Begin

  ValidarCadena:= False;
  if(NCadena.Clave<>'')and(SinEspacios2(NCadena.Clave))
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

procedure TForm1.Button6Click(Sender: TObject);
begin
  if (A.CargarArbol = OK) then begin
    if (ValidarCarga(A)) then
      memo1.Lines.Add('Arbol cargado con �xito')
    else
      memo1.Lines.Add('Error, ingrese valores permitidos');
  end else
    memo1.Lines.Add('No se pudo cargar el arbol');
end;


//------------------------------------------------------------------------------
//Mostrar Arbol

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

procedure TForm1.Button7Click(Sender: TObject);
begin
  MostrarArbol('Arbol N-Ario: ', A, Memo1);
end;


//------------------------------------------------------------------------------
//Ver nodos Hijos recursivo

Function RetornarNodosDosHijos(Var A: Arbol): Cola;
var
  CAux: Cola;
  Procedure BuscarNodos(PA: PosicionArbol; Var Nodos: Cola);
  var
    PAAux: PosicionArbol;
    X: TipoElemento;
  begin
    if (not A.RamaNula(PA)) then begin
      BuscarNodos(PA^.HI, Nodos);
      if (A.HijoIzquierdo(PA) <> NULO) then begin
        PAAux:= A.HijoIzquierdo(PA);
        if (A.HijoDerecho(PAAux) <> NULO) and (A.HijoDerecho(A.HijoDerecho(PAAux)) <> NULO) then begin
          X:= A.Recuperar(PA);
          Nodos.Encolar(X);
        end;
      end;
      BuscarNodos(PA^.HD, Nodos);
    end;
  end;
begin
  CAux.Crear(A.DatoDeLaClave, A.SizeTree);
  BuscarNodos(A.Root, CAux);
  Result:= CAux;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  CAux: Cola;
begin
  if (not A.EsVacio) then begin
    CAux.Crear(A.DatoDeLaClave, A.SizeTree);
    CAux:= RetornarNodosDosHijos(A);
    if (not CAux.EsVacia) then begin
      MostrarCola('Nodos con dos Hijos: ', CAux, memo1);
    end else
      memo1.Lines.Add('No existen nodos con dos hijos');
  end else
    memo1.Lines.Add('Arbol vacio');
end;

end.
