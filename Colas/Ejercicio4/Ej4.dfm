object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 606
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
    Caption = 'Longitud de la cola : '
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 88
    Height = 16
    Caption = 'Carga manual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 99
    Width = 97
    Height = 13
    Caption = 'elemento a cargar : '
  end
  object Label4: TLabel
    Left = 111
    Top = 85
    Width = 28
    Height = 13
    Caption = 'sdasd'
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 54
    Width = 121
    Height = 25
    Caption = 'Definir cola'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 118
    Width = 121
    Height = 21
    MaxLength = 8
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 145
    Width = 121
    Height = 25
    Caption = 'Cargar en cola'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 176
    Width = 121
    Height = 25
    Caption = 'Ver cola'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 207
    Width = 121
    Height = 56
    Caption = 'Ver valores unicos'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 464
    Height = 255
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Button5: TButton
    Left = 8
    Top = 269
    Width = 591
    Height = 56
    Caption = 'Limpiar Pantalla'
    TabOrder = 7
  end
end
