unit Historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, Mask, ToolEdit, StdCtrls, ExtCtrls, TFlatPanelUnit,
  Grids, DBGrids, RXDBCtrl, DB, TFlatGroupBoxUnit, TFlatSpeedButtonUnit,
  TFlatProgressBarUnit, TFlatEditUnit, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmHistorico = class(TForm)
    p1: TFlatPanel;
    FlatPanel1: TFlatPanel;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtData1: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtData2: TDateEdit;
    btnConsulta: TFlatButton;
    FlatGroupBox1: TFlatGroupBox;
    FlatGroupBox2: TFlatGroupBox;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
    dbgEntrada: TRxDBGrid;
    dbgSaida: TRxDBGrid;
    edtDescricao: TEdit;
    Label4: TLabel;
    FlatPanel2: TFlatPanel;
    btnFecha: TFlatSpeedButton;
    Label7: TLabel;
    lblEstoque: TLabel;
    Label8: TLabel;
    lblVendida: TLabel;
    Label5: TLabel;
    lblEntrada: TLabel;
    pbEnt: TFlatProgressBar;
    pbsai: TFlatProgressBar;
    Label6: TLabel;
    edtEdicao: TEdit;
    dsItem: TDataSource;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel3: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel4: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    Label9: TLabel;
    lDevol: TLabel;
    btnVisualizar: TFlatButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    qrEntrada: TIBQuery;
    qrSaida: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure dbgEntradaDblClick(Sender: TObject);
    procedure dbgSaidaDblClick(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pItemExit(Sender: TObject);
    procedure dbgItemCellClick(Column: TColumn);
    procedure dbgItemDblClick(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrSaidaAfterOpen(DataSet: TDataSet);
    procedure qrEntradaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEntradaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgSaidaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnVisualizarClick(Sender: TObject);
  private
    Function Valida:Boolean;
    procedure ConsultaItem;
    procedure FechaConsultaitem;
  public
    { Public declarations }
  end;

implementation
uses Principal, Main, Entrada, Saida, HistoricoR;
{$R *.dfm}

procedure TfrmHistorico.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgEntrada);
  CarregaGrid(dbgSaida);
  edtCodigo.SetFocus;
end;

procedure TfrmHistorico.btnConsultaClick(Sender: TObject);
var
  sai, ent, dev: Integer;
begin
  PbSai.Position := 1;
  pbEnt.Position := 1;
  sai := 0;
  ent := 0;
  dev := 0;
  if not Valida then
    Exit;

  btnConsulta.Enabled := false;
  with qrEntrada,qrEntrada.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                           ');
    Add('  ITEMENTRADA.*, ITEM.DESCRICAO,                 ');
    Add('  ENTRADA.HORA,                                  ');
    Add('  ENTRADA.DATA                                   ');
    Add('FROM ITEMENTRADA, ITEM, ENTRADA                  ');
    Add('WHERE                                            ');
    Add('  ENTRADA.ENTRADA=ITEMENTRADA.ITEMENTRADA        ');
    Add('AND                                              ');
    Add('  ITEMENTRADA.CODBARRA=ITEM.CODBARRA             ');
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      Add('AND                                              ');
      Add('  ENTRADA.DATA BETWEEN :DATA1 AND :DATA2         ');
    end;
    if Trim(edtCodigo.text) <> '' then
    begin
      Add('AND                                            ');
      Add(' ITEMENTRADA.CODBARRA=:CODBARRA                ');
    end;
    if (Trim(edtEdicao.text) <> '') and (StrtoIntDef(edtEdicao.text, 0) > 0 ) then
    begin
      Add('AND                                            ');
      Add(' ITEMENTRADA.EDICAO=:EDICAO                    ');
    end;
    if Trim(edtDescricao.text) <> '' then
    begin
      Add('AND                                            ');
      Add('  ITEM.DESCRICAO LIKE '+QuotedStr(edtDescricao.text+'%') );
    end;
    if Trim(edtCodigo.text) <> '' then
    begin
      Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodigo.text);
    end;
    if (Trim(edtEdicao.text) <> '') and (StrtoIntDef(edtEdicao.text, 0) > 0 ) then
    begin
      Params.ParamByName('EDICAO').AsInteger := StrToIntdef(edtEdicao.text, 0);
    end;
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := (edtData1.Date);
      Params.ParamByName('DATA2').AsDateTime := (edtData2.Date);
    end;
    Open;
    pbEnt.Max := RecordCount+1;
    First;
    While Not Eof do
    begin
      Dev := Dev + FieldByName('DEVOLVIDO' ).AsInteger;
      ent := ent + FieldByName('QUANTIDADE').AsInteger;
      Next;
      pbEnt.Position := pbEnt.Position+1;
    end;
    First;
  end;
  with qrSaida,qrSaida.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                           ');
    Add('  ITEMSAIDA.*, ITEM.DESCRICAO,                   ');
    Add('  SAIDA.HORA,                                    ');
    Add('  SAIDA.DATA                                     ');
    Add(' FROM ITEMSAIDA, SAIDA, ITEM                     ');
    Add('WHERE                                            ');
    Add('  SAIDA.SAIDA = ITEMSAIDA.ITEMSAIDA              ');
    Add('  AND                                            ');
    Add('  ITEMSAIDA.CODBARRA=ITEM.CODBARRA               ');
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      Add('  AND                                            ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2           ');
    end;
    if Trim(edtCodigo.text) <> '' then
    begin
      Add(' AND                                           ');
      Add(' ITEMSAIDA.CODBARRA=:CODBARRA                  ');
    end;
    if (Trim(edtEdicao.text) <> '') and (StrtoIntDef(edtEdicao.text, 0) > 0 ) then
    begin
      Add(' AND                                           ');
      Add(' ITEMSAIDA.EDICAO=:EDICAO                      ');
    end;
    if Trim(edtDescricao.text) <> '' then
    begin
      Add('  AND                                            ');
      Add('  ITEM.DESCRICAO LIKE '+QuotedStr(edtDescricao.text+'%') );
    end;
    if Trim(edtCodigo.text) <> '' then
    begin
      Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodigo.text);
    end;
    if (Trim(edtEdicao.text) <> '') and (StrtoIntDef(edtEdicao.text, 0) > 0 ) then
    begin
      Params.ParamByName('EDICAO').AsInteger := StrToIntdef(edtEdicao.text, 0);
    end;
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      Params.ParamByName('DATA1').AsDateTime := (edtData1.Date);
      Params.ParamByName('DATA2').AsDateTime := (edtData2.Date);
    end;
    Open;
    pbSai.Max := RecordCount+1;
    First;
    While Not Eof do
    begin
      sai := sai + FieldByName('QUANTIDADE').AsInteger;
      Next;
      pbSai.Position := pbSai.Position+1;
    end;
    First;
  end;
  lblEstoque.Caption := IntToStr(EstoqueAtualsemEdicao(FormataCodBarra(edtCodigo.text)));
  lDevol.Caption     := FormatFloat(#0,dev);
  lblVendida.Caption := FormatFloat('#,##0',sai);
  lblEntrada.Caption := FormatFloat('#,##0',ent);
  edtCodigo.SetFocus;
  btnConsulta.Enabled := true;
end;

procedure TfrmHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(dbgEntrada);
  SalvaGrid(dbgSaida);
  loHistorico := nil;
  Action := caFree;
end;

function TfrmHistorico.Valida: Boolean;
begin
  Result := false;
  if (Trim(edtCodigo.text) = '') and (Trim(edtDescricao.text) = '') then
  begin
     Exclusao2('Digite um dos Campos','Aviso');
     edtCodigo.setFocus;
     exit;
  end;
  if (edtData1.Date < edtData2.date) and ((edtData1.date <= 0) or (edtData2.date <= 0)) then
  begin
    Exclusao2('Digite datas válidas','Aviso');
    edtData1.SetFocus;
    exit;
  end;
  Result := True;
end;

procedure TfrmHistorico.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConsulta.Click;
end;

procedure TfrmHistorico.edtCodigoExit(Sender: TObject);
begin
  if trim(edtCodigo.text) <> '' then
    edtDescricao.text := LerCodBarra(FormataCodBarra(edtCodigo.text));
end;

procedure TfrmHistorico.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistorico.dbgEntradaDblClick(Sender: TObject);
begin
  if not frmPrincipal.btnEntrada.Enabled then
    exit;
  if dbgEntrada.Fields[0].AsString <> '' then
  begin
    if loEntrada = nil then
      loEntrada := TfrmEntrada.Create(Application);
    loEntrada.Show;
    loEntrada.AbreEntrada(dbgEntrada.Fields[0].AsInteger);
  end;
end;

procedure TfrmHistorico.dbgSaidaDblClick(Sender: TObject);
begin
  if not frmPrincipal.btnSaida.Enabled then
    Exit;
  if dbgSaida.Fields[0].AsString <> '' then
  begin
    if loSaida = nil then
      loSaida := TfrmSaida.Create(Application);
    loSaida.Show;
    loSaida.AbreSaida(dbgSaida.Fields[0].AsInteger);
  end;
end;

procedure TfrmHistorico.edtDescChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmHistorico.edtDescKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmHistorico.pItemExit(Sender: TObject);
begin
  FechaConsultaItem;
end;

procedure TfrmHistorico.dbgItemCellClick(Column: TColumn);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmHistorico.dbgItemDblClick(Sender: TObject);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmHistorico.ConsultaItem;
begin
  edtCodigo.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmHistorico.FechaConsultaitem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodigo.setFocus;
  pItem.Visible := false;
end;

procedure TfrmHistorico.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
      close;
end;

procedure TfrmHistorico.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    ConsultaItem
  else if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
      close;
end;

procedure TfrmHistorico.qrSaidaAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('HORA'    )).DisplayFormat := 'HH:MM';
  TNumericField( DataSet.FieldByName('VALORUNI')).DisplayFormat := '#,##0.00';
  TNumericField( DataSet.FieldByName('TOTAL'   )).DisplayFormat := '#,##0.00';
