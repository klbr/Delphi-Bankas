unit VendaVendedorR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QRCtrls, QuickRpt, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmVendaVendedorR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    edtTotal: TQRLabel;
    QRDBText7: TQRDBText;
    edtComissao: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    edtTotalGeral: TQRLabel;
    edtTotalComissoes: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iFuncionario : integer;
    sOrdem : String;
    ddata1, ddata2 : TdateTime;
    procedure relatorio;
  public
  published
    property Data1 : TdateTime read ddata1 write ddata1;
    property Data2 : TdateTime read ddata2 write ddata2;
    property Funcionario : Integer read iFuncionario write iFuncionario;
    property Ordem : String read sOrdem write sOrdem;
  end;

var
  frmVendaVendedorR: TfrmVendaVendedorR;
  Total, Comissao, TotalGeral, ComissaoGeral : Double;
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmVendaVendedorR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Total := Total + qrRelatorio.FieldByName('QUITACAO').AsFloat;
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

procedure TfrmVendaVendedorR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Total := 0;
  Comissao := 0;
  TotalGeral := 0;
  ComissaoGeral := 0;
  Relatorio;
end;

procedure TfrmVendaVendedorR.relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                        ');
    Add('  FUNCIONARIO.DESCRICAO AS DESC_FUNCIONARIO,  ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,          ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA,     ');
    Add('  SAIDA.SAIDA,                                ');
    Add('  SAIDA.DESCONTO,                             ');
    Add('  SAIDA.QUITACAO,                             ');
    Add('  FUNCIONARIO.COMISSAO                        ');
    Add('FROM                                          ');
    Add('  FUNCIONARIO,                                ');
    Add('  CLIENTE,                                    ');
    Add('  SAIDA,                                      ');
    Add('  FORMAPAGAMENTO                              ');
    Add('WHERE                                         ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2        ');
      Add('AND                                           ');
    end;
    if iFuncionario > 0 then
    begin
      Add('  FUNCIONARIO.FUNCIONARIO = :FUNCIONARIO      ');
      Add('AND                                           ');
    end;
    Add('  SAIDA.FUNCIONARIO=FUNCIONARIO.FUNCIONARIO   ');
    Add('AND                                           ');
    Add('  SAIDA.CLIENTE=CLIENTE.CLIENTE               ');
    Add('AND                                           ');
    Add('  SAIDA.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO ');
    Add('ORDER BY '+sOrdem                              );
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := ddata1;
      Params.ParamByName('DATA2').AsDateTime := ddata2;
    end;
    if iFuncionario > 0 then
      Params.ParamByName('FUNCIONARIO').AsInteger := iFuncionario;
    Open;
  end;
end;

procedure TfrmVendaVendedorR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.caption := '';
end;

procedure TfrmVendaVendedorR.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00', qrRElatorio.FieldByname('QUITACAO').asFloat);
end;

procedure TfrmVendaVendedorR.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00 %', qrRElatorio.FieldByname('DESCONTO').asFloat);
end;

procedure TfrmVendaVendedorR.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FormatFloat('#,##0.00 %', qrRElatorio.FieldByname('COMISSAO').asFloat);
end;

procedure TfrmVendaVendedorR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotal.Caption := FormatFloat('#,##0.00',Total);
  Comissao := ((Total * qrRelatorio.FieldByname('COMISSAO').AsFloat)/100);
  edtComissao.caption := FormatFloat('#,##0.00',Comissao);
  ComissaoGeral := ComissaoGeral + Comissao;
  TotalGeral := TotalGeral+ Total;
  Total := 0;
end;

procedure TfrmVendaVendedorR.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtTotalGeral.Caption := FormatFloat('#,##0.00',TotalGeral);
  edtTotalComissoes.Caption := FormatFloat('#,##0.00',ComissaoGeral);
end;

end.
