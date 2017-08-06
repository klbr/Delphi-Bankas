unit MargemLucroR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QRCtrls, QuickRpt, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmMargemLucroR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRGroupo: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    edtLucro: TQRLabel;
    edtSubTotal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    edtTotalGeral: TQRLabel;
    edtQtde: TQRLabel;
    edtQtdeT: TQRLabel;
    lblPMC: TQRLabel;
    QRLabel11: TQRLabel;
    lLucroUnid: TQRLabel;
    lVenda: TQRLabel;
    lVendaT: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lMargemS: TQRLabel;
    lMargemT: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private
    iGrupo : Integer;
    ddata1, ddata2 : TdateTime;
    sordem : String;
    procedure Relatorio;
  public

  published
    property Grupo : Integer read iGrupo write iGrupo;
    property Data1 : TDateTime read ddata1 write ddata1;
    property Data2 : TDateTime read ddata2 write ddata2;
    property Ordem : String read sOrdem write sordem;
  end;

var
  frmMargemLucroR: TfrmMargemLucroR;
  Lucro , SubTotal, TotalGeral : Double;
  Qtde , QtdeTotal : Double;
  Venda, VendaTotal : Double;
  
implementation
uses Main, Principal;
{$R *.dfm}

{ TfrmMargemLucro }

procedure TfrmMargemLucroR.Relatorio;
begin
  Venda := 0;
  VendaTotal := 0;
  with qrRelatorio, qrrelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                   ');
    Add('  SUM(ITEMSAIDA.QUANTIDADE) AS QTDE,     ');
    Add('  ITEM.CODBARRA,                         ');
    Add('  ITEM.DESCRICAO AS DESC_ITEM,           ');
    Add('  (SUM(ITEMSAIDA.TOTAL)-SUM(ITEMSAIDA.TOTAL*(FORMAPAGAMENTO.DESCONTO/100))-SUM(ITEMSAIDA.TOTAL*(SAIDA.DESCONTO/100)))/SUM(ITEMSAIDA.QUANTIDADE) AS PRECOVENDA,  ');
    Add('  GRUPO.DESCRICAO AS DESC_GRUPO          ');
    Add('FROM                                     ');
    Add('  ITEMSAIDA,                             ');
    Add('  ITEM,                                  ');
    Add('  GRUPO,                                 ');
    Add('  FORMAPAGAMENTO,                        ');
    Add('  SAIDA                                  ');
    Add('WHERE                                    ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2   ');
      Add('AND                                      ');
    end;
    Add('  SAIDA.SAIDA = ITEMSAIDA.ITEMSAIDA      ');
    Add('AND                                      ');
    Add('  SAIDA.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO   ');
    Add('AND                                      ');
    Add('  ITEMSAIDA.CODBARRA=ITEM.CODBARRA       ');
//    Add('AND                                      ');
//    Add('  ITEMENTRADA.CODBARRA=ITEM.CODBARRA     ');
    Add('AND                                      ');
    Add('  ITEM.GRUPO=GRUPO.GRUPO                 ');
    if iGrupo > 0 then
    begin
      Add('AND                                      ');
      Add('  GRUPO.GRUPO=:GRUPO                     ');
    end;
    Add('GROUP BY                                 ');
    Add('  GRUPO.DESCRICAO,                       ');
    Add('  ITEM.CODBARRA,                         ');
    Add('  ITEM.DESCRICAO                         ');
    Add('ORDER BY                                 ');
    Add(  sOrdem+'                                ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := ddata1;
      Params.ParamByName('DATA2').AsDateTime := ddata2;
    end;
    if iGrupo > 0 then
      Params.ParamByName('GRUPO').Asinteger := iGrupo;
    Open;
  end;
end;

procedure TfrmMargemLucroR.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var
  precocompra : Double;
begin

  with qrRelatorio do
  begin
    PrecoCompra := PegarPrecoCompra(FieldByname('CODBARRA').AsString);
    Venda := Venda + FieldByname('PRECOVENDA').AsFloat*FieldByname('QTDE').AsInteger;
    VendaTotal := VendaTotal + FieldByname('PRECOVENDA').AsFloat*FieldByname('QTDE').AsInteger;
    Lucro := (FieldByname('PRECOVENDA').AsFloat-PrecoCompra)*FieldByname('QTDE').AsInteger;
    Qtde := Qtde + FieldByname('QTDE').AsInteger;
    SubTotal := SubTotal + Lucro;
    lLucroUnid.Caption := FormatFloat('#,##0.00',FieldByname('PRECOVENDA').AsFloat-PrecoCompra);
    edtLucro.Caption := FormatFloat('#,##0.00',Lucro);
    lblPMC.Caption   := FormatFloat('#,##0.00',PrecoCompra);
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

procedure TfrmMargemLucroR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Lucro := 0;
  SubTotal := 0;
  TotalGeral := 0;
  Qtde := 0;
  QtdeTotal := 0;
  Relatorio;
end;

procedure TfrmMargemLucroR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalGeral := TotalGeral + SubTotal;
  edtSubTotal.Caption := FormatFloat('#,##0.00',SubTotal);
  lVenda.Caption := FormatFloat('#,###,##0.00',Venda);

  if Venda > 0 then
    lMargemS.Caption := FormatFloat('#0.00 %',SubTotal*100/Venda)
  else
    lMargemS.Caption := '-';

  Venda := 0;
  SubTotal := 0;
  QtdeTotal := QtdeTotal + Qtde;
  edtQtde.Caption := FormatFloat('#,##0',Qtde);
  Qtde := 0;
end;

procedure TfrmMargemLucroR.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotalGeral.Caption := FormatFloat('#,##0.00',TotalGeral);
  edtQtdeT.Caption := FormatFloat('#,##0',QtdeTotal);
  lVendaT.Caption := FormatFloat('#,###,##0.00',VendaTotal);
  if VendaTotal > 0 then
    lMargemT.Caption := FormatFloat('#0.00 %',TotalGeral*100/VendaTotal)
  else
    lMargemT.Caption := '-';

  VendaTotal := 0;
end;

procedure TfrmMargemLucroR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmMargemLucroR.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRElatorio.FieldByName('PRECOVENDA').asFloat);
end;

end.
