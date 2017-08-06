unit ItemR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormRelatorio, DB, QuickRpt, QRCtrls, ExtCtrls, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmItemR = class(TfrmRelatorio)
    QRLabel1: TQRLabel;
    lblData: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    lLucro: TQRLabel;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private
    ddata1, ddata2 : TdateTime;
    iTipo : Integer;
    procedure Relatorio;
  public

  published
    property Data1 : TdateTime read ddata1 write ddata1;
    property Data2 : TdateTime read ddata2 write ddata2;
    property Tipo  : Integer   read iTipo  write iTipo;
  end;

var
  frmItemR: TfrmItemR;

implementation
uses Main, Principal;

{$R *.dfm}

procedure TfrmItemR.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (ddata1 > 0) and (ddata2 > 0) and (ddata1<=ddata2) then
    lblData.Caption := 'De '+FormatDateTime('dd/mm/yyyy',ddata1)+' à '+FormatDateTime('dd/mm/yyyy',ddata2)
  else
    lblData.Caption := 'Lista de Todas as Mercadorias';
end;

procedure TfrmItemR.QRDBText4Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00' , qrRelatorio.FieldByName('PRECOCOMPRA').AsFloat);
end;

procedure TfrmItemR.QRDBText5Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00' , qrRelatorio.FieldByName('PRECOVENDA').AsFloat);
end;

procedure TfrmItemR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Relatorio;
end;

procedure TfrmItemR.Relatorio;
begin
  with qrRelatorio, qrRelatorio.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                    ');
    Add('  ITEM.*,                                 ');
    Add('  GRUPO.DESCRICAO AS DESC_GRUPO           ');
    Add('FROM                                      ');
    Add('  ITEM,                                   ');
    Add('  GRUPO                                   ');
    Add('WHERE                                     ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Add('  ITEM.CADASTRO BETWEEN :DATA1 AND :DATA2  ');
      Add('AND                                        ');
    end;
    if iTipo = 0 then
    begin
      Add('  ITEM.DESHABILITADO=''N''                 ');
      Add('AND                                        ');
    end
    else if iTipo = 1 then
    begin
      Add('  ITEM.DESHABILITADO=''S''                 ');
      Add('AND                                        ');
    end;
    Add('  ITEM.GRUPO=GRUPO.GRUPO                  ');
    Add(' ORDER BY ITEM.DESCRICAO         ');
    if (ddata1 > 0) and (ddata2 > 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := ddata1;
      Params.ParamByName('DATA2').AsDateTime := ddata2;
    end;
    Open;
  end;
end;

procedure TfrmItemR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrRelatorio.FieldByName('PRECOVENDA').AsFloat > 0 then
    lLucro.Caption := FormatFloat('#0.00 %',Round((1-qrRelatorio.FieldByname('PRECOCOMPRA').AsFloat/qrRelatorio.FieldByName('PRECOVENDA').AsFloat)*100))
  else
    lLucro.Caption := '100,00 %';

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

procedure TfrmItemR.QRExpr1Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatFloat('#,##0.00', StrtoFloatDef(Value,0));
end;

procedure TfrmItemR.QRExpr2Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatFloat('#,##0.00', StrtoFloatDef(Value,0));
end;

end.
