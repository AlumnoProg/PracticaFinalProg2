object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 414
  ClientWidth = 598
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
    Width = 99
    Height = 13
    Caption = 'Longitud de la lista : '
  end
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 105
    Height = 13
    Caption = 'Elemento a ingresar : '
  end
  object Label3: TLabel
    Left = 8
    Top = 157
    Width = 105
    Height = 13
    Caption = 'Elemento a ingresar : '
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 54
    Width = 121
    Height = 25
    Caption = 'Definir listas'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 101
    Width = 121
    Height = 21
    MaxLength = 255
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 126
    Width = 121
    Height = 25
    Caption = 'Cargar en lista 1'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 201
    Width = 121
    Height = 25
    Caption = 'Cargar en Lista 2'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 176
    Width = 121
    Height = 21
    MaxLength = 255
    TabOrder = 5
  end
  object Button4: TButton
    Left = 8
    Top = 232
    Width = 121
    Height = 25
    Caption = 'Mostrar Listas'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 263
    Width = 121
    Height = 25
    Caption = 'Iguales?'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 294
    Width = 121
    Height = 54
    Caption = 'Limpiar Pantalla'
    TabOrder = 8
  end
  object Memo1: TMemo
    Left = 135
    Top = 6
    Width = 458
    Height = 395
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button7: TButton
    Left = 8
    Top = 354
    Width = 121
    Height = 47
    Caption = 'Iguales Recursivo'
    TabOrder = 10
    OnClick = Button7Click
  end
end
