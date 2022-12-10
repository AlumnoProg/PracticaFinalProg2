object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 101
    Height = 16
    Caption = 'Carga manual : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 5
    Width = 121
    Height = 74
    Caption = 'Crear Arbol'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 135
    Top = 5
    Width = 426
    Height = 373
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 105
    Width = 121
    Height = 56
    Caption = 'Cargar arbol'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 167
    Width = 121
    Height = 25
    Caption = 'Ver arbol'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 198
    Width = 81
    Height = 56
    Caption = 'Nodos terminales/Hojas '
    TabOrder = 4
    WordWrap = True
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 260
    Width = 65
    Height = 56
    Caption = 'Nodos interiores'
    TabOrder = 5
    WordWrap = True
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 322
    Width = 65
    Height = 56
    Caption = 'Hojas al mismo nivel'
    TabOrder = 6
    WordWrap = True
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 384
    Width = 553
    Height = 56
    Caption = 'Limpiar Pantalla'
    TabOrder = 7
  end
  object Button8: TButton
    Left = 95
    Top = 198
    Width = 34
    Height = 56
    Caption = 'Hojas Itera'
    TabOrder = 8
    WordWrap = True
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 79
    Top = 260
    Width = 50
    Height = 56
    Caption = 'Nodos Interiores IT'
    TabOrder = 9
    WordWrap = True
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 79
    Top = 322
    Width = 50
    Height = 56
    Caption = 'Hojas al mismo Nivel IT'
    TabOrder = 10
    WordWrap = True
    OnClick = Button10Click
  end
end
