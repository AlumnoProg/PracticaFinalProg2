object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 438
  ClientWidth = 550
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
    Width = 122
    Height = 13
    Caption = 'Longitud de los conjuntos'
  end
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 88
    Height = 16
    Caption = 'Carga manual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 107
    Width = 97
    Height = 13
    Caption = 'Elemento a cargar : '
  end
  object Label4: TLabel
    Left = 8
    Top = 213
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
    Caption = 'Definir longitud'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 126
    Width = 121
    Height = 21
    MaxLength = 7
    NumbersOnly = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 153
    Width = 121
    Height = 54
    Caption = 'Cargar en conjunto A'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 232
    Width = 121
    Height = 21
    MaxLength = 7
    NumbersOnly = True
    TabOrder = 4
  end
  object Button3: TButton
    Left = 8
    Top = 259
    Width = 121
    Height = 54
    Caption = 'Cargar en conjunto B'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 410
    Height = 425
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Button4: TButton
    Left = 8
    Top = 320
    Width = 121
    Height = 54
    Caption = 'Ver conjuntos'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 380
    Width = 121
    Height = 54
    Caption = 'Ver si son iguales'
    TabOrder = 8
    OnClick = Button5Click
  end
end
