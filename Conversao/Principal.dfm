object frmPrincipal: TfrmPrincipal
  Left = 298
  Top = 243
  BorderStyle = bsDialog
  Caption = 'Convers'#227'o de Bancos de Dados'
  ClientHeight = 249
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l1: TLabel
    Left = 160
    Top = 16
    Width = 233
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 168
    Top = 96
    Width = 44
    Height = 13
    Caption = 'Registros'
  end
  object l2: TLabel
    Left = 224
    Top = 56
    Width = 82
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
  end
  object Label4: TLabel
    Left = 239
    Top = 136
    Width = 30
    Height = 13
    Caption = 'Saida:'
  end
  object Label5: TLabel
    Left = 232
    Top = 152
    Width = 37
    Height = 13
    Caption = 'Entrada'
  end
  object Label6: TLabel
    Left = 288
    Top = 120
    Width = 27
    Height = 13
    Caption = 'Antes'
  end
  object Label7: TLabel
    Left = 352
    Top = 120
    Width = 33
    Height = 13
    Caption = 'Depois'
  end
  object lsa: TLabel
    Left = 288
    Top = 136
    Width = 49
    Height = 13
    AutoSize = False
  end
  object lsd: TLabel
    Left = 352
    Top = 136
    Width = 49
    Height = 13
    AutoSize = False
  end
  object lea: TLabel
    Left = 288
    Top = 152
    Width = 49
    Height = 13
    AutoSize = False
  end
  object led: TLabel
    Left = 352
    Top = 152
    Width = 49
    Height = 13
    AutoSize = False
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 121
    Height = 33
    Caption = 'Iniciar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object data: TDateEdit
    Left = 16
    Top = 8
    Width = 57
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    Visible = False
  end
  object r1: TRadioButton
    Left = 24
    Top = 64
    Width = 129
    Height = 17
    Caption = 'Data DD/MM/YY'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object r2: TRadioButton
    Left = 24
    Top = 88
    Width = 137
    Height = 17
    Caption = 'Data YYYY/MM/DD'
    TabOrder = 3
  end
  object r3: TRadioButton
    Left = 24
    Top = 112
    Width = 137
    Height = 17
    Caption = 'Data YY/MM/DD'
    TabOrder = 4
  end
  object r4: TRadioButton
    Left = 24
    Top = 136
    Width = 137
    Height = 17
    Caption = 'Data MM/DD/YY'
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 16
    Top = 176
    Width = 385
    Height = 57
    TabOrder = 6
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Login'
    end
    object Label3: TLabel
      Left = 176
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object c1: TComboBox
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object e1: TEdit
      Left = 176
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Button2: TButton
      Left = 328
      Top = 24
      Width = 43
      Height = 21
      Caption = '&OK'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Button3: TButton
    Left = 136
    Top = 144
    Width = 81
    Height = 25
    Caption = 'Alterar Senhas'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 272
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Ajustar Items'
    TabOrder = 8
    OnClick = Button4Click
  end
  object qr1: TQuery
    DatabaseName = 'banka'
    Left = 112
    Top = 96
  end
  object Db2: TASQLiteDB
    DefaultExt = '.sdb'
    DriverDLL = 'SQLite.dll'
    Connected = False
    MustExist = False
    ExecuteInlineSQL = False
    Left = 144
    Top = 96
  end
  object qr2: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    Connection = Db2
    MaxResults = 0
    StartResult = 0
    TypeLess = True
    Left = 216
    Top = 96
  end
  object qr3: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    Connection = Db2
    MaxResults = 0
    StartResult = 0
    Left = 184
    Top = 96
  end
  object qrCon: TQuery
    DatabaseName = 'banka'
    Left = 96
    Top = 144
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qrCon
    Left = 64
    Top = 144
  end
  object cdsCon: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 32
    Top = 144
  end
  object qrQuery: TQuery
    DatabaseName = 'banka'
    Left = 56
    Top = 88
  end
end
