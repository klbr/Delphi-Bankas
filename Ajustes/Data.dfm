object frmdata: Tfrmdata
  Left = 299
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Ajuste de Datas'
  ClientHeight = 125
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Tabela'
  end
  object Label2: TLabel
    Left = 184
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Campo'
  end
  object edtTabela: TEdit
    Left = 32
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtCampo: TEdit
    Left = 184
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 200
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object Button1: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Abrir Banco'
    TabOrder = 3
    OnClick = Button1Click
  end
  object qr: TASQLiteQuery
    SQLiteDateFormat = False
    Connection = frmPrincipal.DB
    MaxResults = 0
    StartResult = 0
    TypeLess = True
    Left = 192
    Top = 16
  end
  object qr2: TASQLiteQuery
    SQLiteDateFormat = False
    Connection = frmPrincipal.DB
    MaxResults = 0
    StartResult = 0
    TypeLess = True
    Left = 240
    Top = 16
  end
end
