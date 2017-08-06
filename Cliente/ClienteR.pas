unit ClienteR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, QuickRpt, QRCtrls, ExtCtrls, IBCustomDataSet, IBQuery,
  DB;

type
  TfrmClienteR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    bnd1: TQRBand;
    T1: TQRDBText;
    T2: TQRDBText;
    T3: TQRDBText;
    T4: TQRDBText;
    T5: TQRDBText;
    A1: TQRDBText;
    A2: TQRDBText;
    QRGroup1: TQRGroup;
    o1: TQRLabel;
    o2: TQRLabel;
    o3: TQRLabel;
    o4: TQRLabel;
    o5: TQRLabel;
    l1: TQRLabel;
    l2: TQRLabel;
    bndFooter: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lblDesc: TQRLabel;
    lbltotal: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure T4Print(sender: TObject; var Value: String);
    procedure T5Print(sender: TObject; var Value: String);
    procedure bnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lblDescPrint(sender: TObject; var Value: String);
    procedure lbltotalPrint(sender: TObject; var Value: String);
  private
    bTipo : Boolean;
    dData1, dData2 : TDateTime;
    iCliente : Integer;
    procedure Relatorio;
    procedure Relatorio2;
  public

  published
    property Tipo : Boolean read bTipo write bTipo;
    property Data1: TDateTime read dData1 write dData1;
    property Data2: TDateTime read dData2 write dData2;
    property Cliente: Integer read iCliente write iCliente;
  end;

var
  frmClienteR: TfrmClienteR;
  desc , Total : Double;
  Cont : Integer;
implementation
Uses Main, Principal;
{$R *.dfm}

procedure TfrmClienteR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if bTipo then
  begin
    t1.Enabled := false;
    t2.Enabled := false;
    t3.Enabled := false;
    t4.Enabled := false;
    t5.Enabled := false;
    o1.Enabled := false;
    o2.Enabled := false;
    o3.Enabled := false;
    o4.Enabled := false;
    o5.Enabled := false;
    bndFooter.Enabled := false;
    Relatorio;
  end
  else
  begin
    a1.Enabled := false;
    a2.Enabled := false;
    l1.Enabled := false;
    l2.Enabled := false;
    Relatorio2;
  end;
  desc := 0;
  Total := 0;
  Cont := 1;
end;

procedure TfrmClienteR.Relatorio;
begin
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CLIENTE ORDER BY DESCRICAO');
    Open;
  end;
end;

procedure TfrmClienteR.Relatorio2;
begin
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                  ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,                    ');
    Add('  CLIENTE.CLIENTE AS COD_CLIENTE,                       ');
    Add('  SAIDA.*,                                              ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA                ');
    Add('FROM                                                    ');
    Add('  CLIENTE,                                              ');
    Add('  SAIDA,                                                ');
    Add('  FORMAPAGAMENTO                                        ');
    Add('WHERE                                                   ');
    Add('  CLIENTE.CLIENTE=SAIDA.CLIENTE                         ');
    if (dData1 > 0) and (dData2 > 0) then
    begin
      Add('AND                                                     ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2                  ');
      ParamByName('DATA1').AsDateTime := (dData1);
      ParamByName('DATA2').AsDateTime := (dData2);
    end;
    Add('AND                                                     ');
    Add('  FORMAPAGAMENTO.FORMAPAGAMENTO=SAIDA.FORMAPAGAMENTO    ');
    if iCliente > 0 then
    begin
      Add('AND                                                     ');
      Add('  CLIENTE.CLIENTE=:CLIENTE                              ');
      ParamByName('CLIENTE').AsInteger:= iCliente;
    end;
    Add('ORDER BY  CLIENTE.DESCRICAO                             ');
    Open;
  end;
end;

procedure TfrmClienteR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if not btipo then
     lblData.Caption := 'Compras do Cliente: '+qrRelatorio.FieldByName('DESC_CLIENTE').AsString+' de ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
   else
     lblData.Caption := 'Lista de todos os Clientes';
end;

procedure TfrmClienteR.T4Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('##0.00 %',qrRelatorio.FieldByName('DESCONTO').AsFloat);
end;

procedure TfrmClienteR.T5Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('R$ #,##0.00',qrRelatorio.FieldByName('QUITACAO').AsFloat);
end;

procedure TfrmClienteR.bnd1BeforePrint(Sender: TQRCustomBand;
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
  if bndFooter.enabled then
  begin
    desc := (desc + qrRelatorio.FieldByName('DESCONTO').asFloat)/cont;
    Total := Total + qrRelatorio.FieldByName('QUITACAO').asFloat;
    Inc(Cont);
  end;
end;

procedure TfrmClienteR.lblDescPrint(sender: TObject; var Value: String);
begin
  Value := FormatFloat('##0.00 %',desc);
end;

procedure TfrmClienteR.lbltotalPrint(sender: TObject; var Value: String);
begin
  Value := FormatFloat('R$ #,##0.00',total);
end;

end.
