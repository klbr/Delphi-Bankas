unit Buscar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, TFlatButtonUnit, StdCtrls,
  TFlatSpeedButtonUnit, ExtCtrls, TFlatPanelUnit, Grids, DBGrids, RXDBCtrl,
  TFlatGroupBoxUnit, TFlatEditUnit, DB, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmBusca = class(TForm)
    FlatPanel1: TFlatPanel;
    Label1: TLabel;
    Label4: TLabel;
    btnFecha: TFlatSpeedButton;
    edtCodigo: TEdit;
    btnConsulta: TFlatButton;
    edtDescricao: TEdit;
    edtEdicao: TCurrencyEdit;
    Label2: TLabel;
    FlatPanel2: TFlatPanel;
    dbgProduto: TRxDBGrid;
    edtData: TDateEdit;
    Label3: TLabel;
    btnAltera: TFlatSpeedButton;
    FlatGroupBox1: TFlatGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtEntrada: TFlatEdit;
    edtDataEntrada: TFlatEdit;
    edtFornecedor: TFlatEdit;
    edtGrupo: TFlatEdit;
    dsEntrada: TDataSource;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel3: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel4: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    dsItem: TDataSource;
    qrAtualiza: TIBQuery;
    qrEntrada: TIBQuery;
    btnTodas: TFlatSpeedButton;
    edtDevTemp: TDateEdit;
    Label9: TLabel;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEdicaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure dsEntradaDataChange(Sender: TObject; Field: TField);
    procedure btnFechaClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtDataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemDblClick(Sender: TObject);
    procedure dbgItemCellClick(Column: TColumn);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTodasClick(Sender: TObject);
  private
    Procedure AtualizaGrid;
    procedure FechaConsultaitem;
    procedure ConsultaItem;
  public
    { Public declarations }
  end;

var
  frmBusca: TfrmBusca;
  Entrada, Edicao, Index : Integer;
  Barra : String;

implementation
uses Main,Principal;
{$R *.dfm}

procedure TfrmBusca.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    ConsultaItem
  else if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
      close;
end;

procedure TfrmBusca.edtEdicaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConsulta.Click;
end;

procedure TfrmBusca.FormShow(Sender: TObject);
begin
  edtCodigo.SetFocus;
  CarregaGrid(dbgProduto);
end;

procedure TfrmBusca.btnConsultaClick(Sender: TObject);
begin
  btnConsulta.Enabled :=false;
  with qrEntrada, qrEntrada.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT DISTINCT                             ');
    Add('  ITEMENTRADA.CODBARRA AS CODBARRA,         ');
    Add('  ITEM.DESCRICAO AS DESCRICAO,              ');
    Add('  ITEMENTRADA.EDICAO AS EDICAO,             ');
    Add('  LOCALIZACAO.DESCRICAO AS RUA,             ');
    Add('  ITEMENTRADA.VALORUNI AS VALORUNI,         ');
    Add('  ITEMENTRADA.DEVOLUCAO AS DEVOLUCAO,       ');
    Add('  ENTRADA.ENTRADA AS ENTRADA,               ');
    Add('  ENTRADA.DATA AS DATA,                     ');
    Add('  FORNECEDOR.DESCRICAO AS DESC_FORNECEDOR,  ');
    Add('  GRUPO.DESCRICAO AS DESC_GRUPO             ');
    Add('FROM                                        ');
    Add('  ENTRADA, ITEMENTRADA, LOCALIZACAO,        ');
    Add('  GRUPO, FORNECEDOR, ITEM                   ');
    Add('WHERE                                       ');
    Add('  ENTRADA.ENTRADA=ITEMENTRADA.ITEMENTRADA   ');
    Add('AND                                         ');
    Add('  ITEM.CODBARRA=ITEMENTRADA.CODBARRA        ');
    Add('AND                                         ');
    Add('  ITEM.GRUPO=GRUPO.GRUPO                    ');
    Add('AND                                         ');
    Add('  ENTRADA.FORNECEDOR=FORNECEDOR.FORNECEDOR  ');
    Add('AND                                         ');
    Add('  ITEMENTRADA.RUA=LOCALIZACAO.LOCALIZACAO   ');
    Add('AND                                         ');
    Add('  ITEMENTRADA.SITUACAO=''NÃO''              ');
    if edtDevTemp.Date <> 0 then
    begin
      Add(' AND ITEMENTRADA.DEVOLUCAO = :DATADEV     ');
      ParamByName('DATADEV').AsDateTime := edtDevTemp.Date
    end;
    if Trim(edtDescricao.text) <> '' then
    begin
      Add('AND                                         ');
      Add('  ITEM.DESCRICAO LIKE '+QuotedStr(edtDescricao.text+'%')+'  ');
    end;
    if Trim(edtCodigo.text) <> '' then
    begin
      Add('AND                                         ');
      Add('  ITEMENTRADA.CODBARRA=:CODBARRA            ');
    end;
    if edtEdicao.AsInteger > 0 then
    begin
      Add('AND                                         ');
      Add('  ITEMENTRADA.EDICAO=:EDICAO                ');
    end;
    if Trim(edtCodigo.text) <> '' then
      Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodigo.Text);
    if edtEdicao.AsInteger > 0 then
      Params.ParamByName('EDICAO').AsInteger := edtEdicao.AsInteger;
    Open;
    TNumericField( FieldByName('VALORUNI' )).DisplayFormat := '#,##0.00';
    TDateTimeField(FieldByName('DATA'     )).DisplayFormat := 'DD/MM/YY';
    TDateTimeField(FieldByName('DEVOLUCAO')).DisplayFormat := 'DD/MM/YY';
  end;
  btnConsulta.Enabled :=True;
