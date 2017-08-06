unit LancamentoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QRCtrls, QuickRpt, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmLancamentoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    lalal: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    edtData: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    edtTotal: TQRLabel;
    QRLabel8: TQRLabel;
    edtTotalGeral: TQRLabel;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lalalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    ddata1, ddata2 : TDateTime;
    procedure Relatorio;
  public
  published
    property Data1 : TDateTime read ddata1 write ddata1;
    property Data2 : TDateTime read ddata2 write ddata2;
  end;

var
  frmLancamentoR: TfrmLancamentoR;
  Total, TotalGeral : Double;
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmLancamentoR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmLancamentoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Total := 0;
  TotalGeral := 0;
  Relatorio;
end;

procedure TfrmLancamentoR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                ');
    Add('  *                                   ');
    Add('FROM                                  ');
    Add('  LANCAMENTO                            ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('WHERE                                 ');
      Add('  CADASTRO BETWEEN :DATA1 AND :DATA2  ');
    end;
    Add('ORDER BY CADASTRO                     ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := ddata1;
      Params.ParamByName('DATA2').AsDateTime := ddata2;
    end;
    Open;
    TDateTimeField(FieldByName('HORA')).DisplayFormat := 'HH:MM';
  end;
end;

procedure TfrmLancamentoR.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtData.Caption := DateToStr(qrRelatorio.FieldByname('CADASTRO').AsDateTime);
end;

procedure TfrmLancamentoR.QRDBText4Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00', qrRElatorio.FieldByname('VALOR').asFloat);
end;

procedure TfrmLancamentoR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Total := Total + qrRelatorio.FieldByName('VALOR').AsFloat;
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

procedure TfrmLancamentoR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalGeral := TotalGeral + Total;
  edtTotal.Caption := FormatFloat('#,##0.00',Total);
  Total := 0;
end;

procedure TfrmLancamentoR.lalalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotalGeral.Caption := FormatFloat('#,##0.00',TotalGeral);
end;

end.
