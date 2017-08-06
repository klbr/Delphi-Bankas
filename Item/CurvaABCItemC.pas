unit CurvaABCItemC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Animate, GIFCtrl, ExtCtrls, TFlatPanelUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, ToolEdit, Mask, TFlatEditUnit,
  DB, DBTables, Grids, DBGrids, RXDBCtrl, IBCustomDataSet, IBQuery;

type
  TfrmCurvaABCItemC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    edtCodProduto: TEdit;
    edtDescItem: TLabel;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel1: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel2: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    dsItem: TDataSource;
    qrExec: TIBQuery;
    qrRel: TIBQuery;
    qrFat: TIBQuery;
    procedure cancelClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemCellClick(Column: TColumn);
    procedure dbgItemDblClick(Sender: TObject);
    procedure edtCodProdutoChange(Sender: TObject);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure IniciarRelatorio;
    procedure ConsultaItem;
    procedure FechaConsultaItem;
    function  Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmCurvaABCItemC: TfrmCurvaABCItemC;

implementation
uses Main, Principal, CurvaABCItemR, QuickRpt, Consulta;
{$R *.dfm}

procedure TfrmCurvaABCItemC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCurvaABCItemC.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
end;

procedure TfrmCurvaABCItemC.okClick(Sender: TObject);
begin
  if not Valida then
    exit;
  ok.Enabled :=false;
  IniciarRelatorio;
  with TfrmCurvaABCItemR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

function TfrmCurvaABCItemC.Valida: Boolean;
begin
  result := false;
  if edtData1.Date >  edtData2.Date then
  begin
    exclusao2('Preencha um intervalo de datas válidos','Aviso');
    edtData1.SetFocus;
    exit;
  end;
  result :=true;
end;

