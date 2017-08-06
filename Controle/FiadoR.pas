unit FiadoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls,
  DBTables, IBCustomDataSet, IBQuery;

type
  TfrmFiadoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    bndDetalhe: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    bndSumario: TQRBand;
    QRLabel13: TQRLabel;
    l1: TQRLabel;
    lblFiados: TQRLabel;
    lblPagos: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    bndGrupo: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    l2: TQRLabel;
    lblDiferenca: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndSumarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure bndGrupoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    bTipo : Boolean;
    iCLiente, iparcela : Integer;
    dData1, dData2 : TDateTime;
    procedure Relatorio1;
    procedure Relatorio2;
  public
  published
    property Tipo : Boolean read bTipo write bTipo;
    property Cliente : Integer read iCliente write iCliente;
    property Data1 : TDateTime read dData1 write dData1;
    property Data2 : TDateTime read dData2 write dData2;
    property Parcela : integer read iparcela write iparcela;
  end;

var
  frmFiadoR: TfrmFiadoR;
  Pago , Fiado : Double;
  
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmFiadoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  pago := 0;
  fiado := 0;
  if btipo then
    Relatorio1
  else
    Relatorio2;
end;

procedure TfrmFiadoR.Relatorio1;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                   ');
    Add('  CLIENTE.CLIENTE AS CLIENTE,            ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,     ');
    Add('  CLIENTE.RESIDENCIAL AS RESIDENCIAL,    ');
    Add('  CLIENTE.COMERCIAL AS COMERCIAL,        ');
    Add('  CLIENTE.CELULAR AS CELULAR,            ');
    Add('  FIADO.FIADO AS FIADO,                  ');
    Add('  FIADO.DATA AS DATA,                    ');
    Add('  FIADO.SAIDA AS SAIDA,                  ');
    Add('  FIADO.VENCIMENTO AS VENCIMENTO,        ');
    Add('  FIADO.VALOR AS VALOR,                  ');
    Add('  FIADOPARCELA.TOTAL AS TOTAL,           ');
    Add('  FIADOPARCELA.AJUSTE AS AJUSTE,         ');
    Add('  FIADOPARCELA.VALOR AS VALOR_PAGO,      ');
    Add('  FIADOPARCELA.PAGAMENTO AS PAGAMENTO    ');
    Add('FROM                                     ');
    Add('  CLIENTE,                               ');
    Add('  FIADO,                                 ');
    Add('  FIADOPARCELA                           ');
    Add('WHERE                                    ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('  FIADO.DATA BETWEEN :DATA1 AND :DATA2   ');
      Add('AND                                      ');
    end;
    Add('  CLIENTE.CLIENTE=FIADO.CLIENTE          ');
    Add('AND                                      ');
    Add('  FIADO.FIADO=FIADOPARCELA.FIADO         ');
    if iparcela = 0 then
    begin
      Add('AND                                      ');
      Add('  FIADO.VENCIMENTO >= :VENC              ');
    end
    else if iParcela = 1 then
    begin
      Add('AND                                      ');
      Add('  FIADO.VENCIMENTO < :VENC               ');
    end;
    if iCliente > 0 then
    begin
      Add('AND                                      ');
      Add('  CLIENTE.CLIENTE=:CLIENTE               ');
    end;
    Add('AND                                      ');
    Add('  FIADO.PAGO=''S''                       ');
    Add(' ORDER BY FIADO.FIADO, CLIENTE.DESCRICAO ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := dData1;
      Params.ParamByName('DATA2').AsDateTime := dData2;
    end;
    if iParcela < 2 then
    begin
      Params.ParamByName('VENC').AsDateTime := Date;
    end;
    if iCliente > 0 then
    begin
      Params.ParamByName('CLIENTE').AsInteger := iCliente;
    end;
    Open;
  end;
end;

procedure TfrmFiadoR.Relatorio2;
begin
  bndDetalhe.Enabled := false;
  bndGrupo.Height := 23;
  bndSumario.Height := 46;
  l1.Enabled := false;
  l2.Enabled := false;
  lblDiferenca.Enabled := false;
  lblPagos.Enabled := false;
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                   ');
    Add('  CLIENTE.CLIENTE AS CLIENTE,            ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE,     ');
    Add('  CLIENTE.RESIDENCIAL AS RESIDENCIAL,    ');
    Add('  CLIENTE.COMERCIAL AS COMERCIAL,        ');
    Add('  CLIENTE.CELULAR AS CELULAR,            ');
    Add('  FIADO.FIADO AS FIADO,                  ');
    Add('  FIADO.DATA AS DATA,                    ');
    Add('  FIADO.SAIDA AS SAIDA,                  ');
    Add('  FIADO.VENCIMENTO AS VENCIMENTO,        ');
    Add('  FIADO.VALOR AS VALOR                   ');
    Add('FROM                                     ');
    Add('  CLIENTE,                               ');
    Add('  FIADO                                  ');
    Add('WHERE                                    ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('  FIADO.DATA BETWEEN :DATA1 AND :DATA2   ');
      Add('AND                                      ');
    end;
    if iparcela = 0 then
    begin
      Add('  FIADO.VENCIMENTO >= :VENC              ');
      Add('AND                                      ');
    end
    else if iParcela = 1 then
    begin
      Add('  FIADO.VENCIMENTO < :VENC               ');
      Add('AND                                      ');
    end;
    Add('  CLIENTE.CLIENTE=FIADO.CLIENTE          ');
    Add('AND                                      ');
    if iCliente > 0 then
    begin
      Add('  CLIENTE.CLIENTE=:CLIENTE               ');
      Add('AND                                      ');
    end;
    Add('  FIADO.PAGO=''N''                       ');
    Add(' ORDER BY FIADO.FIADO, CLIENTE.DESCRICAO ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := dData1;
      Params.ParamByName('DATA2').AsDateTime := dData2;
    end;
    if iParcela < 2 then
    begin
      Params.ParamByName('VENC').AsDateTime := Date;
    end;
    if iCliente > 0 then
    begin
      Params.ParamByName('CLIENTE').AsInteger := iCliente;
    end;
    Open;
  end;
end;

procedure TfrmFiadoR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if not btipo then
    lblData.Caption := 'Compras do Cliente: '+qrRelatorio.FieldByName('DESC_CLIENTE').AsString+' de ' +FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.Caption := 'Lista de todos os Clientes';
end;

procedure TfrmFiadoR.bndDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Pago := Pago + qrRelatorio.FieldByName('TOTAL').AsFloat;
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

procedure TfrmFiadoR.bndSumarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblFiados.Caption := FormatFloat('R$ #,##0.00',Fiado);
  lblPagos.Caption := FormatFloat('R$ #,##0.00',Pago);
  lblDiferenca.Caption := FormatFloat('R$ #,##0.00',(Pago-Fiado));
end;

procedure TfrmFiadoR.QRDBText3Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR').AsFloat);
end;

procedure TfrmFiadoR.QRDBText6Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALOR_PAGO').AsFloat);
end;

procedure TfrmFiadoR.bndGrupoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Fiado := Fiado + qrRelatorio.FieldByName('VALOR').AsFloat;
end;

procedure TfrmFiadoR.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  bndDetalhe.Tag := 0;
end;

end.
