object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 248
  ClientWidth = 477
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
    Top = 55
    Width = 92
    Height = 39
    Caption = 'Ingrese la longitad de las pilas, entre 1 y 2000'
    WordWrap = True
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 41
    Caption = 'Crear/Vaciar Pila'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 128
    Top = 18
    Width = 105
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 127
    Width = 105
    Height = 25
    Caption = 'Cargar Pila 1'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 127
    Width = 105
    Height = 25
    Caption = 'Cargar Pila 2'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 100
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 128
    Top = 100
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 239
    Top = 8
    Width = 233
    Height = 237
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Button5: TButton
    Left = 8
    Top = 158
    Width = 105
    Height = 25
    Caption = 'Son inguales?'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 128
    Top = 158
    Width = 105
    Height = 25
    Caption = 'Mostrar Pilas'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 189
    Width = 225
    Height = 25
    Caption = 'Limpiar Pantalla'
    TabOrder = 9
  end
end
