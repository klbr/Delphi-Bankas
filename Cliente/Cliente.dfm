inherited frmCliente: TfrmCliente
  Left = 203
  Top = 108
  Caption = 'Cadastro de Clientes'
  ClientHeight = 473
  ClientWidth = 607
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Width = 607
    Height = 398
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 51
      Height = 16
      Caption = '&C'#243'digo'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 54
      Top = 80
      Width = 46
      Height = 16
      Caption = '&Nome:'
      FocusControl = edtDescricao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 28
      Top = 112
      Width = 72
      Height = 16
      Caption = '&Endere'#231'o:'
      FocusControl = edtEndereco
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 53
      Top = 144
      Width = 47
      Height = 16
      Caption = '&Bairro:'
      FocusControl = edtBairro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 269
      Top = 144
      Width = 55
      Height = 16
      Caption = 'C&idade:'
      FocusControl = edtCidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 476
      Top = 142
      Width = 35
      Height = 16
      Caption = 'CE&P:'
      FocusControl = edtCep
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 208
      Width = 88
      Height = 16
      Caption = 'Residenci&al:'
      FocusControl = edtdddResidencial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 218
      Top = 208
      Width = 75
      Height = 16
      Caption = 'Co&mercial:'
      FocusControl = edtdddComercial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 423
      Top = 208
      Width = 54
      Height = 16
      Caption = 'Cel&ular:'
      FocusControl = edtdddCelular
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 56
      Top = 240
      Width = 44
      Height = 16
      Caption = 'Emai&l:'
      FocusControl = edtEmail
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 294
      Top = 240
      Width = 35
      Height = 16
      Caption = '&URL:'
      FocusControl = edtURL
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 64
      Top = 272
      Width = 36
      Height = 16
      Caption = '&OBS:'
      FocusControl = edtOBS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 10
      Top = 174
      Width = 87
      Height = 16
      Caption = '&Nascimento:'
      FocusControl = edtNascimento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 204
      Top = 176
      Width = 88
      Height = 16
      Caption = 'E&stado Civil:'
      FocusControl = edtEstadocivil
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 406
      Top = 176
      Width = 76
      Height = 16
      Caption = '&Ocupa'#231#227'o:'
      FocusControl = edtOcupacao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 100
      Top = 16
      Width = 123
      Height = 16
      Caption = '&Data de Cadastro'
      FocusControl = edtCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FlatGroupBox1: TFlatGroupBox
      Left = 96
      Top = 304
      Width = 493
      Height = 81
      Caption = 'Op'#231#245'es de Fiado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      object Label19: TLabel
        Left = 148
        Top = 16
        Width = 42
        Height = 16
        Caption = 'Limite'
      end
      object Label21: TLabel
        Left = 396
        Top = 16
        Width = 42
        Height = 16
        Caption = 'Saldo'
      end
      object Label22: TLabel
        Left = 276
        Top = 16
        Width = 46
        Height = 16
        Caption = 'D'#237'vida'
      end
      object cbFiado: TFlatCheckBox
        Left = 8
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Usar Fiado'
        TabOrder = 0
        TabStop = True
      end
      object edtLimite: TCurrencyEdit
        Left = 148
        Top = 36
        Width = 87
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00,;-0.00,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnChange = edtLimiteChange
        OnKeyDown = FormKeyDown
      end
      object edtSaldo: TCurrencyEdit
        Left = 396
        Top = 36
        Width = 87
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00,;-0.00,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = edtSaldoKeyPress
      end
      object edtDivida: TCurrencyEdit
        Left = 276
        Top = 36
        Width = 87
        Height = 21
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00,;-0.00,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnChange = edtLimiteChange
        OnKeyDown = FormKeyDown
      end
    end
    object edtCadastro: TDateEdit
      Left = 100
      Top = 40
      Width = 112
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
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 69
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
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 100
      Top = 80
      Width = 493
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
      OnKeyDown = FormKeyDown
    end
    object edtEndereco: TEdit
      Left = 100
      Top = 112
      Width = 493
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
      MaxLength = 255
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyDown = FormKeyDown
    end
    object edtBairro: TEdit
      Left = 100
      Top = 144
      Width = 165
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
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnKeyDown = FormKeyDown
    end
    object edtCidade: TEdit
      Left = 326
      Top = 144
      Width = 147
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
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnKeyDown = FormKeyDown
    end
    object edtCep: TMaskEdit
      Left = 512
      Top = 144
      Width = 80
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '00000\-999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      Text = '     -   '
      OnKeyDown = FormKeyDown
    end
    object edtOcupacao: TEdit
      Left = 482
      Top = 176
      Width = 111
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
      MaxLength = 20
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      OnKeyDown = FormKeyDown
    end
    object edtNascimento: TDateEdit
      Left = 100
      Top = 176
      Width = 99
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
      TabOrder = 7
      OnKeyDown = FormKeyDown
    end
    object edtEstadocivil: TComboBox
      Left = 293
      Top = 176
      Width = 110
      Height = 24
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnKeyDown = FormKeyDown
      Items.Strings = (
        'Solteiro(a)'
        'Casado(a)'
        'Outros')
    end
    object edtdddResidencial: TMaskEdit
      Left = 100
      Top = 208
      Width = 33
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '(99\);1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
      Text = '(  )'
      OnKeyDown = FormKeyDown
    end
    object edtResidencial: TMaskEdit
      Left = 136
      Top = 208
      Width = 78
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '9999-9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
      Text = '    -    '
      OnKeyDown = FormKeyDown
    end
    object edtComercial: TMaskEdit
      Left = 336
      Top = 208
      Width = 78
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '9999-9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
      Text = '    -    '
      OnKeyDown = FormKeyDown
    end
    object edtdddComercial: TMaskEdit
      Left = 300
      Top = 208
      Width = 33
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '(99\);1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 12
      Text = '(  )'
      OnKeyDown = FormKeyDown
    end
    object edtCelular: TMaskEdit
      Left = 515
      Top = 208
      Width = 78
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '9999-9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
      Text = '    -    '
      OnKeyDown = FormKeyDown
    end
    object edtdddCelular: TMaskEdit
      Left = 478
      Top = 208
      Width = 33
      Height = 22
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '(99\);1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 14
      Text = '(  )'
      OnKeyDown = FormKeyDown
    end
    object edtEmail: TEdit
      Left = 100
      Top = 240
      Width = 189
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
      MaxLength = 255
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
      OnKeyDown = FormKeyDown
    end
    object edtURL: TEdit
      Left = 332
      Top = 240
      Width = 261
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
      MaxLength = 255
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 17
      OnKeyDown = FormKeyDown
    end
    object edtOBS: TEdit
      Left = 100
      Top = 272
      Width = 493
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
      MaxLength = 255
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 18
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 396
      Top = 3
      Width = 616
      Height = 388
      ParentColor = True
      Visible = False
      TabOrder = 19
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 614
        Height = 64
        Align = alTop
        TabOrder = 0
        object Label17: TLabel
          Left = 16
          Top = 8
          Width = 129
          Height = 13
          Caption = 'Escolha o Campo (F9):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 184
          Top = 8
          Width = 158
          Height = 13
          Caption = 'Digite para pesquisar (F10):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCampo: TComboBox
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 0
          Text = 'DESCRICAO'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'CLIENTE'
            'DESCRICAO'
            'ENDERECO'
            'BAIRRO'
            'CIDADE'
            'CEP'
            'ESTADOCIVIL'
            'OCUPACAO'
            'RESIDENCIAL'
            'COMERCIAL'
            'CELULAR'
            'EMAIL'
            'URL'
            'OBS')
        end
        object edtConsulta: TEdit
          Left = 184
          Top = 24
          Width = 393
          Height = 19
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          OnChange = edtConsultaChange
          OnKeyDown = edtConsultaKeyDown
        end
      end
      object dbgConsulta: TRxDBGrid
        Left = 1
        Top = 65
        Width = 614
        Height = 317
        TabStop = False
        Ctl3D = False
        DataSource = dsConsulta2
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgConsultaCellClick
        OnDrawColumnCell = dbgConsultaDrawColumnCell
        OnKeyDown = dbgConsultaKeyDown
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 454
    Width = 607
  end
  inherited fpBotoes: TFlatPanel
    Width = 607
  end
  inherited dsConsulta2: TDataSource
    Left = 544
    Top = 232
  end
end
