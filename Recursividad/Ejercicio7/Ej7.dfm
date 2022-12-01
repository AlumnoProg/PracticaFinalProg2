object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 113
  ClientWidth = 302
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
    Top = 11
    Width = 92
    Height = 13
    Caption = 'Nivel de la reunion:'
  end
  object Edit1: TEdit
    Left = 8
    Top = 30
    Width = 92
    Height = 21
    DoubleBuffered = False
    NumbersOnly = True
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object ButtonChinos: TButton
    Left = 8
    Top = 57
    Width = 92
    Height = 48
    Caption = 'Generar Delegacion'
    TabOrder = 1
    WordWrap = True
    OnClick = ButtonChinosClick
  end
  object Memo1: TMemo
    Left = 106
    Top = 11
    Width = 185
    Height = 94
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
