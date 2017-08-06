inherited frmHistoricoR: TfrmHistoricoR
  Width = 816
  Height = 1056
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  inherited bndCabecalho: TQRBand
    Width = 740
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
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
    Width = 740
    Height = 128
    Size.Values = (
      338.666666666666700000
      1957.916666666667000000)
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
      Left = 234
      Top = 64
      Width = 271
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.791666666666680000
        619.125000000000000000
        169.333333333333300000
        717.020833333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Hist'#243'rico de Entrada e Sa'#237'da'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 16
    end
    object lblData: TQRLabel
      Left = 24
      Top = 96
      Width = 692
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        63.500000000000000000
        254.000000000000000000
        1830.916666666667000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = False
      AutoStretch = False
      Caption = 'lblData'
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
  inherited bndRodape: TQRBand
    Top = 419
    Width = 740
    Height = 25
    Size.Values = (
      66.145833333333340000
      1957.916666666667000000)
    inherited Pagina: TQRSysData
      Left = 638
      Top = 2
      Size.Values = (
        44.979166666666670000
        1688.041666666667000000
        5.291666666666667000
        248.708333333333300000)
      FontSize = 10
    end
  end
  object bndent: TQRSubDetail [3]
    Left = 38
    Top = 247
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bndentBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    Master = Owner
    FooterBand = bndFootE
    HeaderBand = bndentg
    PrintBefore = False
    PrintIfEmpty = True
    object A1: TQRDBText
      Left = 4
      Top = 3
      Width = 69
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        7.937500000000000000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'ITEMENTRADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 160
      Top = 3
      Width = 193
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        423.333333333333300000
        7.937500000000000000
        510.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'DESCRICAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 356
      Top = 3
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        941.916666666666800000
        7.937500000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'EDICAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 412
      Top = 3
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        7.937500000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'QUANTIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 468
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1238.250000000000000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'VALORUNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 532
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 596
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1576.916666666667000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'DEVOLUCAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 660
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1746.250000000000000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'SITUACAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 76
      Top = 3
      Width = 83
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        201.083333333333300000
        7.937500000000000000
        219.604166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'CODBARRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object bndentg: TQRBand [4]
    Left = 38
    Top = 206
    Width = 740
    Height = 41
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      108.479166666666700000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object l1: TQRLabel
      Left = 4
      Top = 2
      Width = 100
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        10.583333333333330000
        5.291666666666667000
        264.583333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Entradas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel2: TQRLabel
      Left = 4
      Top = 23
      Width = 69
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        60.854166666666680000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'N'#186' da Entrada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 76
      Top = 23
      Width = 277
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        201.083333333333300000
        60.854166666666680000
        732.895833333333200000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Produto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 356
      Top = 23
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        941.916666666666800000
        60.854166666666680000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Edi'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 412
      Top = 23
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        60.854166666666680000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 468
      Top = 23
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1238.250000000000000000
        60.854166666666680000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vlr. Unit.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 532
      Top = 23
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        60.854166666666680000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 596
      Top = 23
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1576.916666666667000000
        60.854166666666680000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Devolu'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 660
      Top = 23
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1746.250000000000000000
        60.854166666666680000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Devolvido?'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object bndFootE: TQRBand [5]
    Left = 38
    Top = 268
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bndFootEBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRLabel18: TQRLabel
      Left = 275
      Top = 2
      Width = 133
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        727.604166666666800000
        5.291666666666667000
        351.895833333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lQtdeEnt: TQRLabel
      Left = 412
      Top = 2
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        5.291666666666667000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lTotalEnt: TQRLabel
      Left = 532
      Top = 2
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        5.291666666666667000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object bndsai: TQRSubDetail [6]
    Left = 38
    Top = 337
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bndsaiBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    Master = Owner
    FooterBand = bndFootS
    HeaderBand = bndsaig
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText9: TQRDBText
      Left = 4
      Top = 3
      Width = 69
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        7.937500000000000000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'ITEMSAIDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 160
      Top = 3
      Width = 193
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        423.333333333333300000
        7.937500000000000000
        510.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'DESCRICAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 356
      Top = 3
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        941.916666666666800000
        7.937500000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'EDICAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 412
      Top = 3
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        7.937500000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'QUANTIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 468
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1238.250000000000000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'VALORUNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 532
      Top = 3
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        7.937500000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 76
      Top = 3
      Width = 83
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        201.083333333333300000
        7.937500000000000000
        219.604166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'CODBARRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object bndsaig: TQRBand [7]
    Left = 38
    Top = 295
    Width = 740
    Height = 42
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      111.125000000000000000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRLabel10: TQRLabel
      Left = 4
      Top = 2
      Width = 100
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        10.583333333333330000
        5.291666666666667000
        264.583333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sa'#237'das'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel11: TQRLabel
      Left = 4
      Top = 24
      Width = 69
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        63.500000000000000000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'N'#186' da Sa'#237'da'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 76
      Top = 24
      Width = 277
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        201.083333333333300000
        63.500000000000000000
        732.895833333333200000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Produto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 356
      Top = 24
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        941.916666666666800000
        63.500000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Edi'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 412
      Top = 24
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        63.500000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 468
      Top = 24
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1238.250000000000000000
        63.500000000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vlr. Unit.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 532
      Top = 24
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        63.500000000000000000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object bndFootS: TQRBand [8]
    Left = 38
    Top = 358
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bndFootSBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRLabel17: TQRLabel
      Left = 275
      Top = 2
      Width = 133
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        727.604166666666800000
        5.291666666666667000
        351.895833333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lQtdeSai: TQRLabel
      Left = 412
      Top = 2
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1090.083333333333000000
        5.291666666666667000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lTotalSai: TQRLabel
      Left = 532
      Top = 2
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        5.291666666666667000
        161.395833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object bndentc: TQRChildBand [9]
    Left = 38
    Top = 289
    Width = 740
    Height = 6
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      15.875000000000000000
      1957.916666666667000000)
    ParentBand = bndFootE
  end
  object ChildBand2: TQRChildBand [10]
    Left = 38
    Top = 379
    Width = 740
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      0.000000000000000000
      1957.916666666667000000)
    ParentBand = bndFootS
  end
  object QRBand5: TQRBand [11]
    Left = 38
    Top = 379
    Width = 740
    Height = 40
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    BandType = rbSummary
    object lest: TQRLabel
      Left = 539
      Top = 10
      Width = 125
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1426.104166666667000000
        26.458333333333330000
        330.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde Estoque:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object ldev: TQRLabel
      Left = 219
      Top = 10
      Width = 133
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        579.437500000000000000
        26.458333333333330000
        351.895833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde Devolvida:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lent: TQRLabel
      Left = 67
      Top = 10
      Width = 133
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        177.270833333333300000
        26.458333333333330000
        351.895833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde de Entrada:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lsai: TQRLabel
      Left = 379
      Top = 10
      Width = 133
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1002.770833333333000000
        26.458333333333330000
        351.895833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde Vendida:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object qrSai: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 208
  end
  object qrEnt: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 384
  end
end
