inherited frmEntradaR: TfrmEntradaR
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
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        388.937500000000000000)
      FontSize = 9
    end
  end
  inherited bndTitulo: TQRBand
    Height = 99
    Size.Values = (
      261.937500000000000000
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
      Left = 258
      Top = 72
      Width = 202
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        682.625000000000000000
        190.500000000000000000
        534.458333333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Entrada de Mercadorias'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 14
    end
  end
  inherited bndRodape: TQRBand
    Top = 337
    Size.Values = (
      52.916666666666660000
      1899.708333333333000000)
    inherited Pagina: TQRSysData
      Left = 624
      Size.Values = (
        44.979166666666670000
        1651.000000000000000000
        0.000000000000000000
        248.708333333333300000)
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [3]
    Left = 38
    Top = 177
    Width = 718
    Height = 47
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
      124.354166666666700000
      1899.708333333333000000)
    Expression = 'ENTRADA'
    FooterBand = QRBand2
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel2: TQRLabel
      Left = 11
      Top = 6
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        29.104166666666670000
        15.875000000000000000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fornecedor:'
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
      Left = 379
      Top = 6
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1002.770833333333000000
        15.875000000000000000
        134.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Margem:'
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
    object QRDBText3: TQRDBText
      Left = 90
      Top = 6
      Width = 271
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        238.125000000000000000
        15.875000000000000000
        717.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESC_FORNECEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText4: TQRDBText
      Left = 440
      Top = 6
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1164.166666666667000000
        15.875000000000000000
        211.666666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'MARGEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 11
      Top = 23
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        29.104166666666670000
        60.854166666666680000
        201.083333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Data:'
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
      Left = 168
      Top = 23
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        444.500000000000000000
        60.854166666666680000
        108.479166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Hora:'
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
    object QRDBText2: TQRDBText
      Left = 90
      Top = 23
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        238.125000000000000000
        60.854166666666680000
        187.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText5: TQRDBText
      Left = 210
      Top = 23
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        555.625000000000000000
        60.854166666666680000
        187.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'HORA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object QRBand1: TQRBand [4]
    Left = 38
    Top = 245
    Width = 718
    Height = 17
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
      44.979166666666670000
      1899.708333333333000000)
    BandType = rbDetail
    object QRDBText9: TQRDBText
      Left = 13
      Top = 1
      Width = 120
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        34.395833333333340000
        2.645833333333333000
        317.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
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
    object QRDBText10: TQRDBText
      Left = 135
      Top = 1
      Width = 226
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        357.187500000000000000
        2.645833333333333000
        597.958333333333400000)
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
    object QRDBText11: TQRDBText
      Left = 363
      Top = 1
      Width = 42
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        960.437499999999900000
        2.645833333333333000
        111.125000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
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
      Left = 407
      Top = 1
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1076.854166666667000000
        2.645833333333333000
        142.875000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
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
      Left = 463
      Top = 1
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1225.020833333333000000
        2.645833333333333000
        195.791666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALORUNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 540
      Top = 1
      Width = 82
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1428.750000000000000000
        2.645833333333333000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 625
      Top = 1
      Width = 82
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1653.645833333333000000
        2.645833333333333000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'TOTAL_CUSTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object QRBand2: TQRBand [5]
    Left = 38
    Top = 262
    Width = 718
    Height = 75
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      198.437500000000000000
      1899.708333333333000000)
    BandType = rbGroupFooter
    object lblQtde: TQRLabel
      Left = 406
      Top = 6
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1074.208333333333000000
        15.875000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
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
    object le1: TQRExpr
      Left = 540
      Top = 6
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1428.750000000000000000
        15.875000000000000000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'sum(TOTAL)'
      Mask = '#0.00'
      FontSize = 10
    end
    object le2: TQRExpr
      Left = 625
      Top = 6
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1653.645833333333000000
        15.875000000000000000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'sum(TOTAL_CUSTO)'
      Mask = '#0.00'
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 379
      Top = 38
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1002.770833333333000000
        100.541666666666700000
        396.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Margem de Lucro da Nota:'
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
    object lmargem: TQRLabel
      Left = 535
      Top = 38
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1415.520833333333000000
        100.541666666666700000
        134.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lmargem'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand1: TQRChildBand [6]
    Left = 38
    Top = 224
    Width = 718
    Height = 21
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
      55.562500000000000000
      1899.708333333333000000)
    ParentBand = QRGroup1
    object QRLabel8: TQRLabel
      Left = 13
      Top = 2
      Width = 120
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        34.395833333333330000
        5.291666666666667000
        317.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cod. Produto'
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
      Left = 135
      Top = 2
      Width = 226
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        357.187500000000000000
        5.291666666666667000
        597.958333333333400000)
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
    object QRLabel10: TQRLabel
      Left = 363
      Top = 2
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        960.437499999999900000
        5.291666666666667000
        111.125000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Edi'#231#227'o'
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
    object QRLabel11: TQRLabel
      Left = 407
      Top = 2
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1076.854166666667000000
        5.291666666666667000
        142.875000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Qtde.'
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
    object QRLabel12: TQRLabel
      Left = 463
      Top = 2
      Width = 74
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1225.020833333333000000
        5.291666666666667000
        195.791666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vlr. Unit'#225'rio'
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
    object QRLabel13: TQRLabel
      Left = 540
      Top = 2
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1428.750000000000000000
        5.291666666666667000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
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
      Left = 625
      Top = 2
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1653.645833333333000000
        5.291666666666667000
        216.958333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Custo'
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
end
