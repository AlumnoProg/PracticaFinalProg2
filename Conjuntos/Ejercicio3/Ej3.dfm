object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 505
  ClientWidth = 473
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
    Top = 325
    Width = 72
    Height = 13
    Caption = 'OPERACIONES'
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 52
    Height = 13
    Caption = 'ELEMENTO'
  end
  object Label4: TLabel
    Left = 8
    Top = 139
    Width = 35
    Height = 13
    Caption = 'CARGA'
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 13
    Caption = 'LARGO'
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 335
    Height = 492
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 66
    Top = 101
    Width = 63
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 158
    Width = 121
    Height = 35
    Caption = 'CARGAR CONJUNTO 1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 215
    Width = 121
    Height = 34
    Caption = 'CARGAR CONJUNTO 2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 271
    Width = 121
    Height = 34
    Caption = 'CARGAR CONJUNTO 3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 344
    Width = 121
    Height = 33
    Caption = 'UNION'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 408
    Width = 121
    Height = 33
    Caption = 'INTERSECCION'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Edit2: TEdit
    Left = 66
    Top = 5
    Width = 63
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 7
  end
  object Button6: TButton
    Left = 8
    Top = 32
    Width = 121
    Height = 35
    Caption = 'CREAR CONJUNTOS'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 464
    Width = 121
    Height = 33
    Caption = 'MOSTRAR CONJUNTOS'
    TabOrder = 9
  end
end