procedure TfrmCurvaABCItemC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true);
  if (key = VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmCurvaABCItemC.IniciarRelatorio;
begin
  with qrRel, qrRel.SQL do
  begin
    qrRel.Database := frmPrincipal.dba;
    qrRel.SQL.Clear;
    qrRel.Close;
    qrRel.SQL.Add('DELETE FROM FAT_ITEM ');
    qrRel.ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    qrRel.SQL.Clear;
    qrRel.SQL.Add('SELECT                                      ');
    qrRel.SQL.Add('  ITEM.CODBARRA,                            ');
    qrRel.SQL.Add('  ITEM.DESCRICAO,                           ');
    qrRel.SQL.Add('  SUM(ITEMSAIDA.QUANTIDADE) AS QTDE,        ');
    qrRel.SQL.Add('  SUM(ITEMSAIDA.TOTAL) AS TOTAL             ');
    qrRel.SQL.Add('FROM                                        ');
    qrRel.SQL.Add('  ITEM,                                     ');
    qrRel.SQL.Add('  SAIDA,                                    ');
    qrRel.SQL.Add('  ITEMSAIDA                                 ');
    qrRel.SQL.Add('WHERE                                       ');
    qrRel.SQL.Add('  ITEM.CODBARRA=ITEMSAIDA.CODBARRA          ');
    qrRel.SQL.Add('AND                                         ');
    qrRel.SQL.Add('  ITEMSAIDA.ITEMSAIDA=SAIDA.SAIDA            ');
    if Trim(edtDescItem.Caption) <> ''  then
    begin
      qrRel.SQL.Add('AND                                     ');
      qrRel.SQL.Add('  ITEM.CODBARRA=:CODBARRA               ');
      qrRel.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodProduto.text);
    end;
    if (edtData1.date > 0) and (edtData2.date > 0) then
    begin
      qrRel.SQL.Add('AND                                   ');
      qrRel.SQL.Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2');
      qrRel.ParamByName('DATA1').AsDateTime := (edtData1.date);
      qrRel.ParamByName('DATA2').AsDateTime := (edtData2.date);
    end;
    qrRel.SQL.Add('GROUP BY                                          ');
    qrRel.SQL.Add('  ITEM.CODBARRA, ITEM.DESCRICAO                   ');
    qrRel.SQL.Add('ORDER BY                                          ');
    qrRel.SQL.Add('  ITEM.CODBARRA                                   ');
    qrRel.Open;
    qrRel.First;
  end;
  with qrFat, qrFat.SQL do
  begin
    qrFat.Database := frmPrincipal.dba;
    qrFat.Close;
    qrFat.SQL.Clear;
    qrFat.SQL.Add('SELECT                            ');
    qrFat.SQL.Add('  SUM(ITEMSAIDA.TOTAL) AS FAT     ');
    qrFat.SQL.Add('FROM                              ');
    qrFat.SQL.Add('  ITEMSAIDA,                      ');
    qrFat.SQL.Add('  SAIDA                           ');
    qrFat.SQL.Add('WHERE                             ');
    qrFat.SQL.Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA ');
    if (edtData1.date > 0) and (edtData2.date > 0) then
    begin
      qrFat.SQL.Add('AND                                    ');
      qrFat.SQL.Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2 ');
      qrFat.ParamByName('DATA1').AsDateTime:= (edtData1.Date);
      qrFat.ParamByName('DATA2').AsDateTime:= (edtData2.Date);
    end;
    qrFat.Open;
  end;
  While Not qrRel.EOF do
  begin
    with qrExec, qrExec.SQL do
    begin
      qrExec.SQL.Clear;
      qrExec.Database := frmPrincipal.dba;
      qrExec.SQL.Add('INSERT INTO FAT_ITEM        ( ');
      qrExec.SQL.Add('  ITEM,                       ');
      qrExec.SQL.Add('  DESC_ITEM,                  ');
      qrExec.SQL.Add('  FAT_ITEM,                   ');
      qrExec.SQL.Add('  FATURAMENTO,                ');
      qrExec.SQL.Add('  QTDE                        ');
      qrExec.SQL.Add(') VALUES (                    ');
      qrExec.SQL.Add('  :ITEM,                      ');
      qrExec.SQL.Add('  :DESC_ITEM,                 ');
      qrExec.SQL.Add('  :FAT_ITEM,                  ');
      qrExec.SQL.Add('  :FATURAMENTO,               ');
      qrExec.SQL.Add('  :QTDE                       ');
      qrExec.SQL.Add(')                             ');
      qrExec.ParamByName('ITEM'       ).AsString  := qrRel.FieldByName('CODBARRA'   ).AsString;
      qrExec.ParamByName('DESC_ITEM'  ).AsString  := qrRel.FieldByName('DESCRICAO'  ).AsString;
      qrExec.ParamByName('FAT_ITEM'   ).AsFloat   := qrRel.FieldByName('TOTAL'      ).AsFloat;
      qrExec.ParamByName('FATURAMENTO').AsFloat   := qrFat.FieldByName('FAT'        ).AsFloat;
      qrExec.ParamByName('QTDE'       ).AsInteger := qrRel.FieldByName('QTDE'       ).AsInteger;
      qrExec.ExecSQL;
    end;
    qrRel.Next;
  end;
  frmPrincipal.ibtransacao.Commit;
end;

procedure TfrmCurvaABCItemC.edtCodProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F1 then
   ConsultaItem
 else if Key = VK_Return then
   SelectNext(ActiveControl, True, True);
end;

procedure TfrmCurvaABCItemC.ConsultaItem;
begin
  edtCodBarra.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmCurvaABCItemC.edtDescChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmCurvaABCItemC.edtDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
//      SelectedIndex := 0;
      edtCodProduto.text := Fields[0].Text;
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;  
end;

procedure TfrmCurvaABCItemC.dbgItemCellClick(Column: TColumn);
begin
  edtCodProduto.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmCurvaABCItemC.dbgItemDblClick(Sender: TObject);
begin
  edtCodProduto.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmCurvaABCItemC.FechaConsultaItem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodProduto.setFocus;
  pItem.Visible := false;
end;

procedure TfrmCurvaABCItemC.edtCodProdutoChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'CODBARRA';
    if FindKey([FormataCodBarra(edtCodProduto.Text)]) then
      edtDescItem.Caption := FieldByname('DESCRICAO').AsString
    else
      edtDescItem.Caption := '';
  end;
end;

procedure TfrmCurvaABCItemC.dbgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and not (dsItem.DataSet.IsEmpty) then
  begin
    edtCodProduto.text := dbgItem.Fields[0].Text;
    FechaConsultaItem;
  end
  else if key = VK_ESCAPE then
  begin
    FechaConsultaItem;
  end
  else if key = VK_UP then
  begin
    if dsItem.DataSet.Bof then
      edtDesc.SetFocus;
  end;
end;

end.
