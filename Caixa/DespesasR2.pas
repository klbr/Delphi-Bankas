unit DespesasR2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls,
  DBTables, IBCustomDataSet, IBQuery;

type
  TfrmDespesasR2 = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    ChildBand2: TQRChildBand;
    l1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    l2: TQRLabel;
    o5: TQRLabel;
    QRLabel7: TQRLabel;
    lblTotal: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    lblTotalG: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Procedure Relatorio;
  protected
    dData1, dData2 : TDateTime;
    sCredor : String;
  public
  published
    property Data1 : TDateTime read dData1 write dData1;
    property Data2 : TDateTime read dData2 write dData2;
    property Credor : String read sCredor write sCredor;
  end;

var
  frmDespesasR2: TfrmDespesasR2;
  Total, TotalG : Double;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmDespesasR2.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Total  :=0;
  TotalG := 0;
  Relatorio;
end;

procedure TfrmDespesasR2.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                    ');
    Add('  DESPESAS.*,                             ');
    Add('  CREDOR.DESCRICAO AS DESC_CREDOR         ');
    Add('FROM                                      ');
    Add('  DESPESAS,                               ');
    Add('  CREDOR                                  ');
    Add('WHERE                                     ');
    if ((dData1 > 0) and (dData2 > 0)) and (dData1 <= dData2) then
    begin
      Add('  CADASTRO BETWEEN :DATA1 AND :DATA2      ');
      Add('AND                                       ');
    end;
    Add('  CREDOR.CREDOR=DESPESAS.CREDOR           ');
    if sCredor <> '' then
    begin
      Add('AND                                     ');
      Add('  CREDOR.CREDOR=:CREDOR                 ');
    end;
    Add('ORDER BY CREDOR.DESCRICAO, DESPESAS.CADASTRO  ');
    if ((dData1 > 0) and (dData2 > 0)) and (dData1 <= dData2) then
    begin
      Params.ParamByName('DATA1').AsDateTime := dData1;
      Params.ParamByName('DATA2').AsDateTime := dData2;
    end;
    if sCredor <> '' then
      Params.ParamByName('CREDOR').AsInteger := StrToIntDef(sCredor, 0);
    Open;
    TDateTimeField(FieldByName('HORA')).DisplayFormat := 'HH:MM';
  end;
end;

procedure TfrmDespesasR2.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) and (ddata1<=ddata2) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmDespesasR2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Total := Total + qrRelatorio.FieldByName('VALOR').asFloat;
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

procedure TfrmDespesasR2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalG := TotalG + Total;
  lblTotal.Caption := FormatFloat('#,##0.00',total);
  Total := 0;
end;

procedure TfrmDespesasR2.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR').asFloat)
end;

procedure TfrmDespesasR2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblTotalG.Caption := FormatFloat('#,##0.00',totalG);
end;

end.
