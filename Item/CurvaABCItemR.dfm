inherited frmCurvaABCItemR: TfrmCurvaABCItemR
  DataSet = qrRelatorio
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100.000000000000000000
    2970.000000000000000000
    100.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  inherited bndCabecalho: TQRBand
    Size.Values = (
      105.833333333333300000
      1899.708333333333000000)
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
    Height = 165
    Size.Values = (
      436.562500000000000000
      1899.708333333333000000)
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
      Left = 182
      Top = 72
      Width = 354
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.791666666666680000
        481.541666666666700000
        190.500000000000000000
        936.625000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Relat'#243'rio de Faturamento por Produto'
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
      Left = 13
      Top = 102
      Width = 692
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        34.395833333333340000
        269.875000000000000000
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
    object QRLabel2: TQRLabel
      Left = 8
      Top = 148
      Width = 97
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        391.583333333333400000
        256.645833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'C'#243'd. Barras'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 108
      Top = 148
      Width = 257
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        285.750000000000000000
        391.583333333333400000
        679.979166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descri'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 367
      Top = 148
      Width = 50
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        971.020833333333400000
        391.583333333333400000
        132.291666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 423
      Top = 148
      Width = 91
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1119.187500000000000000
        391.583333333333400000
        240.770833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Faturamento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 518
      Top = 148
      Width = 49
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1370.541666666667000000
        391.583333333333400000
        129.645833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Perc.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel8: TQRLabel
      Left = 570
      Top = 148
      Width = 49
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1508.125000000000000000
        391.583333333333400000
        129.645833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '% Lucro.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 624
      Top = 148
      Width = 85
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1651.000000000000000000
        391.583333333333400000
        224.895833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Lucro.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  inherited bndRodape: TQRBand
    Top = 295
    Size.Values = (
      52.916666666666660000
      1899.708333333333000000)
    inherited Pagina: TQRSysData
      Left = 624
      Top = 22
      Size.Values = (
        44.979166666666670000
        1651.000000000000000000
        58.208333333333340000
        248.708333333333300000)
      FontSize = 10
    end
  end
  object bnd1: TQRBand [3]
    Left = 38
    Top = 243
    Width = 718
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bnd1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625000000000000000
      1899.708333333333000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 8
      Top = 1
      Width = 97
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        2.645833333333333000
        256.645833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'ITEM'
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
      Left = 108
      Top = 1
      Width = 257
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        285.750000000000000000
        2.645833333333333000
        679.979166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESC_ITEM'
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
      Left = 367
      Top = 1
      Width = 50
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        971.020833333333400000
        2.645833333333333000
        132.291666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'QTDE'
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
      Left = 423
      Top = 1
      Width = 91
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1119.187500000000000000
        2.645833333333333000
        240.770833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'FAT_ITEM'
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
    object QRDBText5: TQRDBText
      Left = 518
      Top = 1
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1370.541666666667000000
        2.645833333333333000
        129.645833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'PERC'
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
    object lLucro: TQRLabel
      Left = 570
      Top = 0
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1508.125000000000000000
        0.000000000000000000
        129.645833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'lLucro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object lLucroT: TQRLabel
      Left = 624
      Top = 0
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1651.000000000000000000
        0.000000000000000000
        224.895833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'lLucroT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
  end
  object ChildBand1: TQRChildBand [4]
    Left = 38
    Top = 315
    Width = 718
    Height = 16
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
      42.333333333333340000
      1899.708333333333000000)
    ParentBand = bndRodape
  end
  object QRBand2: TQRBand [5]
    Left = 38
    Top = 261
    Width = 718
    Height = 34
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      89.958333333333340000
      1899.708333333333000000)
    BandType = rbSummary
    object lblQtde: TQRLabel
      Left = 367
      Top = 7
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        971.020833333333400000
        18.520833333333340000
        132.291666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Quantidade'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object lblFat: TQRLabel
      Left = 423
      Top = 7
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1119.187500000000000000
        18.520833333333340000
        240.770833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Faturamento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 249
      Top = 7
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        658.812500000000000000
        18.520833333333340000
        304.270833333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object lLucroTotal: TQRLabel
      Left = 624
      Top = 7
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1651.000000000000000000
        18.520833333333340000
        224.895833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Lucro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  inherited qrRelatorio: TIBQuery
    AfterOpen = qrRelatorioAfterOpen
  end
  object qrExec: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 16
  end
end
