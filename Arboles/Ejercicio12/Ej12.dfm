object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 260
  ClientWidth = 565
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
    Top = 86
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
  object Label2: TLabel
    Left = 8
    Top = 10
    Width = 96
    Height = 13
    Caption = 'Tipo clave a elegir : '
  end
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 121
    Height = 24
    Caption = 'Definir tipo clave'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 108
    Width = 121
    Height = 56
    Caption = 'Cargar arbol'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 170
    Width = 121
    Height = 24
    Caption = 'Ver arbol'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 134
    Top = 7
    Width = 426
    Height = 249
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 8
    Top = 29
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 4
  end
  object Button4: TButton
    Left = 8
    Top = 200
    Width = 120
    Height = 56
    Caption = 'Pasar a arbol AVL'
    TabOrder = 5
    OnClick = Button4Click
  end
end
