object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 445
  ClientWidth = 494
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
    Top = 13
    Width = 99
    Height = 13
    Caption = 'Tama'#241'o de las Listas'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 98
    Height = 13
    Caption = 'Valor entre 1 y 2000'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 99
    Height = 21
    TabOrder = 0
  end
  object Button2: TButton
    Left = 128
    Top = 8
    Width = 99
    Height = 59
    Caption = 'Crear/Vaciar Listas'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 96
    Width = 99
    Height = 25
    Caption = 'Cargar en Lista 1'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 128
    Top = 96
    Width = 99
    Height = 25
    Caption = 'Cargar en Lista 2'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 127
    Width = 98
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 128
    Top = 127
    Width = 99
    Height = 21
    TabOrder = 5
  end
  object Button5: TButton
    Left = 8
    Top = 168
    Width = 219
    Height = 49
    Caption = 'Mostrar Listas'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 8
    Top = 223
    Width = 219
    Height = 49
    Caption = #191'Es divisible?'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button6: TButton
    Left = 8
    Top = 333
    Width = 219
    Height = 65
    Caption = 'Limpiar Pantalla'
    TabOrder = 8
  end
  object Memo1: TMemo
    Left = 245
    Top = 8
    Width = 241
    Height = 319
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button10: TButton
    Left = 8
    Top = 404
    Width = 219
    Height = 35
    Caption = 'Borrar Ocurrencias'
    TabOrder = 10
  end
  object Button7: TButton
    Left = 40
    Top = 288
    Width = 169
    Height = 39
    Caption = 'Es divisible recursivo'
    TabOrder = 11
    OnClick = Button7Click
  end
end
