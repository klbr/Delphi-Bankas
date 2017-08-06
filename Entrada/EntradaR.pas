unit EntradaR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmEntradaR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    lblQtde: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    le1: TQRExpr;
    le2: TQRExpr;
    QRLabel7: TQRLabel;
    lmargem: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrRelatorioAfterOpen(DataSet: TDataSet);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    nEntrada : Integer;
    procedure Relatorio;
  public

  published
    property Entrada : Integer read nEntrada write nEntrada;
  end;

var
  frmEntradaR: TfrmEntradaR;
  qtde : Double;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmEntradaR.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
begin
  if qrRelatorio.FieldByName('QUANTIDADE').AsInteger > 0 then
    qtde := qtde + qrRelatorio.FieldByName('QUANTIDADE').AsInteger;

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

procedure TfrmEntradaR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmEntradaR.Relatorio;
begin
  qtde := 0;
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                 ');
    Add('  ITEMENTRADA.*,                                       ');
    Add('ITEMENTRADA.QUANTIDADE*ITEM.PRECOCOMPRA AS TOTAL_CUSTO,');    
    Add('  ENTRADA.*,                                           ');
    Add('  ITEM.DESCRICAO AS DESC_ITEM,                         ');
    Add('  FORNECEDOR.*,                                        ');
    Add('  FORNECEDOR.DESCRICAO AS DESC_FORNECEDOR              ');
    Add('FROM                                                   ');
    Add('  ITEMENTRADA,                                         ');
    Add('  ENTRADA,                                             ');
    Add('  ITEM,                                                ');
    Add('  FORNECEDOR                                           ');
    Add('WHERE                                                  ');
    Add('  ENTRADA.ENTRADA=:ENTRADA                             ');
    Add('AND                                                    ');
    Add('  ENTRADA.ENTRADA=ITEMENTRADA.ITEMENTRADA              ');
    Add('AND                                                    ');
    Add('  ITEM.CODBARRA=ITEMENTRADA.CODBARRA                   ');
    Add('AND                                                    ');
    Add('  FORNECEDOR.FORNECEDOR=ENTRADA.FORNECEDOR             ');
    Add('ORDER BY ENTRADA.ENTRADA                               ');
    Params.ParamByName('ENTRADA').AsInteger := nEntrada;
    Open;
  end;
end;

procedure TfrmEntradaR.qrRelatorioAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(DataSet.FieldByName('VALORUNI')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('MARGEM'  )).DisplayFormat := '#0.00 %';
  TNumericField(DataSet.FieldByName('TOTAL'   )).DisplayFormat := '#,##0.00';
  TDateTimeField(DataSet.FieldByName('DATA'   )).DisplayFormat := 'DD/MM/YYYY';
  TDateTimeField(DataSet.FieldByName('HORA'   )).DisplayFormat := 'HH:MM';
end;

procedure TfrmEntradaR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lblQtde.Caption := FormatFloat('#0',qtde);
  if le1.Value.dblResult <> 0 then
    lmargem.Caption := FormatFloat('#0.00 %',(1-(le2.Value.dblResult/le1.Value.dblResult))*100);
end;

end.
