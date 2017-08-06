object frmBackup: TfrmBackup
  Left = 275
  Top = 196
  BorderStyle = bsDialog
  Caption = 'BackUp do Banco de Dados'
  ClientHeight = 116
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 75
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object pb: TFlatProgressBar
      Left = 4
      Top = 55
      Width = 399
      Height = 16
      Align = alCustom
      Min = 0
      Max = 100
    end
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 382
      Height = 32
      Caption = 
        'Fa'#231'a regurlamente o BackUp do seu Banco de Dados, '#13#10'para iniciar' +
        ' o processo clique em "Iniciar BackUp"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 75
    Width = 407
    Height = 41
    ParentColor = True
    Align = alBottom
    TabOrder = 1
    object FlatButton1: TFlatButton
      Left = 87
      Top = 8
      Width = 113
      Height = 25
      Caption = '&Iniciar BackUp'
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 207
      Top = 8
      Width = 113
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = FlatButton2Click
    end
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clNormal
    CompressionMode = 6
    CurrentVersion = '2.56 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    OnFileProgress = ZipFileProgress
    Zip64Mode = zmDisabled
    Left = 104
    Top = 40
  end
end
