object frmAtualizaFornecedor: TfrmAtualizaFornecedor
  Left = 262
  Top = 221
  Width = 214
  Height = 124
  Caption = 'frmAtualizaFornecedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblRec: TLabel
    Left = 8
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblTotal: TLabel
    Left = 128
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object pb: TProgressBar
    Left = 0
    Top = 80
    Width = 206
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
end
