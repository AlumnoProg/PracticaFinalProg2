object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 386
  ClientWidth = 625
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
    Width = 113
    Height = 13
    Caption = 'Longitud del conjunto : '
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
    Top = 192
    Width = 100
    Height = 16
    Caption = 'Carga aleatoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    MaxLength = 2
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
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 487
    Height = 316
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 8
    Top = 107
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 134
    Width = 121
    Height = 52
    Caption = 'Cargar en conjunto'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 214
    Width = 121
    Height = 52
    Caption = 'Cargar conjunto'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 272
    Width = 121
    Height = 52
    Caption = 'Ver conjunto'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 330
    Width = 614
    Height = 52
    Caption = 'Separar en vocales y consonantes'
    TabOrder = 7
    WordWrap = True
    OnClick = Button5Click
  end
end
