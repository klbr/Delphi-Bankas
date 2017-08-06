object frmMudarPreco: TfrmMudarPreco
  Left = 314
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Ajuste dos Pre'#231'os'
  ClientHeight = 122
  ClientWidth = 149
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 68
    Height = 13
    Caption = 'Data de In'#237'cio'
  end
  object Button1: TButton
    Left = 24
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtData: TDateEdit
    Left = 16
    Top = 32
    Width = 105
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object qrTab: TQuery
    DatabaseName = 'banka'
    Left = 32
    Top = 8
  end
  object qrExec: TQuery
    DatabaseName = 'banka'
    Left = 72
    Top = 8
  end
end
