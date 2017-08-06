inherited frmSaida: TfrmSaida
  Left = 150
  Top = 85
  Caption = 'Sa'#237'da'
  ClientHeight = 585
  ClientWidth = 704
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 704
    Height = 510
    Alignment = taLeftJustify
    TabOrder = 1
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 63
      Height = 16
      Caption = '&N'#186' Sa'#237'da'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 128
      Top = 16
      Width = 101
      Height = 16
      Caption = '&Data de Sa'#237'da'
      FocusControl = edtCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 269
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
    object edtDescFuncionario: TLabel
      Left = 408
      Top = 40
      Width = 273
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
      Left = 348
      Top = 16
      Width = 82
      Height = 16
      Caption = '&Funcion'#225'rio'
      FocusControl = edtFuncionario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 444
      Width = 150
      Height = 16
      Caption = 'F&orma de Pagamento'
      FocusControl = edtFormapagamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescFormaPagamento: TLabel
      Left = 78
      Top = 462
      Width = 338
      Height = 27
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 579
      Top = 444
      Width = 103
      Height = 13
      Caption = 'Valor da Q&uita'#231#227'o'
      FocusControl = edtValorQuitado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 466
      Top = 444
      Width = 55
      Height = 13
      Caption = 'De&sconto'
      FocusControl = edtDesconto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 12
      Top = 80
      Width = 49
      Height = 16
      Caption = '&Cliente'
      FocusControl = edtCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescCLiente: TLabel
      Left = 136
      Top = 80
      Width = 545
      Height = 25
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 100
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
    object edtCadastro: TDateEdit
      Left = 130
      Top = 40
      Width = 112
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
    object edtFuncionario: TComboEdit
      Left = 348
      Top = 40
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
      TabOrder = 3
      OnButtonClick = edtFuncionarioButtonClick
      OnChange = edtFuncionarioChange
      OnKeyDown = FormKeyDown
    end
    object gbSaidaItem: TGroupBox
      Left = 9
      Top = 115
      Width = 681
      Height = 326
      Caption = #171#171' Produtos '#187#187
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label3: TLabel
        Left = 211
        Top = 16
        Width = 72
        Height = 16
        Caption = '&Descri'#231#227'o'
        FocusControl = edtDescricao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 12
        Top = 16
        Width = 91
        Height = 16
        Caption = 'C'#243'd. &Produto'
        FocusControl = edtCodProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 457
        Top = 16
        Width = 34
        Height = 16
        Caption = '&Qtde'
        FocusControl = edtQuantidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 509
        Top = 16
        Width = 69
        Height = 16
        Caption = '&Valor Uni.'
        FocusControl = edtPrecoUni
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 628
        Top = 16
        Width = 37
        Height = 16
        Caption = '&Total'
        FocusControl = edtPrecoTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 382
        Top = 296
        Width = 65
        Height = 13
        Caption = 'Qtde. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 490
        Top = 296
        Width = 92
        Height = 13
        Caption = 'Total da Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 405
        Top = 16
        Width = 24
        Height = 16
        Caption = '&Ed.'
        FocusControl = edtEdicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnApaga: TFlatSpeedButton
        Left = 16
        Top = 296
        Width = 161
        Height = 25
        Caption = 'Apagar Item da Sa'#237'da'
        OnClick = btnApagaClick
      end
      object edtCodProduto: TEdit
        Left = 12
        Top = 40
        Width = 93
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = edtCodProdutoEnter
        OnExit = edtCodProdutoExit
        OnKeyDown = FormKeyDown
      end
      object edtDescricao: TEdit
        Left = 110
        Top = 40
        Width = 275
        Height = 19
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = FormKeyDown
      end
      object edtPrecoUni: TCurrencyEdit
        Left = 510
        Top = 40
        Width = 68
        Height = 19
        AutoSize = False
        Ctl3D = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnChange = edtPrecoUniChange
        OnKeyDown = FormKeyDown
      end
      object edtPrecoTotal: TCurrencyEdit
        Left = 584
        Top = 40
        Width = 81
        Height = 19
        AutoSize = False
        Ctl3D = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnKeyDown = edtPrecoTotalKeyDown
      end
      object edtQuantidade: TCurrencyEdit
        Left = 448
        Top = 40
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MinValue = 1.000000000000000000
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Value = 1.000000000000000000
        OnChange = edtPrecoUniChange
        OnExit = edtQuantidadeExit
        OnKeyDown = FormKeyDown
      end
      object dbgProduto: TRxDBGrid
        Left = 12
        Top = 64
        Width = 656
        Height = 225
        TabStop = False
        Ctl3D = False
        DataSource = dsProduto
        FixedColor = clMoneyGreen
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgProdutoCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODBARRA'
            ReadOnly = False
            Title.Caption = 'C'#243'digo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = False
            Title.Caption = 'Descr'#237#231#227'o'
            Width = 279
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EDICAO'
            ReadOnly = False
            Title.Alignment = taCenter
            Title.Caption = 'Edi'#231#227'o.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE'
            ReadOnly = False
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VALORUNI'
            ReadOnly = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Uni.'
            Width = 75
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TOTAL'
            ReadOnly = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 73
            Visible = True
          end>
      end
      object edtQtdeTotal: TCurrencyEdit
        Left = 451
        Top = 296
        Width = 33
        Height = 21
        TabStop = False
        Alignment = taCenter
        AutoSize = False
        Color = clBlack
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtValorTotal: TCurrencyEdit
        Left = 584
        Top = 296
        Width = 81
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clBlack
        Ctl3D = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtEdicao: TCurrencyEdit
        Left = 391
        Top = 40
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyDown = FormKeyDown
      end
    end
    object edtFormapagamento: TComboEdit
      Left = 16
      Top = 462
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
      TabOrder = 6
      OnButtonClick = edtFormapagamentoButtonClick
      OnChange = edtFormapagamentoChange
      OnKeyDown = FormKeyDown
    end
    object edtValorQuitado: TCurrencyEdit
      Left = 573
      Top = 462
      Width = 109
      Height = 21
      AutoSize = False
      Ctl3D = False
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      OnKeyDown = FormKeyDown
    end
    object edtDesconto: TCurrencyEdit
      Left = 466
      Top = 462
      Width = 87
      Height = 21
      AutoSize = False
      Ctl3D = False
      DisplayFormat = '0.00, %;-0.00, %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      OnChange = edtFormapagamentoChange
      OnKeyDown = FormKeyDown
    end
    object edtCliente: TComboEdit
      Left = 68
      Top = 80
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
      OnButtonClick = edtClienteButtonClick
      OnChange = edtClienteChange
      OnKeyDown = FormKeyDown
    end
    object edtHora: TEdit
      Left = 268
      Top = 40
      Width = 53
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
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object pConsultaRapida: TFlatPanel
      Left = 93
      Top = 224
      Width = 259
      Height = 166
      Color = 16776176
      Visible = False
      TabOrder = 9
      OnExit = pConsultaRapidaExit
      object Label18: TLabel
        Left = 3
        Top = 2
        Width = 94
        Height = 13
        Caption = 'Consulta R'#225'pida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgConsulta: TRxDBGrid
        Left = 2
        Top = 40
        Width = 255
        Height = 124
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = dsConsulta
        FixedColor = 16776176
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgConsultaCellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 197
            Visible = True
          end>
      end
      object edtCampo: TFlatEdit
        Left = 2
        Top = 17
        Width = 251
        Height = 22
        ColorFlat = 16776176
        ParentColor = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = edtCampoChange
        OnKeyDown = edtCampoKeyDown
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 566
    Width = 704
  end
  inherited fpBotoes: TFlatPanel
    Width = 704
    TabOrder = 0
    inherited btnFecha: TFlatSpeedButton
      Left = 648
    end
    inherited btnConsulta: TFlatSpeedButton
      Left = 561
      Width = 74
    end
    object btnImprimir: TFlatSpeedButton
      Left = 487
      Top = 0
      Width = 74
      Height = 55
      Hint = 'Imprimi a venda'
      Caption = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFAEABACCCCACBB1AFAFA09D9EFF00FFFF00FFACAAABD3D3D3DBDADAC0BEBE
        ADAAABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA2A2A2C1C1C1A6A6A6949494FF00FFFF00FFA1A1A1C9
        C9C9D0D0D0B5B5B5A1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFAEABACC7C5C6F4F3F3F7F6F6BCBABAB1AFAF5D5C
        5D615F60888687AEACACCBCACAE3E2E2E7E7E7D5D4D4B6B4B5FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2BCBCBCE9E9E9ECECEC
        B1B1B1A6A6A65252525656567D7D7DA3A3A3C0C0C0D8D8D8DDDDDDCACACAABAB
        ABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADABACBBB8B9EAE9E9FF
        FEFEFDFCFCF3F2F2BAB8B8B2B0B04C4B4D232325303032424244626062878486
        AFADADD2D1D1E9E8E8DEDDDDAAA7A8FF00FFFF00FFFF00FFFF00FFFF00FFA2A2
        A2AFAFAFDFDFDFF4F4F4F2F2F2E8E8E8AFAFAFA7A7A74242421A1A1A27272739
        39395757577B7B7BA4A4A4C7C7C7DEDEDED3D3D39E9E9EFF00FFFF00FFFF00FF
        FF00FFAFADAEE1DFDFFDFCFCFCFBFBFAF9F9FCFBFBEDEBECB6B4B4B6B4B49897
        986F6E6F4C4B4D33333528282A2E2E30414143605F608C898AA7A5A5FF00FFFF
        00FFFF00FFFF00FFFF00FFA4A4A4D6D6D6F2F2F2F1F1F1EFEFEFF1F1F1E2E2E2
        ABABABABABAB8D8D8D6464644242422A2A2A1F1F1F2525253838385555558080
        809C9C9CFF00FFFF00FFFF00FFA4A1A2D1CFCFF8F7F7FBFAFAF7F6F6F7F6F6EA
        E9E9C8C7C7ADABACA09D9EA3A1A1AFACADB8B5B6B3B1B19E9D9D7B7A7B575657
        38383A262729434244A19E9FFF00FFFF00FFFF00FF989898C6C6C6EDEDEDF0F0
        F0ECECECECECECDFDFDFBDBDBDA2A2A2949494989898A3A3A3ACACACA8A8A893
        93937070704C4C4C2F2F2F1D1D1D393939959595FF00FFFF00FFFF00FFA4A1A2
        F0F0F0F4F4F4F1F0F0E2E1E1C1BFBFABA8A9B9B7B7D4D3D3B7B5B5A8A5A5A29F
        A09F9C9DA2A0A0ABA8A9B5B3B2B5B3B3A7A5A68483846C6C6DA2A0A0FF00FFFF
        00FFFF00FF989898E6E6E6EAEAEAE6E6E6D7D7D7B6B6B69F9F9FAEAEAEC9C9C9
        ACACAC9C9C9C9696969393939797979F9F9FA9A9A9AAAAAA9C9C9C7979796262
        62979797FF00FFFF00FFFF00FFA4A1A2E6E5E5DBDADABAB8B8A9A6A7BAB8B8D6
        D5D6DFE0DFE4E3E3E8E7E7D8D6D6C9C7C7BAB8B8AFACADA5A2A3A19E9FA09D9E
        A7A4A4B1AEAEB6B4B4A7A5A5FF00FFFF00FFFF00FF989898DBDBDBD0D0D0AFAF
        AF9D9D9DAFAFAFCBCBCBD5D5D5D9D9D9DDDDDDCDCDCDBEBEBEAFAFAFA3A3A399
        99999595959494949B9B9BA5A5A5ABABAB9C9C9CFF00FFFF00FFFF00FFA4A1A2
        B2B0B1A9A7A7BBBABAD4D4D4DCDDDDD9D9D9D5D5D5ECEBEBF8F7F7F6F6F6F1F0
        F0E7E6E6DAD9D9CDCCCCC0BEBEB5B3B3AAA8A8A3A1A1A19E9F9D9A9BFF00FFFF
        00FFFF00FF989898A7A7A79E9E9EB0B0B0CACACAD2D2D2CFCFCFCBCBCBE1E1E1
        EDEDEDECECECE6E6E6DCDCDCCFCFCFC2C2C2B5B5B5AAAAAA9F9F9F9898989595
        95919191FF00FFFF00FFFF00FFA4A1A2BCBABBD5D4D4DADADAD7D7D7D6D6D6D3
        D3D3E3E3E3F7F6F6C5C3C4C6BCC4D1CFD0E1E0E0E8E8E8E9E9E9E2E2E2D9D9D9
        CFCECEC4C3C3BCBABAA8A5A6FF00FFFF00FFFF00FF989898B1B1B1CACACAD0D0
        D0CDCDCDCCCCCCC9C9C9D9D9D9ECECECBABABAB7B7B7C6C6C6D6D6D6DEDEDEDF
        DFDFD8D8D8CFCFCFC4C4C4B9B9B9B1B1B19C9C9CFF00FFFF00FFFF00FFA4A1A2
        D6D6D6D8D8D8D6D6D6D6D6D6D4D4D4E0E0E0F7F6F6C0BCBEAEB2AD80C184B2B6
        B1AEAAACB0AFAFBCBBBBCAC9C9D8D7D7DCDCDCDCDCDCDADADAAFAEAEFF00FFFF
        00FFFF00FF989898CCCCCCCECECECCCCCCCCCCCCCACACAD6D6D6ECECECB4B4B4
        A5A5A5969696A9A9A9A2A2A2A5A5A5B1B1B1BFBFBFCDCDCDD2D2D2D2D2D2D0D0
        D0A4A4A4FF00FFFF00FFFF00FFFF00FFBFBDBEDBDBDBD8D9D9D9D9D9E6E6E6EA
        E9E9B7B5B5BDBBBCF2F2F1D4F1D5EBEEEBE7E5E6FAC0AFC1BFC0B3B1B1AAA7A8
        AFACADBDBBBBBDBBBCB6B3B4FF00FFFF00FFFF00FFFF00FFB4B4B4D1D1D1CECE
        CECFCFCFDCDCDCDFDFDFACACACB2B2B2E7E7E7D8D8D8E2E2E2DCDCDCCACACAB6
        B6B6A8A8A89E9E9EA3A3A3B2B2B2B2B2B2AAAAAAFF00FFFF00FFFF00FFFF00FF
        FF00FFB5B3B4CAC9C9D6D5D5C6C4C4AEACACCCCACAF7F6F6F7F6F6F7F2F6EFED
        EDEBEAEAE9E9E9E8E8E8E2E2E2D9D9D9CDCDCDAAA8A9A5A2A3FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFAAAAAABFBFBFCBCBCBBBBBBBA3A3A3C1C1C1ECECEC
        ECECECEAEAEAE4E4E4E0E0E0DFDFDFDEDEDED8D8D8CFCFCFC3C3C39F9F9F9999
        99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA19E9FBBBABADC
        DCDCCDCDCDADAEAEC9C9C9DDDCDCE6E5E5E8E7E7E6E6E6E4E4E4E5E5E5E0E0E0
        C5C5C5BAB7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF959595B0B0B0D2D2D2C3C3C3A3A3A3BFBFBFD2D2D2DBDBDBDDDDDDDCDCDCDA
        DADADBDBDBD6D6D6BBBBBBAEAEAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB1AFB0F6F7F7F7F6F5E2DFDEBCBABABABBBBC4C7C8D4D7
        D8D5D8D8D8D9D9D8D8D8C6C5C6ADABACBAB7B8FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F8FD2D2D2D2D2D2BCBCBC999999
        989898A2A2A2B2B2B2B2B2B2B4B4B4B4B4B4BBBBBBA2A2A2AEAEAEFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEED9D8FF
        EAE2FFE5DAFEDFD4FADDD3F6DCD3F1DCD6ECDEDAE6E1DFDBDBDBC8C7C8FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBFBFBFCCCCCCC8C8C8C5C5C5C2C2C2C0C0C0BFBFBFBFBFBFBEBEBEB7
        B7B7A3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE5C4C1FFE7DDFFE1D5FFDACEFFD4C5FFCEBCFFC9
        B7FFC7B3FDC1AEEBD2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAFAFAFCACACAC6C6C6C2C2C2
        BEBEBEB9B9B9B7B7B7B5B5B5B1B1B1B9B9B9FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C5C1FF
        EBE1FFE1D5FFDACEFFD5C7FECFBFFECAB8FFC4B0F9B9A7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFAFAFAFCCCCCCC6C6C6C2C2C2BFBFBFBABABAB7B7B7B3B3B3ACACACFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFECCDC8FFEBE1FFE1D5FFDACEFFD5C7FECFBFFECA
        B8FFC5B1F0B4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6B6B6CCCCCCC6C6C6C2C2C2
        BFBFBFBABABAB7B7B7B4B4B4A6A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8CCC8FF
        E9DFFFE1D5FFDACEFFD5C7FECFBFFECAB8FFC5B1FAC0AFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFB4B4B4CBCBCBC6C6C6C2C2C2BFBFBFBABABAB7B7B7B4B4B4B0B0B0FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE8CCC8FFE7DDFFE1D5FFDACEFFD5C7FECFBFFFCA
        B8FAC0AFFAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4CACACAC6C6C6C2C2C2
        BFBFBFBABABAB7B7B7B0B0B0B0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7C9C5FFF1E9FF
        E7DDFFE1D5FFDACEFED5C7FED0BFFFCCB9FAC0AFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFB2B2B2D0D0D0CACACAC6C6C6C2C2C2BEBEBEBABABAB8B8B8B0B0B0FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE8CCC8FFF4EBFFEBE1FFE6D9FFDFD2FFD9CAFFD4C3F1BD
        B0FAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4D1D1D1CCCCCCC8C8C8C4C4C4
        C0C0C0BDBDBDACACACB0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9B3B1E8CCC8E7C7C3E7
        C5BFE7C2BBE7BEB8E7BCB4E5B6AFFAC0AFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1
        A1B4B4B4B1B1B1AFAFAFADADADABABABA9A9A9A6A6A6B0B0B0FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnConsultaClick
    end
  end
  inherited qrCadastro: TASQLiteQuery
    SQLiteDateFormat = True
    Left = 368
  end
  inherited qrNavegacao: TASQLiteQuery
    SQL.Strings = ()
    Left = 416
  end
  object dsProduto: TDataSource
    DataSet = tbProduto
    Left = 544
    Top = 264
  end
  object qrProduto: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    TableDateFormat = 'dd/mm/yy hh:mm:ss'
    Connection = dbCadastro
    MaxResults = 0
    StartResult = 0
    Left = 584
    Top = 264
  end
  object tbProduto: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    TableDateFormat = 'dd/mm/yy'
    Connection = dbCadastro
    MaxResults = 0
    StartResult = 0
    TypeLess = True
    Left = 592
    Top = 307
  end
  object qrConsulta: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    TableDateFormat = 'dd/mm/yy'
    Connection = dbCadastro
    MaxResults = 0
    StartResult = 0
    TypeLess = True
    SQL.Strings = (
      'SELECT FORMAPAGAMENTO, DESCRICAO FROM FORMAPAGAMENTO')
    Left = 182
    Top = 328
  end
  object dsConsulta: TDataSource
    DataSet = qrConsulta
    Left = 142
    Top = 320
  end
  object qrAtualiza: TASQLiteQuery
    AutoCommit = False
    SQLiteDateFormat = False
    TableDateFormat = 'dd/mm/yy'
    Connection = dbCadastro
    MaxResults = 0
    StartResult = 0
    Left = 545
    Top = 299
  end
end
