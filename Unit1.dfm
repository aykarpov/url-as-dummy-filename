object Form1: TForm1
  Left = 228
  Top = 117
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Преобразователь URL из стандартного вида в имя файла, не содержа' +
    'щее недопустимых или неочевидных символов'
  ClientHeight = 42
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edit1: TEdit
    Left = 8
    Top = 8
    Width = 673
    Height = 21
    TabOrder = 0
    Text = 'edit1'
    OnDblClick = edit1DblClick
  end
  object btn1: TButton
    Left = 688
    Top = 8
    Width = 59
    Height = 25
    Caption = 'Отмена'
    TabOrder = 1
    OnClick = btn1Click
  end
end
