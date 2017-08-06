object frmHistorico: TfrmHistorico
  Left = 209
  Top = 126
  BorderStyle = bsDialog
  Caption = 'Compras e Vendas'
  ClientHeight = 500
  ClientWidth = 777
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
  object p1: TFlatPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 500
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object pbEnt: TFlatProgressBar
      Left = 6
      Top = 98
      Width = 16
      Height = 165
      Orientation = pbVertical
      Min = 0
      Max = 200
      Position = 1
    end
    object pbsai: TFlatProgressBar
      Left = 6
      Top = 282
      Width = 16
      Height = 165
      Orientation = pbVertical
      Min = 0
      Max = 200
      Position = 1
    end
    object FlatPanel1: TFlatPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 94
      ParentColor = True
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 16
        Width = 109
        Height = 16
        Caption = 'C'#243'd do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 368
        Top = 16
        Width = 79
        Height = 16
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 464
        Top = 16
        Width = 72
        Height = 16
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 124
        Top = 16
        Width = 72
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFecha: TFlatSpeedButton
        Left = 704
        Top = 12
        Width = 51
        Height = 49
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
      object Label6: TLabel
        Left = 298
        Top = 16
        Width = 50
        Height = 16
        Caption = 'Edi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 4
        Top = 40
        Width = 113
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
        MaxLength = 13
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
      object edtData1: TDateEdit
        Left = 368
        Top = 40
        Width = 89
        Height = 22
        ClickKey = 112
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        YearDigits = dyTwo
        TabOrder = 3
        OnKeyDown = edtDescricaoKeyDown
      end
      object edtData2: TDateEdit
        Left = 464
        Top = 40
        Width = 89
        Height = 22
        ClickKey = 112
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        YearDigits = dyTwo
        TabOrder = 4
        OnKeyDown = edtDescricaoKeyDown
        OnKeyPress = edtData2KeyPress
      end
      object btnConsulta: TFlatButton
        Left = 560
        Top = 12
        Width = 65
        Height = 49
        Caption = '&Consultar'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF1C98CE1C98CE1C98CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0E90C946B2DA3BB5DE24A4D51698CE0F90CA0C8CC6FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9975741F4975FF00FFFF00FFFF00FF098AC68FD1EAB4FFFF78F6FF76EE
          FC65DDF34ECAEA3CBAE129A9D81899CF0F90CA0A8BC60A8BC6FF00FFFF00FFFF
          00FFFF01FEFF00FFAC7673235E9C0D6BD15E809FFF00FFFF00FF078AC648ADD7
          D1FFFF79FBFF7DFAFF7FFCFF81FAFF81FAFF7AF3FF75EAFC5FD8F340BFE52DAD
          DA1C9ED11193CB0E8FC9288AB7A978772C5E8E106DE235A3FF3099F0FF00FFFF
          00FF0D8FC91896CCBDEAF68AFEFF7AF7FF7AF7FF79F4FF78F4FF78F4FF78F4FF
          79F4FF7DF4FF78F2FF72EAFC68DEF66BBFD5918388265C8F0D6EE0359EFF3FAA
          FE2392FFFF00FFFF00FF1396CB20A0D36FC2E2ADFFFF76F7FF7AF7FF79F4FF78
          F4FF77F3FF78F0FC77EFFE75EEFE76EFFE74EFFF81DEEA9A8E912D5D8E0D6DDD
          319AFF3DA9FF228EFEFF00FFFF00FFFF00FF1091CA49C1E33BABD7BCF8FC79FB
          FF7AF7FF79F4FF78F4FF83D9E28FCAD08ED7DA87CAD07AC2CB74E3F07FB4BB34
          628B0A6BD8329DFF3EA9FF2899F60D8EC9FF00FFFF00FFFF00FF0F8FC966D8EF
          38BAE0A3DDEF8AFEFF78F4FE7BE9F28BDCE0BBAFA4DDC6ADDAD4B6D3C7ACB8AB
          988FA5A373898B5280A746AAFB3FAFFF32A4FB56D1F61396CBFF00FFFF00FFFF
          00FF0F8FC96EDEF2A4676970C1E1A7FFFF75E9F091A1A3CBCEC4F7F0D0FFFFD7
          FFFFD5FFFFD8FFFFD5D3C49DA78472CAB0A97AD8FA4EC9FE4AC5F66CE5FC2BAD
          D9FF00FFFF00FFFF00FF0F8FC96CDCF0A4676940B0D9C4F8FE7DC7CBCBB0A7FF
          FCF8FFFFF6FFFFDAFFFFD4FFFFD3FFFCCFFFF8BBF2D3A4D5A48E76DAEF6DE7FE
          4ECAF66FE7FF52D0ED0C8CC7FF00FFFF00FF108FC96BDAEFA0675B30B5DDABDA
          EEA79F99F8F6DAFFFFFEFFFFFEFFFFF0FFFFDCFFFFD1FCF6C6FAD89EFFDE9DD5
          B1918AC0C96EE5FB4ECAF66CE3FE73EBFC1698CEFF00FFFF00FF108FC96BDAEF
          A0675BFFF4E5289FD0C4A390FFFFDEFFFFEAFFFFFCFFFFF6FFFFDCFFFFD3FCF7
          C6F0C28AFCCE89EDD1A3A7AAA973DAF04ECAF669E2FB81F7FF33B6DE0A8AC5FF
          00FF1190C972DDF2A7756BFFFBF0F8EADCCBB699FFFFDAFFFFD8FFFFE3FFFFE1
          FFFFD8FFFFD3FAE6B1EBAB72F6C27FF4D9A5B1A7A379D4E64ECAF669E2FB81F7
          FF66E1F71192CAFF00FF1290C973DEF2A7756BFFFFFCFAF0E6CAAB93FFFFD7FF
          FFD4FFFFD5FFFFD8FFFFD5FCF0BFF2C589E9A362FBCF88F2D9A7A6ABA973D8EB
          4BC9F667E2FB7AF3FF7DF4FF28ACD9FF00FF1290C972E0F2BC8268FFFFFFFEF7
          F2B78F84FCFECCFFFFD1FCF8C9FEF7C7FAE5AFF2C78BEEBC82F4D39FFFF7B6E2
          C49CA3BABF8BEAFA62D1F879E7FE88F7FF89F8FF54D0EE0C8EC61290C972E0F2
          BC8268FFFFFFFFFEFCD4BCB7D1B89AFFFFC9FADDA1EFBD86EAAA6EEBB274F7DE
          BAFFFFF8F0E7CEAF9F989CC6D8A0D8EDADDEF0BBE6F3BDEAF6C2EEF8B2E9F718
          96CC1391CA76E2F3D1926DFFFFFFFFFFFFFAF7F6DDC6BBDCBF9AFFEBABFEDD98
          FED58CFFE6A1FFFFE0EDE6E2B8918953B5D041C2E63FC0E61C9ED11190C91593
          CA1895CB1A97CB0F91C91593CA7FE6F4D1926DFFFFFFFFFFFFFFFFFFFEFBF8E7
          D4CBD8AF9AE9C9A0E3C29CE1C49CCAAB8EAF9583A56B6B76EFFF76F3FF74EFFF
          23A9D8FF00FFFF00FFFF00FFFF00FFFF00FF0F8FC988DCEFDA9D75FFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6EDD8C9A56B5FA56B5FA56B5FA4676983
          E9FC82EBFC80E9FC24A4D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3AA7D5
          DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
          55E68F31B56D4D1F9CCF239FD126A0D11192CAFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF0A8CC7E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8
          F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD192
          6DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 5
        OnClick = btnConsultaClick
      end
      object edtDescricao: TEdit
        Left = 124
        Top = 40
        Width = 169
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
        MaxLength = 60
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edtDescricaoKeyDown
      end
      object edtEdicao: TEdit
        Left = 298
        Top = 40
        Width = 65
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
        MaxLength = 60
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyDown = edtDescricaoKeyDown
      end
      object btnVisualizar: TFlatButton
        Left = 628
        Top = 12
        Width = 68
        Height = 49
        Caption = '&Visualizar'
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDD7877DD78887DDDDDDDDDDD78FF87777788F88DDDDDDD
          78FFFF8700007778F87DDDD78FFFFF887700000777DDD78FFFFF877778777000
          07DDD7FFF88788877777777777DDD788878888F88877777787DDD77788888FFF
          F888877777DDD78888888F8888FF888887DDD7888888F8777778888887DDDD88
          888F88F8F888777888DDDDD788878FFFFFFF88877DDDDDDDD78887888F888888
          DDDDDDDDD7FF88888888878DDDDDDDDDDD8FF88888888DDDDDDDDDDDDD8FF888
          8888DDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDD
          DD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDD8FFF88888DDDDDD
          DDDDDDDDD8FFF88888DDDDDDDDDDDDDD888888888DDDDDDDDDDD}
        TabOrder = 6
        OnClick = btnVisualizarClick
      end
      object rb1: TRadioButton
        Left = 560
        Top = 72
        Width = 65
        Height = 17
        Caption = 'Entrada'
        TabOrder = 7
      end
      object rb2: TRadioButton
        Left = 628
        Top = 72
        Width = 57
        Height = 17
        Caption = 'Sa'#237'da'
        TabOrder = 8
      end
      object rb3: TRadioButton
        Left = 707
        Top = 72
        Width = 49
        Height = 17
        Caption = 'Tudo'
        Checked = True
        TabOrder = 9
        TabStop = True
      end
    end
    object FlatGroupBox1: TFlatGroupBox
      Left = 32
      Top = 96
      Width = 737
      Height = 169
      Caption = 'Entrada do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object dbgEntrada: TRxDBGrid
        Left = 8
        Top = 16
        Width = 721
        Height = 145
        Ctl3D = False
        DataSource = dsEntrada
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgEntradaDrawColumnCell
        OnDblClick = dbgEntradaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEMENTRADA'
            Title.Caption = 'N'#186' Entr'
            Width = 49
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 54
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRA'
            Title.Caption = 'C'#243'digo'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descricao'
            Width = 142
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EDICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Edi'#231#227'o'
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Width = 36
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VALORUNI'
            Title.Alignment = taRightJustify
            Title.Caption = 'Vlr. Unit.'
            Width = 71
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Title.Caption = 'Devol?'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEVOLUCAO'
            Title.Caption = 'Dt. Devolu'#231#227'o'
            Width = 86
            Visible = True
          end>
      end
    end
    object FlatGroupBox2: TFlatGroupBox
      Left = 32
      Top = 280
      Width = 737
      Height = 169
      Caption = 'Saida do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object dbgSaida: TRxDBGrid
        Left = 8
        Top = 16
        Width = 721
        Height = 145
        Ctl3D = False
        DataSource = dsSaida
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgSaidaDrawColumnCell
        OnDblClick = dbgSaidaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEMSAIDA'
            Title.Caption = 'N'#186' Saida'
            Width = 55
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 58
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRA'
            Title.Caption = 'C'#243'digo'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 195
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EDICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Edi'#231#227'o'
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Width = 32
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VALORUNI'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pre'#231'o Unit.'
            Width = 74
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 77
            Visible = True
          end>
      end
    end
    object FlatPanel2: TFlatPanel
      Left = 1
      Top = 458
      Width = 775
      Height = 41
      Color = clTeal
      ColorHighLight = clOlive
      ColorShadow = clPurple
      Align = alBottom
      TabOrder = 3
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 121
        Height = 24
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtde Estoque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstoque: TLabel
        Left = 128
        Top = 8
        Width = 57
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 576
        Top = 8
        Width = 121
        Height = 24
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtde Vendida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVendida: TLabel
        Left = 696
        Top = 8
        Width = 57
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 192
        Top = 8
        Width = 137
        Height = 24
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtde Entradas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEntrada: TLabel
        Left = 328
        Top = 8
        Width = 57
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 384
        Top = 8
        Width = 137
        Height = 24
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtde Devolvida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lDevol: TLabel
        Left = 520
        Top = 8
        Width = 57
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pItem: TPanel
      Left = 6
      Top = 64
      Width = 373
      Height = 262
      Color = 16776176
      TabOrder = 4
      Visible = False
      OnExit = pItemExit
      object Label22: TLabel
        Left = 10
        Top = 24
        Width = 74
        Height = 13
        Caption = 'C'#243'd do Produto'
        Visible = False
      end
      object Label23: TLabel
        Left = 10
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object FlatPanel3: TFlatPanel
        Left = 1
        Top = 1
        Width = 371
        Height = 19
        Caption = 'Consulta de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Color = clTeal
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 0
      end
      object edtDesc: TFlatEdit
        Left = 8
        Top = 40
        Width = 353
        Height = 19
        ColorFlat = 16776176
        ParentColor = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 1
        OnChange = edtDescChange
        OnKeyDown = edtDescKeyDown
      end
      object FlatPanel4: TFlatPanel
        Left = 8
        Top = 72
        Width = 353
        Height = 183
        ParentColor = True
        TabOrder = 2
        object dbgItem: TRxDBGrid
          Left = 1
          Top = 1
          Width = 351
          Height = 181
          Align = alClient
          Color = 16776176
          DataSource = dsItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnCellClick = dbgItemCellClick
          OnDblClick = dbgItemDblClick
          OnKeyDown = dbgItemKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'CODBARRA'
              Title.Caption = 'C'#243'digo do Produto'
              Title.Color = clMoneyGreen
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clMoneyGreen
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 227
              Visible = True
            end>
        end
      end
      object edtCodBarra: TFlatEdit
        Left = 8
        Top = 40
        Width = 97
        Height = 19
        ColorFlat = 16776176
        ParentColor = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
  end
  object dsEntrada: TDataSource
    AutoEdit = False
    DataSet = qrEntrada
    Left = 424
    Top = 168
  end
  object dsSaida: TDataSource
    AutoEdit = False
    DataSet = qrSaida
    Left = 424
    Top = 320
  end
  object dsItem: TDataSource
    AutoEdit = False
    DataSet = frmPrincipal.cds
    Left = 226
    Top = 82
  end
  object qrEntrada: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 528
    Top = 160
  end
  object qrSaida: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 536
    Top = 368
  end
end
