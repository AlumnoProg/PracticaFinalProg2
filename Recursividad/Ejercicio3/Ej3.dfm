object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 131
  ClientWidth = 229
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
    Left = 111
    Top = 11
    Width = 6
    Height = 13
    Alignment = taCenter
    Caption = 'X'
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 123
    Top = 8
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 35
    Width = 212
    Height = 25
    Caption = 'MULTIPLICAR'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 66
    Width = 212
    Height = 57
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
