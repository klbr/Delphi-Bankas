unit EstoquePorGrupoR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmEstoquePorGrupoR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qtde: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    total: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    qtde2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    total1: TQRLabel;
    total2: TQRLabel;
    total3: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrRelatorioAfterOpen(DataSet: TDataSet);
  private
    igrupo : Integer;
    iOrdem : Integer;
    procedure Relatorio;
  public
  published
    Property Grupo : Integer read iGrupo write iGrupo;
    Property Ordem : Integer read iOrdem write iOrdem;
  end;

var
  frmEstoquePorGrupoR: TfrmEstoquePorGrupoR;
  Geral, Qt : Integer;
  TotalGeral, subTotal : Double;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmEstoquePorGrupoR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Geral := 0;
  Relatorio;
end;

procedure TfrmEstoquePorGrupoR.Relatorio;
begin
  Geral := 0;
  Qt := 0;
  TotalGeral := 0;
  subTotal := 0;
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT  DISTINCT                     ');
    Add('  GRUPO.DESCRICAO AS DESC_GRUPO,     ');
    Add('  ITEM.CODBARRA AS CODBARRA,         ');
    Add('  ITEM.PRECOVENDA AS PRECO,          ');
    Add('  ITEM.DESCRICAO AS DESCRICAO        ');
    Add('FROM                                 ');
    Add('  ITEM,                              ');
    Add('  GRUPO                              ');
    Add('WHERE                                ');
    Add('  GRUPO.GRUPO=ITEM.GRUPO             ');
    if iGrupo > 0 then
    begin
      Add('AND                                  ');
      Add('  ITEM.GRUPO=:GRUPO                  ');
      ParamByName('GRUPO').AsInteger := iGrupo;
    end;
    Add('AND                                  ');
    Add('  ITEM.DESHABILITADO=''N''           ');
    Add('ORDER BY GRUPO.DESCRICAO,            ');
    if iOrdem = 0 then
      Add('  ITEM.DESCRICAO                     ')
    else if iOrdem = 1 then
      Add('  ITEM.CODBARRA                      ');
    Open;
  end;
end;

procedure TfrmEstoquePorGrupoR.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
var
  X : Integer;
  Y : Double;
begin
  X := EstoqueAtualSemEdicao(qrRelatorio.FieldByName('CODBARRA').AsString);
  qtde.Caption   := IntToStr(X);
  Y := X * qrRelatorio.FieldByname('PRECO').AsFloat;
  total1.Caption := FormatFloat('#,##0.00',Y);
  if X > 0 then
  begin
    Geral := Geral + X;
    QT := QT + X;
  end;
  if Y > 0 then
  begin
    TotalGeral := TotalGeral + Y;
    SubTotal := SubTotal + Y;
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

procedure TfrmEstoquePorGrupoR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  total.Caption := IntToStr(Geral);
  total3.Caption := FormatFloat('#,##0.00',TotalGeral);
end;

procedure TfrmEstoquePorGrupoR.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qtde2.Caption := IntTOStr(Qt);
  Qt := 0;
  total2.Caption := FormatFloat('#,##0.00',subTotal);
  subTotal := 0;
end;

procedure TfrmEstoquePorGrupoR.qrRelatorioAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('PRECO')).DisplayFormat := '#,##0.00';
end;

end.
