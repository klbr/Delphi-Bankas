unit DevolucaoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, QuickRpt, QRCtrls, ExtCtrls, IBCustomDataSet, IBQuery,
  DB;

type
  TfrmDevolucaoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    bndPe: TQRBand;
    QRDBText15: TQRDBText;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    edtQuantidade: TQRLabel;
    edtqtde: TQRLabel;
    edtVendida: TQRLabel;
    edtTotal: TQRLabel;
    edtValorEncalhado: TQRLabel;
    edtValorVendida: TQRLabel;
    edtLucro: TQRLabel;
    edtValoraPagar: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndPeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndPeAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    procedure Zerar;
  public
    { Public declarations }
  end;

var
  frmDevolucaoR: TfrmDevolucaoR;
  quantidade, qtde, vendida : integer;
  total, valorencalhado, valorvendida, lucro, valorapagar : double;
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmDevolucaoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Zerar;
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM DEVOLUCAO ORDER BY DESC_FORNECEDOR, DESC_PRODUTO');
    Open;
  end;
end;

procedure TfrmDevolucaoR.QRLabel4Print(sender: TObject; var Value: String);
begin
  Value := FormatDateTime('dd/mm/yy', qrRelatorio.FieldByName('DEVOLUCAO').asDateTime);
end;

procedure TfrmDevolucaoR.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALORUNITARIO').AsFloat);
end;

procedure TfrmDevolucaoR.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmDevolucaoR.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALORENCALHADO').AsFloat);
end;

procedure TfrmDevolucaoR.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALORVENDIDA').AsFloat);
end;

procedure TfrmDevolucaoR.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('LUCRO').AsFloat);
end;

procedure TfrmDevolucaoR.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('#,##0.00',qrRelatorio.FieldByName('VALORAPAGAR').AsFloat);
end;

procedure TfrmDevolucaoR.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value := LerIniCaractere('EMPRESA','TITULO');
end;

procedure TfrmDevolucaoR.Zerar;
begin
   quantidade := 0;
   qtde := 0;
   vendida := 0;
   total := 0;
   valorencalhado := 0;
   valorvendida := 0;
   lucro := 0;
   valorapagar := 0;
end;

procedure TfrmDevolucaoR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  quantidade := quantidade + qrRelatorio.FieldByName('QUANTIDADE').AsInteger;
  qtde := qtde + qrRelatorio.FieldByName('QTDEENCALHADO').AsInteger;
  vendida := vendida + qrRelatorio.FieldByName('VENDIDA').AsInteger;
  total := total + qrRelatorio.FieldByName('TOTAL').AsFloat;
  valorencalhado := valorencalhado + qrRelatorio.FieldByName('VALORENCALHADO').AsFloat;
  valorvendida := valorvendida + qrRelatorio.FieldByName('VALORVENDIDA').AsFloat;
  lucro := lucro + qrRelatorio.FieldByName('LUCRO').AsFloat;
  valorapagar := valorapagar + qrRelatorio.FieldByName('VALORAPAGAR').AsFloat;
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

procedure TfrmDevolucaoR.bndPeBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  edtQuantidade.Caption := inttostr(quantidade);
  edtQtde.Caption := inttostr(qtde);
  edtVendida.Caption := inttostr(vendida);
  edtTotal.Caption := FormatFloat('#,##0.00', total);
  edtValorEncalhado.Caption := FormatFloat('#,##0.00', valorencalhado);
  edtValorVendida.Caption := FormatFloat('#,##0.00', valorvendida);
  edtLucro.Caption := FormatFloat('#,##0.00', lucro);
  edtValorapagar.Caption := FormatFloat('#,##0.00', valorapagar);
end;

procedure TfrmDevolucaoR.bndPeAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Zerar;
end;

end.