end;

procedure TfrmHistorico.qrEntradaAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('HORA'    )).DisplayFormat := 'HH:MM';
  TNumericField( DataSet.FieldByName('VALORUNI')).DisplayFormat := '#,##0.00';
  TNumericField( DataSet.FieldByName('TOTAL'   )).DisplayFormat := '#,##0.00';
end;

procedure TfrmHistorico.FormCreate(Sender: TObject);
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

procedure TfrmHistorico.dbgItemKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmHistorico.dbgEntradaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column <> nil then
    if Column.Field <> nil then
      if Column.Field.DataType in [ftDate, ftDateTime] then
        if Column.Field.AsDateTime = 0 then
          TDBGrid(Sender).Canvas.TextRect(Rect, 0, 0, '');
end;

procedure TfrmHistorico.dbgSaidaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column <> nil then
    if Column.Field <> nil then
      if Column.Field.DataType in [ftDate, ftDateTime] then
        if Column.Field.AsDateTime = 0 then
          TDBGrid(Sender).Canvas.TextRect(Rect, 0, 0, '');
end;

procedure TfrmHistorico.btnVisualizarClick(Sender: TObject);
begin
  if not(qrEntrada.Active) or not(qrSaida.Active) then
  begin
    Exclusao2('Não é possível gerar relatório. Realize uma consulta de algum produto!','Aviso');
    Exit;
  end;
  TFlatButton(Sender).Enabled :=false;
  try
    with TfrmHistoricoR.Create(Application) do
    begin
      Data1 := edtData1.Date;
      Data2 := edtData2.Date;
      QueryEnt := qrEntrada;
      QuerySai := qrSaida;
      if rb1.Checked then
        Tipo := 1
      else if rb2.Checked then
        Tipo := 2
      else if rb3.Checked then
        Tipo := 3;
      Estoque := StrtoIntDef(lblEstoque.Caption,0);
      Entrada := StrtoIntDef(lblEntrada.Caption,0);
      Devolvida := StrtoIntDef(lDevol.Caption,0);
      Saida  := StrtoIntDef(lblVendida.Caption,0);
      PreviewModal;
      Free;
    end;
  finally
    TFlatButton(Sender).Enabled := true;
  end;
end;

end.
