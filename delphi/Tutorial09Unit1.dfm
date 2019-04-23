object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Tutorial 9'
  ClientHeight = 399
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 8
    Top = 368
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'chocolate'
    OnChange = ComboBox1Change
    Items.Strings = (
      'chocolate'
      'stone'
      'water'
      'snow')
  end
end
