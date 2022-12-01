object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 206
  ClientWidth = 171
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
    Width = 43
    Height = 13
    Caption = 'Numero1'
  end
  object Label2: TLabel
    Left = 120
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Numero2'
  end
  object Button1: TButton
    Left = 8
    Top = 54
    Width = 155
    Height = 49
    Caption = 'Minimo Comun Multiplo'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 43
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 120
    Top = 27
    Width = 43
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 109
    Width = 155
    Height = 89
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
