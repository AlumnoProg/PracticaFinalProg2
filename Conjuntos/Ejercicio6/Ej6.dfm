object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 364
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit2: TEdit
    Left = 71
    Top = 17
    Width = 58
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 57
    Height = 40
    Caption = 'Definir conjuntos'
    TabOrder = 1
    WordWrap = True
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 71
    Top = 63
    Width = 58
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 54
    Width = 57
    Height = 40
    Caption = 'Cargar en conjunto A'
    TabOrder = 3
    WordWrap = True
    OnClick = Button2Click
  end
  object Edit4: TEdit
    Left = 71
    Top = 109
    Width = 58
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 4
  end
  object Button3: TButton
    Left = 8
    Top = 100
    Width = 57
    Height = 40
    Caption = 'Cargar en conjunto B'
    TabOrder = 5
    WordWrap = True
    OnClick = Button3Click
  end
  object Edit5: TEdit
    Left = 71
    Top = 155
    Width = 58
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 6
  end
  object Button4: TButton
    Left = 8
    Top = 146
    Width = 57
    Height = 40
    Caption = 'Cargar en conjunto C'
    TabOrder = 7
    WordWrap = True
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 434
    Height = 352
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object Button5: TButton
    Left = 8
    Top = 192
    Width = 121
    Height = 52
    Caption = 'Ver conjuntos'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 250
    Width = 121
    Height = 52
    Caption = 'Subconjunto parcial o total'
    TabOrder = 10
    WordWrap = True
    OnClick = Button6Click
  end
end
