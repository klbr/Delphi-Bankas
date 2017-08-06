unit GrupoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmGrupoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
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
  frmGrupoR: TfrmGrupoR;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmGrupoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmGrupoR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM GRUPO ORDER BY DESCRICAO  ');
    Open;
  end;
end;

procedure TfrmGrupoR.QRBand1BeforePrint(Sender: TQRCustomBand;
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
