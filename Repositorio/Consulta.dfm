object frmConsulta: TfrmConsulta
  Left = 316
  Top = 260
  BorderStyle = bsNone
  Caption = 'frmConsulta'
  ClientHeight = 243
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 20
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = 'Consulta R'#225'pida'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 20
    Width = 354
    Height = 223
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object edtConsulta: TEdit
      Left = 6
      Top = 7
      Width = 331
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtConsultaChange
      OnKeyDown = edtConsultaKeyDown
      OnKeyPress = edtConsultaKeyPress
    end
    object grdConsulta: TRxDBGrid
      Left = 2
      Top = 34
      Width = 350
      Height = 187
      Align = alBottom
      DataSource = dsConsulta
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = grdConsultaCellClick
      OnDblClick = grdConsultaDblClick
      OnKeyDown = grdConsultaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 251
          Visible = True
        end>
    end
  end
  object dsConsulta: TDataSource
    DataSet = qrConsulta
    Left = 104
    Top = 92
  end
  object qrConsulta: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 100
  end
end
