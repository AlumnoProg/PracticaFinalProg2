object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 354
  ClientWidth = 597
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
    Left = 64
    Top = 63
    Width = 66
    Height = 13
    Caption = 'Carga Manual'
  end
  object Label2: TLabel
    Left = 64
    Top = 137
    Width = 71
    Height = 13
    Caption = 'Carga Random'
  end
  object Label3: TLabel
    Left = 8
    Top = 186
    Width = 30
    Height = 13
    Caption = 'Desde'
  end
  object Label4: TLabel
    Left = 8
    Top = 224
    Width = 28
    Height = 13
    Caption = 'Hasta'
  end
  object Label5: TLabel
    Left = 8
    Top = 156
    Width = 79
    Height = 13
    Caption = 'Cant. Elementos'
    WordWrap = True
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 49
    Caption = 'Crear / Resetear Pila'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 103
    Top = 22
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 82
    Width = 89
    Height = 49
    Caption = 'Cargar Elemento'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 103
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 44
    Top = 183
    Width = 53
    Height = 21
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 44
    Top = 221
    Width = 53
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 103
    Top = 183
    Width = 89
    Height = 59
    Caption = 'Cargar Random'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Edit5: TEdit
    Left = 103
    Top = 156
    Width = 89
    Height = 21
    TabOrder = 7
  end
  object Button4: TButton
    Left = 8
    Top = 248
    Width = 89
    Height = 49
    Caption = 'Buscar Clave'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit6: TEdit
    Left = 103
    Top = 262
    Width = 89
    Height = 21
    TabOrder = 9
  end
  object Button5: TButton
    Left = 8
    Top = 303
    Width = 89
    Height = 49
    Caption = 'Colocar Fondo'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Edit7: TEdit
    Left = 103
    Top = 317
    Width = 89
    Height = 21
    TabOrder = 11
  end
  object Memo1: TMemo
    Left = 208
    Top = 8
    Width = 185
    Height = 344
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object Button6: TButton
    Left = 408
    Top = 8
    Width = 89
    Height = 49
    Caption = 'Eliminar todas las ocurrecias'
    TabOrder = 13
    WordWrap = True
    OnClick = Button6Click
  end
  object Edit8: TEdit
    Left = 503
    Top = 22
    Width = 89
    Height = 21
    TabOrder = 14
  end
  object Button7: TButton
    Left = 408
    Top = 63
    Width = 184
    Height = 49
    Caption = 'Intercarmbiar valores de fondo y tope'
    TabOrder = 15
    WordWrap = True
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 408
    Top = 118
    Width = 184
    Height = 49
    Caption = 'Duplicar Elementos de la Pila'
    TabOrder = 16
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 408
    Top = 173
    Width = 184
    Height = 49
    Caption = 'Es Palindromo'
    TabOrder = 17
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 408
    Top = 228
    Width = 184
    Height = 49
    Caption = 'Contar Elementos de la Pila'
    TabOrder = 18
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 408
    Top = 289
    Width = 89
    Height = 63
    Caption = 'Mostrar Pila'
    TabOrder = 19
  end
  object Button12: TButton
    Left = 503
    Top = 289
    Width = 89
    Height = 63
    Caption = 'Limpiar Pantalla'
    TabOrder = 20
  end
end
