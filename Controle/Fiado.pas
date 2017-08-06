unit Fiado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TFlatSpeedButtonUnit, ExtCtrls, TFlatPanelUnit, Grids,
  DBGrids, RXDBCtrl, StdCtrls, DB, TFlatGroupBoxUnit, CurrEdit,
  Mask, ToolEdit, TFlatRadioButtonUnit, TFlatEditUnit, TFlatButtonUnit,
  DBTables;

type
  TfrmComprasFiado = class(TForm)
    pHead: TFlatPanel;
    FlatSpeedButton1: TFlatSpeedButton;
    Status: TStatusBar;
    pBody: TFlatPanel;
    pgrid: TFlatPanel;
    dbgPrazo: TRxDBGrid;
    dsParcela: TDataSource;
    dsSubParcela: TDataSource;
    Label1: TLabel;
    edtParcela: TEdit;
    edtCliente: TEdit;
    Label4: TLabel;
    btnLast: TFlatSpeedButton;
    btnNext: TFlatSpeedButton;
    btnPrior: TFlatSpeedButton;
    btnFirst: TFlatSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    gbSubP: TFlatGroupBox;
    FlatPanel1: TFlatPanel;
    dbgSubParcela: TRxDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    edtPagamento: TDateEdit;
    edtValorS: TCurrencyEdit;
    btnSalva: TFlatSpeedButton;
    edtEmissao: TDateEdit;
    edtVencimento: TDateEdit;
    edtValor: TCurrencyEdit;
    btnAlterar: TFlatSpeedButton;
    Label8: TLabel;
    edtStatus: TEdit;
    rbTodas: TFlatRadioButton;
    rbNPagas: TFlatRadioButton;
    rbPagas: TFlatRadioButton;
    edtHistorico: TEdit;
    Label11: TLabel;
    btnInclui: TFlatSpeedButton;
    btnExclui: TFlatSpeedButton;
    l1: TLabel;
    edtGeral: TCurrencyEdit;
    btnBaixa: TFlatSpeedButton;
    pc: TFlatPanel;
    FlatPanel3: TFlatPanel;
    Label2: TLabel;
    Label3: TLabel;
    FlatSpeedButton2: TFlatSpeedButton;
    edtSaida: TFlatEdit;
    edtNomeCliente: TFlatEdit;
    FlatButton1: TFlatButton;
    FlatSpeedButton3: TFlatSpeedButton;
    qrParcela: TQuery;
    qrSubParcela: TQuery;
    qrOperacao: TQuery;
    procedure FormShow(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure dsParcelaDataChange(Sender: TObject; Field: TField);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsSubParcelaDataChange(Sender: TObject; Field: TField);
    procedure rbTodasClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure edtValorSKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSubParcelaCellClick(Column: TColumn);
    procedure dbgSubParcelaDblClick(Sender: TObject);
    procedure edtSaidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure dbgPrazoDblClick(Sender: TObject);
  private
    Procedure AbrirConsulta;
    procedure Consulta;
    procedure FechaConsulta;
    procedure Mudar;
    procedure Parcelas;
    procedure AtualizaParcela;
    Function  ValidaParcela:Boolean;
    Procedure ReCalcula;
  public
    { Public declarations }
  end;

var
  OP  : Char;
  ID  : Integer;

implementation
uses Main, Principal, Saida;
{$R *.dfm}

procedure TfrmComprasFiado.FormShow(Sender: TObject);
begin
  Tag := 0;
  Parcelas;
  qrParcela.FilterOptions := [foCaseInsensitive];
  CarregaGrid(dbgPrazo);
  CarregaGrid(dbgSubParcela);
end;

{procedure TfrmComprasFiado.Navegacao;
begin
  if qrParcela.RecordCount = 0 then
  begin
    btnFirst.Enabled := false;
    btnPrior.Enabled := false;
    btnNext.Enabled := false;
    btnLast.Enabled := false;
  end
  else
  begin
    if qrParcela.RecordCount =1 then
    begin
      btnFirst.Enabled := false;
      btnPrior.Enabled := false;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrParcela.RecNo = qrParcela.RecordCount then
    begin
      btnFirst.Enabled := True;
      btnPrior.Enabled := True;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrParcela.RecNo = 1 then
    begin
      btnFirst.Enabled := False;
      btnPrior.Enabled := False;
      btnNext.Enabled := true;
      btnLast.Enabled := true;
    end
    else
    begin
      btnFirst.Enabled := true;
      btnPrior.Enabled := true;
      btnNext.Enabled := true;
      btnLast.Enabled := true;
    end;
  end;
end;}

procedure TfrmComprasFiado.btnFirstClick(Sender: TObject);
begin
  qrParcela.First;
end;

procedure TfrmComprasFiado.btnPriorClick(Sender: TObject);
begin
  qrParcela.Prior;
end;

procedure TfrmComprasFiado.btnNextClick(Sender: TObject);
begin
  qrParcela.Next;
end;

procedure TfrmComprasFiado.btnLastClick(Sender: TObject);
begin
  qrParcela.Last;
end;

procedure TfrmComprasFiado.dsParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  Tag := 0;
  //Navegacao;
  edtParcela.Text := qrParcela.FieldByName('FIADO').AsString;

  if qrParcela.FieldByName('PAGO').AsString = 'N' then
  begin
    edtStatus.text := 'FIADO NÃO QUITADO';
    btnBaixa.Enabled := true;
    gbSubP.Enabled := TRue;
  end
  else if qrParcela.FieldByName('PAGO').AsString = 'S' then
  begin
    edtStatus.text := 'FIADO QUITADO';
    btnBaixa.Enabled := false;
    gbSubP.Enabled := false;
  end
  else
    edtStatus.text := '';

  edtHistorico.Text := qrParcela.FieldByName('DESCRICAOF').AsString;
  edtCliente.Text := qrParcela.FieldByName('DESC_CLIENTE').AsString;
  edtEmissao.Date := qrParcela.FieldByName('DATA').AsDateTime;
  edtVencimento.Date := qrParcela.FieldByName('VENCIMENTO').AsDateTime;
  edtValor.Text := qrParcela.FieldByName('VALOR').AsString;
  edtParcela.SetFocus;

  edtPagamento.Enabled := false;
  edtValorS.Enabled := false;
  btnExclui.Enabled :=false;
  btnSalva.Enabled := false;
  btnInclui.Enabled := true;
  try
    with qrSubParcela, qrSubParcela.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM FIADOPARCELA WHERE FIADO=:FIADO  ');
      Params.ParamByName('FIADO').AsInteger := qrParcela.FieldByName('FIADO').Asinteger;
      Open;
    end;
  except
      id := 0;
  end;
end;

procedure TfrmComprasFiado.FlatSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmComprasFiado.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  SalvaGrid(dbgPrazo);
  SalvaGrid(dbgSubParcela);
  loComprasFiado :=nil;
  Action := caFree;
end;

procedure TfrmComprasFiado.dsSubParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  Mudar;
end;

procedure TfrmComprasFiado.rbTodasClick(Sender: TObject);
begin
  Parcelas;
end;

procedure TfrmComprasFiado.btnSalvaClick(Sender: TObject);
begin
  if not ValidaParcela then
    Exit;
  if Op = 'I' then
  begin
    with qrOperacao,qrOperacao.SQL do
    begin
      Clear;
      Add('INSERT INTO FIADOPARCELA (  ');
      Add(' ID,                        ');
      Add(' CAIXA,                     ');
      Add(' FIADO,                     ');
      Add(' PAGAMENTO,                 ');
      Add(' VALOR                      ');
      Add(' ) VALUES (                 ');
      Add(' :ID,                       ');
      Add(' :CAIXA,                    ');
      Add(' :FIADO,                    ');
      Add(' :PAGAMENTO,                ');
      Add(' :VALOR    )                ');
      Params.ParamByName('FIADO'    ).AsInteger := StrToint(edtParcela.text);
      Params.ParamByName('ID'       ).AsInteger := ID;
      Params.ParamByName('CAIXA'    ).AsInteger := Caixa;
      Params.ParamByName('PAGAMENTO').AsDateTime:= edtPagamento.Date;
      Params.ParamByName('VALOR'    ).AsFloat := edtValorS.Value;
      ExecSQL;
      GeraMovimentacao(edtPagamento.date, ('Pagamento de Fiado - Parcela: '+inttostr(ID)),'CRÉDITO',edtValorS.Value,3,strtoint(edtParcela.text),'I');
      Descreditar(0,);
    end;
  end
  else if (OP = 'A') and (caixa = caixaatual2('FIADOPARCELA',edtParcela.text)) then
  begin
    with qrOperacao,qrOperacao.SQL do
    begin
      Clear;
      Add('UPDATE FIADOPARCELA SET     ');
      Add(' PAGAMENTO=:PAGAMENTO,      ');
      Add(' VALOR=:VALOR               ');
      Add(' WHERE                      ');
      Add(' ID=:ID                     ');
      Add(' AND                        ');
      Add(' FIADO=:FIADO               ');
      Add(' AND                        ');
      Add(' CAIXA=:CAIXA               ');
      Params.ParamByName('ID'       ).AsInteger := ID;
      Params.ParamByName('FIADO'    ).AsInteger := StrToint(edtParcela.text);
      Params.ParamByName('PAGAMENTO').AsDateTime:= edtPagamento.Date;
      Params.ParamByName('CAIXA'    ).AsInteger := Caixa;
      Params.ParamByName('VALOR'    ).AsFloat := edtValorS.Value;
      ExecSQL;
      GeraMovimentacao(edtPagamento.date, ('Pagamento de Fiado - Parcela: '+inttostr(ID)),'CRÉDITO',edtValorS.Value,3,strtoint(edtParcela.text),'A');
    end;
  end
  else
    Exclusao2('Não é possivel atualizar uma parcela paga em um caixa anterior','Aviso');

  btnAlterar.Enabled := false;
  btnInclui.Enabled := true;
  btnExclui.Enabled := false;
  edtPagamento.Text := '';
  edtValorS.Text := '';
  AtualizaParcela;
  Tag := 1;
  Recalcula;
  btnInclui.Click;
end;

procedure TfrmComprasFiado.btnIncluiClick(Sender: TObject);
begin
  op := 'I';
  edtValorS.Value := 0;
  edtPagamento.Clear;
  edtValorS.Enabled := true;
  edtPagamento.Enabled := true;
  edtPagamento.Date := Date;
  edtValorS.SetFocus;
  btnExclui.Enabled := False;
  btnAlterar.Enabled := False;
  btnInclui.Enabled := False;
  btnsalva.Enabled := true;
  with qrOperacao, qrOperacao.SQL do
  begin
    Clear;
    Add('SELECT MAX(ID) AS MAXI FROM FIADOPARCELA WHERE FIADO=:FIADO  ');
    Params.ParamByName('FIADO').AsInteger := qrParcela.FieldByName('FIADO').AsInteger;
    Open;
    try
      ID := FieldByName('MAXI').AsInteger + 1;
    except
      ID := 1;
    end;
    Close;
  end;
end;

procedure TfrmComprasFiado.btnAlterarClick(Sender: TObject);
begin
  btnExclui.Enabled := false;
  btnAlterar.Enabled := false;
  btnInclui.Enabled := false;
  btnsalva.Enabled := true;
  op := 'A';
  edtValorS.Enabled := true;
  edtPagamento.Enabled := true;
  edtValorS.SetFocus;
end;

procedure TfrmComprasFiado.btnExcluiClick(Sender: TObject);
begin
  if id = 0 then
  begin
    Exclusao2('É necessário primeiro selecionar uma parcela','Aviso');
    Exit;
  end;
  if caixa = CaixaAtual2('FIADOPARCELA', edtParcela.text) then
  begin
    with qrOperacao, qrOperacao.SQL do
    begin
      Clear;
      Add('DELETE FROM FIADOPARCELA WHERE ID=:ID AND FIADO=:FIADO ');
      Params.ParamByName('ID').AsInteger := ID;
      Params.ParamByName('FIADO').AsInteger := StrToInt(edtParcela.text);
      ExecSQL;
      Clear;
      Add('DELETE FROM MOVIMENTO WHERE CODIGO=:CODIGO AND TIPO=''CRÉDITO'' AND DESCRICAO=:DESCRICAO  ');
      Params.ParamByName('CODIGO').AsInteger := StrToInt(edtParcela.text);
      Params.ParamByName('DESCRICAO').AsString := ('Pagamento de Fiado - Parcela: '+inttostr(ID));      
      ExecSQL;
      edtValorS.Value := 0;
      edtPagamento.Clear;
    end;
  end
  else
    Exclusao2('Não é possível apagar uma parcela paga em caixa anterior','Aviso');

  AtualizaParcela;
end;

procedure TfrmComprasFiado.AtualizaParcela;
begin
  qrSubparcela.Close;
  qrSubParcela.Open;
end;

function TfrmComprasFiado.ValidaParcela: Boolean;
begin
  Result := false;
  if edtPagamento.Date < edtEmissao.Date then
  begin
    Exclusao2('A data do Pagamento não pode ser anterior a data de emissão','Aviso');
    Exit;
  end;
  if edtValorS.Value <= 0 then
  begin
    Exclusao2('Digite um Valor maior que "0" (Zero)','Aviso');
    Exit;
  end;
  Result := true;
end;

procedure TfrmComprasFiado.ReCalcula;
var
  Val, Valor : Double;
begin
  val := 0;
  Valor := edtValor.Value;
  with qrOperacao, qrOperacao.SQL do
  begin
    Clear;
    Add('SELECT VALOR FROM FIADOPARCELA WHERE FIADO=:FIADO ');
    Params.ParamByName('FIADO').AsInteger := StrToInt(edtParcela.text);
    Open;
    First;
    while Not Eof do
    begin
      val := val + FieldByName('VALOR').AsFloat;
      Next;
    end;
  end;

  if ( (Valor - val) = 0) and (edtStatus.text = 'FIADO NÃO QUITADO') then
  begin
    if tag = 1 then
    begin
      if Exclusao('Valor total foi pago, deseja quitar o fiado?','Confirmação de Quitação') then
        btnBaixa.Click;
    end;
    edtgeral.Value := 0;
    l1.Caption := '';
  end
  else if ((Valor - val) > 0) then
  begin
    edtGeral.value := (edtValor.Value - val);
    l1.Caption := 'Valor restante a Pagar:';
  end
  else
  begin
    edtGeral.value := (Valor - val) * -1;
    l1.Caption := 'Valor em Crédito:';
  end;
  Tag := 0;
end;

procedure TfrmComprasFiado.btnBaixaClick(Sender: TObject);
begin
  if Exclusao('Deseja realmente baixar esse fiado?','Confirmação') then
  begin
    with qrOperacao, qrOperacao.SQL do
    begin
      Close;
      Clear;
      Add('UPDATE FIADO SET      ');
      Add('  PAGO=''S''          ');
      Add('WHERE                 ');
      Add('  FIADO.FIADO=:FIADO  ');
      Params.ParamByName('FIADO').AsInteger := StrToInt(edtParcela.text);
      ExecSQL;
    end;
    qrParcela.Close;
    qrParcela.Open;
  end;
end;

procedure TfrmComprasFiado.Parcelas;
begin
  if rbPagas.Checked then
  begin
    with qrParcela, qrParcela.SQL do
    begin
      close;
      Clear;
      Add('SELECT                             ');
      Add('CLIENTE.DESCRICAO AS DESC_CLIENTE, ');
      Add('PAGO,                              ');
      Add('FIADO,                             ');
      Add('DATA,                              ');
      Add('VALOR,                             ');
      Add('VENCIMENTO,                        ');
      Add('FIADO.DESCRICAO  AS DESCRICAOF     ');
      Add('FROM                               ');
      Add('  CLIENTE,                         ');
      Add('  FIADO                            ');
      Add('WHERE                              ');
      Add('  CLIENTE.CLIENTE=FIADO.CLIENTE    ');
      Add('AND                                ');
      Add('  PAGO=''S''                       ');
      Add('ORDER BY                           ');
      Add('  FIADO                            ');
      open;
    end;
    //Navegacao;
  end
  else if rbNPagas.Checked then
  begin
    with qrParcela, qrParcela.SQL do
    begin
      close;
      Clear;
      Add('SELECT                             ');
      Add('CLIENTE.DESCRICAO AS DESC_CLIENTE, ');
      Add('PAGO,                              ');
      Add('FIADO,                             ');
      Add('DATA,                              ');
      Add('VALOR,                             ');
      Add('VENCIMENTO,                        ');
      Add('FIADO.DESCRICAO  AS DESCRICAOF     ');
      Add('FROM                               ');
      Add('  CLIENTE,                         ');
      Add('  FIADO                            ');
      Add('WHERE                              ');
      Add('  CLIENTE.CLIENTE=FIADO.CLIENTE    ');
      Add('AND                                ');
      Add('  PAGO=''N''                       ');
      Add('ORDER BY                           ');
      Add('  FIADO                            ');
      open;
    end;
    //Navegacao;
  end
  else if rbTodas.Checked then
  begin
    with qrParcela, qrParcela.SQL do
    begin
      close;
      Clear;
      Add('SELECT                             ');
      Add('CLIENTE.DESCRICAO AS DESC_CLIENTE, ');
      Add('PAGO,                              ');
      Add('FIADO,                             ');
      Add('DATA,                              ');
      Add('VALOR,                             ');
      Add('VENCIMENTO,                        ');
      Add('FIADO.DESCRICAO  AS DESCRICAOF     ');
      Add('FROM                               ');
      Add('  CLIENTE,                         ');
      Add('  FIADO                            ');
      Add('WHERE                              ');
      Add('  CLIENTE.CLIENTE=FIADO.CLIENTE    ');
      Add('ORDER BY                           ');
      Add('  FIADO                            ');
      open;
    end;
    //Navegacao;
  end;
end;

procedure TfrmComprasFiado.edtValorSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    if btnSalva.Enabled then
      btnSalva.Click;
end;

procedure TfrmComprasFiado.Mudar;
begin
  edtValorS.Enabled := false;
  edtPagamento.Enabled := false;
  with qrSubParcela,qrSubparcela.SQL do
  begin
    if not IsEmpty then
    begin
      btnExclui.Enabled := true;
      btnAlterar.Enabled := true;
      btnInclui.Enabled := true;
      btnSalva.Enabled := false;
      id := FieldByName('ID').AsInteger;
      edtValorS.Text := FieldByName('VALOR').AsString;
      edtPagamento.date := FieldByName('PAGAMENTO').AsDateTime;
      ReCalcula;
    end
    else
    begin
      btnExclui.Enabled := false;
      btnAlterar.Enabled := false;
      btnInclui.Enabled := true;
      btnSalva.Enabled := false;
    end;
  end;
end;

procedure TfrmComprasFiado.dbgSubParcelaCellClick(Column: TColumn);
begin
  Mudar;
end;

procedure TfrmComprasFiado.dbgSubParcelaDblClick(Sender: TObject);
begin
  Mudar;
end;

procedure TfrmComprasFiado.AbrirConsulta;
begin
  pGrid.Height := 305;
  edtSaida.Clear;
  edtNomeCliente.Clear;
  pc.Visible := True;
  edtSaida.SetFocus;
end;

procedure TfrmComprasFiado.Consulta;
begin
  with qrParcela do
  begin
    Filter := '';
    Filtered := False;
    if Trim(edtSaida.text) <> '' then
      Filter := 'DESCRICAOF = ''Venda de Mercadorias da Saida n: '+edtSaida.text+'%';
    if (Trim(edtSaida.text) <> '') and (Trim(edtNomeCliente.text)<>'') then
      Filter := Filter + ' AND ';
    if Trim(edtNomeCliente.text) <> '' then
      Filter := Filter + 'DESC_CLIENTE ='''+edtNomeCliente.text+'%';
    Filtered := True;
  end;
  edtSaida.SetFocus;
end;

procedure TfrmComprasFiado.FechaConsulta;
begin
  with qrParcela do
  begin
    Filter := '';
    Filtered := false;
  end;
  pc.Visible := false;
  pgrid.Height := 380;
end;

procedure TfrmComprasFiado.edtSaidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtNomeCliente.SetFocus
  else if key = VK_ESCAPE then
    FechaConsulta
  else if (Shift = [ssCtrl]) and ((key = 80) or (key = 112)) then
    Consulta;
end;

procedure TfrmComprasFiado.edtNomeClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtSaida.SetFocus
  else if key = VK_ESCAPE then
    FechaConsulta
  else if (Shift = [ssCtrl]) and ((key = 80) or (key = 112)) then
    Consulta;
end;

procedure TfrmComprasFiado.FlatSpeedButton2Click(Sender: TObject);
begin
  FechaConsulta;
end;

procedure TfrmComprasFiado.FlatButton1Click(Sender: TObject);
begin
  Consulta;
end;

procedure TfrmComprasFiado.FlatSpeedButton3Click(Sender: TObject);
begin
  AbrirConsulta;
end;

procedure TfrmComprasFiado.dbgPrazoDblClick(Sender: TObject);
begin
  if loSaida = nil then
    loSaida := TfrmSaida.Create(Application);
  loSaida.Show;

  loSaida.AbreSaida(StrToInt(copy(dbgPrazo.Fields[6].AsString,35,20)) );
end;

end.
