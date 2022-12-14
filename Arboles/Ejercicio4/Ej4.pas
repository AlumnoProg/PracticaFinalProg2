unit Ej4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinarios, QueuesPointer,
  Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Memo1: TMemo;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AB, AB2: Arbol;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
//CREAR ARBOLES

procedure TForm1.Button1Click(Sender: TObject);
begin
  AB.Crear(Cadena, AB.MaxSizeTree);
  AB2.Crear(Cadena, AB2.MaxSizeTree);
  memo1.Lines.Add('Arboles creado con ?xito');
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
  if (AB.CargarArbol = OK) then begin
    if (ValidarCarga(AB)) then
      memo1.Lines.Add('Arbol 1 cargado con ?xito')
    else
      memo1.Lines.Add('Error, ingrese valores permitidos');
  end else
    memo1.Lines.Add('No se pudo cargar el arbol');
end;


//------------------------------------------------------------------------------
//CARGAR ARBOL 2

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (AB2.CargarArbol = OK) then begin
    if (ValidarCarga(AB2)) then
      memo1.Lines.Add('Arbol 2 cargado con ?xito')
    else
      memo1.Lines.Add('Error, ingrese valores permitidos');
  end else
    memo1.Lines.Add('No se pudo cargar el arbol');
end;


//------------------------------------------------------------------------------
//VER ARBOLES

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

procedure TForm1.Button4Click(Sender: TObject);
begin
  MostrarArbol('Arbol binario 1', AB, Memo1);
  MostrarArbol('Arbol binario 2', AB2, Memo1);
end;


//------------------------------------------------------------------------------
//RECORRIDO EN ANCHURA

Function esPadre(PA: PosicionArbol): Boolean;
begin
  esPadre:= False;
  if (AB.HijoIzquierdo(PA) <> NULO) then
    esPadre:= True;
end;

