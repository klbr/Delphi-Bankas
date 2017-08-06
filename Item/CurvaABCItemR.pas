unit CurvaABCItemR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmCurvaABCItemR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    bnd1: TQRBand;
    ChildBand1: TQRChildBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    lblQtde: TQRLabel;
    lblFat: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lLucro: TQRLabel;
    lLucroT: TQRLabel;
    lLucroTotal: TQRLabel;
    qrExec: TIBQuery;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrRelatorioAfterOpen(DataSet: TDataSet);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    dData1, dData2 : TDateTime;
    procedure Relatorio;
  public

  published
    property Data1: TDateTime read dData1 write dData1;
    property Data2: TDateTime read dData2 write dData2;
  end;

var
  frmCurvaABCItemR: TfrmCurvaABCItemR;
  Qtde , Val, Lucro : Double;

implementation
Uses Main, Principal;
{$R *.dfm}

procedure TfrmCurvaABCItemR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmCurvaABCItemR.Relatorio;
begin
  Val := 0;
  Qtde := 0;
  Lucro := 0;
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT FAT_ITEM.*, ((FAT_ITEM.FAT_ITEM/FAT_ITEM.FATURAMENTO)*100) AS PERC FROM FAT_ITEM ');
    Add(' ORDER BY FAT_ITEM DESC ');
    Open;
  end;
end;

procedure TfrmCurvaABCItemR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if (dData1 <> 0) and (dData2 <> 0) then
     lblData.Caption := 'De ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
   else
     lblData.Caption := 'Todo o Período';
end;

procedure TfrmCurvaABCItemR.bnd1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Valor : Double;
begin
  if Sender.Tag = 0 then
  begin
    Sender.tag := 1;
    Sender.Color := clWhite;
  end
  else
  begin
    Sender.Tag := 0;
    Sender.Color := $F1F2F3;
  end;
  with qrExec, qrExec.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('SELECT PRECOCOMPRA, PRECOVENDA FROM ITEM WHERE CODBARRA=:COD ');
    ParamByName('COD').AsString := qrRelatorio.FieldByName('ITEM').AsString;
    Open;
    if FieldByName('PRECOVENDA').AsFloat > 0 then
    begin
      Valor := Round((1-FieldByname('PRECOCOMPRA').AsFloat/FieldByName('PRECOVENDA').AsFloat)*100);
      lLucro.Caption := FormatFloat('#0.00 %',Valor);
      lLucroT.Caption := FormatFloat('#0.00',(Valor/100)*qrRelatorio.FieldBYname('FAT_ITEM').AsFloat);
      Lucro := Lucro + (Valor/100)*qrRelatorio.FieldBYname('FAT_ITEM').AsFloat;
    end
    else
    begin
      lLucro.Caption := '100,00 %';
      lLucroT.Caption := QRDBText4.Caption;
      Lucro := Lucro + qrRelatorio.FieldBYname('FAT_ITEM').AsFloat;
    end;
  end;
  Qtde := Qtde + qrRelatorio.FieldBYname('QTDE').AsInteger;
  Val  := Val + qrRelatorio.FieldBYname('FAT_ITEM').AsFloat;
end;

procedure TfrmCurvaABCItemR.qrRelatorioAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('FAT_ITEM'   )).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('PERC'       )).DisplayFormat := '#,##0.00 %';
end;

procedure TfrmCurvaABCItemR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lblQtde.Caption := FormatFloat('#0' , Qtde);
  lblFat.Caption  := FormatFloat('#,##0.00' , Val);
  lLucroTotal.Caption := FormatFloat('#,##0.00' , Lucro);
  Qtde := 0;
  Val := 0;
  Lucro := 0;
end;

end.
