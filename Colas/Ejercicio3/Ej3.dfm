object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 525
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Longitud de las colas : '
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 80
    Height = 16
    Caption = 'Carga manual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 106
    Width = 97
    Height = 13
    Caption = 'Elemento a cargar : '
  end
  object Label4: TLabel
    Left = 8
    Top = 183
    Width = 97
    Height = 13
    Caption = 'Elemento a cargar : '
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 54
    Width = 121
    Height = 25
    Caption = 'Definir colas'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 458
    Height = 512
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 8
    Top = 125
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Cargar en cola 1'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 229
    Width = 121
    Height = 25
    Caption = 'Cargar en cola 2'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 202
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 6
  end
  object Button4: TButton
    Left = 8
    Top = 260
    Width = 121
    Height = 25
    Caption = 'Mostrar Colas'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 291
    Width = 121
    Height = 25
    Caption = 'Iguales?'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 322
    Width = 121
    Height = 56
    Caption = 'Limpiar Pantalla'
    TabOrder = 9
  end
  object Button7: TButton
    Left = 8
    Top = 400
    Width = 93
    Height = 41
    Caption = 'Iguales Recursivo'
    TabOrder = 10
    OnClick = Button7Click
  end
end
