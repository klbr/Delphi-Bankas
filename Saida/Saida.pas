unit Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, Grids, DBGrids, RXDBCtrl, CurrEdit, StdCtrls,
  ToolEdit, Mask, DB, TFlatSpeedButtonUnit, ComCtrls, ExtCtrls,
  TFlatPanelUnit, TFlatEditUnit, TFlatCheckBoxUnit, TFlatMaskEditUnit,
  DBClient, Provider, DBTables, Menus, IBCustomDataSet, IBQuery;

type
  TfrmSaida = class(TfrmFormCadatroMini)
    btnImprimir: TFlatSpeedButton;
    Label6: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    edtDescFuncionario: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    edtDescFormaPagamento: TLabel;
    Label13: TLabel;
    edtCodigo: TEdit;
    edtCadastro: TDateEdit;
    edtFuncionario: TComboEdit;
    gbSaidaItem: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    btnApaga: TFlatSpeedButton;
    edtCodProduto: TEdit;
    edtDescricao: TEdit;
    edtPrecoUni: TCurrencyEdit;
    edtPrecoTotal: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    dbgProduto: TRxDBGrid;
    edtQtdeTotal: TCurrencyEdit;
    edtValorTotal: TCurrencyEdit;
    edtEdicao: TCurrencyEdit;
    edtFormapagamento: TComboEdit;
    edtValorQuitado: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    Label10: TLabel;
    dsProduto: TDataSource;
    dsConsulta: TDataSource;
    Label14: TLabel;
    edtCliente: TComboEdit;
    edtDescCLiente: TLabel;
    edtHora: TEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    cbConsulta: TComboBox;
    dbgConsulta2: TRxDBGrid;
    Label17: TLabel;
    edtTroco: TCurrencyEdit;
    Label19: TLabel;
    edtPago: TCurrencyEdit;
    pItem: TPanel;
    FlatPanel1: TFlatPanel;
    edtDesc: TFlatEdit;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel2: TFlatPanel;
    dbgItem: TRxDBGrid;
    dsItem: TDataSource;
    edtCodBarra: TFlatEdit;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    FlatSpeedButton3: TFlatSpeedButton;
    FlatSpeedButton4: TFlatSpeedButton;
    edtConsulta: TEdit;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    Panel2: TPanel;
    Label18: TLabel;
    edtFornecedor: TComboEdit;
    edtDescFornecedor: TLabel;
    pmImprimir: TPopupMenu;
    Video1: TMenuItem;
    Bobina1: TMenuItem;
    qrItem: TIBQuery;
    tbProduto: TIBQuery;
    qrProduto: TIBQuery;
    qrAtualiza: TIBQuery;
    procedure edtPrecoUniChange(Sender: TObject);
    procedure dbgProdutoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApagaClick(Sender: TObject);
    procedure edtCodProdutoEnter(Sender: TObject);
    procedure edtFuncionarioChange(Sender: TObject);
    procedure edtFormapagamentoChange(Sender: TObject);
    procedure edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2CellClick(Column: TColumn);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtEdicaoEnter(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtPrecoUniEnter(Sender: TObject);
    procedure edtPrecoTotalEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtPagoExit(Sender: TObject);
    procedure edtCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodBarraChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemCellClick(Column: TColumn);
    procedure pItemExit(Sender: TObject);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorQuitadoKeyPress(Sender: TObject; var Key: Char);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure FlatSpeedButton4Click(Sender: TObject);
    procedure edtFormapagamentoEnter(Sender: TObject);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoClick(Sender: TObject);
    procedure edtFuncionarioEnter(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure dbgItemDblClick(Sender: TObject);
    procedure edtValorTotalChange(Sender: TObject);
    procedure edtCodProdutoChange(Sender: TObject);
    procedure edtFuncionarioButtonClick(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtFormapagamentoButtonClick(Sender: TObject);
    procedure dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrNavegacaoAfterOpen(DataSet: TDataSet);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFornecedorButtonClick(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtEdicaoExit(Sender: TObject);
    procedure edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Video1Click(Sender: TObject);
    procedure Bobina1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    Operacao : Char;
//    Tipo : Char;
    Id : Integer;
    Nav : Integer;
    procedure AtivarCodBarraPreco;
    procedure AtivarEdicao;
    procedure AtivarFornecedor;
    function  ExisteItem:Boolean;
    function  ValidaItem:Boolean;
    procedure SalvaItem;
    procedure Recalcula;
    procedure PegaItem;
    procedure PegaItem2;
    procedure LimpaCampoItem;
    procedure AtualizaGrid;
    procedure ConfiguraGrid;
    procedure ConsultaItem;
    procedure FechaConsultaItem;
  protected
    function  Salva:boolean;
    function  Altera:boolean;
    procedure Exclui;
    function  ExisteRegistro: boolean;
    procedure SetRegistroNavegacao;
    procedure LimpaCampos;
    procedure FPrior;
    procedure FFirst;
    Procedure FNext;
    procedure FLast;
    function  validaAltera:boolean;
    function  validaSalva: boolean;
    procedure ChamarVencimento;
    procedure Edicao;
    procedure AtualizaNavegacao;
  public
    procedure AbreSaida(num :Integer);
  end;

var
  Venc : TdateTime;
  Permissao, Pegar : Boolean;
  Id2, qtde2 : integer;

implementation
uses Main, Principal, Vencimento, SaidaR, QuickRpt, Consulta;

{$R *.dfm}

procedure TfrmSaida.edtPrecoUniChange(Sender: TObject);
begin
  edtPrecoTotal.Value := edtQuantidade.Value * edtPrecoUni.Value;
end;

procedure TfrmSaida.Recalcula;
begin
  edtValorTotal.Value := 0;
  edtQtdeTotal.Value := 0;
  if edtCodigo.text = '' then
    Exit;

  with cdsProduto do
  begin
    First;
    while not Eof do
    begin
      edtValorTotal.Value := edtValorTotal.Value + FieldByName('TOTAL').AsFloat;
      edtQtdeTotal.Value := edtQtdeTotal.Value + FieldByName('QUANTIDADE').AsInteger;
      Next;
    end;
  end;
{  with qrProduto,qrProduto.SQL do
  begin
    Close;
    Clear;
    Add('SELECT TOTAL, QUANTIDADE FROM ITEMSAIDA WHERE ITEMSAIDA=:SAIDA ');
    Params.ParamByName('SAIDA').AsInteger := StrparaInt(edtCodigo.Text);
    Open;
    edtValorTotal.Value := 0;
    edtQtdeTotal.Value := 0;
    First;
    while not (qrProduto.Eof) do
    begin
      edtValorTotal.Value := edtValorTotal.Value + qrProduto.FieldByName('TOTAL').AsFloat;
      edtQtdeTotal.Value := edtQtdeTotal.Value + qrProduto.FieldByName('QUANTIDADE').AsInteger;
      qrProduto.Next;
    end;
  end;}
  if (Trim(edtFormaPagamento.text) <> '') and (edtFormaPagamento.text <> '0') then
    edtValorQuitado.Value := ( (edtValorTotal.Value * (1 -  edtDesconto.Value/100)) * (1 - (LerDescontoFormaPagamento(edtFormaPagamento.text)/100)) );
end;

procedure TfrmSaida.dbgProdutoCellClick(Column: TColumn);
begin
  PegaItem;
  edtCodProduto.SetFocus;
end;

procedure TfrmSaida.PegaItem;
begin
  with dbgProduto do
  begin
    edtCodProduto.Text := DataSource.DataSet.FieldByName('CODBARRA').AsString;
    edtDescricao.text := DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    edtEdicao.text := DataSource.DataSet.FieldByName('EDICAO').AsString;
    edtQuantidade.text := DataSource.DataSet.FieldByName('QUANTIDADE').AsString;
    edtprecoUni.text := DataSource.DataSet.FieldByName('VALORUNI').AsString;
    id2 := DataSource.DataSet.FieldByName('ID').AsInteger;
    qtde2 := DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
  end;
  Pegar := True;
end;

procedure TfrmSaida.PegaItem2;
begin
  with dbgProduto do
  begin
    SelectedIndex := 0;
    edtCodProduto.Text := DataSource.DataSet.FieldByName('CODBARRA').AsString;
    edtDescricao.text := DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    edtEdicao.text := DataSource.DataSet.FieldByName('EDICAO').AsString;
    edtQuantidade.text := DataSource.DataSet.FieldByName('QUANTIDADE').AsString;
    edtprecoUni.text := DataSource.DataSet.FieldByName('VALORUNI').AsString;
    id2 := DataSource.DataSet.FieldByName('ID').AsInteger;
    qtde2 := DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
  end;
end;

function TfrmSaida.validaSalva:boolean;
begin
  result := false;
  if trim(edtDescFuncionario.Caption) = '' then
  begin
    Exclusao2('Digite o Funcionário.','Aviso');
    edtFuncionario.setFocus;
    exit;
  end;
  if trim(edtDescCliente.Caption) = '' then
  begin
    Exclusao2('Digite o Cliente.','Aviso');
    edtCliente.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmSaida.Altera:boolean;
begin
  result := false;
  if not (validaAltera) then
    exit;

  with qrCadastro,qrCadastro.SQL do
  begin
    Clear;
    Add('UPDATE  SAIDA    SET               ');
    Add('  DATA=:DATA,                      ');
    Add('  HORA=:HORA,                      ');
    Add('  FUNCIONARIO=:FUNCIONARIO,        ');
    Add('  CLIENTE=:CLIENTE,                ');
    Add('  BAIXADO=:BAIXADO,                ');
    Add('  FORMAPAGAMENTO=:FORMAPAGAMENTO,  ');
    Add('  DESCONTO=:DESCONTO,              ');
    Add('  QUITACAO=:QUITACAO               ');
    Add('WHERE                              ');
    Add('  SAIDA=:SAIDA                     ');
    ParamByName('SAIDA'         ).asInteger := strtoint(edtCodigo.text);
    ParamByName('DATA'          ).AsDateTime := (edtCadastro.date);
    ParamByName('HORA'          ).asDateTime := (StrToTimeDef(edthora.text,0));
    ParamByName('FUNCIONARIO'   ).asInteger := strparaint(edtFuncionario.Text);
    ParamByName('CLIENTE'       ).asinteger := strparaint(edtCliente.text);
    ParamByName('BAIXADO'       ).asString  := 'N';
    ParamByName('FORMAPAGAMENTO').asInteger := strtointdef(edtFormaPagamento.text,1);
    ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
    ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    if (edtFormaPagamento.text<>'3') and (edtFormaPagamento.text<>'2') then
    begin
      //Apaga Fiado Qualquer
//      if (ExisteMovimentoFiado('Venda de Mercadorias da Saida nº: '+edtCodigo.text)) then
      ApagaFiado(edtCodigo.text);

      ApagaMovimento('Venda','CRÉDITO',StrToIntDef(edtFormapagamento.Text,0),StrToIntDef(edtCodigo.text, 0));
      GeraMovimentacao(edtCadastro.date, 'Venda','CRÉDITO',edtValorQuitado.Value,strparaint(edtFormaPagamento.text),strtointDef(edtCodigo.text,0));
    end
    else if edtFormaPagamento.text='3' then
    begin
      ChamarVencimento;
      //Apaga Movimento Qualquer
      //Cria o Fiado
      ApagaMovimento('Venda','CRÉDITO',1,StrToIntDef(edtCodigo.text, 0));
      ApagaFiado(edtCodigo.text);
      GeraParcelaFiado(edtCadastro.date,Venc ,edtValorQuitado.Value, Strtoint(SequencialUser('G_FIADO')),strtoint(edtCliente.text),StrToIntDef(edtCodigo.text,0));
      venc := Date;
    end;
    Creditar(StrToIntDef(edtCliente.text,0));
    result := true;
  end;
end;

procedure TfrmSaida.FormShow(Sender: TObject);
begin
  if not CaixaAberto then
  begin
    Exclusao2('Você pode apenas fazer venda com o caixa aberto.','Aviso');
    Close;
  end;
  CarregaGrid(dbgProduto);
  CarregaGrid(dbgConsulta2);
  CarregaGrid(dbgItem);
  CarregarCampodePesquisa(Self.Name, cbConsulta);
  Panel2.Visible := LerIniInteiro('VENDAS','MULTIPLO') = 1;
  with qrNavegacao,qrNavegacao.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM SAIDA WHERE CAIXA=:CAIXA ORDER BY SAIDA');
    Params.ParamByName('CAIXA').AsInteger := Main.Caixa;
    Open;
  end;
end;

procedure TfrmSaida.btnIncluiClick(Sender: TObject);
begin
//  IF btnSalva.Enabled THEN
//    btnSalva.Click;
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_SAIDA');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnImprimir.Enabled := false;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtCadastro.Date := now;
  edtHora.text := copy(timeToStr(now),1,5);
  Operacao := 'I';
  edtFuncionario.SetFocus;
  Permissao := true;
  Id := 0;
  AtualizaGrid;
end;

procedure TfrmSaida.btnAlteraClick(Sender: TObject);
begin
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnImprimir.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  operacao := 'O';
  Id := UltimoId(StrToInt(edtCodigo.text), 'ITEMSAIDA')+1;
  if caixa = caixaatual('SAIDA',edtCodigo.text) then
    Permissao := true
  else
    Permissao := false;
end;

procedure TfrmSaida.Exclui;
begin
  if (ExisteRegistro) and (caixa = caixaatual('SAIDA',edtCodigo.text)) then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM SAIDA WHERE SAIDA=:SAIDA ');
         Params.ParamByName('SAIDA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         while not tbProduto.IsEmpty do
         begin
           PegaItem2;
           btnApaga.Click;
         end;
         ApagaFiado(edtCodigo.text);
         ApagaMovimento('Venda','CRÉDITO',StrToIntDef(edtFormapagamento.Text,0),StrToIntDef(edtCodigo.text, 0));
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmSaida.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmSaida.LimpaCampos;
begin
  edtCodigo.text := '';
  edtCadastro.Text := '';
  edtHora.text := '';
  edtCliente.text := '';
  edtFuncionario.Text := '';
  edtFormaPagamento.Text := '';
  edtQtdeTotal.Value := 0;
  edtValorTotal.Value := 0;
  edtDesconto.Value := 0;
  edtValorQuitado.Value := 0;
  edtTroco.Value := 0;
  tbProduto.Close;
  cdsProduto.close;
  LimpaCampoItem;
end;

procedure TfrmSaida.btnExcluiClick(Sender: TObject);
begin
  if Exclusao('Deseja excluir esse registro?','Exclusão') then
  begin
    Exclui;
    fpBody.enabled := false;
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    btnImprimir.Enabled := false;
    btnExclui.Enabled := false;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmSaida.FPrior;
begin
  qrNavegacao.Prior;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo;
end;

procedure TfrmSaida.btnCancelaClick(Sender: TObject);
begin
  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnImprimir.Enabled := false;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
  btnConsulta.Enabled := true;
end;

procedure TfrmSaida.btnSalvaClick(Sender: TObject);
begin
  if Altera then
  begin
    edicao;
    //navegacao;
    btnInclui.Enabled := true;
    btnImprimir.Enabled := True;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
    fpBody.Enabled := false;
    AtualizaNavegacao;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmSaida.Navegacao;
begin
  if qrNavegacao.RecordCount = 0 then
  begin
    btnFirst.Enabled := false;
    btnPrior.Enabled := false;
    btnNext.Enabled := false;
    btnLast.Enabled := false;
  end
  else
  begin
    if qrNavegacao.RecordCount =1 then
    begin
      btnFirst.Enabled := false;
      btnPrior.Enabled := false;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrNavegacao.RecNo = qrNavegacao.RecordCount then
    begin
      btnFirst.Enabled := True;
      btnPrior.Enabled := True;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrNavegacao.RecNo = 1 then
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

procedure TfrmSaida.Edicao;
begin
  if existeRegistro then
  begin
    btnImprimir.Enabled := true;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
  end;
end;

procedure TfrmSaida.FFirst;
begin
  qrNavegacao.First;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmSaida.FNext;
begin
  qrNavegacao.Next;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmSaida.FLast;
begin
  qrNavegacao.Last;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmSaida.btnFirstClick(Sender: TObject);
begin
{  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;

  FFirst;}
end;

procedure TfrmSaida.btnPriorClick(Sender: TObject);
begin
{  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;

 FPrior;}
end;

procedure TfrmSaida.btnNextClick(Sender: TObject);
begin
{  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;

  FNext;}
end;

procedure TfrmSaida.btnLastClick(Sender: TObject);
begin
  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;

  FLast;
end;

procedure TfrmSaida.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = Vk_F9) then
   SelectNext(ActiveControl, true, true)
 else if Shift = [ssCtrl] then
 begin
   if Key = VK_F4 then
     close
   else if (Key = VK_NEXT) and (btnNext.Enabled) and (btnNext.Visible) then
     btnNext.Click
   else if (Key = VK_PRIOR) and (btnPrior.Enabled) and (btnPrior.Visible) then
     btnPrior.Click
   else if (Key = VK_END) and (btnLast.Enabled) and (btnLast.Visible) then
     btnLast.Click
   else if (Key = VK_HOME) and (btnFirst.Enabled) and (btnFirst.Visible) then
     btnFirst.Click
   else if ((Key = 65) or (key = 97)) and (btnAltera.Enabled) then
     btnAltera.Click
   else if ((Key = 69) or (key = 101)) and (btnExclui.Enabled) then
     btnExclui.Click
   else if ((Key = 73) or (key = 105)) and (btnInclui.Enabled) then
     btnInclui.Click
   else if ((Key = 80) or (key = 112)) and (btnConsulta.Enabled) then
     btnConsulta.Click
   else if ((Key = 83) or (key = 115)) and (btnSalva.Enabled) then
     btnSalva.Click
   else if ((Key = 67) or (key = 99)) and (btnCancela.Enabled) then
     btnCancela.Click
   else if ((key=90) or (key=122)) and (TEdit(Sender).Tag=10) then
     LimpaCampoItem;
 end
 else if Key = VK_ESCAPE then
   edtFormaPagamento.SetFocus;
end;

procedure TfrmSaida.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM SAIDA WHERE CAIXA = '+inttostr(UltimoCaixa)+' ORDER BY SAIDA';
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;

  SalvaGrid(dbgProduto);
  SalvaGrid(dbgConsulta2);
  SalvaGrid(dbgItem);
  SalvarCampodePesquisa(Self.Name, cbConsulta.Text);
  loSaida := nil;
  Action := caFree;
end;

procedure TfrmSaida.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text             := FieldByName('SAIDA'         ).asString;
    edtCadastro.date           := FieldByName('DATA'          ).AsDateTime;
    edthora.text               := Hpv(FieldByName('HORA'      ).asDateTime);
    edtCliente.text            := FieldByName('CLIENTE'       ).asString;
    edtFuncionario.text        := FieldByName('FUNCIONARIO'   ).asString;
    edtFormaPagamento.text     := FieldByName('FORMAPAGAMENTO').asString;
    edtDesconto.text           := FieldByName('DESCONTO'      ).asString;
    edtValorQuitado.text       := FieldByName('QUITACAO'      ).asString;
    Operacao := 'O';
    if ExisteRegistro then
    begin
      AtualizaGrid;
      btnImprimir.Enabled := true;
    end;
  end;
  edicao;
end;

procedure TfrmSaida.btnApagaClick(Sender: TObject);
var
  Acho : Boolean;
begin
  if not ExisteItem then
  begin
    Exclusao2('Produto não inserido','Aviso');
    Exit;
  end;
  with cdsProduto do
  begin
    First;
    Acho := False;
    while (not (eof)) and (not Acho) do
    begin
      if (FieldByName('ID').AsInteger = id2) and (FieldByName('EDICAO').AsInteger=edtEdicao.AsInteger) and
         (FieldByName('CODBARRA').AsString = FormataCodBarra(edtCodProduto.text)) then
         Acho := True
      else
        Next;
    end;
    if Acho then
      Delete;
  end;
  with qrProduto, qrProduto.SQL do
  begin
    Clear;
    Add('DELETE FROM ITEMSAIDA WHERE CODBARRA =:CODBARRA  AND EDICAO=:EDICAO AND ITEMSAIDA=:ITEM AND QUANTIDADE=:QTDE AND ID=:ID');
    Params.ParamByName('CODBARRA').AsString := FormataCodbarra(edtCodProduto.text);
    Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
    Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
    Params.ParamByName('QTDE').AsInteger := edtQuantidade.AsInteger;
    Params.ParamByName('ID').AsInteger := ID2;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
//    AtualizaEstoque((edtQuantidade.AsInteger),FormataCodBarra(edtCodProduto.text),edtedicao.AsInteger);
//    AtualizaGrid;
    LimpaCampoItem;
    Recalcula;
  end;
end;

procedure TfrmSaida.LimpaCampoItem;
begin
  edtCodProduto.Text := '';
  edtDescricao.Text := '';
  edtQuantidade.Value := 1;
  edtEdicao.Value := 0;
  edtPrecoUni.Value := 0;
  edtPrecoTotal.Value := 0;
  edtFornecedor.Clear;
end;

procedure TfrmSaida.SalvaItem;
var
  Acho, Localizou : Boolean;
  Q : Integer;
  T : Double;
  Codi, Pre : String;
  Edi, Forn : Integer;
begin
  if not ValidaItem then
  begin
    exclusao2('Preencha corretamente os campos','Aviso');
    exit;
  end;
  Q := 0;
  T := 0;
  if Pegar then
  begin
    with cdsProduto do
    begin
      First;
      Acho := False;
      while (not (eof)) and (not Acho) do
      begin
        if (FieldByName('ID').AsInteger = id2) and (FieldByName('EDICAO').AsInteger=edtEdicao.AsInteger) and
           (FieldByName('CODBARRA').AsString = FormataCodBarra(edtCodProduto.text)) and (FieldByName('FORN').AsInteger = StrtoIntDef(edtFornecedor.Text,0))
        then
           Acho := True
        else
          Next;
      end;
      if Acho then
      begin
        Edit;
        FieldByname('QUANTIDADE').AsInteger := edtQuantidade.AsInteger;
        FieldByname('VALORUNI'  ).AsFloat   := edtPrecoUni.Value;
        FieldByname('TOTAL'     ).AsFloat   := edtPrecoTotal.value;
        Post;
      end;
    end;

    with qrProduto,qrProduto.SQL do
    begin
      Close;
      Clear;
      Add('UPDATE ITEMSAIDA SET       ');
      Add('  QUANTIDADE=:QUANTIDADE,  ');
      Add('  VALORUNI=:VALORUNI,      ');
      Add('  TOTAL=:TOTAL             ');
      Add('WHERE                      ');
      Add('  ITEMSAIDA=:ITEMSAIDA     ');
      Add('AND                        ');
      Add('  CODBARRA=:CODBARRA       ');
      Add('AND                        ');
      Add('  ID=:ID                   ');
      Add('AND                        ');
      Add('  EDICAO=:EDICAO           ');
      Add('AND                        ');
      Add('  FORN=:FORN               ');
      Params.ParamByName('ITEMSAIDA'   ).AsInteger := strParaint(edtCodigo.text);
      Params.ParamByName('CODBARRA'     ).AsString  := FormataCodBarra(edtCodProduto.text);
      Params.ParamByName('ID'           ).AsInteger := id2;
      Params.ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
      Params.ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
      Params.ParamByName('FORN'         ).AsInteger := StrtoIntDef(edtFornecedor.Text,0);
      Params.ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
      Params.ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
//      AtualizaEstoque(((edtQuantidade.AsInteger-qtde2)*-1),FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
      Pegar := False;
      qtde2 := 0;
    end;
  end
  else
  begin
    with cdsproduto do
    begin
      First;
      localizou := False;
      while not (Eof) and not (Localizou) do
      begin
        Edi  := cdsproduto.FieldByName('EDICAO').AsInteger;
        Forn := cdsproduto.FieldByName('FORN'  ).AsInteger;
        Codi := cdsproduto.FieldByName('CODBARRA').AsString;
        Pre  := FormatFloat('#0.00', cdsproduto.FieldByName('VALORUNI').AsFloat);
        if ( Edi = edtEdicao.AsInteger) then
        begin
          if ( Pre = FormatFloat('#0.00', edtPrecoUni.Value)) then
          begin
            if (Codi = FormataCodBarra(edtCodProduto.text) ) then
            begin
              if Forn = StrtoIntDef(edtFornecedor.Text,0) then
              begin
                Localizou := True;
                Edit;
                Q := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                T := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                cdsproduto.FieldByName('QUANTIDADE').asinteger := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                cdsproduto.FieldByName('TOTAL').asFloat  := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                Post;
              end;
            end;
          end;
        end;
        Next;
      end;
      if not Localizou then
      begin
        Append;
        FieldByName('CODBARRA').asString := FormataCodbarra(edtCodProduto.text);
        FieldByName('DESCRICAO').asString := edtDescricao.Text;
        FieldByName('ID').asinteger :=  id;
        FieldByName('EDICAO').asinteger := edtEdicao.AsInteger;
        FieldByName('QUANTIDADE').asinteger := edtQuantidade.AsInteger;
        FieldByName('VALORUNI').asFloat  := edtPrecoUni.Value;
        FieldByName('TOTAL').asFloat  := edtPrecoTotal.value;
        FieldByName('FORN').asinteger := StrtoIntDef(edtFornecedor.Text,0);
        Post;
      end;
    end;
    with qrProduto,qrProduto.SQL do
    begin
      Close;
      Clear;
      if not Localizou then
      begin
        Add('INSERT INTO ITEMSAIDA   (  ');
        Add('  ITEMSAIDA,               ');
        Add('  ID,                      ');
        Add('  CODBARRA,                ');
        Add('  EDICAO,                  ');
        Add('  QUANTIDADE,              ');
        Add('  VALORUNI,                ');
        Add('  FORN,                    ');
        Add('  TOTAL                    ');
        Add('  ) VALUES (               ');
        Add('  :ITEMSAIDA,              ');
        Add('  :ID,                     ');
        Add('  :CODBARRA,               ');
        Add('  :EDICAO,                 ');
        Add('  :QUANTIDADE,             ');
        Add('  :VALORUNI,               ');
        Add('  :FORN,                   ');
        Add('  :TOTAL  )                ');
        Params.ParamByName('ITEMSAIDA'    ).AsInteger := strParaint(edtCodigo.text);
        Params.ParamByName('ID'           ).AsInteger := Id;
        Params.ParamByName('CODBARRA'     ).AsString  := FormataCodbarra(edtCodProduto.text);
        Params.ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
        Params.ParamByName('FORN'         ).AsInteger := StrToIntDef(edtFornecedor.Text,0);
        Params.ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
        Params.ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
        Params.ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
        inc(ID);
//        AtualizaEstoque((edtQuantidade.AsInteger*-1),FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
      end
      else
      begin
        Add('UPDATE ITEMSAIDA   SET      ');
        Add('  QUANTIDADE =:QUANTIDADE,  ');
        Add('  TOTAL      =:TOTAL        ');
        Add('WHERE                       ');
        Add('  ITEMSAIDA  =:ITEMSAIDA    ');
        Add('AND                         ');
        Add('  CODBARRA   =:CODBARRA     ');
        Add('AND                         ');
        Add('  EDICAO     =:EDICAO       ');
        Add('AND                         ');
        Add('  VALORUNI   =:VALORUNI     ');
        Add('AND                         ');
        Add('  FORN       =:FORN         ');
        Params.ParamByName('ITEMSAIDA'    ).AsInteger := strParaint(edtCodigo.text);
        Params.ParamByName('CODBARRA'     ).AsString  := FormataCodbarra(edtCodProduto.text);
        Params.ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
        Params.ParamByName('FORN'         ).AsInteger := StrtoIntDef(edtFornecedor.Text,0);
        Params.ParamByName('QUANTIDADE'   ).AsInteger := Q;//cdsProduto.FieldByName('QUANTIDADE').asinteger; //edtQuantidade.AsInteger;
        Params.ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
        Params.ParamByName('TOTAL'        ).AsFloat   := T;//cdsProduto.FieldByName('TOTAL').asFloat;
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
//        AtualizaEstoque((edtQuantidade.AsInteger*-1),FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
      end;
    end;
  end;
//  cdsProduto.Last;
  LimpaCampoItem;
  Recalcula;
end;

procedure TfrmSaida.edtCodProdutoEnter(Sender: TObject);
begin
  if Operacao = 'O' then
   exit;
  if Salva then
  begin
    operacao := 'O';
    edicao;
    //navegacao;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := true;
    AtualizaNavegacao;
  end;
end;

function TfrmSaida.Salva: boolean;
//var
//  D : String[10];
begin
  result := false;
  if not (validaSalva) then
    exit;
  with qrCadastro,qrCadastro.SQL do
  begin
    Clear;
    Add('INSERT INTO SAIDA    (          ');
    Add('  SAIDA,                        ');
    Add('  DATA,                         ');
    Add('  HORA,                         ');
    Add('  FUNCIONARIO,                  ');
    Add('  CLIENTE,                      ');
    Add('  DESCONTO,                     ');
    Add('  QUITACAO,                     ');
    Add('  CAIXA,                        ');
    Add('  BAIXADO                       ');
    Add(') VALUES (                      ');
    Add('  :SAIDA,                       ');
    Add('  :DATA,                        ');
    Add('  :HORA,                        ');
    Add('  :FUNCIONARIO,                 ');
    Add('  :CLIENTE,                     ');
    Add('  :DESCONTO,                    ');
    Add('  :QUITACAO,                    ');
    Add('  :CAIXA,                       ');
    Add('  :BAIXADO                      ');
    Add(')                               ');
    ParamByName('SAIDA'         ).asInteger := strtoint(edtCodigo.text);
    ParamByName('DATA'          ).AsDateTime  := (edtCadastro.date);
    ParamByName('HORA'          ).asDateTime  := (StrToTimeDef(edthora.text,0));
    ParamByName('CLIENTE'       ).asInteger := strparaint(edtCliente.text);
    ParamByName('FUNCIONARIO'   ).asInteger := strparaint(edtFuncionario.Text);
    ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
    ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
    ParamByName('CAIXA'         ).asInteger := Caixa;
    ParamByName('BAIXADO'       ).asString  := 'N';
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;    
    //UpdCodigo('SAIDA', strtoint(edtCodigo.text));
    result := true;
  end;
end;

function TfrmSaida.validaAltera: boolean;
begin
  result := false;
  if not ValidaSalva then
  begin
    exit;
  end;
  if trim(edtDescFormaPagamento.Caption) = '' then
  begin
    exclusao2('Digite a Forma de pagamento.','Aviso');
    edtFormaPagamento.setFocus;
    exit;
  end;
  if cdsProduto.IsEmpty then
  begin
    exclusao2('Insira Produtos para efetuar a entrada.','Aviso');
    edtCodProduto.SetFocus;
    exit;
  end;
  result := true;
end;

procedure TfrmSaida.AtualizaGrid;
begin
  if edtCodigo.text = '' then
    Exit;
  cdsProduto.Close;
  with tbProduto,tbProduto.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT ITEMSAIDA.CODBARRA AS CODBARRA, ITEM.DESCRICAO AS DESCRICAO, ');
    Add(' ITEMSAIDA.VALORUNI AS VALORUNI, ITEMSAIDA.TOTAL AS TOTAL,          ');
    Add(' ITEMSAIDA.QUANTIDADE AS QUANTIDADE, ITEMSAIDA.EDICAO AS EDICAO,    ');
    Add(' ITEMSAIDA.ID AS ID, ITEMSAIDA.FORN AS FORN FROM ITEMSAIDA, ITEM    ');
    Add(' WHERE ITEMSAIDA=:SAIDA AND ITEM.CODBARRA=ITEMSAIDA.CODBARRA        ');
    Params.ParamByName('SAIDA').AsInteger := strtoint(edtCodigo.Text);
    Open;
  end;
  cdsProduto.open;
  ConfiguraGrid;
  edtValorTotal.Value := 0;
  edtQtdeTotal.Value := 0;
  if not cdsProduto.IsEmpty then
    Recalcula;
end;

function TfrmSaida.ValidaItem: Boolean;
begin
  result := (trim(edtCodProduto.Text) <> '') and (edtDescricao.Text <> '') and (edtQuantidade.Value > 0) and (edtPrecoUni.Value > 0) and (edtPrecoTotal.Value > 0);
end;

procedure TfrmSaida.edtFuncionarioChange(Sender: TObject);
begin
  if Trim(edtFuncionario.Text) <> '' then
    edtDescFuncionario.Caption := LerDescricaoPorCampo('FUNCIONARIO',strtointDef(edtFuncionario.text,0))
  else
    edtDescFuncionario.Caption := '';
end;

procedure TfrmSaida.edtFormapagamentoChange(Sender: TObject);
begin
  if (Trim(edtFormaPagamento.Text) <> '') and (edtFormaPagamento.text <> '0') then
  begin
    edtDescFormaPagamento.Caption := LerDescricaoPorCampo('FORMAPAGAMENTO',strtointDef(edtFormaPagamento.text,0));
    edtValorQuitado.Value := ( (edtValorTotal.Value * (1 -  edtDesconto.Value/100)) * (1 - (LerDescontoFormaPagamento(edtFormaPagamento.text)/100)) );
    edtPago.Value := edtValorQuitado.Value;
  end
  else
  begin
    edtDescFormaPagamento.Caption := '';
    edtValorQuitado.Value := 0;
    edtPago.Value := 0;
  end;
end;

procedure TfrmSaida.edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    SalvaItem;
    edtCodProduto.SetFocus;
  end
  else if Key = VK_ESCAPE then
    edtFormaPagamento.SetFocus
  else if (Shift=[ssCtrl]) and ((key=90) or (key=122)) and (TEdit(Sender).Tag=10) then
   LimpaCampoItem;
end;

procedure TfrmSaida.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointdef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmSaida.btnConsultaClick(Sender: TObject);
begin
  if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) = 3) then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end
    else
      btnSalva.Click;
  end
  else if (btnSalva.Enabled) and (btnSalva.Visible) and (Operacao = 'O') and (StrToIntDef(edtFormapagamento.Text, 0) <> 0) then
    btnSalva.Click;


  btnConsulta.Enabled := False;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnExclui.Enabled :=false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
  btnFirst.Visible := false;
  btnPrior.Visible := false;
  btnNext.Visible := false;
  btnLast.Visible := false;
  with qrConsulta2,qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM SAIDA ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmSaida.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    if cbConsulta.Text <> 'DATA' then
      Add('SELECT * FROM ENTRADA WHERE '+cbConsulta.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') )
    else
      Add('SELECT * FROM SAIDA WHERE '+cbConsulta.Text+' = '''+DataValida(edtConsulta.Text)+''' ');
    Open;
  end;
end;

procedure TfrmSaida.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta2 do
    begin
      SelectedIndex            := 0;
      edtCodigo.Text           :=  Fields[0].Text;
      edtCadastro.Date         :=  Fields[2].AsDateTime;
      edtHora.text             :=  Hpv(Fields[3].AsDateTime);
      edtFuncionario.text      :=  Fields[4].Text;
      edtCliente.text          :=  Fields[5].Text;
      edtFormaPagamento.text   :=  Fields[6].Text;
      edtDesconto.text         :=  Fields[7].Text;
      edtValorQuitado.text     :=  Fields[8].Text;

      if edtCodigo.text <> '' then
      begin
        AtualizaGrid;
//        Recalcula;
      end
      else
      begin
        tbProduto.Close;
        cdsproduto.close;
        Recalcula;
      end;
    end;
    btnFirst.Visible := true;
    btnPrior.Visible := true;
    btnNext.Visible := true;
    btnLast.Visible := true;
    Edicao;
//    cbConsulta.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
  end
  else if key = VK_ESCAPE then
  begin
//    cbConsulta.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
    btnFirst.Visible := true;
    btnPrior.Visible := true;
    btnNext.Visible := true;
    btnLast.Visible := true;
    Edicao;
  end
  else if Key = VK_f9 then
  begin
    cbConsulta.SetFocus;
  end;  
end;

procedure TfrmSaida.dbgConsulta2CellClick(Column: TColumn);
begin
  with dbgConsulta2 do
  begin
    edtCodigo.Text           :=  Fields[0].Text;
    edtCadastro.Date         :=  Fields[2].AsDateTime;
    edtHora.text             :=  Hpv(Fields[3].AsDateTime);
    edtFuncionario.text      :=  Fields[4].Text;
    edtCliente.text          :=  Fields[5].Text;
    edtFormaPagamento.text   :=  Fields[6].Text;
    edtDesconto.text         :=  Fields[7].Text;
    edtValorQuitado.text     :=  Fields[8].Text;

    if edtCodigo.text <> '' then
    begin
      AtualizaGrid;
//      Recalcula;
    end
    else
    begin
      tbProduto.Close;
      cdsProduto.close;
      Recalcula;
    end;
  end;
  btnFirst.Visible := true;
  btnPrior.Visible := true;
  btnNext.Visible := true;
  btnLast.Visible := true;
  Edicao;
//  cbConsulta.ItemIndex := 0;
  edtConsulta.Text := '';
  pConsulta.Visible :=false;
  fpBody.Enabled := false;
  btnConsulta.Enabled := true;
end;

procedure TfrmSaida.edtDescricaoEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmSaida.edtEdicaoEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmSaida.edtQuantidadeEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmSaida.edtPrecoUniEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmSaida.edtPrecoTotalEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmSaida.edtQuantidadeExit(Sender: TObject);
begin
  if Trim(edtCodProduto.text) = '' then
    Exit;
  if ((EstoqueAtual(FormataCodBarra(edtCodProduto.text), edtEdicao.AsInteger) - edtQuantidade.value) < 0) then
    Exclusao2('A quatidade Digitada Ultrapassou o estoque.','Aviso');
end;

procedure TfrmSaida.edtPagoExit(Sender: TObject);
begin
  if (edtValorQuitado.Value - edtPago.Value) <= 0 then
    edtTroco.Value := (edtValorQuitado.Value - edtPago.Value) * -1
  else
    Exclusao2('Você digitou um valor para o troco menor que o valor de venda.','Aviso');
end;

procedure TfrmSaida.ConsultaItem;
begin
  edtCodBarra.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmSaida.edtCodBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_REturn then
  begin
    if not (Trim(edtCodBarra.text) = '') then
      edtCodBarra.text := FormataCodBarra(edtCodBarra.text);
    edtDesc.SetFocus;
  end
  else if key=Vk_Escape then
    FechaConsultaItem;
end;

procedure TfrmSaida.FechaConsultaItem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodProduto.setFocus;
  pItem.Visible := false;
end;

procedure TfrmSaida.edtCodBarraChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmSaida.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
//      SelectedIndex := 0;
      edtCodProduto.text := Floattostr(StrtofloatDef(Fields[0].Text,0));
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;  
end;

procedure TfrmSaida.dbgItemCellClick(Column: TColumn);
begin
  edtCodProduto.text := Floattostr(StrtofloatDef(dbgItem.Fields[0].Text,0));
  FechaConsultaItem;
end;

procedure TfrmSaida.pItemExit(Sender: TObject);
begin
  FechaConsultaItem;
end;

procedure TfrmSaida.edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_F1 then
   ConsultaItem
 else if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true)
 else if Shift = [ssCtrl] then
 begin
   if Key = VK_F4 then
     close
   else if Key = VK_NEXT then
     btnNext.Click
   else if Key = VK_PRIOR then
     btnPrior.Click
   else if Key = VK_END then
     btnLast.Click
   else if Key = VK_HOME then
     btnFirst.Click
   else if (Key = 65) or (key = 97) then
     btnAltera.Click
   else if (Key = 69) or (key = 101) then
     btnExclui.Click
   else if (Key = 73) or (key = 105) then
     btnInclui.Click
   else if (Key = 80) or (key = 112) then
     btnConsulta.Click
   else if (Key = 83) or (key = 115) then
     btnSalva.Click
   else if (Key = 67) or (key = 99) then
     btnCancela.Click;
 end
 else if Key = VK_ESCAPE then
   edtFormaPagamento.SetFocus;
end;

procedure TfrmSaida.edtValorQuitadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if not (TemSaldoCliente(strtoint(edtCliente.text), edtValorQuitado.Value)) and (Trim(edtFormapagamento.Text) = '3') then
    begin
      if not Exclusao('Cliente Ultrapassou o seu Saldo. Deseja Continuar?','Cliente sem Saldo') then
      begin
        edtCLiente.setFocus;
        Exit;
      end;
    end;
    if Exclusao('Deseja Salvar e Iniciar novo registro?','Confirmação do Sistema') then
    begin
      btnSalva.Click;
      if LerIniInteiro('VENDAS','IMPRIME') = 1 then
        Bobina1.Click;
      Sleep(500);
      btnInclui.Click;
    end;
  end;
end;

procedure TfrmSaida.FlatSpeedButton1Click(Sender: TObject);
begin
  if frmPrincipal.Cliente1.Enabled then
    frmPrincipal.Cliente1Click(Sender);
end;

procedure TfrmSaida.FlatSpeedButton2Click(Sender: TObject);
begin
  if frmPrincipal.Funcionrios1.Enabled then
    frmPrincipal.Funcionrios1Click(Sender);
end;

procedure TfrmSaida.FlatSpeedButton3Click(Sender: TObject);
begin
  if frmPrincipal.FormadePagamento1.Enabled then
    frmPrincipal.FormadePagamento1Click(Sender);
end;

procedure TfrmSaida.FlatSpeedButton4Click(Sender: TObject);
begin
  ConsultaItem;
end;

procedure TfrmSaida.edtFormapagamentoEnter(Sender: TObject);
begin
  if (Trim(edtFormaPagamento.text) = '') and (LerIniInteiro('CONFIGURACAO','ATIVA') = 1) then
    edtFormaPagamento.Text := LerIniCaractere('CONFIGURACAO','FORMAPAGAMENTO');
end;

procedure TfrmSaida.edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if (Trim(edtCodProduto.text) = '') then
    begin
      Exclusao2('Digite o Código de Barras para prosseguir','Aviso');
      edtCodProduto.SetFocus;
    end
    else
    begin
//      edtDescricao.Text := LerCodBarraEntrada(edtCodProduto.Text);
//      edtPrecoUni.Value := LerValorUni(edtCodProduto.Text,'S');
      AtivarCodBarraPreco;
      if edtDescricao.text = '' then
      begin
        Exclusao2('Produto sem Entrada!','Aviso');
        edtCodProduto.SetFocus;
        exit;
      end;
      AtivarEdicao;
//      else if PossuiEdicao(edtCodProduto.Text) then
//      begin
//       edtEdicao.SetFocus;
//      end
//      else
//      begin
//        edtEdicao.Value := 0;
//        edtQuantidade.SetFocus;
//      end;
    end;
  end;
end;

procedure TfrmSaida.edtCodigoClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TfrmSaida.edtFuncionarioEnter(Sender: TObject);
begin
  if (Trim(edtFuncionario.text) = '') and (LerIniInteiro('CONFIGURACAO','ATIVA') = 1) then
    edtFuncionario.text := LerIniCaractere('CONFIGURACAO','FUNCIONARIO');
end;

procedure TfrmSaida.edtClienteEnter(Sender: TObject);
begin
  if (Trim(edtCliente.text) = '') and (LerIniInteiro('CONFIGURACAO','ATIVA') = 1) then
    edtCliente.text := LerIniCaractere('CONFIGURACAO','CLIENTE');
end;

procedure TfrmSaida.ChamarVencimento;
begin
  with TfrmVencimento.Create(Application) do
  begin
    ShowModal;
    Venc := edtData.Date;
    Free;
  end
end;

procedure TfrmSaida.dbgItemDblClick(Sender: TObject);
begin
  edtCodProduto.text := Floattostr(StrtofloatDef(dbgItem.Fields[0].Text,0));
  FechaConsultaItem;
end;

procedure TfrmSaida.edtValorTotalChange(Sender: TObject);
begin
  edtPago.Value := edtValorTotal.value;
end;

procedure TfrmSaida.edtCodProdutoChange(Sender: TObject);
begin
  Pegar := False;
end;

function TfrmSaida.ExisteItem: Boolean;
begin
  result := false;
  with qrAtualiza,qrAtualiza.SQL do
  begin
    Database := frmPrincipal.dba;
    close;
    Clear;
    Add('SELECT CODBARRA FROM ITEMSAIDA WHERE CODBARRA=:CODBARRA AND EDICAO=:EDICAO AND ITEMSAIDA=:ITEM ');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodProduto.text);
    Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
    Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
    Open;
    if qrAtualiza.RecordCount > 0 then
       Result := true;
  end;
end;

procedure TfrmSaida.AtivarCodBarraPreco;
begin
  with frmPrincipal do
  begin
    cds.First;
    cds.IndexFieldNames := 'CODBARRA';

    if Length(Trim(edtCodProduto.Text)) <= 6 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
        edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
      else
        edtDescricao.Text := '';
      if not (edtDescricao.text = '') then
        edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
    end

    else if Length(Trim(edtCodProduto.Text)) < 13 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
        edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
      else
        edtDescricao.Text := '';
      if not (edtDescricao.text = '') then
        edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
    end

    else if Length(Trim(edtCodProduto.Text)) = 13 then
    begin
      {se o codigo for menor que 999.999 (seis caracteres para o codigo)}
      if StrToFloatDef(Copy(edtCodProduto.Text,1,6),0) <= 999999 then
      begin
        if cds.FindKey(['0'+Copy(FormataCodBarra(edtCodProduto.Text),2,12)]) then
          edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
        else
        begin
          cds.First;
          if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
            edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
          else
            edtDescricao.Text := '';
        end;
        if not (edtDescricao.text = '') then
          edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
      end
      else
      begin
        if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
          edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
        else
          edtDescricao.Text := '';
        if not (edtDescricao.text = '') then
          edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
      end;
    end;
  end;
end;

procedure TfrmSaida.AtivarEdicao;
begin
  with frmPrincipal do
  begin
    cds.First;
    cds.IndexFieldNames := 'CODBARRA';
    if Length(Trim(edtCodProduto.Text)) <= 6 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
      begin
//        if SparaB(cds.FieldByName('EDICAO').AsString) then
        edtEdicao.SetFocus
//        else
//        begin
//          edtEdicao.Value := 0;
//          edtQuantidade.SetFocus;
//        end;
      end
      else
      begin
        Exclusao2('Esse produto não existe','Aviso');
        edtCodBarra.SetFocus;
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) < 13 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
      begin
//        if SparaB(cds.FieldByName('EDICAO').AsString) then
        edtEdicao.SetFocus
//        else
//        begin
//          edtEdicao.Value := 0;
//          edtQuantidade.SetFocus;
//        end;
      end
      else
      begin
        Exclusao2('Esse produto não existe','Aviso');
        edtCodBarra.SetFocus;
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) = 13 then
    begin
      {se o codigo for menor que 999.999 (seis caracteres para o codigo)}
      if StrToFloatDef(Copy(edtCodProduto.Text,1,6),0) <= 999999 then
      begin
        if cds.FindKey(['0'+Copy(FormataCodBarra(edtCodProduto.Text),1,12)]) then
        begin
//          if SparaB(cds.FieldByName('EDICAO').AsString) then
          edtEdicao.SetFocus
//          else
//          begin
//            edtEdicao.Value := 0;
//            edtQuantidade.SetFocus;
//          end;
        end
        else
        begin
          cds.First;
          if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
          begin
//            if SparaB(cds.FieldByName('EDICAO').AsString) then
            edtEdicao.SetFocus
//            else
//            begin
//              edtEdicao.Value := 0;
//              edtQuantidade.SetFocus;
//            end;
          end
          else
          begin
            Exclusao2('Esse produto não existe','Aviso');
            edtCodBarra.SetFocus;
          end;
        end;
      end
      else
      begin
        if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
        begin
//          if SparaB(cds.FieldByName('EDICAO').AsString) then
//          begin
          edtEdicao.SetFocus;
//          end
//          else
//          begin
//            edtEdicao.Value := 0;
//            edtQuantidade.SetFocus;
//          end;
        end
        else
        begin
          Exclusao2('Esse produto não existe','Aviso');
          edtCodBarra.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TfrmSaida.AbreSaida(num: Integer);
begin
  with qrItem, qrItem.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM SAIDA WHERE SAIDA = :SAIDA  ');
    Params.ParamByName('SAIDA').AsInteger := Num;
    Open;
    edtCodigo.text             := FieldByName('SAIDA'         ).asString;
    edtCadastro.Date           := FieldByName('DATA'          ).AsDateTime;
    edthora.text               := HPV(FieldByName('HORA'      ).asDateTime);
    edtCliente.text            := FieldByName('CLIENTE'       ).asString;
    edtFuncionario.text        := FieldByName('FUNCIONARIO'   ).asString;
    edtFormaPagamento.text     := FieldByName('FORMAPAGAMENTO').asString;
    edtDesconto.text           := FieldByName('DESCONTO'      ).asString;
    edtValorQuitado.text       := FieldByName('QUITACAO'      ).asString;
    Operacao := 'O';
    if ExisteRegistro then
      AtualizaGrid;
  end;
  edicao;
end;

procedure TfrmSaida.edtFuncionarioButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+56+20+40, Left+350, 'FUNC');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmSaida.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+80+20+60, Left+70, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmSaida.edtFormapagamentoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+461+56+20-260, Left+20, 'FORM');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmSaida.ConfiguraGrid;
begin
  with cdsProduto do
  begin
    TNumericField(FieldByName('VALORUNI')).DisplayFormat := '#0.00';
    TNumericField(FieldByName('TOTAL'   )).DisplayFormat := '#0.00';
  end;
end;

procedure TfrmSaida.dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    cbConsulta.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmSaida.qrNavegacaoAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('HORA'    )).DisplayFormat := 'HH:MM';
end;

procedure TfrmSaida.dbgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and not (dsItem.DataSet.IsEmpty) then
  begin
    edtCodProduto.text := Floattostr(StrtofloatDef(dbgItem.Fields[0].Text,0));
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

{
   Era a Pesquisa do AtivarEdicao

   if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
    begin
      if SparaB(cds.FieldByName('EDICAO').AsString) then
      begin
        edtEdicao.SetFocus;
      end
      else
      begin
        edtEdicao.Value := 0;
        edtQuantidade.SetFocus;
      end;
    end
    else
    begin
      Exclusao2('Esse produto não existe','Aviso');
      edtCodBarra.SetFocus;
    end;}

procedure TfrmSaida.edtFornecedorButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+76+88+50, Left+15+200, 'FORN');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmSaida.edtFornecedorChange(Sender: TObject);
begin
  if Trim(edtFornecedor.Text) <> '' then
    edtDescFornecedor.Caption := LerDescricaoPorCampo('FORNECEDOR',strtointDef(edtFornecedor.text,0))
  else
    edtDescFornecedor.Caption := '';
end;

procedure TfrmSaida.AtivarFornecedor;
var
  qrForn : TIBQuery;
begin
  qrForn := TIBQuery.Create(nil);
  try
    with qrForn, qrForn.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Close;
      Add('SELECT                                    ');
      Add('  ENTRADA.FORNECEDOR AS COD_FORN          ');
      Add('FROM                                      ');
      Add('  ENTRADA,                                ');
      Add('  ITEMENTRADA                             ');
      Add('WHERE                                     ');
      Add('  ENTRADA.ENTRADA=ITEMENTRADA.ITEMENTRADA ');
      Add('AND                                       ');
      Add('  ITEMENTRADA.CODBARRA=:BARRA             ');
      Add('AND                                       ');
      Add('  ITEMENTRADA.EDICAO=:EDICAO              ');
      ParamByName('BARRA').AsString   := FormataCodBarra(edtCodProduto.text);
      ParamByName('EDICAO').AsInteger := edtEdicao.AsInteger;
      Open;
      Last;
      edtFornecedor.Text := FieldByName('COD_FORN').AsString;
      Close;
      Clear;
    end;
  finally
    qrForn.Destroy;
  end;
end;

procedure TfrmSaida.edtEdicaoExit(Sender: TObject);
begin
  inherited;
  AtivarFornecedor;
end;

procedure TfrmSaida.edtFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = Vk_F9) then
   edtQuantidade.SetFocus
 else if Shift = [ssCtrl] then
 begin
   if Key = VK_F4 then
     close
   else if (Key = VK_NEXT) and (btnNext.Enabled) and (btnNext.Visible) then
     btnNext.Click
   else if (Key = VK_PRIOR) and (btnPrior.Enabled) and (btnPrior.Visible) then
     btnPrior.Click
   else if (Key = VK_END) and (btnLast.Enabled) and (btnLast.Visible) then
     btnLast.Click
   else if (Key = VK_HOME) and (btnFirst.Enabled) and (btnFirst.Visible) then
     btnFirst.Click
   else if ((Key = 65) or (key = 97)) and (btnAltera.Enabled) then
     btnAltera.Click
   else if ((Key = 69) or (key = 101)) and (btnExclui.Enabled) then
     btnExclui.Click
   else if ((Key = 73) or (key = 105)) and (btnInclui.Enabled) then
     btnInclui.Click
   else if ((Key = 80) or (key = 112)) and (btnConsulta.Enabled) then
     btnConsulta.Click
   else if ((Key = 83) or (key = 115)) and (btnSalva.Enabled) then
     btnSalva.Click
   else if ((Key = 67) or (key = 99)) and (btnCancela.Enabled) then
     btnCancela.Click
   else if ((key=90) or (key=122)) and (TEdit(Sender).Tag=10) then
     LimpaCampoItem;
 end
 else if Key = VK_ESCAPE then
   edtFormaPagamento.SetFocus;
end;

procedure TfrmSaida.dbgConsulta2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column <> nil then
    if Column.Field <> nil then
      if Column.Field.DataType in [ftDate, ftDateTime] then
        if Column.Field.AsDateTime = 0 then
          TDBGrid(Sender).Canvas.TextRect(Rect, 0, 0, '');
end;

procedure TfrmSaida.Video1Click(Sender: TObject);
begin
  try
    if not ExisteRegistro then
    begin
      Exclusao2('Não existe nenhum registro ativo. Escolha um e tente novamento','Aviso');
      Exit;
    end;
    with TfrmSaidaR.Create(Application) do
    begin
      Saida := StrtoIntDef(edtCodigo.Text,0);
      PreviewModal;
      Free;
    end;
  finally
  end;
end;

procedure TfrmSaida.Bobina1Click(Sender: TObject);
var
  Arquivo : TextFile;
  s : String;
begin
  try
    S := LerIniCaractere('CONFIGURACAO','BOBINA');
    if LerIniInteiro('VENDAS','IMPTERMICA') = 1 then
      AssignFile(Arquivo,'C:\imp_tmp.txt')
    else
    begin
      if TRIM(S) <> '' then
        AssignFile(Arquivo,S)
      else
        AssignFile(Arquivo,'LPT1');
    end;
    ReWrite(Arquivo);
    s := '----------------------------------------';
    WriteLn(Arquivo,S);
    s := Copy(LerIniCaractere('EMPRESA','RAZAO'),1,40);
    WriteLn(Arquivo,S);
    s := Copy(LerIniCaractere('EMPRESA','ENDERECO'),1,40);
    WriteLn(Arquivo,S);
    s := 'CNPJ: '+LerIniCaractere('EMPRESA','CNPJ');
    WriteLn(Arquivo,S);
    s := Copy('Fones: '+LerIniCaractere('EMPRESA','TELEFONE') +' '+LerIniCaractere('EMPRESA','TELEFONE2')+' '+
         LerIniCaractere('EMPRESA','TELEFONE3'),1,40);
    WriteLn(Arquivo,S);
    s := '----------------------------------------';
    WriteLn(Arquivo,S);
    s := 'Nº   : '+edtCodigo.text;
    WriteLn(Arquivo,S);
    s := 'Venda: '+Copy(edtDescFuncionario.Caption,1,30);
    WriteLn(Arquivo,S);
    s := 'Cliente: '+Copy(edtDescCliente.Caption,1,28);
    WriteLn(Arquivo,S);
    s := 'Data : '+edtCadastro.text+' Hora: '+edtHora.text;
    WriteLn(Arquivo,S);
    s := '----------------------------------------';
    WriteLn(Arquivo,S);
    s := 'Descricao';
    WriteLn(Arquivo,S);
    S := 'Cod. Produto  Qtde Preco Unit.    Total';
    WriteLn(Arquivo,S);
    s := '________________________________________';
    WriteLn(Arquivo,S);
    with cdsProduto do
    begin
      First;
      While not Eof do
      begin
        S := FieldByName('DESCRICAO').AsString;
        WriteLn(Arquivo,S);
        S := FieldByName('CODBARRA' ).AsString+' '+JustificaNumeroDir('#0',FieldByName('QUANTIDADE').AsFloat,4)+' '+
             JustificaNumeroDir('#0.00',FieldByName('VALORUNI').AsFloat,11)+' '+JustificaNumeroDir('#0.00',FieldByName('TOTAL').AsFloat,8);
        WriteLn(Arquivo,S);
        Next;
        Application.ProcessMessages;
      end;
    end;
    s := '________________________________________';
    WriteLn(Arquivo,S);
    S := 'Total Venda     Desconto   Valor Total';
    WriteLn(Arquivo,S);
    S := justificaNumeroDir('#0.00',edtValorTotal.value,11)+'     '+justificaNumeroDir('#0.00%',edtDesconto.value,8)+
         '   '+justificaNumeroDir('#0.00',edtValorQuitado.value,11);
    WriteLn(Arquivo,S);
    S := 'Forma Pag. : '+edtDescFormaPagamento.Caption;
    WriteLn(Arquivo,S);
    S := '________________________________________';
    WriteLn(Arquivo,S);
    S := '               OBRIGADO!!!!             ';
    WriteLn(Arquivo,S);
    S := '               VOLTE SEMPRE             ';
    WriteLn(Arquivo,S);
    S := LerIniCaractere('CONFIGURACAO','MENSAGEM');
    if Trim(s) <> '' then
      WriteLn(Arquivo,S);
    S := '________________________________________';
    WriteLn(Arquivo,S);
    S := '      NAO VALE COMO CUPOM FISCAL!';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
    s := ' ';
    WriteLn(Arquivo,S);
  finally
    CloseFile(Arquivo);
  end;
  if not (FileExists('C:\imp_tmp.txt')) then
    Exit;
  if LerIniInteiro('VENDAS','IMPTERMICA') = 1 then
  begin
    Int_Retorno := Daruma_DUAL_AcionaGaveta();
    Int_Retorno := Daruma_DUAL_ImprimirArquivo('C:\imp_tmp.txt');
    if not (Int_Retorno=1) then
      Application.MessageBox('Erro ao imprimir, verifique a impressora e suas configurações!', 'Erro!', mb_ok + 16);
  end;
  if FileExists('C:\imp_tmp.txt') then
    DeleteFile('C:\imp_tmp.txt');
end;

procedure TfrmSaida.btnImprimirClick(Sender: TObject);
begin
  inherited;
  pmImprimir.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

end.
