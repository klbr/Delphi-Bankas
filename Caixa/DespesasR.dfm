inherited frmDespesasR: TfrmDespesasR
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
    Height = 126
    Size.Values = (
      333.375000000000000000
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
      Left = 255
      Top = 64
      Width = 208
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.083333333333340000
        674.687500000000000000
        169.333333333333300000
        550.333333333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Resumo de Despesas'
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
        34.395833333333340000
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
    Top = 340
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
  object QRBand1: TQRBand [3]
    Left = 38
    Top = 259
    Width = 718
    Height = 19
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
      50.270833333333330000
      1899.708333333333000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 12
      Top = 2
      Width = 85
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        31.750000000000000000
        5.291666666666667000
        224.895833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESPESAS'
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
      Left = 100
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
        264.583333333333400000
        5.291666666666667000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'HORA'
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
      Left = 164
      Top = 2
      Width = 165
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        433.916666666666700000
        5.291666666666667000
        436.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'DESC_CREDOR'
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
      Left = 332
      Top = 2
      Width = 301
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        878.416666666666800000
        5.291666666666667000
        796.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'HISTORICO'
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
    object QRDBText6: TQRDBText
      Left = 632
      Top = 2
      Width = 81
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1672.166666666667000000
        5.291666666666667000
        214.312500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'VALOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      OnPrint = QRDBText6Print
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object QRBand2: TQRBand [4]
    Left = 38
    Top = 300
    Width = 718
    Height = 40
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
      105.833333333333300000
      1899.708333333333000000)
    BandType = rbSummary
    object QRLabel4: TQRLabel
      Left = 552
      Top = 10
      Width = 72
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1460.500000000000000000
        26.458333333333330000
        190.500000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total Geral'
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
    object lblTotalG: TQRLabel
      Left = 632
      Top = 10
      Width = 81
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1672.166666666667000000
        26.458333333333330000
        214.312500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'lblTotal'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [5]
    Left = 38
    Top = 204
    Width = 718
    Height = 33
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
      87.312500000000000000
      1899.708333333333000000)
    Expression = 'CADASTRO'
    FooterBand = QRBand3
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel7: TQRLabel
      Left = 8
      Top = 12
      Width = 81
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        21.166666666666670000
        31.750000000000000000
        214.312500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Data'
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
      Left = 92
      Top = 12
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        243.416666666666700000
        31.750000000000000000
        224.895833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qrRelatorio
      DataField = 'CADASTRO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand3: TQRBand [6]
    Left = 38
    Top = 278
    Width = 718
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.208333333333340000
      1899.708333333333000000)
    BandType = rbGroupFooter
    object QRLabel6: TQRLabel
      Left = 552
      Top = 2
      Width = 72
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1460.500000000000000000
        5.291666666666667000
        190.500000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sub-Total'
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
    object lblTotal: TQRLabel
      Left = 632
      Top = 2
      Width = 81
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1672.166666666667000000
        5.291666666666667000
        214.312500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'lblTotal'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand2: TQRChildBand [7]
    Left = 38
    Top = 237
    Width = 718
    Height = 22
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
      58.208333333333340000
      1899.708333333333000000)
    ParentBand = QRGroup1
    object l1: TQRLabel
      Left = 12
      Top = 4
      Width = 85
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        31.750000000000000000
        10.583333333333330000
        224.895833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'N'#186' da Despesa'
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
    object QRLabel2: TQRLabel
      Left = 100
      Top = 4
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        264.583333333333300000
        10.583333333333330000
        161.395833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Hora'
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
      Left = 164
      Top = 4
      Width = 165
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        433.916666666666700000
        10.583333333333330000
        436.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Credor'
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
    object l2: TQRLabel
      Left = 332
      Top = 4
      Width = 301
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        878.416666666666800000
        10.583333333333330000
        796.395833333333200000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Hist'#243'rico'
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
    object o5: TQRLabel
      Left = 632
      Top = 4
      Width = 81
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        1672.166666666667000000
        10.583333333333330000
        214.312500000000000000)
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
  end
end
