unit Ej12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinarios, ArbolesBinariosAVL,
  Vcl.StdCtrls;

Const MaxEntero = 9999999;
      MaxCadena = 255;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Arbol;
  Clave: String;

implementation

{$R *.dfm}

Procedure CartelInicio(Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ---------------------------------------------------------------------------------------------------');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' Primero, ingrese el tipo de clave del arbol. ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' Tipo clave -> NUMERO - CADENA. ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' Espacios no permitidos. ');

End;

Procedure MostrarArbolAVL(Cartel: String; Var AAVL: ArbolAVL; Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' || '+Cartel+' || ');
  Memo1.Lines.Add(' ');
  if(Not A.EsVacio)then begin

    //Memo1.Lines.Add(' Raiz : '+AAVL.RootAVL.Datos.ArmarString);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' '+AAVL.InOrden);
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' Altura : '+AAVL.Altura.ToString);

  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -ARBOL VACIO- ');
  end;

End;

Procedure CartelNumero(Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ---------------------------------------------------------------------------------------------------');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' Valores permitidos a ingresar en el arbol : ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('  -Valores de tipo numerico entre -'+MaxEntero.ToString+' y '+MaxEntero.ToString+'. ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('  -Espacios no permitidos. ');
  Memo1.Lines.Add(' ');

End;

Procedure CartelCadena(Memo1: TMemo);
Begin

  Memo1.Lines.Add(' ---------------------------------------------------------------------------------------------------');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(' Valores permitidos a ingresar en el arbol : ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('  -Valores de tipo alfabeticos, numericos y signos. ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('  -Longitud de la cadena debe estar entre 1 y '+MaxCadena.ToString+'. ');
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('  -Espacios no permitidos. ');
  Memo1.Lines.Add(' ');

End;

//------------------------------------------------------------------------------
//Definir tipo clave

Function ValidarTipoClave(NTClave: String): Boolean;
Begin

  if(NTClave='NUMERO')then begin

    Clave:= 'NUMERO';
    ValidarTipoClave:= True;

  end else

  if(NTClave='CADENA')then begin

    Clave:= 'CADENA';
    ValidarTipoClave:= True;

  end else ValidarTipoClave:= False;

End;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  if(ValidarTipoClave(Edit1.Text))then begin

    A.Crear(Cadena, A.MaxSizeTree);

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -ARBOL DEFINIDO- ');

    if(Clave='NUMERO')then
      CartelNumero(Memo1)
    else CartelCadena(Memo1);

  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -INGRESE VALORES PERMITIDOS- ');
    CartelInicio(Memo1);

  end;
end;


//------------------------------------------------------------------------------
//Cargar arbol

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
    Memo1.Lines.Add(' Altura : '+A.Altura.ToString);

  end else begin

    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -ARBOL VACIO- ');

  end;

End;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  if(A.CargarArbol=OK)then begin
      Memo1.Lines.Add(' ');
      Memo1.Lines.Add(' -ARBOL CARGADO- ');
      Memo1.Lines.Add(' ');
      MostrarArbol('Arbol binario', A, Memo1);
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -NO SE PUDO CARGAR EL ARBOL- ');
  end;
end;


//------------------------------------------------------------------------------
//Ver arbol

procedure TForm1.Button3Click(Sender: TObject);
begin
  MostrarArbol('ARBOL BINARIO', A, Memo1);
end;


//------------------------------------------------------------------------------
//Pasar a AVL

Function PasarAArbolAVL(Var A: Arbol): ArbolAVL;
Var
  AAVL: ArbolAVL;
  Procedure CargarArbolAVL(PA: PosicionArbol);
  var
    X: TipoElemento;
  begin
    If(Not A.RamaNula(PA))Then Begin
      CargarArbolAVL(PA^.HI);
      X:= A.Recuperar(PA);
      AAVL.Insertar(X);
      CargarArbolAVL(PA^.HD);
    end;
  end;
begin
  AAVL.Crear(A.DatoDeLaClave, A.SizeTree);
  CargarArbolAVL(A.Root);
  Result:= AAVL;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var
  AAVL: ArbolAVL;
Begin
  if(Not A.EsVacio)then begin
    AAVL:= PasarAArbolAVL(A);
    Memo1.Lines.Add(' ');
    MostrarArbol('ARBOL BINARIO', A, Memo1);
    Memo1.Lines.Add(' ');
    MostrarArbolAVL('ARBOL BINARIO DE BUSQUEDA AVL', AAVL, Memo1);
  end else begin
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' -ARBOL VACIO- ');
    Memo1.Lines.Add(' ');
    Memo1.Lines.Add(' No se puede realizar la operacion. ');
  end;
end;

end.
