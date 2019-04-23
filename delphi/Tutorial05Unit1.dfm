object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Tutorial 5'
  ClientHeight = 478
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    741
    478)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 445
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 445
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 247
    Top = 445
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Button3'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 328
    Top = 445
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Button4'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 409
    Top = 445
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Button5'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 520
    Top = 445
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 5
    OnClick = Button6Click
  end
  object cbMode: TComboBox
    Left = 601
    Top = 449
    Width = 114
    Height = 21
    ItemIndex = 2
    TabOrder = 6
    Text = 'dmSet'
    Items.Strings = (
      'dmFastBlend'
      'dmDrawWithTransparency'
      'dmSet'
      'dmXor')
  end
end
