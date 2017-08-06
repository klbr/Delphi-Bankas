inherited frmCaixa: TfrmCaixa
  Left = 216
  Top = 97
  Caption = 'Abertura/Fechamento do Caixa'
  ClientHeight = 592
  ClientWidth = 515
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 515
    Height = 517
    Enabled = True
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 83
      Height = 16
      Caption = '&N'#186' do Caixa'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 8
      Top = 80
      Width = 119
      Height = 16
      Caption = 'Data de &Abertura'
      FocusControl = edtAbertura
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 140
      Top = 16
      Width = 63
      Height = 16
      Caption = '&Hist'#243'rico'
      FocusControl = edtHistorico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 152
      Width = 145
      Height = 16
      Caption = 'Data de &Fechamento'
      FocusControl = edtFechamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 176
      Top = 152
      Width = 146
      Height = 16
      Caption = 'Hora de F&echamento'
      FocusControl = edtHoraFechamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 176
      Top = 80
      Width = 120
      Height = 16
      Caption = 'H&ora de Abertura'
      FocusControl = edtHoraAbertura
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 352
      Top = 80
      Width = 125
      Height = 16
      Caption = '&Caixa de Abertura'
      FocusControl = edtCaixaAbertura
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 352
      Top = 152
      Width = 151
      Height = 16
      Caption = 'Cai&xa de Fechamento'
      FocusControl = edtCaixaFechamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 152
      Top = 456
      Width = 59
      Height = 16
      Caption = 'Cr'#233'ditos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 280
      Top = 456
      Width = 55
      Height = 16
      Caption = 'D'#233'bitos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 408
      Top = 456
      Width = 42
      Height = 16
      Caption = 'Saldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 256
      Top = 464
      Width = 12
      Height = 44
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 382
      Top = 472
      Width = 21
      Height = 37
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 16
      Top = 456
      Width = 85
      Height = 16
      Caption = 'Caixa Abert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 123
      Top = 474
      Width = 16
      Height = 32
      Caption = '+'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCA: TFlatEdit
      Left = 16
      Top = 480
      Width = 97
      Height = 19
      TabStop = False
      ColorFlat = clMoneyGreen
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 13
      OnClick = edtCodigoClick
    end
    object edtCredito: TFlatEdit
      Left = 152
      Top = 480
      Width = 97
      Height = 19
      TabStop = False
      ColorFlat = clMoneyGreen
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 10
      OnClick = edtCodigoClick
    end
    object edtDebito: TFlatEdit
      Left = 280
      Top = 480
      Width = 97
      Height = 19
      TabStop = False
      ColorFlat = 10930928
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 11
      OnClick = edtCodigoClick
    end
    object edtSaldo: TFlatEdit
      Left = 408
      Top = 480
      Width = 97
      Height = 19
      TabStop = False
      ColorFlat = 16776176
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 12
      OnClick = edtCodigoClick
    end
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 69
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
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtAbertura: TDateEdit
      Left = 10
      Top = 104
      Width = 112
      Height = 24
      ClickKey = 113
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
      ReadOnly = True
      YearDigits = dyTwo
      TabOrder = 2
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtHistorico: TEdit
      Left = 140
      Top = 40
      Width = 341
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
      MaxLength = 80
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtFechamento: TDateEdit
      Left = 10
      Top = 176
      Width = 112
      Height = 24
      ClickKey = 113
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
      ReadOnly = True
      YearDigits = dyTwo
      TabOrder = 5
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtCaixaAbertura: TCurrencyEdit
      Left = 352
      Top = 104
      Width = 121
      Height = 24
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtCaixaFechamento: TCurrencyEdit
      Left = 352
      Top = 176
      Width = 121
      Height = 24
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object dbgCaixa: TRxDBGrid
      Left = 8
      Top = 216
      Width = 497
      Height = 233
      TabStop = False
      Ctl3D = False
      DataSource = dsMovimento
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 181
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 74
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESC_FORMA'
          Title.Alignment = taCenter
          Title.Caption = 'Forma de Pagamento'
          Width = 170
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 98
          Visible = True
        end>
    end
    object edtHoraAbertura: TEdit
      Left = 176
      Top = 104
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
      MaxLength = 5
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object edtHoraFechamento: TEdit
      Left = 176
      Top = 176
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
      MaxLength = 5
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnClick = edtCodigoClick
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 456
      Top = 2
      Width = 509
      Height = 511
      ParentColor = True
      Visible = False
      TabOrder = 9
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 507
        Height = 54
        Align = alTop
        TabOrder = 0
        object Label18: TLabel
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
        object Label19: TLabel
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
          Text = 'CAIXA'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'CAIXA'
            'HISTORICO'
            'DATAABERTURA'
            'DATAFECHAMENTO'
            'CAIXAABERTURA'
            'CAIXAFECHAMENTO')
        end
        object edtConsulta: TEdit
          Left = 184
          Top = 24
          Width = 310
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
        Left = 4
        Top = 56
        Width = 501
        Height = 449
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
    Top = 573
    Width = 515
  end
  inherited fpBotoes: TFlatPanel
    Width = 515
    inherited btnInclui: TFlatSpeedButton
      Width = 75
      Hint = 'Abre o Caixa'
      Caption = '&Abrir Caixa'
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D
        598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1B88CC1B88CC1B88CC1B88CC8E5D59F8E3CF
        F4E7D3F2E3CEF0E2CBF0E1C9F0E0C6F0E0C7F0E0C7F0E0C7F0E0C7F0E0C7F6E7
        CC8E5D59FF00FFFF00FFFF00FFFF00FFFF00FF1B88CC9DDEF098DEF398E0F395
        D8EDA39392EFDDCCF0E3D1EFE0CEEEDECBEDDDC9EDDCC5EBDAC2EBDAC2EBDAC2
        EBD9C2EBD9C1F0E0C68E5D59FF00FFFF00FFFF00FFFF00FF1B88CC8FDCF28CEF
        FF70E6FF72E7FF6FDEF79D9595F2DED0F2E5D7F0E2D1EFE0CEEEDECBEEDDC9ED
        DCC6EDDAC4EBD9C1EBD9C1EBD9C1F0E0C68E5D59FF00FFFF00FFFF00FFFF00FF
        1B88CC8EDDF37BE9FF6FE3FE6CE3FF66DAF69A9395F4E2D5F4E6D7FACA9CFAC5
        93FAC695FAC593FAC593FAC592F8C490F7C798EDD9C0EFE0C78E5D59FF00FFFF
        00FFFF00FFFF00FF1B88CC92DDF388EAFF7AE5FE76E6FF6EDCF69C9696F4E3D9
        F4EADDF6DABFF6D8BBF4D8B8F4D7B7F4D5B6F3D4B5F3D3B1F2D3B2EDDAC4EFE0
        C78E5D59FF00FFFF00FFFF00FFFF00FF1B88CC99DEF392EDFF84E7FE80E9FF79
        E0F6A39A98F6E7DDF6EDE2F4E3D1F4E1CEF3E0CBF3DEC9F2DDC6F2DCC5F0DAC1
        EFD9C0EEDDC7F2E2CB8E5D59FF00FFFF00FFFF00FFFF00FF1B88CC9FE1F39DEF
        FF8EEAFE8AEBFF83E1F6AA9F9AF7EAE2F8EDE2FCC796FCC28EFCC48FFCC48EFC
        C28EFCC28EFBC18BFAC696EFDECBF2E5D08E5D59FF00FFFF00FFFF00FFFF00FF
        1B88CCA6E2F3A7F2FF99EDFE95EDFF8CE3F6B0A39DF8EDE6F8F3EDF7F2EBF6EF
        E7F4EEE5F3EDE2F3EAE0F3E9DCF2E6D9F0E5D7EFE2D1F4E6D48E5D59FF00FFFF
        00FFFF00FFFF00FF1B88CCACE3F3B4F3FFA4EEFE9EEFFF98E6F6B7A69EFAF0EB
        FAF4EDFBD7B2FBD1ABFAD1ABFAD1AAF8D0A9F8CFA7F8CEA5F7D1ACF2E5D4F6EA
        D98E5D59FF00FFFF00FFFF00FFFF00FF1B88CCB1E3F3BDF4FFADEFFFA9F0FFA1
        E7F6BDABA0FCF4F0FCF8F0FCD7B2FBD1AAFBD1AAFBD1A9FBD0A7FACFA7FACEA5
        FAD1ACF6E9DAF8EEDE8E5D59FF00FFFF00FFFF00FFFF00FF1B88CCB5E5F3C9F8
        FFB8F2FFB5F2FFACEAF7C5B0A3FEF7F4FFFEFCFCFCFCFAFAF8F8F7F6F8F6F3F7
        F3EFF6F2EEF6F2EDF7F2EAEEE5DAD5CFC58E5D59FF00FFFF00FFFF00FFFF00FF
        1B88CCB8E5F3D5FAFFC6F4FFC0F4FFB8EDF7CBB5A4FEF8F6FFFFFFFFFEFCFEFB
        F8FCF8F4FAF6F2F8F3EFF8F3EDF3E7E1DCCEC9BDB2B0B1A9AA8E5D59FF00FFFF
        00FFFF00FFFF00FF1B88CCBBE5F3E1FBFFD0F7FFCBF7FFC5EFF7D3B8A5FEF8F6
        FFFFFFFFFFFFFFFFFFFFFCFBFCFAF6FBF7F3FCFBF7C6A398B78063C1865ACA82
        478E5D59FF00FFFF00FFFF00FFFF00FF1B88CCBDE6F3EDFFFFDCF8FFD7F8FFCF
        F2F7D9BBA6FEF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFCFAFEFEFCC5A096
        DAA36AFCAA4AF36E48FF00FFFF00FFFF00FFFF00FFFF00FF1B88CCBFE6F3F8FF
        FFE7FBFFE2FBFFDAF3F7DDBDA9FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC9A59CE19F63BC996BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1B88CCC2E6F3FFFFFFF3FEFFEFFEFFE7F7FADCB49AEECFBCEFD4C4EED3C4EBD0
        C2E9CEC1E5CBC1E2CAC0E0C7C0C08E7EBCA7861B88CCFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF1B88CCC2E6F3FFFFFFFEFFFFF4FFFFEDFCFFE1DED5DAD1C5
        D7D1C7D3D0C7CCCEC6C6CBC5C1C7C5BBC5C4B7C2C2BAC5C293DDEE1B88CCFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF1B88CCC2E6F3FFFFFFFAFFFFA5D9E69C
        D4E39DD9E99CD9EA9AD9EA99D9EA98D9EA97D9EA95D8EA9ADCEDC9FBFFCEFFFF
        9CEAFE1B88CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B88CCC4E7F4FFFF
        FFC2B7B18E7B738E7D758C7B738C7B738C7B738C7B738C7B738C7B738F7D748C
        7970B0B6B5D9FCFFA5EBFC1B88CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1B88CCC9EAF6FFFFFFA69187AB968CD4CAC5D8CEC9D8CFCAD8CFCAD8CFCAD8CF
        CAD8CFC9D4CBC5B7A3999C8378EAFAFBA6EEFF1B88CCFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF1B88CCF6FBFED7D5D4917E75B2A49CEDE9E6FFFFFF
        FFFFFFFFFFFFFFFFFFEEEBE9BDAFA7897A7392B2B7AFF3FC1B88CCFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B88CC1B88CC387FAC88
        786FC4B5ACCCC2BCCBC1BBCBC1BBCCC2BCC5B7B1957E75387FAC1B88CC1B88CC
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF88786F88786F88786F88786F88786F88786FFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
    end
    inherited btnAltera: TFlatSpeedButton
      Left = 75
      Width = 75
      Hint = 'Fecha o Caixa'
      Caption = '&Fechar Caixa'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCA6501CA6501CA6501CA6501CA6501CA
        6501CA6501CA6501CA6501CA6501CA6501CA6501CA6501CA6501CA6501CA6501
        CA6501CA6501CA6501CA6501FF00FFFF00FFFF00FFFF00FFCA6501FFFFFFFFF7
        EDFFF4E6FFF0DFFEECD741AB31FEE5C8FFE1C1FFDFBAFEDCB4F7D3ABC6A88739
        872CE4C29AF3CEA4FCD5AAFED7ABFED7ABCA6501FF00FFFF00FFFF00FFFF00FF
        CA6501FFFFFFFFFAF4FEF7EFFFF3E8FFF0E041AB31FEE9D1FEE6CAFEE2C2FFDF
        BBECCCA94445471D56676E756CAF977AE0BE97F7D1A6FED7ABCA6501FF00FFFF
        00FFFF00FFFF00FFCA6501FFFFFFFFFDFAFFFAF5FFF7EFFEF4E841AB31FFEDDA
        FEEAD3FEE6CBFEE3C3FEDFBCA59F8F0E7AA44E6F86765C5A9B826BD1B28EEECA
        A1CA6501FF00FFFF00FFFF00FFFF00FFCA650151B04241AB3141AB3141AB3141
        AB3141AB3141AB3141AB3141AB3141AB3141AB313DA3333F6D67D9A09EC48D8D
        7A595235652A37842CCA6501FF00FFFF00FFFF00FFFF00FFCA6501FFFFFFFFFF
        FFFFFFFFFFFDFCFFFBF741AB31FFF5EBFEF3E4FFEFDCFFECD5FFE7CDFFE4C642
        8644D8A3A1E2ACACBC8787815A578E7964CA6501FF00FFFF00FFFF00FFFF00FF
        CA6501FFFFFFFFFFFFFFFFFFFFFFFFFFFEFD41AB31FEF8F2FEF6ECFFF2E5FFEF
        DEFEEBD6FFE8CE41AB31C39C8BD4A3A3E2ADADBA8585825B57CA6501FF00FFFF
        00FFFF00FFFF00FFCA6501FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41AB31FFFCF8
        FFF9F3FFF6EDFFF3E5FEEFDEFFECD641AB31FEE4C8B99687D6A6A6DFAAAABF83
        838D4E45FF00FFFF00FFFF00FFFF00FFCA6501DAD8FA9292FF6262FF4444FE3F
        3FFC3247D58C8BFED8D5FAFFF9F4FEF6EDFEF3E6FEF0DF41AB31FFEAD0FFE5C9
        BD9B8CE4ADAC9D9099279FBD1CAECEFF00FFFF00FFFF00FFCA6501535BF05858
        EB5858CA6B6BC3696AC25654C44444DF4046F233718541AB3141AB3141AB3141
        AB3141AB3141AB3141AB316E7B4433A5C508B9F1003BBE0107A0FF00FFFF00FF
        6768FE6768D99A98C1E6DECCD9D0CFBEBDD6EFE9D9A9A7C35656BF4B4BF7A5A3
        FCFFFAF6FFF7EF41AB31FEF1E2FEEDDAFEE9D3FFE6CB90C3C41174DA2840DF06
        1FB4FF00FF6363FF7373E2BCBBCDFFFBD5FADBADF1C593EDBB8AF9D9AFFFFFF0
        D5D6D65756BD5151FED9D9FCFFFBF541AB31FFF5EAFFF1E3FEEEDCFEEAD4FEE7
        CC8C6781333BD9FF00FFFF00FF7F7FF99393D3FFFFDFFFF9D0FCF3C9FBEABFF7
        D4A3F2C894F7DAABFFFCE3A29EBD5150DC8E8EFFFFFDFC41AB31FFF9F1FFF6EB
        FFF3E3FEEFDCFFEBD3CA6501FF00FFFF00FF5252FF7D7CECD4D2DDFFFFE5FFFF
        DAFFFFDBFFFFDCFFFAD1FFE4B5F8C68EF8CB9BECE3D45858BB6461FEFEEDF751
        B041FEEAF0FEE8EAFEE5E5FEE1DFFEDED6CA6501FF00FFFF00FF6363FF8483E8
        D9E3EBFDFFFEFFFFE1FFFFDDC0C0A9555655555655555655555655D3CBD26667
        B95048E7D87302D87302D87302D87302D87302D87302D87402CA6501FF00FFFF
        00FF6363FF8988E9CADBEAFBFEFFFFFFF8FFFFE1C5C5AE55565551524D9F977F
        E1B688BCB8CE6365BE5048E7CA6501CA6501CA6501CA6501CA6501CA6501CA65
        01FF00FFFF00FFFF00FF4F4FFF8887EFDDD5E4FFFFFFFFFFFFFFFFF6FFFFE2E0
        E0C1717267B6A98CFFDBA8ECDFC85B5BC94847FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8484FCA5A0DDFFFFF7FFFF
        FFFFFFFFFFFFFCFFFFF3EDEDD4716F62CCC1A1A6A2CA5353EB4847FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5C5CFF
        8382F1C9C0DAFFFFF7FFFFFFFDFFFFFAFDFFFFFFFFFEFDDABFBEC45C5DDE4847
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6161FF7777F1A9A3DEEAE5E6EAF2F0D7EAF3EFEEF2ACACE1
        5D5DE74949FDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4C4CFF5D5DFB6664EE7C79E87B
        79E95F5FEE4848F93D3DFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF3131FF2F2FFF2B2BFF2A2AFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
    end
    inherited btnCancela: TFlatSpeedButton
      Left = 213
      Visible = False
    end
    inherited btnExclui: TFlatSpeedButton
      Left = 150
      Hint = 'Exclui o caixa e todos os registros relacionados'
      Enabled = True
    end
    inherited btnSalva: TFlatSpeedButton
      Visible = False
    end
    inherited btnFirst: TFlatSpeedButton
      Left = 218
    end
    inherited btnPrior: TFlatSpeedButton
      Left = 263
    end
    inherited btnNext: TFlatSpeedButton
      Left = 308
    end
    inherited btnLast: TFlatSpeedButton
      Left = 353
    end
    inherited btnFecha: TFlatSpeedButton
      Left = 459
    end
    inherited btnConsulta: TFlatSpeedButton
      Left = 402
    end
  end
  inherited qrNavegacao: TIBQuery
    AfterOpen = qrNavegacaoAfterOpen
    SQL.Strings = (
      'select * from caixa'
      'ORDER BY CAIXA')
  end
  object dsMovimento: TDataSource
    DataSet = qrMovimento
    Left = 256
    Top = 328
  end
  object qrMovimento: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 320
  end
end
