inherited frmTipoPagamento: TfrmTipoPagamento
  Caption = 'frmTipoPagamento'
  ClientHeight = 216
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Height = 141
    object Label1: TLabel
      Left = 12
      Top = 88
      Width = 76
      Height = 16
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 88
      Top = 16
      Width = 123
      Height = 16
      Caption = 'Data de Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 51
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescricao: TEdit
      Left = 90
      Top = 88
      Width = 490
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtCadastro: TDateEdit
      Left = 90
      Top = 40
      Width = 114
      Height = 24
      ClickKey = 113
      DialogTitle = 'Selecione uma data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      YearDigits = dyFour
      TabOrder = 1
    end
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 53
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited sbStatus: TStatusBar
    Top = 197
  end
  inherited qrCadastro: TASQLiteQuery
    Left = 512
    Top = 48
  end
  inherited dbCadastro: TASQLiteDB
    Left = 448
    Top = 48
  end
  inherited qrNavegacao: TASQLiteQuery
    Left = 488
    Top = 48
  end
end
