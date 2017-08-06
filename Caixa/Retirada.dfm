inherited frmRetirada: TfrmRetirada
  Caption = 'Retiradas'
  ClientHeight = 218
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Height = 143
    object Label6: TLabel
      Left = 20
      Top = 16
      Width = 82
      Height = 16
      Caption = '&N'#186' Retirada'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 154
      Top = 16
      Width = 120
      Height = 16
      Caption = '&Data de Emiss'#227'o'
      FocusControl = edtCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 424
      Top = 16
      Width = 38
      Height = 16
      Caption = '&Valor'
      FocusControl = edtValor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 20
      Top = 77
      Width = 29
      Height = 16
      Caption = '&Ref:'
      FocusControl = edtHistorico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 304
      Top = 16
      Width = 35
      Height = 16
      Caption = '&Hora'
      FocusControl = edtHora
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 20
      Top = 40
      Width = 77
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object edtCadastro: TDateEdit
      Left = 154
      Top = 40
      Width = 95
      Height = 22
      ClickKey = 112
      Ctl3D = False
      DialogTitle = 'Selecione uma data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      YearDigits = dyTwo
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
    object edtHistorico: TEdit
      Left = 20
      Top = 96
      Width = 544
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 255
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnKeyDown = FormKeyDown
      OnKeyPress = edtHistoricoKeyPress
    end
    object edtValor: TCurrencyEdit
      Left = 424
      Top = 40
      Width = 140
      Height = 22
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyDown = FormKeyDown
    end
    object edtHora: TEdit
      Left = 304
      Top = 40
      Width = 57
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 401
      Top = 1
      Width = 601
      Height = 142
      ParentColor = True
      Visible = False
      TabOrder = 5
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 599
        Height = 54
        Align = alTop
        TabOrder = 0
        object Label17: TLabel
          Left = 16
          Top = 8
          Width = 129
          Height = 13
          Caption = 'Escolha o Campo (F9):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 184
          Top = 8
          Width = 154
          Height = 13
          Caption = 'Digite para pesquisa (F10):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCampo: TComboBox
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'RETIRADA'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'RETIRADA'
            'CAIXA'
            'CADASTRO'
            'VALOR'
            'HISTORICO')
        end
        object edtConsulta: TEdit
          Left = 184
          Top = 24
          Width = 393
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
        end
      end
      object dbgConsulta: TRxDBGrid
        Left = 1
        Top = 57
        Width = 599
        Height = 81
        TabStop = False
        Ctl3D = False
        DataSource = dsConsulta2
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgConsultaCellClick
        OnDrawColumnCell = dbgConsultaDrawColumnCell
        OnKeyDown = dbgConsultaKeyDown
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 199
  end
  inherited qrNavegacao: TIBQuery
    AfterOpen = qrNavegacaoAfterOpen
    SQL.Strings = (
      'select * from retirada'
      'ORDER BY RETIRADA')
  end
end
