inherited frmFornecedor: TfrmFornecedor
  Left = 203
  Top = 161
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 362
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Height = 287
    object Label16: TLabel
      Left = 112
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
    object Label2: TLabel
      Left = 12
      Top = 80
      Width = 98
      Height = 16
      Caption = '&Raz'#227'o Social:'
      FocusControl = edtRazaoSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 381
      Top = 80
      Width = 65
      Height = 16
      Caption = '&Fantasia:'
      FocusControl = edtFantasia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 38
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
    object Label5: TLabel
      Left = 63
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
    object Label7: TLabel
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
    object Label8: TLabel
      Left = 466
      Top = 144
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
    object Label10: TLabel
      Left = 66
      Top = 208
      Width = 44
      Height = 16
      Caption = '&Email:'
      FocusControl = edtEmail
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 304
      Top = 208
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
      Left = 74
      Top = 240
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
    object Label9: TLabel
      Left = 35
      Top = 176
      Width = 75
      Height = 16
      Caption = '&Telefones:'
      FocusControl = edtdddComercial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCadastro: TDateEdit
      Left = 114
      Top = 40
      Width = 113
      Height = 24
      ClickKey = 113
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
      Width = 67
      Height = 22
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
    object edtRazaoSocial: TEdit
      Left = 112
      Top = 80
      Width = 265
      Height = 22
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
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object edtFantasia: TEdit
      Left = 448
      Top = 80
      Width = 134
      Height = 22
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
      TabOrder = 3
      OnKeyDown = FormKeyDown
    end
    object edtEndereco: TEdit
      Left = 112
      Top = 112
      Width = 470
      Height = 22
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
      TabOrder = 4
      OnKeyDown = FormKeyDown
    end
    object edtBairro: TEdit
      Left = 112
      Top = 144
      Width = 153
      Height = 22
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
    object edtCidade: TEdit
      Left = 325
      Top = 144
      Width = 136
      Height = 22
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
      TabOrder = 6
      OnKeyDown = FormKeyDown
    end
    object edtCep: TMaskEdit
      Left = 502
      Top = 144
      Width = 80
      Height = 22
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
      TabOrder = 7
      Text = '     -   '
      OnKeyDown = FormKeyDown
    end
    object edtEmail: TEdit
      Left = 112
      Top = 208
      Width = 189
      Height = 22
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
      TabOrder = 14
      OnKeyDown = FormKeyDown
    end
    object edtURL: TEdit
      Left = 341
      Top = 208
      Width = 241
      Height = 22
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
      TabOrder = 15
      OnKeyDown = FormKeyDown
    end
    object edtOBS: TEdit
      Left = 112
      Top = 240
      Width = 470
      Height = 22
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
      OnKeyPress = edtOBSKeyPress
    end
    object edtdddComercial: TMaskEdit
      Left = 112
      Top = 176
      Width = 34
      Height = 22
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
      TabOrder = 8
      Text = '(  )'
      OnKeyDown = FormKeyDown
    end
    object edtComercial: TMaskEdit
      Left = 152
      Top = 176
      Width = 78
      Height = 22
      AutoSize = False
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
      TabOrder = 9
      Text = '    -    '
      OnKeyDown = FormKeyDown
    end
    object edtDDDcomercial2: TMaskEdit
      Left = 292
      Top = 176
      Width = 33
      Height = 22
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
    object edtComercial2: TMaskEdit
      Left = 330
      Top = 176
      Width = 78
      Height = 22
      AutoSize = False
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
    object edtdddComercial3: TMaskEdit
      Left = 464
      Top = 176
      Width = 33
      Height = 22
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
    object edtComercial3: TMaskEdit
      Left = 504
      Top = 176
      Width = 78
      Height = 22
      AutoSize = False
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
    object pConsulta: TFlatPanel
      Left = 524
      Top = 2
      Width = 596
      Height = 279
      ParentColor = True
      Visible = False
      TabOrder = 17
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 594
        Height = 54
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
          Width = 154
          Height = 13
          Caption = 'Digite para pesquisa (F10):'
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
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'FORNECEDOR'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'FORNECEDOR'
            'DESCRICAO'
            'RAZAOSOCIAL'
            'ENDERECO'
            'BAIRRO'
            'CIDADE'
            'CEP'
            'COMERCIAL'
            'COMERCIAL2'
            'COMERCIAL3'
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
        Top = 57
        Width = 589
        Height = 216
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
    Top = 343
  end
  inherited qrNavegacao: TIBQuery
    SQL.Strings = (
      'select * from fornecedor'
      'ORDER BY FORNECEDOR')
  end
end
