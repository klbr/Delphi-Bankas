unit LocalizacaoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, QRCtrls, DB, QuickRpt, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmLocalizacaoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  procedure Relatorio;
  public
    { Public declarations }
  end;

var
  frmLocalizacaoR: TfrmLocalizacaoR;

implementation
Uses Main, Principal;
{$R *.dfm}

procedure TfrmLocalizacaoR.QuickRepBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmLocalizacaoR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT DISTINCT * FROM LOCALIZACAO ORDER BY DESCRICAO');
    Open;
  end;
end;

procedure TfrmLocalizacaoR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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

end.
