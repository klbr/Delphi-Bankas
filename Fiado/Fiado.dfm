object frmFiado: TfrmFiado
  Left = 203
  Top = 104
  BorderStyle = bsDialog
  Caption = 'Controle de Fiado'
  ClientHeight = 481
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 294
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 76
      Width = 128
      Height = 16
      Caption = 'Selecione o Fiado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 267
      Width = 48
      Height = 16
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 520
      Top = 267
      Width = 108
      Height = 16
      Caption = 'Valor Restante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 456
      Top = 76
      Width = 88
      Height = 16
      Caption = 'Pagamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 192
      Top = 267
      Width = 41
      Height = 16
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 320
      Top = 267
      Width = 61
      Height = 16
      Caption = 'A Pagar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgFiado: TRxDBGrid
      Left = 16
      Top = 96
      Width = 433
      Height = 161
      TabStop = False
      DataSource = dsFiado
      FixedColor = clMoneyGreen
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FIADO'
          Title.Caption = 'C'#243'digo'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_CLIENTE'
          Title.Caption = 'Cliente'
          Width = 94
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor do Fiado'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Data de Compra'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Caption = 'Data de Vencimento'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SAIDA'
          Title.Caption = 'N'#186' da Sa'#237'da'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGO'
          Title.Caption = 'Situa'#231#227'o'
          Width = 48
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 16
      Top = 8
      Width = 745
      Height = 65
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 1
      object edtDescCLiente: TLabel
        Left = 152
        Top = 8
        Width = 385
        Height = 25
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FlatSpeedButton1: TFlatSpeedButton
        Left = 128
        Top = 8
        Width = 21
        Height = 22
        Glyph.Data = {
          D6020000424DD602000000000000D60000002800000010000000100000000100
          1000030000000002000000000000000000001400000000000000007C0000E003
          00001F0000000000000000008000008000000080800080000000800080008080
          0000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7CE105E1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53810EE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53A10EE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53A10EE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53A20EE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CE105E105E105
          E105E105EE53C316E105E105E105E105E1051F7C1F7C1F7CE105EE538A43693B
          4837262BE522C41AC31AA212A10EA10E810EE1051F7C1F7CE105EE53EE53EE53
          EE53EE53EE53E526EE53EE53EE53EE53EE53E1051F7C1F7C1F7CE105E105E105
          E105E105EE53272FE105E105E105E105E1051F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53693BE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE538A43E1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53CC4BE1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7CE105EE53EE53E1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7CE105E1051F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C}
        OnClick = FlatSpeedButton1Click
      end
      object Label14: TLabel
        Left = 12
        Top = 8
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
      object btnFecha: TFlatSpeedButton
        Left = 683
        Top = 4
        Width = 55
        Height = 55
        Hint = 'Fecha esta janela'
        Caption = 'Sai&r'
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
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A
          00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00009A1244FF0C30E600009AFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00009A0028F2002CF900009AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA6A6A69797976B6B6BFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B9797979A9A9A6B6B6BFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1A4BFF1645FF1444FF0D
          2FE500009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0027F00030FF
          0030FF002EFD00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BAAAA
          AAA8A8A8A7A7A79797976B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B
          6B6B9696969D9D9D9D9D9D9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A1740F11A4BFF1746FF1646FF0E30E400009AFF00FFFF00FFFF00
          FFFF00FF00009A0129EF0030FF002EFF0030FF0023E700009AFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6B6B6BA2A2A2AAAAAAA9A9A9A8A8A89797976B6B6B
          FF00FFFF00FFFF00FFFF00FF6B6B6B9696969D9D9D9D9D9D9D9D9D9191916B6B
          6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1940F01C4CFF18
          47FF1646FF0F32E700009AFF00FFFF00FF00009A002BF70232FF0331FF0131FF
          0023E400009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B
          6BA2A2A2ABABABA9A9A9A8A8A89999996B6B6BFF00FFFF00FF6B6B6B9999999E
          9E9E9F9F9F9E9E9E9090906B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00009A1A40EF1D4DFF1948FF1848FF1238EF00009A0000
          9A002BF8002FFF002EFF0232FF0324E500009AFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA2A2A2ACACACAAAAAAA9A9A9
          9E9E9E6B6B6B6B6B6B9A9A9A9D9D9D9D9D9D9E9E9E9292926B6B6BFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1B
          42F01E4EFF1B4AFF1949FF0E38F60431FD0131FF002EFF0030FF0027F100009A
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF6B6B6BA3A3A3ACACACABABABAAAAAAA0A0A09E9E9E9E9E9E9D9D9D9D
          9D9D9696966B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00009A1B42EF1F4FFF1745FF0E3DFF0939
          FF0634FF0333FF0128F000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA3A3A3ADADAD
          A9A9A9A4A4A4A2A2A2A0A0A09F9F9F9696966B6B6BFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF00009A1B45F51747FF1342FF0F3EFF0C3CFF0830F000009AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF6B6B6BA6A6A6A9A9A9A7A7A7A5A5A5A3A3A39A9A9A6B
          6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1F4DFC1D4CFF1A48FF1544
          FF1443FF143CF000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BABABAB
          ACACACAAAAAAA8A8A8A7A7A7A0A0A06B6B6BFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          009A2A58FC2756FF2251FF204FFF1D4DFF1D4CFF1E4EFF173EEF00009AFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF6B6B6BB1B1B1B1B1B1AEAEAEADADADACACACACACACACACACA1
          A1A16B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00009A2C56F43160FF2B5AFF295AFF2047F11F46
          F12454FF204FFF1F4FFF183FF000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BAEAEAEB6B6B6B3B3B3
          B2B2B2A6A6A6A6A6A6AFAFAFADADADADADADA2A2A26B6B6BFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A325EF736
          66FF3361FF3365FF274FF000009A00009A2047EF2656FF2251FF2151FF1840EF
          00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF6B6B6BB2B2B2B8B8B8B7B7B7B7B7B7A9A9A96B6B6B6B6B6BA5A5A5B0B0B0AE
          AEAEAEAEAEA1A1A16B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00009A3865F73C6DFF3867FF3869FF284DE700009AFF00FFFF00
          FF00009A1E41E72757FF2352FF2252FF1A42F000009AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB5B5B5BBBBBBB9B9B9B9B9B9A5A5A5
          6B6B6BFF00FFFF00FF6B6B6BA0A0A0B1B1B1AFAFAFAEAEAEA3A3A36B6B6BFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A406EFB4172FF3E6DFF3E
          6FFF2A4CE400009AFF00FFFF00FFFF00FFFF00FF00009A1D40E42859FF2452FF
          2353FF1C45F300009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BBBBB
          BBBEBEBEBCBCBCBCBCBCA5A5A56B6B6BFF00FFFF00FFFF00FFFF00FF6B6B6B9E
          9E9EB1B1B1AFAFAFAFAFAFA5A5A56B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A4676FD4576FF4475FF2E51E500009AFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF00009A1E41E5295AFF2758FF1E48F300009AFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6B6B6BBFBFBFC0C0C0BFBFBFA7A7A76B6B6BFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B9F9F9FB2B2B2B1B1B1A6A6A66B6B
          6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A4471F83356E500
          009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A2144E8
          244DF100009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B
          6BBCBCBCAAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF6B6B6BA2A2A2A8A8A86B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFechaClick
      end
      object edtCliente: TComboEdit
        Left = 68
        Top = 8
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
        OnButtonClick = edtClienteButtonClick
        OnChange = edtClienteChange
        OnClick = edtClienteClick
        OnKeyPress = edtClienteKeyPress
      end
      object rb1: TRadioButton
        Left = 16
        Top = 40
        Width = 125
        Height = 17
        Caption = 'Fiados n'#227'o pagos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnKeyDown = rb1KeyDown
        OnMouseDown = rb1MouseDown
      end
      object rb2: TRadioButton
        Left = 152
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Fiados Pagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = rb1KeyDown
        OnMouseDown = rb1MouseDown
      end
      object rb3: TRadioButton
        Left = 288
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Todos os Fiados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnKeyDown = rb1KeyDown
        OnMouseDown = rb1MouseDown
      end
    end
    object pParcelas: TPanel
      Left = 456
      Top = 96
      Width = 305
      Height = 161
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object Label4: TLabel
        Left = 10
        Top = 30
        Width = 63
        Height = 13
        Caption = '&Data de Pag.'
        FocusControl = edtPag
      end
      object Label5: TLabel
        Left = 94
        Top = 30
        Width = 52
        Height = 13
        Caption = '&Valor Pago'
        FocusControl = edtValor
      end
      object Label8: TLabel
        Left = 161
        Top = 30
        Width = 29
        Height = 13
        Caption = 'Ajuste'
        FocusControl = edtAjuste
      end
      object Label9: TLabel
        Left = 228
        Top = 30
        Width = 24
        Height = 13
        Caption = 'Total'
        FocusControl = edtAjuste
      end
      object dbgParcelas: TRxDBGrid
        Left = 8
        Top = 72
        Width = 295
        Height = 87
        TabStop = False
        DataSource = dsParcela
        FixedColor = clMoneyGreen
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgParcelasCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'N'#186
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTO'
            Title.Caption = 'Pagamento'
            Width = 63
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Pago'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'AJUSTE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Ajuste'
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 69
            Visible = True
          end>
      end
      object edtPag: TDateEdit
        Left = 10
        Top = 46
        Width = 83
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = edtPagKeyDown
      end
      object edtValor: TCurrencyEdit
        Left = 94
        Top = 46
        Width = 65
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00;-,0.00'
        ParentCtl3D = False
        TabOrder = 1
        OnChange = edtAjusteChange
        OnKeyDown = edtPagKeyDown
      end
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 301
        Height = 22
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 5
        object btnNovo: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 22
          Caption = '&Novo'
          OnClick = btnNovoClick
        end
        object btnApaga: TSpeedButton
          Left = 90
          Top = 0
          Width = 89
          Height = 22
          Caption = '&Apagar'
          OnClick = btnApagaClick
        end
        object btnPagarTudo: TSpeedButton
          Left = 212
          Top = 0
          Width = 89
          Height = 22
          Caption = '&Pagar Todos'
          OnClick = btnPagarTudoClick
        end
      end
      object edtAjuste: TCurrencyEdit
        Left = 161
        Top = 46
        Width = 65
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00;-,0.00'
        ParentCtl3D = False
        TabOrder = 2
        OnChange = edtAjusteChange
        OnKeyDown = edtPagKeyDown
      end
      object edtTotal: TCurrencyEdit
        Left = 228
        Top = 46
        Width = 65
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00;-,0.00'
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = edtTotalKeyPress
      end
    end
    object edtStatus: TEdit
      Left = 70
      Top = 267
      Width = 115
      Height = 19
      TabStop = False
      BorderStyle = bsNone
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtRestante: TCurrencyEdit
      Left = 636
      Top = 267
      Width = 121
      Height = 21
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtTotalGeral: TCurrencyEdit
      Left = 244
      Top = 267
      Width = 69
      Height = 21
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtapagar: TCurrencyEdit
      Left = 384
      Top = 267
      Width = 73
      Height = 21
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 294
    Width = 774
    Height = 168
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 176
      Height = 16
      Caption = 'Itens comprados no fiado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgItem: TRxDBGrid
      Left = 16
      Top = 32
      Width = 737
      Height = 130
      TabStop = False
      DataSource = dsItem
      FixedColor = clMoneyGreen
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ITEMSAIDA'
          Title.Caption = 'Sa'#237'da'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBARRA'
          Title.Caption = 'C'#243'digo de Barras'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_ITEM'
          Title.Caption = 'Produto'
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EDICAO'
          Title.Caption = 'Edi'#231#227'o'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALORUNI'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 73
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Total'
          Width = 78
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 462
    Width = 774
    Height = 19
    Panels = <>
  end
  object dsFiado: TDataSource
    DataSet = qrFiado
    OnDataChange = dsFiadoDataChange
    Left = 192
    Top = 176
  end
  object dsParcela: TDataSource
    DataSet = qrParcela
    Left = 544
    Top = 224
  end
  object dsItem: TDataSource
    DataSet = qrItem
    Left = 232
    Top = 401
  end
  object qrFiado: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 104
    Top = 168
  end
  object qrParcela: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 488
    Top = 200
  end
  object qrExecuta: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 408
    Top = 40
  end
  object qrDiferenca: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 512
    Top = 32
  end
  object qrItem: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 398
  end
end
