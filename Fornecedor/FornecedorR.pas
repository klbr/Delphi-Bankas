unit FornecedorR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls,
  DBTables, IBCustomDataSet, IBQuery;

type
  TfrmFornecedorR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  dData1, dData2 : TdateTime;
  procedure Relatorio;
  public
  published
    property Data1 : TdateTime read dData1 write dData1;
    property Data2 : TdateTime read dData2 write dData2;
  end;

var
  frmFornecedorR: TfrmFornecedorR;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmFornecedorR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) and (ddata1 <= ddata2)then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.Caption := 'Lista de Todos os Fornecedores';
end;

procedure TfrmFornecedorR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmFornecedorR.Relatorio;
begin
  with qrRelatorio,qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT              ');
    Add('  FORNECEDOR,       ');
    Add('  DESCRICAO,        ');
    Add('  RAZAOSOCIAL,      ');
    Add('  COMERCIAL,        ');
    Add('  COMERCIAL2,       ');
    Add('  COMERCIAL3        ');
    Add('FROM                ');
    Add('  FORNECEDOR        ');
    if (dData1 > 0) and (dData2 >0) and (dData1<=dData2) then
    begin
      Add('WHERE                                ');
      Add('  CADASTRO BETWEEN :DATA1 AND :DATA2 ');
      Add(' ORDER BY DESCRICAO                  ');
      ParamByName('DATA1').AsDateTime := dData1;
      ParamByName('DATA2').AsDateTime := dData2;
    end
    else
      Add(' ORDER BY DESCRICAO                  ');
    Open;
  end;
end;

procedure TfrmFornecedorR.QRBand1BeforePrint(Sender: TQRCustomBand;
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

end.
