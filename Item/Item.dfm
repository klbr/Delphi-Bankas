inherited frmItem: TfrmItem
  Left = 210
  Top = 127
  Caption = 'Cadastro de Mercadorias'
  ClientHeight = 378
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Height = 303
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 51
      Height = 16
      Caption = '&C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 90
      Top = 16
      Width = 123
      Height = 16
      Caption = '&Data de Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 88
      Width = 76
      Height = 16
      Caption = 'D&escri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 224
      Top = 16
      Width = 47
      Height = 16
      Caption = '&Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescGrupo: TLabel
      Left = 312
      Top = 40
      Width = 273
      Height = 25
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 260
      Top = 122
      Width = 119
      Height = 16
      Caption = 'C'#243'di&go de Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object barra: TBarcode
      Left = 263
      Top = 165
      Width = 123
      Height = 92
      Hint = 'C'#243'digo de Barras do Produto'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      BarColor = clBlack
      BackgroundColor = clWhite
      BarcodeType = btEAN13
      Digits = '000000000000'
      Magnification = 1
      Version = 'Registered 1.0'
      Author.Name = 'Francisco Reis Oliveira'
      Author.Phone = '(034) 314-3592'
      Author.Email = 'linkd@linkd.com.br'
      BarCaption = True
      RescaleEAN = True
    end
    object FlatSpeedButton3: TFlatSpeedButton
      Left = 284
      Top = 40
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
    object ab: TABarra
      Left = 277
      Top = 288
      Width = 96
      Height = 1
      Digito = '0'
      CorBarra = clBlack
      CorEspaco = clWhite
      Tipo = cdEAN13
      Codigo = '000000000000'
      Largura = 1
    end
    object SpeedButton1: TSpeedButton
      Left = 264
      Top = 259
      Width = 122
      Height = 22
      Caption = 'Criar C'#243'digo'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object edtCadastro: TDateEdit
      Left = 90
      Top = 40
      Width = 103
      Height = 24
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
      Width = 53
      Height = 24
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
    object edtGrupo: TComboEdit
      Left = 224
      Top = 40
      Width = 57
      Height = 24
      Hint = 'Aperte F1 para ativar a Consulta R'#225'pida'
      ButtonHint = 'Consulta R'#225'pida'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnButtonClick = edtGrupoButtonClick
      OnChange = edtGrupoChange
      OnKeyDown = edtGrupoKeyDown
    end
    object p1: TFlatPanel
      Left = 397
      Top = 124
      Width = 186
      Height = 164
      ParentColor = True
      TabOrder = 6
      object Label5: TLabel
        Left = 26
        Top = 10
        Width = 126
        Height = 16
        Caption = 'P&re'#231'o de Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 56
        Width = 117
        Height = 16
        Caption = 'Pre'#231'o de &Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 116
        Width = 39
        Height = 16
        Caption = '&Lucro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 112
        Top = 116
        Width = 14
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPrecoCompra: TCurrencyEdit
        Left = 26
        Top = 31
        Width = 137
        Height = 21
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = edtPrecoCompraChange
        OnKeyDown = FormKeyDown
      end
      object edtPrecoVenda: TCurrencyEdit
        Left = 24
        Top = 75
        Width = 137
        Height = 21
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnChange = edtPrecoCompraChange
        OnKeyDown = FormKeyDown
      end
      object edtLucro: TCurrencyEdit
        Left = 24
        Top = 135
        Width = 81
        Height = 21
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
        TabOrder = 2
        OnChange = edtLucroChange
        OnKeyDown = FormKeyDown
        OnKeyPress = edtLucroKeyPress
      end
      object edtLucroMargem: TCurrencyEdit
        Left = 112
        Top = 135
        Width = 63
        Height = 21
        TabStop = False
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00 %;- ,0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = edtLucroKeyPress
      end
    end
    object gbOp: TFlatGroupBox
      Left = 16
      Top = 120
      Width = 233
      Height = 161
      Caption = 'Op'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object cbEdicao: TFlatCheckBox
        Left = 24
        Top = 32
        Width = 121
        Height = 17
        Caption = '&Possui Edi'#231#227'o'
        TabOrder = 0
        TabStop = True
      end
      object cbDesHabilitado: TFlatCheckBox
        Left = 24
        Top = 64
        Width = 193
        Height = 17
        Caption = 'Desabilitar &Mercadoria'
        TabOrder = 1
        TabStop = True
      end
      object cbCodBarra: TFlatCheckBox
        Left = 24
        Top = 96
        Width = 193
        Height = 25
        Caption = '&Usar C'#243'digo Barra'
        TabOrder = 2
        TabStop = True
        OnClick = cbCodBarraExit
        OnExit = cbCodBarraExit
      end
    end
    object edtCodBarra: TEdit
      Left = 264
      Top = 141
      Width = 121
      Height = 24
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnExit = edtCodBarraExit
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 564
      Top = 2
      Width = 598
      Height = 295
      ParentColor = True
      Visible = False
      TabOrder = 7
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 596
        Height = 64
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
        object Label7: TLabel
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
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 0
          Text = 'DESCRICAO'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'ITEM'
            'DESCRICAO'
            'GRUPO'
            'CODBARRA'
            'EDICAO')
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
      object dbgConsulta2: TRxDBGrid
        Left = 1
        Top = 65
        Width = 592
        Height = 224
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
        OnDrawColumnCell = dbgConsulta2DrawColumnCell
        OnKeyDown = dbgConsulta2KeyDown
      end
    end
    object edtDescricao: TComboBox
      Left = 96
      Top = 83
      Width = 465
      Height = 24
      BevelInner = bvSpace
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyDown = FormKeyDown
    end
  end
  inherited sbStatus: TStatusBar
    Top = 359
  end
  inherited qrNavegacao: TIBQuery
    SQL.Strings = (
      'select * from item'
      'ORDER BY ITEM')
    Top = 104
  end
  inherited qrCadastro: TIBQuery
    Top = 104
  end
  inherited qrConsulta2: TIBQuery
    Top = 104
  end
end
