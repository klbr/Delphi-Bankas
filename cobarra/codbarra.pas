unit codbarra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRBarcode, abarra, DB,
  DBTables, IBCustomDataSet, IBQuery;

type
  TfrmCodbarra = class(TQuickRep)
    QRBand1: TQRBand;
    barra: TQRBarcode;
    QRDBText1: TQRDBText;
    qrRelatorio: TIBQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  frmCodbarra: TfrmCodbarra;

implementation
uses Main, Principal;
{$R *.DFM}

procedure TfrmCodbarra.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  barra.Digits := qrRelatorio.FieldByName('CODBARRA').AsString;
  barra.Refresh;
  barra.Repaint;
end;

procedure TfrmCodbarra.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CODBARRA ');
    open;
  end;
end;

end.
