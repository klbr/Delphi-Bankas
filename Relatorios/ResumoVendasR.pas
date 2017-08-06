unit ResumoVendasR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmResumoVendaR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    lblData: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    lblValor: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText13Print(sender: TObject; var Value: String);
  private
    ddata1, ddata2 : TDateTime;
    sCli, sFunc, sForma : String;
    procedure Relatorio;
  public
  published
    property Data1   : TDateTime read ddata1 write ddata1;
    property Data2   : TDateTime read ddata2 write ddata2;
    property Cliente : String    read sCli   write sCli;
    property Func    : String    read sFunc  write sFunc;
    property Forma   : String    read sForma write sForma;
  end;

var
  frmResumoVendaR: TfrmResumoVendaR;
  Valor, SubTotal : Double;

implementation
uses Main, Principal;
{$R *.dfm}

{ TfrmResumoVendaR }


procedure TfrmResumoVendaR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Valor := 0;
  SubTotal := 0;
  Relatorio;
end;

procedure TfrmResumoVendaR.Relatorio;
begin
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                    ');
    Add('  SAIDA.CAIXA AS CAIXA,                                   ');
    Add('  SAIDA.DATA AS DATA,                                     ');
    Add('  SAIDA.DESCONTO AS DESCONTO,                             ');
    Add('  SAIDA.QUITACAO AS QUITACAO,                             ');
    Add('  SAIDA.SAIDA AS SAIDA,                                   ');
    Add('  SAIDA.HORA AS HORA,                                     ');
    Add('  ITEMSAIDA.CODBARRA AS CODBARRA,                         ');
    Add('  ITEM.DESCRICAO AS DESCRICAO,                            ');
    Add('  ITEMSAIDA.EDICAO AS EDICAO,                             ');
    Add('  ITEMSAIDA.QUANTIDADE AS QUANTIDADE,                     ');
    Add('  ITEMSAIDA.TOTAL AS TOTAL,                               ');
    Add('  FUNCIONARIO.DESCRICAO AS DESC_FUNCIONARIO,              ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA,                 ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE                       ');
    Add('FROM                                                      ');
    Add('  SAIDA,                                                  ');
    Add('  ITEMSAIDA,                                              ');
    Add('  ITEM,                                                   ');
    Add('  FUNCIONARIO,                                            ');
    Add('  FORMAPAGAMENTO,                                         ');
    Add('  CLIENTE                                                 ');
    Add('WHERE                                                     ');
    Add('  ITEM.CODBARRA=ITEMSAIDA.CODBARRA                        ');
    Add('AND                                                       ');
    Add('  CLIENTE.CLIENTE=SAIDA.CLIENTE                           ');
    Add('AND                                                       ');
    Add('  FORMAPAGAMENTO.FORMAPAGAMENTO=SAIDA.FORMAPAGAMENTO      ');
    Add('AND                                                       ');
    Add('  FUNCIONARIO.FUNCIONARIO=SAIDA.FUNCIONARIO               ');
    Add('AND                                                       ');
    Add('  ITEMSAIDA.ITEMSAIDA=SAIDA.SAIDA                         ');
    if (dData1 > 0) and (dData2 > 0) then
    begin
      Add('AND                                                       ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2                    ');
      ParamByName('DATA1').AsDateTime := (ddata1);
      ParamByName('DATA2').AsDateTime := (ddata2);
    end;
    if Trim(sCli) <> '' then
    begin
      Add('AND                                                       ');
      Add('  SAIDA.CLIENTE=:CLIENTE                                  ');
      ParamByName('CLIENTE').AsInteger := StrToIntDef(sCli,0);
    end;
    if Trim(sFunc) <> '' then
    begin
      Add('AND                                                       ');
      Add('  SAIDA.FUNCIONARIO=:FUNC                                 ');
      ParamByName('FUNC').AsInteger := StrToIntDef(sFunc,0);
    end;
    if Trim(sForma) <> '' then
    begin
      Add('AND                                                       ');
      Add('  SAIDA.FORMAPAGAMENTO=:FORMA                             ');
      ParamByName('FORMA').AsInteger := StrToIntDef(sForma,0);
    end;
    Add('ORDER BY                                                  ');
    Add('  SAIDA.CAIXA, SAIDA.SAIDA                                ');
    Open;
    TDateTimeField(FieldByName('HORA')).DisplayFormat := 'HH:MM';
  end;
end;

procedure TfrmResumoVendaR.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('##0.00 %',qrRelatorio.FieldByName('DESCONTO').asFloat);
end;

procedure TfrmResumoVendaR.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('QUITACAO').asFloat);
end;

procedure TfrmResumoVendaR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmResumoVendaR.QRBand1BeforePrint(Sender: TQRCustomBand;
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
    Sender.Color := $F1F2F3
  end;
end;

procedure TfrmResumoVendaR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblValor.Caption := FormatFloat('#,##0.00',valor);
  valor := 0;
end;

procedure TfrmResumoVendaR.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qrRElatorio.IsEmpty then
    Valor := Valor + qrRelatorio.FieldByName('QUITACAO').asFloat;
end;

procedure TfrmResumoVendaR.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('TOTAL').asFloat);
end;

end.