Function RecorridoEnAnchura(): String;
var
  Recorrido: String;
  Procedure BuscarP(PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (not AB.RamaNula(PA)) then begin
      X:= AB.Recuperar(PA);
      Recorrido:= Recorrido + ' ' + VarToStr(X.Clave);
      BuscarP(AB.HijoDerecho(PA));
      if (esPadre(PA)) then
        BuscarP(AB.HijoIzquierdo(PA));
    end;
  end;
begin
  Recorrido:= '' + VarToStr(AB.Root^.Datos.Clave);
  BuscarP(AB.HijoIzquierdo(AB.Root));
  Result:= Recorrido;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (not AB.EsVacio) then begin
    memo1.Lines.Add('Recorrido en anchura de izquierda a derecha');
    Memo1.Lines.Add(RecorridoEnAnchura);
  end else
    memo1.Lines.Add('Arbol vac?o');
end;


//------------------------------------------------------------------------------
//NUMERO DE HOJAS

Function esHoja(PA: PosicionArbol): Boolean;
begin
  esHoja:= False;
  if (AB.HijoIzquierdo(PA) = NULO) then
    esHoja:= True;
end;

Function CantHojas(var Listado: String): Integer;
var
  CHojas: Integer;
  Procedure Buscar(PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    if (not AB.RamaNula(PA)) then begin
      Buscar(PA^.HI);
      X:= AB.Recuperar(PA);
      if (esHoja(PA)) then begin
        Listado:= Listado + ' ' + VarToStr(X.Clave) + ' - ';
        Inc(CHojas);
      end;
      Buscar(PA^.HD);
    end;
  end;
begin
  CHojas:= 0;
  Listado:= '';
  Buscar(AB.Root);
  Result:= CHojas;
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
  CHojas: Integer;
  Listado: String;
begin
  if (not AB.EsVacio) then begin
    CHojas:= CantHojas(Listado);
    if (CHojas > 0) then begin
      memo1.Lines.Add('Cantidad de hojas: ' + CHojas.ToString);
      memo1.Lines.Add(' ');
      memo1.Lines.Add(Listado);
    end else
      memo1.Lines.Add('La cantidad de hojas es 0');
  end else
    memo1.Lines.Add('Arbol vac?o');
end;


//------------------------------------------------------------------------------
//ARBOL SIMINAR

Function esArbolSimilar(): Boolean;
var
  esSimilar: Boolean;
  Procedure BuscarS(PA1, PA2: PosicionArbol);
  begin
    if (not AB.RamaNula(PA1)) and (not AB2.RamaNula(PA2)) then begin
      if ((AB.HijoIzquierdo(PA1) <> NULO) and (AB2.HijoIzquierdo(PA2) <> NULO)) then begin
        BuscarS(AB.HijoIzquierdo(PA1), AB2.HijoIzquierdo(PA2));
      end else
      if((AB.HijoIzquierdo(PA1)=NULO)and(AB2.HijoIzquierdo(PA1)=NULO))then begin

      end;
      if((AB.HijoDerecho(PA1)<>NULO)and(AB2.HijoDerecho(PA2)<>NULO))then begin
        BuscarS(AB.HijoDerecho(PA1), AB2.HijoDerecho(PA2));
      end else
      if((AB.HijoDerecho(PA1)=NULO)and(AB2.HijoDerecho(PA1)=NULO))then
      else EsSimilar:= False;
    end else
      if(AB.RamaNula(PA1))and(AB2.RamaNula(PA2))then begin

      end else
        EsSimilar:= False;
  end;
begin
  esSimilar:= True;
  BuscarS(AB.Root, AB2.Root);
  Result:= esSimilar;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (not AB.EsVacio) and (not AB2.EsVacio) then begin
    if (esArbolSimilar) then
      memo1.Lines.Add('Son similares')
    else
      memo1.Lines.Add('No son similares');
  end else begin
    if (AB.EsVacio) and (AB2.EsVacio) then
      memo1.Lines.Add('Son similares')
    else begin
      if ((AB.EsVacio)and(Not AB2.EsVacio))or((Not AB.EsVacio)and(AB2.EsVacio)) then
        memo1.Lines.Add('No son similares');
    end;
  end;
end;


//------------------------------------------------------------------------------
//Anchura iterativa

Function RecorridoEnAnchuraIT(): String;
var
  C: Cola;
  S: String;
  PA: PosicionArbol;
  X: TipoElemento;
begin
  S:= '';
  if (not AB.EsVacio) then begin
    C.Crear(AB.DatoDeLaClave, AB.SizeTree);
    X:= AB.Recuperar(AB.Root);
    X.Valor2:= AB.Root;
    C.Encolar(X);
    while (not C.EsVacia) do begin
      X:= C.Recuperar;
      C.DesEncolar;
      PA:= X.Valor2;
      while (not AB.RamaNula(PA)) do begin
        S:= S + VarToStr(PA^.Datos.Clave);
        if (AB.HijoIzquierdo(PA) <> NULO) then begin
          X:= AB.Recuperar(PA^.HI);
          X.Valor2:= PA^.HI;
          C.Encolar(X);
        end;
        PA:= PA^.HD;
      end;
    end;
  end;
  Result:= S;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (not AB.EsVacio) then begin
    memo1.Lines.Add('Recorrido en anchura de izquierda a derecha');
    Memo1.Lines.Add(RecorridoEnAnchuraIT);
  end else
    memo1.Lines.Add('Arbol vac?o');
end;


//------------------------------------------------------------------------------
//Numero de hojas iterativo

Function esHojaIT(X: TipoElemento): Boolean;
begin
  esHojaIT:= False;
  if (AB.HijoIzquierdo(X.Valor2) = NULO) then
    esHojaIT:= True;
end;

Function CantHojasIT(Var Listado: String): Integer;
var
  CHojas: Integer;
  X: TipoElemento;
  PA: PosicionArbol;
  C: Cola;
begin
  CHojas:= 0;
  Listado:= '';
  PA:= AB.Root;
  C.Crear(AB.DatoDeLaClave, AB.SizeTree);
  while (PA <> NULO) or (not C.EsVacia) do begin
    while (PA <> NULO) do begin
      X:= AB.Recuperar(PA);
      X.Valor2:= PA;
      C.Encolar(X);
      PA:= AB.HijoIzquierdo(X.Valor2);
    end;
    if (PA = NULO) and (not C.EsVacia) then begin
      X:= C.Recuperar;
      if (esHojaIT(X)) then begin
        Inc(CHojas);
        Listado:= Listado + ', ' + VarToStr(X.Clave);
      end;
      C.DesEncolar;
      PA:= AB.HijoDerecho(X.Valor2);
    end;
  end;
  Result:= CHojas;
end;

procedure TForm1.Button10Click(Sender: TObject);
Var
  CHojas: Integer;
  Listado: String;
begin
  if (not AB.EsVacio) then begin
    CHojas:= CantHojasIT(Listado);
    if (CHojas > 0) then begin
      memo1.Lines.Add('Cantidad de hojas: ' + CHojas.ToString);
      memo1.Lines.Add(' ');
      memo1.Lines.Add(Listado);
    end else
      memo1.Lines.Add('La cantidad de hojas es 0');
  end else
    memo1.Lines.Add('Arbol vac?o');
end;

end.
