inherited frmDevolucaoR: TfrmDevolucaoR
  Width = 1123
  Height = 794
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = []
  Page.Orientation = poLandscape
  Page.Values = (
    100.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    2970.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  inherited bndCabecalho: TQRBand
    Width = 1047
    Size.Values = (
      105.833333333333300000
      2770.187500000000000000)
    inherited Data: TQRSysData
      Width = 178
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        470.958333333333400000)
      Data = qrsDateTime
      FontSize = 9
    end
  end
  inherited bndTitulo: TQRBand
    Width = 1047
    Height = 96
    Size.Values = (
      254.000000000000000000
      2770.187500000000000000)
    inherited edtEmpresa: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        21.166666666666670000
        193.145833333333300000)
      FontSize = 10
    end
    inherited edtEndereco: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        63.500000000000000000
        193.145833333333300000)
      FontSize = 10
    end
    inherited edtCNPJ: TQRLabel
      Size.Values = (
        44.979166666666670000
        1100.666666666667000000
        21.166666666666670000
        100.541666666666700000)
      FontSize = 10
    end
    inherited edtTelefones: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        105.833333333333300000
        193.145833333333300000)
      FontSize = 10
    end
    inherited lblEmpresa: TQRLabel
      Size.Values = (
        44.979166666666670000
        232.833333333333300000
        21.166666666666670000
        849.312500000000000000)
      FontSize = 10
    end
    inherited lblEndereco: TQRLabel
      Size.Values = (
        44.979166666666670000
        232.833333333333300000
        63.500000000000000000
        849.312500000000000000)
      FontSize = 10
    end
    inherited lblCNPJ: TQRLabel
      Size.Values = (
        44.979166666666670000
        1206.500000000000000000
        21.166666666666670000
        637.645833333333200000)
      FontSize = 10
    end
    inherited lblTel1: TQRLabel
      Size.Values = (
        44.979166666666670000
        232.833333333333300000
        105.833333333333300000
        341.312500000000000000)
      FontSize = 10
    end
    inherited lblTel2: TQRLabel
      Size.Values = (
        44.979166666666670000
        613.833333333333200000
        105.833333333333300000
        341.312500000000000000)
      FontSize = 10
    end
    inherited lblTel3: TQRLabel
      Size.Values = (
        44.979166666666670000
        1016.000000000000000000
        105.833333333333300000
        341.312500000000000000)
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 421
      Top = 64
      Width = 204
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.083333333333340000
        1113.895833333333000000
        169.333333333333300000
        539.750000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Nota de Devolu'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 18
    end
  end
  inherited bndRodape: TQRBand
    Top = 300
    Width = 1047
    Size.Values = (
      52.916666666666660000
      2770.187500000000000000)
    inherited Pagina: TQRSysData
      Left = 857
      Top = 22
      Size.Values = (
        44.979166666666670000
        2267.479166666667000000
        58.208333333333340000
        248.708333333333300000)
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [3]
    Left = 38
    Top = 174
    Width = 1047
    Height = 83
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      219.604166666666700000
      2770.187500000000000000)
    Expression = 'DESC_FORNECEDOR'
    FooterBand = bndPe
    Master = Owner
    ReprintOnNewPage = True
    object QRLabel2: TQRLabel
      Left = 8
      Top = 40
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        105.833333333333300000
        185.208333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fornecedor:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 8
      Top = 16
      Width = 194
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        42.333333333333340000
        513.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Produtos a serem Devolvidos em:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 88
      Top = 40
      Width = 737
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        232.833333333333400000
        105.833333333333300000
        1949.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESC_FORNECEDOR'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 4
      Top = 64
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        169.333333333333300000
        267.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cod.Produto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 108
      Top = 64
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        285.750000000000000000
        169.333333333333300000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Edi'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 164
      Top = 64
      Width = 189
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        433.916666666666700000
        169.333333333333300000
        500.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Produto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 356
      Top = 64
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        941.916666666666800000
        169.333333333333300000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Rua'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 446
      Top = 64
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1180.041666666667000000
        169.333333333333300000
        119.062500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 494
      Top = 64
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1307.041666666667000000
        169.333333333333300000
        119.062500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Devol'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 542
      Top = 64
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1434.041666666667000000
        169.333333333333300000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vendas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 598
      Top = 64
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1582.208333333333000000
        169.333333333333300000
        140.229166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vl. Uni'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 654
      Top = 64
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1730.375000000000000000
        169.333333333333300000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vl. Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 718
      Top = 64
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000
        169.333333333333300000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vl. Devol'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel17: TQRLabel
      Left = 782
      Top = 64
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2069.041666666667000000
        169.333333333333300000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vl. Venda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel18: TQRLabel
      Left = 854
      Top = 64
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2259.541666666667000000
        169.333333333333300000
        119.062500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Lucro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel19: TQRLabel
      Left = 902
      Top = 64
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2386.541666666667000000
        169.333333333333300000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vl. Pagar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 208
      Top = 16
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        550.333333333333400000
        42.333333333333340000
        216.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DEVOLUCAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object bndPe: TQRBand [4]
    Left = 38
    Top = 277
    Width = 1047
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = bndPeAfterPrint
    AlignToBottom = False
    BeforePrint = bndPeBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.854166666666680000
      2770.187500000000000000)
    BandType = rbGroupFooter
    object edtQuantidade: TQRLabel
      Left = 447
      Top = 3
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1182.687500000000000000
        7.937500000000000000
        113.770833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtQuantidade'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtqtde: TQRLabel
      Left = 494
      Top = 3
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1307.041666666667000000
        7.937500000000000000
        113.770833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtQuantidade'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtVendida: TQRLabel
      Left = 542
      Top = 3
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1434.041666666667000000
        7.937500000000000000
        137.583333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtQuantidade'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtTotal: TQRLabel
      Left = 654
      Top = 3
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1730.375000000000000000
        7.937500000000000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtTotal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtValorEncalhado: TQRLabel
      Left = 718
      Top = 3
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000
        7.937500000000000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtTotal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtValorVendida: TQRLabel
      Left = 782
      Top = 3
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2069.041666666667000000
        7.937500000000000000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtTotal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtLucro: TQRLabel
      Left = 854
      Top = 3
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2259.541666666667000000
        7.937500000000000000
        116.416666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtTotal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object edtValoraPagar: TQRLabel
      Left = 902
      Top = 3
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2386.541666666667000000
        7.937500000000000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'edtTotal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [5]
    Left = 38
    Top = 257
    Width = 1047
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666670000
      2770.187500000000000000)
    BandType = rbDetail
    object QRDBText2: TQRDBText
      Left = 5
      Top = 2
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        5.291666666666667000
        264.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'CODBARRA'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 109
      Top = 2
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        288.395833333333300000
        5.291666666666667000
        134.937500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'EDICAO'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 165
      Top = 2
      Width = 188
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        436.562500000000000000
        5.291666666666667000
        497.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESC_PRODUTO'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 356
      Top = 2
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        941.916666666666800000
        5.291666666666667000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'RUA'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 447
      Top = 2
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1182.687500000000000000
        5.291666666666667000
        113.770833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'QUANTIDADE'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 494
      Top = 2
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1307.041666666667000000
        5.291666666666667000
        113.770833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'QTDEENCALHADO'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 542
      Top = 2
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1434.041666666667000000
        5.291666666666667000
        137.583333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VENDIDA'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 598
      Top = 2
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1582.208333333333000000
        5.291666666666667000
        137.583333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALORUNITARIO'
      OnPrint = QRDBText9Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 654
      Top = 2
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1730.375000000000000000
        5.291666666666667000
        156.104166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'TOTAL'
      OnPrint = QRDBText10Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 718
      Top = 2
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000
        5.291666666666667000
        164.041666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALORENCALHADO'
      OnPrint = QRDBText11Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 782
      Top = 2
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2069.041666666667000000
        5.291666666666667000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALORVENDIDA'
      OnPrint = QRDBText12Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 854
      Top = 2
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2259.541666666667000000
        5.291666666666667000
        116.416666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'LUCRO'
      OnPrint = QRDBText13Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 902
      Top = 2
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2386.541666666667000000
        5.291666666666667000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALORAPAGAR'
      OnPrint = QRDBText14Print
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
end
