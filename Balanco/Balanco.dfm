object frmBalanco: TfrmBalanco
  Left = 241
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es de Balan'#231'o'
  ClientHeight = 384
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TPageControl
    Left = 0
    Top = 0
    Width = 384
    Height = 343
    ActivePage = tbFechar
    Align = alClient
    TabOrder = 0
    object tbFechar: TTabSheet
      Caption = 'Fechar Balan'#231'o'
      object Label1: TLabel
        Left = 8
        Top = 80
        Width = 108
        Height = 13
        Caption = 'Descri'#231#227'o do Balan'#231'o:'
      end
      object Label2: TLabel
        Left = 136
        Top = 104
        Width = 171
        Height = 13
        Caption = 'Ex: "Jun/2004"  ou  "Jan-Dez2005"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtDescBalanco: TEdit
        Left = 136
        Top = 80
        Width = 209
        Height = 21
        TabOrder = 0
      end
    end
    object tbOpcoes: TTabSheet
      Caption = 'Configurar Balan'#231'os'
      ImageIndex = 1
    end
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rios dos Balan'#231'os'
      ImageIndex = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
end
