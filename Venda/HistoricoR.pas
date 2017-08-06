unit HistoricoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmHistoricoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    bndent: TQRSubDetail;
    bndentg: TQRBand;
    bndFootE: TQRBand;
    bndsai: TQRSubDetail;
    bndsaig: TQRBand;
    bndFootS: TQRBand;
    bndentc: TQRChildBand;
    l1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    A1: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    ChildBand2: TQRChildBand;
    QRBand5: TQRBand;
    lest: TQRLabel;
    ldev: TQRLabel;
    lent: TQRLabel;
    lsai: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lQtdeEnt: TQRLabel;
    lTotalEnt: TQRLabel;
    lQtdeSai: TQRLabel;
    lTotalSai: TQRLabel;
    qrSai: TIBQuery;
    qrEnt: TIBQuery;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndentBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndsaiBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndFootEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndFootSBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    dData1, dData2 : TDateTime;
    sQueryEnt, sQuerySai : TIBQuery;
    iEst, iDev, iEnt, iSai, iTipo : Integer;
    procedure Relatorio;
    procedure SQLSaida;
    procedure SQLEntrada;
  public
  published
    property QueryEnt : Tibquery read sQueryEnt write sQueryEnt;
    property QuerySai : TIBQuery read sQuerySai write sQuerySai;
    property Tipo     : Integer read iTipo write iTipo;
    property Estoque  : Integer read iEst write iEst;
    property Devolvida: Integer read iDev write iDev;
    property Entrada  : Integer read iEnt write iEnt;
    property Saida    : Integer read iSai write iSai;
    property Data1: TDateTime read dData1 write dData1;
    property Data2: TDateTime read dData2 write dData2;
  end;

var
  frmHistoricoR: TfrmHistoricoR;
  QtdeS, QtdeE, TotalS, TotalE : Double;

implementation
Uses Main, Principal;
{$R *.dfm}

procedure TfrmHistoricoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmHistoricoR.Relatorio;
begin
  QtdeS :=0;
  QtdeE :=0;
  TotalS:=0;
  TotalE:=0;
  if Tipo = 1 then
  begin
    SQLEntrada;
    bndsai.Enabled := false;
    bndsaig.Enabled := False;
    bndFootS.Enabled := False;
  end
  else if Tipo = 2 then
  begin
    SQLSaida;
    bndent.Enabled := False;
    bndentg.Enabled := False;
    bndentc.Enabled := False;
    bndFootE.Enabled := False;    
  end
  else if Tipo = 3 then
  begin
    SQLEntrada;
    SQLSaida;
  end;
end;

procedure TfrmHistoricoR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 <> 0) and (ddata2 <> 0) then
    lblData.Caption := ' de ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.Caption := 'Todo Período';
end;

procedure TfrmHistoricoR.SQLEntrada;
begin
  with qrEnt do
  begin
    Database := frmPrincipal.dba;
    Close;
    SQl.Clear;
    SQL.Text := sQueryEnt.SQL.Text;
    Params := sQueryEnt.Params;
    Open;
  end;
end;

procedure TfrmHistoricoR.SQLSaida;
begin
  with qrSai do
  begin
    Database := frmPrincipal.dba;
    Close;
    SQl.Clear;
    SQL.Text := sQuerySai.SQL.Text;
    Params := sQuerySai.Params;
    Open;
  end;
end;

procedure TfrmHistoricoR.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QtdeS :=0;
  QtdeE :=0;
  TotalS:=0;
  TotalE:=0;

  lest.Caption := 'Qtde Estoque: '+InttoStr(iEst);
  ldev.Caption := 'Qtde Devolvida: '+IntToStr(iDev);
  lent.Caption := 'Qtde de Entradas: '+IntToStr(iEnt);
  lsai.Caption := 'Qtde Vendida: '+IntToStr(iSai);
end;

procedure TfrmHistoricoR.bndentBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QtdeE := QtdeE + qrEnt.FieldByName('QUANTIDADE').AsInteger;
  TotalE := TotalE + qrEnt.FieldByName('TOTAL').AsFloat;
end;

procedure TfrmHistoricoR.bndsaiBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QtdeS := QtdeS + qrSai.FieldByName('QUANTIDADE').AsInteger;
  TotalS := TotalS + qrSai.FieldByName('TOTAL').AsFloat;
end;

procedure TfrmHistoricoR.bndFootEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lQtdeEnt.Caption := FormatFloat('#0',QtdeE);
  lTotalEnt.Caption := FormatFloat('#,###,##0.00',TotalE);
end;

procedure TfrmHistoricoR.bndFootSBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lQtdeSai.Caption := FormatFloat('#0',QtdeS);
  lTotalSai.Caption := FormatFloat('#,###,##0.00',TotalS);
end;

end.
