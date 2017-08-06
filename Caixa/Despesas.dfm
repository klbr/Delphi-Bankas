inherited frmDespesas: TfrmDespesas
  Left = 192
  Caption = 'Despesas'
  ClientHeight = 276
  ClientWidth = 605
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 605
    Height = 201
    object Label16: TLabel
      Left = 122
      Top = 16
      Width = 34
      Height = 16
      Caption = 'Data'
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
      Width = 85
      Height = 16
      Caption = 'N'#186' Despesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 272
      Top = 16
      Width = 35
      Height = 16
      Caption = 'Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 12
      Top = 72
      Width = 48
      Height = 16
      Caption = 'Credor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescCredor: TLabel
      Left = 100
      Top = 96
      Width = 445
      Height = 25
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 128
      Width = 29
      Height = 16
      Caption = 'Ref:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 376
      Top = 16
      Width = 38
      Height = 16
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FlatSpeedButton3: TFlatSpeedButton
      Left = 72
      Top = 96
      Width = 21
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08
        780E08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A70EAA1D08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A710AA1F08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
        0E08780EFF00FFFF00FFFF00FF08780E76F9A755E38349DA7242D36837C8562A
        B94322B3371CB23016AF270FA81D0EA91B0DA21B08780EFF00FFFF00FF08780E
        76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
        A776F9A708780EFF00FFFF00FFFF00FF08780E08780E08780E08780E08780E76
        F9A73CCB5D08780E08780E08780E08780E08780EFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A755E28208780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A776F9A708780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = FlatSpeedButton3Click
    end
    object edtCadastro: TDateEdit
      Left = 122
      Top = 40
      Width = 111
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
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 85
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
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object edtCredor: TComboEdit
      Left = 12
      Top = 96
      Width = 57
      Height = 22
      ClickKey = 112
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B0034CB
        5C17A72B004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF004B003ED76D3ED76D25BA430C9718004B00FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B003ED7
        6D34CB5B004B00FF00FFFF00FFFF00FF535A62655F6EFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FF
        3F8CD1196DC9846F7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF319FFF186AC48A7079FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF2D9EFF166AC2786C77FF00FF925D5AC9A391C28F88FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FB0FF767277BB
        9C82FEFCCFFEFCCEFFFFEAA0746FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF8B98B1E5B692FFF4BBFFFFD4FFFFDAFFFFF4F8F7DAB784
        7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB67F76F0CB92F7
        D79FFFFFD3FFFFEAFFFFFEF8F7DAB7847EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDCBA9EF3CA8EEEB678FEFAC6FFFFDDFFFFE0FFFFD4B697
        82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB8980F3D9A7F4
        CB95F2CA90FBEBBAFFFFCCF6F2C4B88B80FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD1B4A0F6F3EEFAD397F6C583FAE1A6AC8676FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB
        987ED3AD93D1A592BB987EFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnButtonClick = edtCredorButtonClick
      OnChange = edtCredorChange
      OnKeyDown = FormKeyDown
    end
    object edtHistorico: TEdit
      Left = 12
      Top = 152
      Width = 565
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
      TabOrder = 5
      OnKeyDown = FormKeyDown
      OnKeyPress = edtHistoricoKeyPress
    end
    object edtValor: TCurrencyEdit
      Left = 376
      Top = 40
      Width = 113
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
      Left = 268
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
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 536
      Top = 4
      Width = 603
      Height = 197
      ParentColor = True
      Visible = False
      TabOrder = 6
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 601
        Height = 54
        Align = alTop
        TabOrder = 0
        object Label20: TLabel
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
        object Label21: TLabel
          Left = 184
          Top = 8
          Width = 158
          Height = 13
          Caption = 'Digite para pesquisar (F10):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbConsulta: TComboBox
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
          Text = 'DESPESAS'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'DESPESAS'
            'CAIXA'
            'CADASTRO'
            'HORA'
            'VALOR'
            'HISTORICO'
            'CREDOR')
        end
        object edtConsulta: TEdit
          Left = 184
          Top = 24
          Width = 401
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
      object dbgConsulta2: TRxDBGrid
        Left = 1
        Top = 57
        Width = 600
        Height = 135
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
        OnCellClick = dbgConsulta2CellClick
        OnDrawColumnCell = dbgConsulta2DrawColumnCell
        OnKeyDown = dbgConsulta2KeyDown
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 257
    Width = 605
  end
  inherited fpBotoes: TFlatPanel
    Width = 605
  end
  inherited qrNavegacao: TIBQuery
    AfterOpen = qrNavegacaoAfterOpen
    SQL.Strings = (
      'select * from despesas'
      'ORDER BY DESPESAS')
  end
end
