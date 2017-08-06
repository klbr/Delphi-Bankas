unit DespesasR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls,  DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmDespesasR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRDBText2: TQRDBText;
    lblTotal: TQRLabel;
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
  frmDespesasR: TfrmDespesasR;
  Total, TotalG : Double;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmDespesasR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmDespesasR.Relatorio;
begin
  Total  := 0;
  TotalG := 0;
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                    ');
    Add('  DESPESAS.VALOR AS VALOR,                ');
    Add('  DESPESAS.DESPESAS AS DESPESAS,          ');
    Add('  DESPESAS.HISTORICO AS HISTORICO,        ');
    Add('  DESPESAS.HORA AS HORA,                  ');
    Add('  DESPESAS.CADASTRO AS CADASTRO,          ');
    Add('  CREDOR.DESCRICAO AS DESC_CREDOR         ');
    Add('FROM                                      ');
    Add('  DESPESAS,                               ');
    Add('  CREDOR                                  ');
    Add('WHERE                                     ');
    Add('  CREDOR.CREDOR=DESPESAS.CREDOR           ');
    if (dData1 > 0) and (dData2 > 0) then
    begin
      Add('AND                                       ');
      Add('  CADASTRO BETWEEN :DATA1 AND :DATA2      ');
      ParamByName('DATA1').AsDateTime := dData1;
      ParamByName('DATA2').AsDateTime := dData2;
    end;
    if sCredor <> '' then
    begin
      Add('AND                                     ');
      Add('  CREDOR.CREDOR=:CREDOR                 ');
    end;
    Add('ORDER BY DESPESAS.CADASTRO, CREDOR.DESCRICAO  ');
    if sCredor <> '' then
      Params.ParamByName('CREDOR').AsInteger := StrToIntDef(sCredor, 0);
    Open;
    TDateTimeField(FieldByName('HORA')).DisplayFormat := 'HH:MM';
  end;
end;

procedure TfrmDespesasR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) and (ddata1<=ddata2) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmDespesasR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Total := Total + qrRelatorio.FieldByName('VALOR').asFloat;
  TotalG := TotalG + qrRelatorio.FieldByName('VALOR').asFloat;
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

procedure TfrmDespesasR.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblTotal.Caption := FormatFloat('#,##0.00',total);
  Total := 0;
end;

procedure TfrmDespesasR.QRDBText6Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR').asFloat);
end;

procedure TfrmDespesasR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblTotalG.Caption := FormatFloat('#,##0.00',totalG);
end;

end.
