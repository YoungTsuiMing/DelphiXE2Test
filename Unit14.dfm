object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Form14'
  ClientHeight = 350
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 89
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 1
    OnClick = btn2Click
  end
  object lst1: TListBox
    Left = 8
    Top = 72
    Width = 201
    Height = 113
    ItemHeight = 13
    TabOrder = 2
  end
  object drwgrd1: TDrawGrid
    Left = 232
    Top = 8
    Width = 366
    Height = 334
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 176
    Top = 16
  end
end
