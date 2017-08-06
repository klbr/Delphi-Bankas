unit ListadoCaixaR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, QuickRpt, DB, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmListadoCaixaR = class(TfrmRelatorio)
    bndHeader: TQRGroup;
    QRBand1: TQRBand;
    bndHeaderf: TQRBand;
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    Cred: TQRLabel;
    Deb: TQRLabel;
    QRBand2: TQRBand;
    QRLabel18: TQRLabel;
    tc: TQRLabel;
    td: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    Saldo: TQRLabel;
    ts: TQRLabel;
    c: TQRLabel;
    d: TQRLabel;
    s: TQRLabel;
    lDescricao: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndHeaderfBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure bndHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    dData1, dData2 : TDateTime;
    procedure Relatorio;
  public
  published
    property Data1 : TDateTime read dData1 write dData1;
    property Data2 : TDateTime read dData2 write dData2;
  end;

var
  frmListadoCaixaR: TfrmListadoCaixaR;
  Credito , Debito, totalCred, TotalDeb, TSal, GSal : Double;
  
implementation
uses main, Principal;
{$R *.dfm}

procedure TfrmListadoCaixaR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) and (ddata1<=ddata2) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2);
end;

procedure TfrmListadoCaixaR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Credito  :=0;
  Debito   :=0;
  totalCred:=0;
  TotalDeb :=0;
  TSal := 0;
  GSal := 0;
  Relatorio;
end;

procedure TfrmListadoCaixaR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                         ');
    Add('  CAIXA.CAIXA AS CAIXA,                                        ');
    Add('  CAIXA.DATAABERTURA AS ABERTURA,                              ');
    Add('  CAIXA.DATAFECHAMENTO AS FECHAMENTO,                          ');
    Add('  CAIXA.CAIXAABERTURA AS CAIXAABERTURA,                        ');
    Add('  CAIXA.CAIXAFECHAMENTO AS CAIXAFECHAMENTO,                    ');
    Add('  CAIXA.HISTORICO AS HISTORICO,                                ');
    Add('  MOVIMENTO.DESCRICAO AS DESCRICAO,                            ');
    Add('  MOVIMENTO.FORMAPAGAMENTO AS FORMAPAGAMENTO,                  ');    
    Add('  MOVIMENTO.TIPO AS TIPO,                                      ');
    Add('  MOVIMENTO.CODIGO AS CODIGO,                                  ');
    Add('  MOVIMENTO.VALOR AS VALOR,                                    ');
    Add('  MOVIMENTO.DATA AS DATA,                                      ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA                       ');
    Add('FROM                                                           ');
    Add('  CAIXA,                                                       ');
    Add('  MOVIMENTO,                                                   ');
    Add('  FORMAPAGAMENTO                                               ');
    Add('WHERE                                                          ');
    if (ddata1>0) and (ddata2>0) and (ddata1<=ddata2) then
    begin
      Add('  CAIXA.DATAFECHAMENTO BETWEEN :DATA1 AND :DATA2             ');
      Add('AND                                                          ');
    end;
    Add('  CAIXA.CAIXA=MOVIMENTO.CAIXA                                  ');
    Add('AND                                                            ');
    Add('  MOVIMENTO.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO       ');
    if (ddata1>0) and (ddata2>0) and (ddata1<=ddata2) then
    begin
      Params.ParamByName('DATA1').AsDateTime := ddata1;
      Params.ParamByName('DATA2').AsDateTime := ddata2;
    end;
    Open;
//    TSal := qrRelatorio.FieldByName('CAIXAABERTURA').AsFloat;    
  end;
end;

procedure TfrmListadoCaixaR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrRelatorio.FieldByName('TIPO').AsString ='CRÉDITO' then
  begin
    Credito := Credito + qrRelatorio.FieldByName('VALOR').AsFloat;
    TSal  := TSal + qrRelatorio.FieldByName('VALOR').AsFloat;
    c.Caption := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR').AsFloat);
    d.Caption := '-';
  end
  else if qrRelatorio.FieldByName('TIPO').AsString ='DÉBITO' then
  begin
    Debito := Debito + qrRelatorio.FieldByName('VALOR').AsFloat;
    c.Caption := '-';;
    d.Caption := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR').AsFloat);
    TSal  := TSal - qrRelatorio.FieldByName('VALOR').AsFloat;
  end;
  s.Caption := FormatFloat('#,##0.00',TSal);
  if Copy(qrRelatorio.FieldByName('DESCRICAO').AsString,1,5) = 'Lança' then
  begin
    lDescricao.Caption := GetDescricao('HISTORICO','LANCAMENTO','LANCAMENTO='+qrRelatorio.FieldByName('CODIGO').AsString);
  end
  else if Copy(qrRelatorio.FieldByName('DESCRICAO').AsString,1,5) = 'Retir' then
  begin
    lDescricao.Caption := GetDescricao('HISTORICO','RETIRADA','RETIRADA='+qrRelatorio.FieldByName('CODIGO').AsString);
  end
  else if Copy(qrRelatorio.FieldByName('DESCRICAO').AsString,1,5) = 'Despe' then
  begin
    lDescricao.Caption := GetDescricao('DESCRICAO','DESPESAS, CREDOR','CREDOR.CREDOR=DESPESAS.CREDOR AND DESPESAS.DESPESAS='+qrRelatorio.FieldByName('CODIGO').AsString);
    lDescricao.Caption := lDescricao.Caption + ' - ' + GetDescricao('HISTORICO','DESPESAS','DESPESAS='+qrRelatorio.FieldByName('CODIGO').AsString);
  end
  else if Copy(qrRelatorio.FieldByName('DESCRICAO').AsString,1,5) = 'Venda' then
  begin
    lDescricao.Caption := GetDescricao('DESCRICAO','FORMAPAGAMENTO','FORMAPAGAMENTO='+qrRelatorio.FieldByName('FORMAPAGAMENTO').AsString);
  end
  else if Copy(qrRelatorio.FieldByName('DESCRICAO').AsString,1,5) = 'Parce' then
  begin
   lDescricao.Caption := GetDescricao('DESCRICAO','FORMAPAGAMENTO','FORMAPAGAMENTO='+qrRelatorio.FieldByName('FORMAPAGAMENTO').AsString);
  end;

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

procedure TfrmListadoCaixaR.bndHeaderfBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Cred.Caption  := FormatFloat('#,##0.00',Credito);
  Deb.Caption   := FormatFloat('#,##0.00',Debito);
  Saldo.Caption := FormatFloat('#,##0.00',TSal);

  totalCred := TotalCred + Credito;
  TotalDeb := TotalDeb + Debito;
  GSal := GSal + TSal;

  Credito := 0;
  Debito := 0;
  TSal := 0;
end;

procedure TfrmListadoCaixaR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  tc.Caption := FormatFloat('#,##0.00',TotalCred);
  td.Caption := FormatFloat('#,##0.00',TotalDeb);
  tS.Caption := FormatFloat('#,##0.00',TotalCred -TotalDeb);//GSal);
end;

procedure TfrmListadoCaixaR.QRDBText9Print(sender: TObject;
  var Value: String);
begin
//  Value := FormatFloat('#,##0.00', qrRelatorio.FieldByName('VALOR').asFloat);
end;

procedure TfrmListadoCaixaR.bndHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  TSal := TSal + qrRelatorio.FieldByName('CAIXAABERTURA').AsFloat;
end;

end.