end;

procedure TfrmBusca.AtualizaGrid;
begin
  qrEntrada.Database := frmPrincipal.dba;
  qrEntrada.close;
  qrEntrada.Open;
end;

procedure TfrmBusca.dsEntradaDataChange(Sender: TObject; Field: TField);
begin
  try
    with qrEntrada do
    begin
      Entrada := FieldByName('ENTRADA').AsInteger;
      Barra := FieldByName('CODBARRA').AsString;
      Edicao := FieldByName('EDICAO').AsInteger;
      edtEntrada.text := FieldByName('ENTRADA').AsString;
      edtDataEntrada.Text := FieldByName('DATA').AsString;
      edtFornecedor.Text := FieldByName('DESC_FORNECEDOR').AsString;
      edtGrupo.text := FieldByName('DESC_GRUPO').AsString;
      //edtData.Date := FieldByName('DEVOLUCAO').AsDateTime;
    end;
  except
    Exclusao2('Busca sem Resultados','Aviso');
  end;
end;

procedure TfrmBusca.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBusca.btnAlteraClick(Sender: TObject);
begin
  with qrAtualiza, qrAtualiza.SQL do
  begin
    Clear;
    Add('UPDATE ITEMENTRADA SET   ');
    Add('  DEVOLUCAO=:DEVOLUCAO   ');
    Add('WHERE                    ');
    Add('  CODBARRA=:CODBARRA     ');
    Add('AND                      ');
    Add('  ITEMENTRADA=:ENTRADA   ');
    Add('AND                      ');
    Add('  EDICAO=:EDICAO         ');
    Params.ParamByName('DEVOLUCAO').AsDateTime  := (edtData.Date);
    Params.ParamByName('CODBARRA' ).AsString  := barra;
    Params.ParamByName('ENTRADA'  ).AsInteger := Entrada;
    Params.ParamByName('EDICAO'   ).AsInteger := edicao;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    Exclusao2('Atualização realizada com sucesso','Alteração da Devolução');
  end;
  AtualizaGrid;
  edtCodigo.SetFocus;
end;

procedure TfrmBusca.edtCodigoExit(Sender: TObject);
begin
  if trim(edtCodigo.text) <> '' then
    edtDescricao.text := LerCodBarraEntrada(FormataCodBarra(edtCodigo.text));
end;

procedure TfrmBusca.edtDataKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnAltera.Click;
end;

procedure TfrmBusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgProduto);
end;

procedure TfrmBusca.edtDescChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmBusca.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
//      SelectedIndex := 0;
      edtCodigo.text := Fields[0].Text;
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;
end;

procedure TfrmBusca.dbgItemDblClick(Sender: TObject);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmBusca.dbgItemCellClick(Column: TColumn);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmBusca.FechaConsultaitem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodigo.setFocus;
  pItem.Visible := false;
end;

procedure TfrmBusca.ConsultaItem;
begin
  edtCodigo.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmBusca.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_Return then
    SelectNext(ActiveControl, true, true)
  else if (shift = [ssCtrl]) and (key = vk_F4) then
    Close
  else if key = VK_Escape then
    edtData.SetFocus;
end;

procedure TfrmBusca.FormCreate(Sender: TObject);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Database := frmPrincipal.dba;
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
//    else if (Components[x] is TDataBase) then
  //    TDataBase(Components[x]).Database := frmPrincipal.dba;
  end;
end;

procedure TfrmBusca.dbgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and not (dsItem.DataSet.IsEmpty) then
  begin
    edtCodigo.text := dbgItem.Fields[0].Text;
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

procedure TfrmBusca.btnTodasClick(Sender: TObject);
begin
  if not Exclusao('Deseja Iniciar o processo?','Devolução dos Produtos') then
    Exit;
  with qrEntrada do
  begin
    First;
    while not Eof do
    begin
      qrAtualiza.SQL.Clear;
      qrAtualiza.SQL.Add('UPDATE ITEMENTRADA SET   ');
      qrAtualiza.SQL.Add('  DEVOLUCAO=:DEVOLUCAO   ');
      qrAtualiza.SQL.Add('WHERE                    ');
      qrAtualiza.SQL.Add('  CODBARRA=:CODBARRA     ');
      qrAtualiza.SQL.Add('AND                      ');
      qrAtualiza.SQL.Add('  ITEMENTRADA=:ENTRADA   ');
      qrAtualiza.SQL.Add('AND                      ');
      qrAtualiza.SQL.Add('  EDICAO=:EDICAO         ');
      qrAtualiza.Params.ParamByName('DEVOLUCAO').AsDateTime:= edtData.Date;
      qrAtualiza.Params.ParamByName('CODBARRA' ).AsString  := barra;
      qrAtualiza.Params.ParamByName('ENTRADA'  ).AsInteger := Entrada;
      qrAtualiza.Params.ParamByName('EDICAO'   ).AsInteger := edicao;
      qrAtualiza.ExecSQL;
      frmPrincipal.ibtransacao.Commit;      
      Next;
      Application.ProcessMessages;
    end;
  end;
  Exclusao2('Atualização realizada com sucesso','Alteração da Devolução');
  AtualizaGrid;
  edtCodigo.SetFocus;
end;

end.
