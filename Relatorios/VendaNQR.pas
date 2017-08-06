unit VendaNQR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QRCtrls, QuickRpt, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmVendaNQR = class(TfrmRelatorio)
    lTitulo: TQRLabel;
    lblData: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    l1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    DESC_CLIENTE: TQRDBText;
    DESC_FUNCIONARIO: TQRDBText;
    QRLabel7: TQRLabel;
    edtTotal: TQRLabel;
    QRLabel8: TQRLabel;
    edtTotalGeral: TQRLabel;
    edtData: TQRLabel;
    edtAquitar: TQRLabel;
    e2: TQRLabel;
    e1: TQRLabel;
    i2: TQRLabel;
    i1: TQRLabel;
    u1: TQRLabel;
    o1: TQRLabel;
    qrAquitar: TIBQuery;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    ddata1, ddata2 : TDateTime;
    iTipo : Integer;
    procedure Relatorio;
  public
  published
    property Data1 : TdateTime read ddata1 write ddata1;
    property Data2 : TdateTime read ddata2 write ddata2;
    property Tipo  : Integer   read iTipo  write iTipo;
  end;

var
  frmVendaNQR: TfrmVendaNQR;
  Total, TotalGeral : Double;
  VlrBruto, VlrBrutoT : Double;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmVendaNQR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';

  if iTipo = 0 then
    lTitulo.Caption := 'Listagem de Vendas não Quitadas'
  else
    lTitulo.Caption := 'Listagem de Vendas com Desconto';
end;

procedure TfrmVendaNQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmVendaNQR.QRBand2BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
var
  Aq : Double;
begin
  with qrAQuitar, qrAquitar.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT             ');
    Add('  SUM(TOTAL) AS T  ');
    Add('FROM               ');
    Add('  ITEMSAIDA        ');
    Add('WHERE              ');
    Add('  ITEMSAIDA=:SAIDA ');
    Params.ParamByName('SAIDA').AsInteger := qrRelatorio.FieldByname('SAIDA').AsInteger;
    Open;
    if iTipo = 0 then
     aq := FieldByName('T').AsFloat
    else
      aq := FieldByName('T').AsFloat - qrRelatorio.FieldByName('QUITACAO').AsFloat;
  end;
  edtAquitar.Caption := FormatFloat('#,##0.00',aq);
  i1.Caption := FormatFloat('#,##0.00', qrAquitar.FieldByName('T').AsFloat);
  if qrAquitar.FieldByName('T').AsFloat <> 0 then
    i2.Caption := FormatFloat('#0.00 %',(1-(qrRelatorio.FieldByName('QUITACAO').AsFloat/qrAquitar.FieldByName('T').AsFloat))*100)
  else
    i2.Caption := '-';
  VlrBruto := VlrBruto + qrAquitar.FieldByName('T').AsFloat;
  VlrBrutoT := VlrBrutoT + qrAquitar.FieldByName('T').AsFloat;
  Total := Total + Aq;
  TotalGeral := TotalGeral + Aq;
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

procedure TfrmVendaNQR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotal.Caption := FormatFloat('#,##0.00',Total);
  u1.Caption := FormatFloat('#,##0.00',VlrBruto);
  Total := 0;
  VlrBruto := 0;
end;

procedure TfrmVendaNQR.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotalGeral.Caption := FormatFloat('#,##0.00',TotalGeral);
  o1.Caption := FormatFloat('#,##0.00',VlrBrutoT);
  VlrBruto := 0;
  VlrBrutoT := 0;
  TotalGeral := 0;
end;

procedure TfrmVendaNQR.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtData.caption := DateToStr(qrRElatorio.FieldByName('DATA').AsDateTime);
end;

procedure TfrmVendaNQR.Relatorio;
begin
  Total := 0;
  TotalGeral := 0;
  VlrBruto := 0;
  VlrBrutoT := 0;
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    if iTipo = 0 then
    begin
      Add('SELECT                                                  ');
      Add('  SAIDA.DATA,                                           ');
      Add('  SAIDA.SAIDA,                                          ');
      Add('  SAIDA.QUITACAO,                                       ');
      Add('  SAIDA.DESCONTO,                                       ');
      Add('  (SUM(ITEMSAIDA.TOTAL)*(1-(SAIDA.DESCONTO/100))) AS T, ');
      Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,                    ');
      Add('  FUNCIONARIO.DESCRICAO AS DESC_FUNCIONARIO             ');
      Add('FROM                                                    ');
      Add('  SAIDA,                                                ');
      Add('  CLIENTE,                                              ');
      Add('  ITEMSAIDA,                                            ');
      Add('  FUNCIONARIO                                           ');
      Add('WHERE                                                   ');
      Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA                       ');
      Add('AND                                                     ');
      Add('  SAIDA.FORMAPAGAMENTO =  0                             ');
      Add('AND                                                     ');
      Add('  SAIDA.FUNCIONARIO=FUNCIONARIO.FUNCIONARIO             ');
      Add('AND                                                     ');
      Add('  SAIDA.CLIENTE=CLIENTE.CLIENTE                         ');
      if (ddata1 > 0) and (ddata2 > 0) then
      begin
        Add('AND                                        ');
        Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2     ');
        ParamByName('DATA1').AsDateTime := ddata1;
        ParamByName('DATA2').AsDateTime := ddata2;
      end;
      Add('GROUP BY                                                ');
      Add('  SAIDA.DATA,                                           ');
      Add('  SAIDA.SAIDA,                                          ');
      Add('  SAIDA.QUITACAO,                                       ');
      Add('  SAIDA.DESCONTO,                                       ');
      Add('  CLIENTE.DESCRICAO,                                    ');
      Add('  FUNCIONARIO.DESCRICAO                                 ');
      Open;
    end
    else
    begin
      Add('SELECT                                                  ');
      Add('  SAIDA.DATA,                                           ');
      Add('  SAIDA.SAIDA,                                          ');
      Add('  SAIDA.QUITACAO,                                       ');
      Add('  SAIDA.DESCONTO,                                       ');
      Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,                    ');
      Add('  FUNCIONARIO.DESCRICAO AS DESC_FUNCIONARIO             ');
      Add('FROM                                                    ');
      Add('  SAIDA,                                                ');
      Add('  CLIENTE,                                              ');
//      Add('  ITEMSAIDA,                                            ');
      Add('  FUNCIONARIO                                           ');
      Add('WHERE                                                   ');
//      Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA                       ');
//      Add('AND (                                                   ');
      Add(' ( SAIDA.FORMAPAGAMENTO >  1                            ');
      Add('OR                                                      ');
      Add('  SAIDA.DESCONTO <> 0  )                                ');
      Add('AND                                                     ');
      Add('  SAIDA.FUNCIONARIO=FUNCIONARIO.FUNCIONARIO             ');
      Add('AND                                                     ');
      Add('  SAIDA.CLIENTE=CLIENTE.CLIENTE                         ');
      if (ddata1 > 0) and (ddata2 > 0) then
      begin
        Add('AND                                        ');
        Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2     ');
        ParamByName('DATA1').AsDateTime:= ddata1;
        ParamByName('DATA2').AsDateTime:= ddata2;
      end;
      Open;
      e1.Enabled := True;
      e2.Enabled := True;
      i1.Enabled := True;
      i2.Enabled := True;
      u1.Enabled := True;
      o1.Enabled := True;
    end;
  end;
end;

procedure TfrmVendaNQR.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if iTipo > 0 then
    l1.Caption := 'Diferença';
end;

end.
