inherited frmUsuario: TfrmUsuario
  Left = 165
  Top = 171
  Caption = 'Controle de Usu'#225'rio'
  ClientHeight = 284
  ClientWidth = 663
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 663
    Height = 209
    object Label1: TLabel
      Left = 84
      Top = 16
      Width = 126
      Height = 16
      Caption = 'Nome do Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 248
      Top = 16
      Width = 123
      Height = 16
      Caption = 'Grupo de Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 28
      Top = 16
      Width = 33
      Height = 16
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescricao: TFlatEdit
      Left = 84
      Top = 40
      Width = 157
      Height = 22
      ColorFlat = clBtnFace
      ParentColor = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 255
      ParentFont = False
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
    object cbGrupo: TFlatComboBox
      Left = 248
      Top = 40
      Width = 121
      Height = 24
      Style = csDropDownList
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      Items.Strings = (
        'Administrador'
        'Usu'#225'rio')
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = 'Administrador'
      ItemIndex = 0
      OnKeyDown = FormKeyDown
    end
    object gbLogin: TFlatGroupBox
      Left = 28
      Top = 76
      Width = 341
      Height = 125
      Caption = 'Login de Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label2: TLabel
        Left = 64
        Top = 32
        Width = 43
        Height = 16
        Caption = 'Login:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object l1: TLabel
        Left = 58
        Top = 61
        Width = 49
        Height = 16
        Caption = 'Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object l2: TLabel
        Left = 8
        Top = 91
        Width = 99
        Height = 16
        Caption = 'Repita Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtLogin: TFlatEdit
        Left = 120
        Top = 32
        Width = 177
        Height = 22
        ColorFlat = clBtnFace
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnKeyDown = FormKeyDown
      end
      object edtSenha1: TFlatEdit
        Left = 120
        Top = 61
        Width = 121
        Height = 22
        ColorFlat = clBtnFace
        ParentColor = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnKeyDown = FormKeyDown
      end
      object edtSenha2: TFlatEdit
        Left = 120
        Top = 91
        Width = 121
        Height = 22
        ColorFlat = clBtnFace
        ParentColor = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
        OnKeyDown = FormKeyDown
      end
      object btnAlterarSenha: TFlatButton
        Left = 120
        Top = 69
        Width = 137
        Height = 36
        Caption = 'Mudar Senhar'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C90E90C90E90C90E90C9
          0E90C90E90C90E90C90E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C90E90C959C1E955
          C0E948BAE73CB5E531B0E22AACE128ABE02AADE10E90C90E90C9FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C958CE
          F26DD1F072CCEF63C6EB4DACCF41B7E633B2E32AADE126AAE024A7DE24A7DE2C
          ADE20E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0E90C966D8F67BD8F684D3EF626C6F546F7742636A3C9CBC32B4E52DAF
          E228ABE125A7DE29ACE10E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF0E90C96EDDFA88DAF4697474AB96928B6D6B6F5652
          44606638B2DD34B5E62EB1E329ACE12CAFE20E90C9FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C976E2FB8FD3E5695F58E9
          E2E17A6D648F6F6B6D514C3D92AB3BBCEA35B7E730B2E530B2E50E90C9FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C978E3
          FC9CE1F37F87879E8781D9D7D46E625781635C47656944C4EE3FBFEB38B8E936
          B8E70E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0E90C978E3FCA1E9FCBCE0EB7B7876BCACA9BDB6B472645B5950494ABB
          DC47C6EF41C1ED3EBDEA0E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF0E90C978E3FCA3EBFFC6EEFBA9C0C7786B68DED3D1
          9D928B695C544CA7BF4EC1E249C9F045C4EE0E90C9FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C978E3FCA3EBFFC9F0FFCB
          F0FF92A5A98C7A76EAE7E77B6F665F6864447882488FA04DCBF20E90C9FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C978E3
          FCA3EBFFC9F0FFCBF0FFB6DDE9778484AD9A97E2E0DE70645B8677736F706D55
          D0F40E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0E90C978E3FCA3EBFFC9F0FFCBF0FFC2EFFFA1D7E56D7774D0C2C1CBC5
          C270645BC4AFAD634C430E90C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF0E90C978E3FCA3EBFFC9F0FFCBF0FFC2EFFFADEAFB
          72ABB676746FE2DADAABA19D7F7269B6A09E5841364B3529725C52513F335D47
          3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E90C978E3FCA3EBFFC9F0FFCB
          F0FFC2EFFFAFEDFF8BE6FC59929A978C84EFEBEB8A7F78988A83CFBCBBAD9996
          A48F8BCFBCBBB5A19F725C52FF00FFFF00FFFF00FFFF00FFFF00FF0E90C978E3
          FCA3EBFFC9F0FFCBF0FFC2EFFFAFEDFF8BE7FE66CCE35B8082BBAFACE9E6E675
          695FBCAFACEADCDEDCCBCBF2E2E6EBE0E2998982FF00FFFF00FFFF00FFFF00FF
          FF00FF0E90C978E3FCA3EBFFC9F0FFCBF0FFC2EFFFAFEDFF8BE7FE6CE2FE63C7
          DD666F6CDCD3D3D4C9C6E0D3D3E0D3D3E2D7D7DCD0D0EAE0E1DCD8D7897870FF
          00FFFF00FFFF00FFFF00FF0E90C978E3FCA3EBFFC9F0FFCCF0FFC4EFFFB0EDFF
          8CE7FE6DE2FE60BFD168665ED9CFCFE3DCDCE3DCDCE6DCDCE6DCDCE9E1E1EEE7
          E6F6F6F6CCC6C458463BFF00FFFF00FFFF00FF0E90C979E5FCAAEFFFD7F7FFD5
          F4FFC6F0FFB0EEFF8CE9FE6BD7EF566966C2BBB6F3EFF0EAE6E6EBE6E6EBE6E6
          F0EFEFF2EFEFE7E2E1E6E1E0D7D1CF352014FF00FFFF00FFFF00FF0E90C974E1
          FB72D1F05EBFE34EB6DE43B1DC3CAFDC34ADDA2F97BA685B52F0F0EFF6F6F6F2
          F0F0F0F0F0F6F6F6F3F3F3E1DEDE897B72BBB4ADA0938C58453AFF00FFFF00FF
          FF00FF0E90C925A4D43FADDA5CBFE26DC9EA79D0EE7AD1F074D1EF66CBEB6596
          A09E9791F6F6F6F6F6F6F6F6F6E1E0DECBC6C27F6F663C2A1CDCD7D758453AFF
          00FFFF00FFFF00FFFF00FF0E90C98CD8F2C7F6FFC2F7FFB1F3FFA0EFFF90EBFF
          82EAFF7AE9FF77EAFF778C8ABCB5AFF3F3F3F6F6F6C4BDBA513F3468564A7464
          59E1DCDC58453AFF00FFFF00FFFF00FFFF00FFFF00FF0E90C90E90C960CEEF64
          D5F464DAF864DDFA62DDFB5ED9F857D3F452BBD76D7675DEDAD9E1DEDCBBB2AD
          BCB5AF93897FE9E9E79D908958453AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF0C8FC90F92CA1193CB1295CB1295CB1193CB1092CA0D8FC7FF00FF56
          44388878705F4D41968A7F86786F7F70665B493CFF00FFFF00FF}
        Layout = blGlyphRight
        TabOrder = 3
        Visible = False
        OnClick = btnAlterarSenhaClick
      end
    end
    object edtCodigo: TFlatEdit
      Left = 28
      Top = 40
      Width = 41
      Height = 22
      TabStop = False
      ColorFlat = clBtnFace
      ParentColor = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 25
      ParentFont = False
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object gbAcesso: TFlatGroupBox
      Left = 376
      Top = 16
      Width = 281
      Height = 185
      Caption = 'Acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object cbCadastro: TFlatCheckBox
        Left = 8
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Cadastros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbCliente: TFlatCheckBox
        Left = 24
        Top = 32
        Width = 81
        Height = 17
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbCredor: TFlatCheckBox
        Left = 24
        Top = 48
        Width = 81
        Height = 17
        Caption = 'Credor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbGrupos: TFlatCheckBox
        Left = 24
        Top = 64
        Width = 81
        Height = 17
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbFormapagamento: TFlatCheckBox
        Left = 24
        Top = 80
        Width = 81
        Height = 17
        Caption = 'F. Pagam.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbFornecedor: TFlatCheckBox
        Left = 24
        Top = 96
        Width = 81
        Height = 17
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbFuncionario: TFlatCheckBox
        Left = 24
        Top = 112
        Width = 81
        Height = 17
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbMercadorias: TFlatCheckBox
        Left = 24
        Top = 128
        Width = 81
        Height = 17
        Caption = 'Mercadorias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbRua: TFlatCheckBox
        Left = 24
        Top = 144
        Width = 81
        Height = 17
        Caption = 'Rua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbMovimentacao: TFlatCheckBox
        Left = 96
        Top = 16
        Width = 89
        Height = 17
        Caption = 'Movimenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbCaixa: TFlatCheckBox
        Left = 112
        Top = 32
        Width = 81
        Height = 17
        Caption = 'Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbLancamento: TFlatCheckBox
        Left = 112
        Top = 48
        Width = 81
        Height = 17
        Caption = 'Lan'#231'amentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbRetirada: TFlatCheckBox
        Left = 112
        Top = 64
        Width = 81
        Height = 17
        Caption = 'Retiradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbSaida: TFlatCheckBox
        Left = 112
        Top = 80
        Width = 81
        Height = 17
        Caption = 'Sa'#237'das'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbEntrada: TFlatCheckBox
        Left = 112
        Top = 96
        Width = 81
        Height = 17
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbDespesas: TFlatCheckBox
        Left = 112
        Top = 112
        Width = 81
        Height = 17
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbFiado: TFlatCheckBox
        Left = 112
        Top = 144
        Width = 81
        Height = 17
        Caption = 'Fiado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbRelatorios: TFlatCheckBox
        Left = 208
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Relat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        TabStop = True
        OnClick = cbCadastroClick
      end
      object cbDevolucao: TFlatCheckBox
        Left = 112
        Top = 128
        Width = 81
        Height = 17
        Caption = 'Devolu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        TabStop = True
        OnClick = cbCadastroClick
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 265
    Width = 663
  end
  inherited fpBotoes: TFlatPanel
    Width = 663
    inherited btnFirst: TFlatSpeedButton
      Left = 306
    end
    inherited btnPrior: TFlatSpeedButton
      Left = 351
    end
    inherited btnNext: TFlatSpeedButton
      Left = 396
    end
    inherited btnLast: TFlatSpeedButton
      Left = 441
    end
    inherited btnFecha: TFlatSpeedButton
      Left = 603
    end
    inherited btnConsulta: TFlatSpeedButton
      Left = 522
      Visible = False
    end
  end
  inherited qrNavegacao: TIBQuery
    SQL.Strings = (
      'select * from usuario')
  end
  object Timer: TTimer
    Enabled = False
    Interval = 350
    OnTimer = TimerTimer
    Left = 584
    Top = 176
  end
end
