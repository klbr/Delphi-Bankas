unit SaidaR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmSaidaR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    nSaida : Integer;
    procedure Relatorio;
  public

  published
    property Saida : Integer read nSaida write nSaida;
  end;

var
  frmSaidaR: TfrmSaidaR;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmSaidaR.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
begin
  if Sender.Tag = 0 then
  begin
    Sender.tag := 1;
    Sender.Color := clWhite;
  end
  else
  begin
    Sender.Tag := 0;
    Sender.Color := $F1F2F3
  end;
end;

procedure TfrmSaidaR.QRDBText13Print(sender: TObject; var Value: String);
begin
  value := FormatFloat('#,##0.00', qrRelatorio.FieldByName('VALORUNI').AsFloat);
end;

procedure TfrmSaidaR.QRDBText14Print(sender: TObject; var Value: String);
begin
  value := FormatFloat('#,##0.00', qrRelatorio.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmSaidaR.QRDBText16Print(sender: TObject; var Value: String);
begin
  value := FormatFloat('#,##0.00 %', qrRelatorio.FieldByName('DESCONTO').AsFloat);
end;

procedure TfrmSaidaR.QRDBText17Print(sender: TObject; var Value: String);
begin
  value := FormatFloat('#,##0.00', qrRelatorio.FieldByName('QUITACAO').AsFloat);
end;

procedure TfrmSaidaR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmSaidaR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                 ');
    Add('  ITEMSAIDA.*,                                         ');
    Add('  SAIDA.*,                                             ');
    Add('  ITEM.DESCRICAO AS DESC_ITEM,                         ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA,              ');
    Add('  CLIENTE.*,                                           ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,                   ');
    Add('  FUNCIONARIO.FUNCIONARIO,                             ');
    Add('  FUNCIONARIO.DESCRICAO AS DESC_FUNC                   ');
    Add('FROM                                                   ');
    Add('  ITEMSAIDA,                                           ');
    Add('  SAIDA,                                               ');
    Add('  ITEM,                                                ');
    Add('  FORMAPAGAMENTO,                                      ');
    Add('  FUNCIONARIO,                                         ');
    Add('  CLIENTE                                              ');
    Add('WHERE                                                  ');
    Add('  SAIDA.SAIDA=:SAIDA                                   ');
    Add('AND                                                    ');
    Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA                      ');
    Add('AND                                                    ');
    Add('  ITEM.CODBARRA=ITEMSAIDA.CODBARRA                     ');
    Add('AND                                                    ');
    Add('  SAIDA.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO   ');
    Add('AND                                                    ');
    Add('  CLIENTE.CLIENTE=SAIDA.CLIENTE                        ');
    Add('AND                                                    ');
    Add('  SAIDA.FUNCIONARIO=FUNCIONARIO.FUNCIONARIO            ');
    Add('ORDER BY SAIDA.SAIDA, CLIENTE.CLIENTE                  ');
    Params.ParamByName('SAIDA').AsInteger := nSaida;
    Open;
  end;
end;

end.
