inherited frmGrupo: TfrmGrupo
  Left = 228
  Top = 136
  Caption = 'Cadastro de Grupo'
  ClientHeight = 220
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpBody: TFlatPanel
    Height = 145
    object Label1: TLabel
      Left = 84
      Top = 16
      Width = 76
      Height = 16
      Caption = '&Descri'#231#227'o:'
      FocusControl = edtDescricao
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
    object edtDescricao: TEdit
      Left = 82
      Top = 40
      Width = 491
      Height = 24
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
      OnKeyDown = FormKeyDown
      OnKeyPress = edtDescricaoKeyPress
    end
    object edtCodigo: TEdit
      Left = 12
      Top = 40
      Width = 53
      Height = 24
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
      OnKeyDown = FormKeyDown
    end
    object pConsulta: TFlatPanel
      Left = 548
      Top = 1
      Width = 590
      Height = 141
      ParentColor = True
      Visible = False
      TabOrder = 2
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 588
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
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 0
          Text = 'DESCRICAO'
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'GRUPO'
            'DESCRICAO')
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
        Width = 584
        Height = 80
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
    Top = 201
  end
  inherited qrNavegacao: TIBQuery
    SQL.Strings = (
      'select * from grupo'
      'ORDER BY GRUPO')
  end
end
