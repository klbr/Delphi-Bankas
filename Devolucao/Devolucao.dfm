inherited frmDevolucao: TfrmDevolucao
  Left = 246
  Top = 118
  Caption = 'Devolu'#231#227'o'
  ClientHeight = 456
  ClientWidth = 763
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 763
    Height = 381
    Enabled = True
    object edtDescFornecedor: TLabel
      Left = 64
      Top = 24
      Width = 265
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 85
      Height = 16
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescGrupo: TLabel
      Left = 398
      Top = 24
      Width = 273
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 336
      Top = 6
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
    object dbgDevolucao: TRxDBGrid
      Left = 1
      Top = 51
      Width = 758
      Height = 318
      Ctl3D = False
      DataSource = dsDevolucao
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODBARRA'
          ReadOnly = False
          Title.Caption = 'Cod. Produto'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODUTO'
          ReadOnly = False
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DEVOLUCAO'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'Devolu'#231#227'o'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DEVOLVIDO'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'Devolvido?'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA'
          ReadOnly = False
          Title.Caption = 'Dia Entrada'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_FORNECEDOR'
          ReadOnly = False
          Title.Caption = 'Fornecedor'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RUA'
          ReadOnly = False
          Title.Caption = 'Rua'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EDICAO'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'Edi'#231#227'o'
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'MARGEM'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Margem (%)'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QUANTIDADE'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'QTDE'
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDEENCALHADO'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'Encalhado'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VENDIDA'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'Vendida'
          Width = 45
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALORUNITARIO'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Total'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALORENCALHADO'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Devol'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALORVENDIDA'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Vend'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'LUCRO'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Lucro'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALORAPAGAR'
          ReadOnly = False
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor a Pagar'
          Width = 70
          Visible = True
        end>
    end
    object edtFornecedor: TComboEdit
      Left = 4
      Top = 24
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
      TabOrder = 0
      OnButtonClick = edtFornecedorButtonClick
      OnChange = edtFornecedorChange
      OnClick = edtFornecedorClick
      OnKeyDown = FormKeyDown
    end
    object edtGrupo: TComboEdit
      Left = 336
      Top = 24
      Width = 57
      Height = 22
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
      TabOrder = 1
      OnButtonClick = edtGrupoButtonClick
      OnChange = edtGrupoChange
      OnClick = edtGrupoClick
    end
  end
  inherited sbStatus: TStatusBar
    Top = 437
    Width = 763
  end
  inherited fpBotoes: TFlatPanel
    Width = 763
    inherited btnInclui: TFlatSpeedButton
      Left = 180
      Top = 2
      Width = 90
      Height = 54
      Hint = 'Gera Devolu'#231#227'o'
      Caption = '&Gerar Devolu'#231#227'o'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC6701CC6701CC6701CC6701CC67
        01CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC
        6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701CC6701FFF8F1
        FFF6ECFFF3E6FFF0DFFEEDD9993300FEF7EDFFF4E9FFF3E5FEF1E1FFEFDCEBC7
        ACFEEAD2FEE8CEFEE6C9FFE3C4FEE1C1EABD97FFDDB9FEDCB5FEDAB2FED8AECC
        6701CC6701FFFCF7FFF9F2FEF7EDFFF3E7FEF0E0993300FFF8F1FFF6ECFFF4E8
        FEF2E3FEEFDFEBC9AEFEECD5FEE9D1FEE7CCFEE5C8FEE2C4EABD99FEDEBAFEDD
        B7FEDBB4FED9B0CC6701CC6701FFFDFBFFFBF7FFF9F3FFF6EDFFF4E7993300FF
        F9F3FFF7EFFFF5EAFFF3E6FFF2E2EBC9B1FFEDD8FEEBD3FFE9CFFFE6CBFFE3C6
        EABE9AFEE0BDFEDDBAFEDCB6FEDBB2CC6701CC6701FFFFFFFFFEFCFFFCF8FFF9
        F3FFF7EE993300FFFBF5FFF8F1FFF6EDFFF4E9FEF2E5EBCAB3FEEEDBFFECD7FE
        E9D2FEE7CEFEE5C9EAC09DFFE1C0FEDFBCFEDDB8FFDBB4CC6701CC6701993300
        993300993300993300993300993300EBD3C6EBD1C3EBD1BFEACFBDEACDB9EBCC
        B6EAC9B2EBC8AEEBC6AAEBC4A7EBC3A3EBC19FEABF9BEBBD99EABC95EABA92CC
        6701CC6701FFFFFFFFFFFFFFFFFFFFFEFDFFFCF9993300FFFCF9FEFAF6FFF8F2
        FFF7EEFFF5EAEBCDB8FFF1E2FFEEDDFFECD8FEEBD3FEE8CFEBC1A1FEE4C5FEE2
        C1FEE0BDFFDEB9CC6701CC6701FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE993300FF
        FDFBFFFCF7FEFAF4FFF8F0FFF7EDEACDBAFEF2E4FEF0DFFEEEDBFFECD6FEE9D2
        EAC3A4FFE5C8FFE3C4FEE1C0FEDFBCCC6701CC6701FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF993300FFFEFCFFFCFAFFFBF6FEF9F3FFF7EFEACEBCFFF4E7FFF1E2FF
        EFDEFEEDD9FFEAD4EBC4A6FEE7CBFEE4C6FEE2C3FEE0BECC6701CC6701FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF993300FFFEFEFFFDFBFFFCF8FFFBF6FFF9F2EBCF
        BEFEF5EAFEF3E6FFF0E0FFEEDCFEEDD7EAC5A9FFE8CEFEE6CAFFE4C5FFE1C1CC
        6701CC6701FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993300FFFFFFFFFEFDFFFDFB
        FFFBF7FEF9F4EBD1C0FFF6ECFFF4E8FFF2E3FEEFDFFFEDDAEBC6ABFEE9D1FFE7
        CCFEE5C8FEE3C3CC6701CC670199330099330099330099330099330099330099
        3300993300993300993300993300993300993300993300993300993300993300
        993300993300993300993300993300CC6701CC6701FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF993300FFFFFFFFFFFFFFFFFFFFFFFFFFFEFC993300FFF9F4FFF7EFFF
        F4EAFEF2E3FEEFDC993300FEE9D0FFE5C9FFE2C3FFE2C3CC6701CC6701FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF993300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9933
        00FFFDF9FFFAF4FFF8EFFFF5EAFFF2E4993300FEECD8FEE9D1FEE6CBFEE6CBCC
        6701CC6701FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993300FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF993300FFFFFEFFFCFAFFFAF6FFF8F0FFF5EB993300FEF0DEFEED
        D8FFE9D1FFE9D1CC6701CC6701FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993300FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF993300FFFFFFFFFEFEFFFCFAFFFBF6FFF9F1
        993300FFF3E6FFF0E0FFEDD9FFEDD9CC6701CC6701E27E03E27E03E27E03E27E
        03E27E03E27E03E27E03E27E03E27E03E27E03E27E03E27E03E27E03E27E03E2
        7E03E27E03E27E03E27E03E27E03E27E03E27E03E27E03CC6701FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
    end
    inherited btnAltera: TFlatSpeedButton
      Left = 360
      Top = 2
      Width = 90
      Height = 54
      Hint = 'Visualisa a lista de produtos baixados'
      Caption = '&Visualizar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
        9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
        B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
        E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
        97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
        2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
        FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
        805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
        00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
        8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
        2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
        9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
        918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
        A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
        8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
        9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
        EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
        00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
        B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
        A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
        D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
        D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
        CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
        ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
        FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
        E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
        BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
        F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
        A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
        D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
        A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
        FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
        E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
        A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
        FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
        E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
        9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
    end
    inherited btnCancela: TFlatSpeedButton
      Left = 61
      Top = 24
      Visible = False
    end
    inherited btnExclui: TFlatSpeedButton
      Left = 540
      Top = 2
      Width = 101
      Height = 54
      Hint = 'Atualiza estoque de produtos'
      Caption = '&Atualizar Estoque'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF1A97CE1F9ACF1C99CFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F90C964C1E24DC5
        E630B2DD1698CE1698CE1698CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0C8CC793D5EBBFFFFF76FAFF7BF3FF6BE5F759D5EE47C5E636B6E01698CE1698
        CE1698CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFA46669A36668A36668A36668A36668A36669A36669A36669A36669A36669
        A4676975EDFC5EDAF24DCBEB39BAE21698CE1698CE1698CEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46669F7DDBDEDCEA9EBC79FE9C495E9BD89E6B87FE5
        B87DE5B87EEDC180AD736C79F4FF7EF7FF7FF8FF7BF3FF75EDFE69E1F85BD8F2
        1698CE1698CEFF00FFFF00FFFF00FFFF00FFA0675BFEEDD0F3D9B8F2D4ADEFCF
        A1EEC996B7C47D015703025A0403620603670602630502590302580474EFFF75
        EFFF79F0FF7BF3FF6BE3FF37B7E61092CAFF00FFFF00FFFF00FFA7756BFFF0DD
        F4DDC4F2D8BAF0D4ACEFCCA02C70276393576393572C7027037309047F0B0475
        08025C0501510372EDFE70EBFE70EBFE5FDCFC5AD5F820A3D4FF00FFFF00FFFF
        00FFBC8268FFF8EAF7E3CFF3DEC4F2D9B8F2D3ACEECEA1EDC796EBC28AF0C782
        AF746C036D08068E0D047B0A025904025B0472EAFE73EBFE5AD7FA66DEFE3CBC
        E3FF00FFFF00FFFF00FFBC8268FFFFF8F8EBDDF6E5D0F3E0C4F2D9B7F0D3ADEE
        CCA1EBC795F3CB8CAF746DE9BD8904740A06950F03700701560372EAFE73EBFE
        5AD5F864DDFC62DDF61596CCFF00FFFF00FFD1926DFFFFFFFCF3EBF8EBDDF7E5
        CFF6E0C4F2D9B8F2D3ACEECEA1F6D199AF756FEEC996015603129F230B901700
        4E0072EAFE73EBFE5AD5F85DD7FA7FF4FF25A7D7FF00FFFF00FFDA9D75FFFFFF
        FEFBF8FBF3EBF7EBDEF6E5D0F4DEC4F3D7B7F2D3AB015603035E060563090564
        0C1FB23B14A027015903036206025F05004B005AD5F884FAFF48C9E90D8EC7FF
        00FFE7AB79FFFFFFFFFFFFFFFBF8FBF3EAF8EBDCF7E3CFFAE5C9FAE3C1004C00
        06750C1A962F31C05730C75622B53E14A126129D21087910004B0056D5FA7BF3
        FF79F0FF199DD0FF00FFE7AB79FFFFFFFFFFFFFFFFFFFEFBF8FBF3EAFBEDDEEE
        D8C2C9AF9EA49187004A0008660F35CA6040DC722DC4510F951C097910004B00
        5AD8FB56D5FA75EFFF86FEFF37BDE3FF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFAFCF7EEA36669A36669A36669A3666900440007670E49ED843FDC6F06
        720C004B009FEBF890E1F895E5FCA9F8FFB2FFFF90EAFB1595CBE7AB79FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAA36669D99855BB7E60F7EBDEF6E5D0004B
        0025AA431F9F39004B006AC5E570C9E670C6E56FC1E172C2E177C7E57BCBE718
        97CCD1926DFBF4F0FAF2EDF8F0EBF7EFEBF7F2EEF2EAE9A36669BB7E60FFFBF8
        FBF3EAF8EBDCF7E3CF046509046309E6D3AB1795CC1795CC1795CC098BC60989
        C50D8EC71090C70E90C9D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1
        926DFFFFFFFFFFFFFEFBF8FBF3EAFBEDDEEED8C2C9AF9EA49187A06A6D92FFFF
        1795CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1795CCAFFF
        FF7AFEFFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7EEA36669A36669A3
        6669A366691795CC1795CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1795CC7AD3EA84EBF4E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
        FAA36669D99855BB7E60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1795CC1795CCD1926DFBF4F0FAF2EDF8F0EB
        F7EFEBF7F2EEF2EAE9A36669BB7E60FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DD1
        926DD1926DD1926DD1926DD1926DD1926DD1926DFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 1
    end
    inherited btnSalva: TFlatSpeedButton
      Left = 108
      Top = 48
      Visible = False
    end
    inherited btnFirst: TFlatSpeedButton
      Left = 2
      Top = 24
      Enabled = False
      Visible = False
    end
    inherited btnPrior: TFlatSpeedButton
      Left = 47
      Top = 24
      Enabled = False
      Visible = False
    end
    inherited btnNext: TFlatSpeedButton
      Left = 92
      Top = 40
      Enabled = False
      Visible = False
    end
    inherited btnLast: TFlatSpeedButton
      Left = 137
      Top = 40
      Visible = False
    end
    inherited btnFecha: TFlatSpeedButton
      Left = 705
      Top = 1
      Height = 54
    end
    inherited btnConsulta: TFlatSpeedButton
      Left = 130
      Top = 48
      Enabled = False
      Visible = False
    end
    object Label16: TLabel
      Left = 6
      Top = 1
      Width = 76
      Height = 32
      Caption = '&Data de '#13#10'Devolu'#231#227'o'
      FocusControl = edtDevolucao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnBuscar: TFlatSpeedButton
      Left = 270
      Top = 2
      Width = 90
      Height = 54
      Hint = 'Busca por Produtos p/ Devolu'#231#227'o'
      Caption = '&Buscar Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066000A91130066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600006600
        00660017AB280A9113006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        66004FD87A42CE6733C15124B53B17AA280A9113006600FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF00660058E0874FD97A42CE6733C15124B63B17AA280A911300
        6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF00660058E08758E08750D87A42CE6733C1
        51199D29006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600006600
        00660050D97A2EAF48006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0066003DBB5E006600FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0670A41876A01880AD0670A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF1388BB2D8DB00D0D0E0707071C4D610D7EB1FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0670A427ACDF39CCFE56939FF2C493806A5400000029
        627AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0976A9158CC039CCFE39CCFE56939FFFCD
        99FFCD994D4134161B1E2A84B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A1D99CC39CCFE1D99CC3BCCFE
        49CFFE54A4BFF2C493FFCD99AD8D6D0707075C96B4FF00FFFF00FF0052862B86
        B300669AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D7EB12EB9EB39CCFE3D
        CDFE2595C673D9FF93E1FFAEE7FFAC9C86FFCD99CDA781070707518EAD00669A
        4499C2659EB7181C1E1C35410E72A2FF00FFFF00FFFF00FFFF00FF158CC039CC
        FE42CEFE5CD4FE7EDBFF439CC6ABE2F9D0F1FFE4F7FFE8EFF3A69786836A5132
        4D5A368FBA82D2F27BDBFF5E8D999D8164030303112D3B00669AFF00FF0670A4
        1486B94AD0FE68D6FE89DEFFA6E5FFC0EDFFBDE1F2589DC0F5FCFFF0FAFFDDF5
        FFBBE6F95EA8CD0D96C357C2EC51D1FE3ECDFE56939FFFCD996D5A470303030C
        5B830D78AB34A9D94EAFD993E1FFAFE8FFC8EFFFDEF5FFEFFAFFF5FCFF2F9DC4
        2D9CC466B8D8459CC40C89B70173A504ADD730B9EB39CCFE39CCFE319CBEF2C4
        93CDA7810000001C739A00669A94DCF93A8FBAD0F1FFE5F7FFF3FBFFF3FBFFE4
        F7FFCDF0FF90D0EC1C9CC803A0CC0392C004ADD70285B504A9D325B8E839CCFE
        39CCFE39CCFE879386CDA781000000186D9400669AD7F3FF84B8D37BB1CDF0FA
        FFDCF4FFC4EDFFAAE6FF8EDFFF70D8FF50D1FE1DA2D40475A80397C4017CAD04
        A4CF0A9FCD39CCFE39CCFE39CCFE39C3F255808607364A0670A400669A8BBBD3
        D0E7F22A81AD247FAD64B5D961B9DF64D5FE48CFFE3BCCFE39CCFE39CCFE35C6
        F81D9DD00690BF03A0CC04A4CF17A7D635C6F81EABDE1092C50076AA005286FF
        00FFFF00FF00669A00669AFF00FFFF00FF0B71A427A1D224A6D924A6D935C6F8
        39CCFE39CCFE39CCFE39CCFE35C6F824A6D9006C9E0076A5005286FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C
        7CAF27ACDF158CC01D99CC179FD11092C5057FB2006C9F005286FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0074A7037BAE006598FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarClick
    end
    object btnAnterior: TFlatSpeedButton
      Left = 450
      Top = 2
      Width = 90
      Height = 54
      Hint = 'Visualisa a lista de produtos baixados'
      Caption = '&Ver Anteriores'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
        9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
        B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
        E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
        97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
        2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
        FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
        805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
        00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
        8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
        2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
        9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
        918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
        A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
        8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
        9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
        EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
        00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
        B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
        A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
        D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
        D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
        CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
        ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
        FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
        E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
        BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
        F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
        A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
        D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
        A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
        FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
        E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
        A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
        FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
        E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
        9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAnteriorClick
    end
    object edtDevolucao: TDateEdit
      Left = 5
      Top = 32
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
      TabOrder = 0
    end
  end
  object dsDevolucao: TDataSource
    DataSet = qrNavegacao
    Left = 424
    Top = 112
  end
  object qrSaida: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 240
    Top = 272
  end
  object qrTemp: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 104
    Top = 232
  end
end
