object frmCadastro: TfrmCadastro
  Left = 31
  Top = 43
  BorderStyle = bsDialog
  Caption = 'Form Cadastro'
  ClientHeight = 452
  ClientWidth = 717
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
  object fpBody: TFlatPanel
    Left = 0
    Top = 81
    Width = 717
    Height = 352
    ParentColor = True
    Align = alClient
    TabOrder = 0
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 433
    Width = 717
    Height = 19
    Panels = <>
  end
  object fpBotoes: TFlatPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 81
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object btnInclui: TFlatSpeedButton
      Left = 0
      Top = 0
      Width = 65
      Height = 81
      Hint = 'Inclui novo registro'
    end
    object btnAltera: TFlatSpeedButton
      Left = 65
      Top = 0
      Width = 65
      Height = 81
      Hint = 'Altera registro ativo'
    end
    object btnCancela: TFlatSpeedButton
      Left = 130
      Top = 0
      Width = 65
      Height = 81
      Hint = 'Cancela a edi'#231#227'o de um registro'
    end
    object btnExclui: TFlatSpeedButton
      Left = 195
      Top = 0
      Width = 65
      Height = 81
      Hint = 'Exclui o registro'
    end
    object btnSalva: TFlatSpeedButton
      Left = 260
      Top = 0
      Width = 65
      Height = 81
      Hint = 'Salva o registro'
    end
    object btnFirst: TFlatSpeedButton
      Left = 338
      Top = 0
      Width = 73
      Height = 81
      Hint = 'Salta para o primeiro registro'
    end
    object btnPrior: TFlatSpeedButton
      Left = 411
      Top = 0
      Width = 73
      Height = 81
      Hint = 'Pula para o registro anterior'
    end
    object btnNext: TFlatSpeedButton
      Left = 484
      Top = 0
      Width = 73
      Height = 81
      Hint = 'Pula para o pr'#243'ximo registro'
    end
    object btnLast: TFlatSpeedButton
      Left = 557
      Top = 0
      Width = 73
      Height = 81
      Hint = 'Pula para '#250'ltimo registro'
    end
    object btnFecha: TFlatSpeedButton
      Left = 643
      Top = 0
      Width = 73
      Height = 81
      Hint = 'Fecha esta janela'
    end
  end
  object qrCadastro: TASQLiteQuery
    AutoCommit = False
    Connection = dbCadastro
    MaxResults = 0
    StartResult = 0
    Left = 504
    Top = 88
  end
  object dbCadastro: TASQLiteDB
    DefaultExt = '.sdb'
    DriverDLL = 'SQLite.dll'
    Connected = False
    MustExist = False
    Left = 472
    Top = 88
  end
  object fhHint: TFlatHint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 536
    Top = 89
  end
end
