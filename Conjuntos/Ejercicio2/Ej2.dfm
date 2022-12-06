object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 382
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 47
    Width = 73
    Height = 36
    Caption = 'CARGAR CONJUNTO 1'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 89
    Width = 73
    Height = 36
    Caption = 'CARGAR CONJUNTO 2'
    TabOrder = 1
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 131
    Width = 142
    Height = 36
    Caption = 'UNION'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 173
    Width = 142
    Height = 36
    Caption = 'INTERSECCION'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 215
    Width = 142
    Height = 36
    Caption = 'DIFERENCIA'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 257
    Width = 73
    Height = 36
    Caption = 'PERTENECE '
    TabOrder = 5
    OnClick = Button6Click
  end
  object Memo1: TMemo
    Left = 156
    Top = 5
    Width = 321
    Height = 334
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 87
    Top = 74
    Width = 63
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 87
    Top = 264
    Width = 63
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 8
  end
  object Edit3: TEdit
    Left = 87
    Top = 12
    Width = 63
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 9
  end
  object Button8: TButton
    Left = 8
    Top = 5
    Width = 73
    Height = 36
    Caption = 'SETEAR CONJUNTOS'
    TabOrder = 10
    WordWrap = True
    OnClick = Button8Click
  end
  object Button7: TButton
    Left = 8
    Top = 299
    Width = 142
    Height = 36
    Caption = 'MOSTRAR CONJUNTOS'
    TabOrder = 11
    OnClick = Button7Click
  end
  object Button9: TButton
    Left = 8
    Top = 341
    Width = 469
    Height = 36
    Caption = 'LIMPIAR PANTALLA'
    TabOrder = 12
  end
end
