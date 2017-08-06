unit CurvaABCClienteR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmCurvaABCClienteR = class(TfrmRelatorio)
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
  frmCurvaABCClienteR: TfrmCurvaABCClienteR;
  Qtde , Val : Double;

implementation
Uses Main, Principal;
{$R *.dfm}

procedure TfrmCurvaABCClienteR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmCurvaABCClienteR.Relatorio;
begin
  Val := 0;
  Qtde := 0;
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT FAT_CLIENTE.*, ((FAT_CLIENTE.FAT_CLIENTE/FAT_CLIENTE.FATURAMENTO)*100) AS PERC FROM FAT_CLIENTE ');
    Add(' ORDER BY FAT_CLIENTE DESC ');
    Open;
  end;
end;

procedure TfrmCurvaABCClienteR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if (dData1 <> 0) and (dData2 <> 0) then
     lblData.Caption := 'De ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
   else
     lblData.Caption := 'Todo o Período';
end;

procedure TfrmCurvaABCClienteR.bnd1BeforePrint(Sender: TQRCustomBand;
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
    Sender.Color := $F1F2F3;
  end;
  Qtde := Qtde + qrRelatorio.FieldBYname('QTDE').AsInteger;
  Val  := Val + qrRelatorio.FieldBYname('FAT_CLIENTE').AsFloat;  
end;

procedure TfrmCurvaABCClienteR.qrRelatorioAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('FAT_CLIENTE')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('PERC'       )).DisplayFormat := '#,##0.00 %';
end;

procedure TfrmCurvaABCClienteR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lblQtde.Caption := FormatFloat('#0' , Qtde);
  lblFat.Caption  := FormatFloat('#,##0.00' , Val);
  Qtde := 0;
  Val := 0;
end;

end.
