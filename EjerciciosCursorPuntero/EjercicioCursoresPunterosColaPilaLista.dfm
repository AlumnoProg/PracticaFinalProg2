object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 625
  ClientWidth = 445
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
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Definir Cola'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Definir Lista'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 39
    Width = 156
    Height = 25
    Caption = 'Definir Pila'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 70
    Width = 156
    Height = 21
    TabOrder = 3
  end
  object Button4: TButton
    Left = 8
    Top = 186
    Width = 156
    Height = 25
    Caption = 'Mostrar todo'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Cargar Cola'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 89
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Cargar Lista'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 128
    Width = 156
    Height = 25
    Caption = 'Cargar Pila'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 159
    Width = 156
    Height = 21
    TabOrder = 8
  end
  object Memo1: TMemo
    Left = 170
    Top = 8
    Width = 271
    Height = 610
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button8: TButton
    Left = 8
    Top = 217
    Width = 156
    Height = 25
    Caption = 'Limpiar Pantalla'
    TabOrder = 10
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 248
    Width = 75
    Height = 41
    Caption = 'Borrar ocurrencias Listas'
    TabOrder = 11
    WordWrap = True
    OnClick = Button9Click
  end
  object Edit3: TEdit
    Left = 89
    Top = 258
    Width = 75
    Height = 21
    TabOrder = 12
  end
  object Button10: TButton
    Left = 8
    Top = 295
    Width = 75
    Height = 41
    Caption = 'Borrar Ocurrencias Colas'
    TabOrder = 13
    WordWrap = True
    OnClick = Button10Click
  end
  object Edit4: TEdit
    Left = 89
    Top = 305
    Width = 75
    Height = 21
    TabOrder = 14
  end
  object Button11: TButton
    Left = 8
    Top = 342
    Width = 75
    Height = 41
    Caption = 'Insertar Ordenado Lista'
    TabOrder = 15
    WordWrap = True
  end
  object Edit5: TEdit
    Left = 89
    Top = 352
    Width = 75
    Height = 21
    TabOrder = 16
  end
  object Button12: TButton
    Left = 8
    Top = 389
    Width = 75
    Height = 41
    Caption = 'Insertar Ordenado Colas'
    TabOrder = 17
    WordWrap = True
  end
  object Edit6: TEdit
    Left = 89
    Top = 399
    Width = 75
    Height = 21
    TabOrder = 18
  end
  object Button13: TButton
    Left = 8
    Top = 436
    Width = 75
    Height = 41
    Caption = 'Borrar Ocurrencias Listas Puntero'
    TabOrder = 19
    WordWrap = True
  end
  object Button14: TButton
    Left = 8
    Top = 483
    Width = 75
    Height = 41
    Caption = 'Borrar Ocurrencias Colas Puntero'
    TabOrder = 20
    WordWrap = True
  end
  object Button15: TButton
    Left = 8
    Top = 530
    Width = 75
    Height = 41
    Caption = 'Insertar OrdenadoCola Puntero'
    TabOrder = 21
    WordWrap = True
  end
  object Button16: TButton
    Left = 8
    Top = 577
    Width = 75
    Height = 41
    Caption = 'Insertar Ordenado Lista Puntero'
    TabOrder = 22
    WordWrap = True
  end
  object Edit7: TEdit
    Left = 89
    Top = 446
    Width = 75
    Height = 21
    TabOrder = 23
  end
  object Edit8: TEdit
    Left = 89
    Top = 493
    Width = 75
    Height = 21
    TabOrder = 24
  end
  object Edit9: TEdit
    Left = 89
    Top = 540
    Width = 75
    Height = 21
    TabOrder = 25
  end
  object Edit10: TEdit
    Left = 89
    Top = 587
    Width = 75
    Height = 21
    TabOrder = 26
  end
end