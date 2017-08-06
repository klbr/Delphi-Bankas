unit CurvaABCFuncionarioR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables;

type
  TfrmCurvaABCFuncionarioR = class(TfrmRelatorio)
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
    procedure T4Print(sender: TObject; var Value: String);
    procedure T5Print(sender: TObject; var Value: String);
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
  frmCurvaABCFuncionarioR: TfrmCurvaABCFuncionarioR;
  Qtde , Val : Double;

implementation
Uses Main;
{$R *.dfm}

procedure TfrmCurvaABCFuncionarioR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmCurvaABCFuncionarioR.Relatorio;
begin
  Val := 0;
  Qtde := 0;
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Close;
    Clear;
    Add('SELECT FAT_FUNCIONARIO.*, ((FAT_FUNCIONARIO.FAT_FUNCIONARIO/FAT_FUNCIONARIO.FATURAMENTO)*100) AS PERC FROM FAT_FUNCIONARIO ');
    Add(' ORDER BY FAT_FUNCIONARIO DESC ');
    Open;
  end;
end;

procedure TfrmCurvaABCFuncionarioR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if (dData1 <> 0) and (dData2 <> 0) then
     lblData.Caption := 'De ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
   else
     lblData.Caption := 'Todo o Período';
end;

procedure TfrmCurvaABCFuncionarioR.T4Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('##0.00 %',qrRelatorio.FieldByName('DESCONTO').AsFloat);
end;

procedure TfrmCurvaABCFuncionarioR.T5Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('R$ #,##0.00',qrRelatorio.FieldByName('SAIDA.QUITACAO').AsFloat);
end;

procedure TfrmCurvaABCFuncionarioR.bnd1BeforePrint(Sender: TQRCustomBand;
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
  Val  := Val + qrRelatorio.FieldBYname('FAT_FUNCIONARIO').AsFloat;
end;

procedure TfrmCurvaABCFuncionarioR.qrRelatorioAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('FAT_FUNCIONARIO')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('PERC'       )).DisplayFormat := '#,##0.00 %';
end;

procedure TfrmCurvaABCFuncionarioR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lblQtde.Caption := FormatFloat('#0' , Qtde);
  lblFat.Caption  := FormatFloat('#,##0.00' , Val);
end;

end.
