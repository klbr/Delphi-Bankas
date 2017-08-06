unit Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, Mask, ToolEdit, StdCtrls, CurrEdit, Grids,
  DBGrids, RXDBCtrl, TFlatCheckBoxUnit, TFlatEditUnit, DBClient, Provider,
  IBCustomDataSet, IBQuery, DB;

type
  TfrmEntrada = class(TfrmFormCadatroMini)
    Label6: TLabel;
    edtCodigo: TEdit;
    edtCadastro: TDateEdit;
    Label16: TLabel;
    btnImprimir: TFlatSpeedButton;
    Label4: TLabel;
    edtFornecedor: TComboEdit;
    edtDescFornecedor: TLabel;
    Label1: TLabel;
    gbItemEntrada: TGroupBox;
    edtCodProduto: TEdit;
    edtDescricao: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edtPrecoUni: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtPrecoTotal: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    dbgProduto: TRxDBGrid;
    dsProduto: TDataSource;
    Label9: TLabel;
    edtFormapagamento: TComboEdit;
    edtDescFormaPagamento: TLabel;
    Label11: TLabel;
    edtQtdeTotal: TCurrencyEdit;
    Label12: TLabel;
    edtValorTotal: TCurrencyEdit;
    Label13: TLabel;
    edtValorQuitado: TCurrencyEdit;
    Label17: TLabel;
    edtMargem: TCurrencyEdit;
    edtDevolucao: TDateEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtEdicao: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    Label10: TLabel;
    edtEnviarDespesa: TCheckBox;
    btnApaga: TFlatSpeedButton;
    edthora: TEdit;
    edtRua: TComboEdit;
    Label19: TLabel;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    cbConsulta: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta2: TRxDBGrid;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel1: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel2: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    dsItem: TDataSource;
    FlatSpeedButton3: TFlatSpeedButton;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    Label18: TLabel;
    edtPrecompra: TCurrencyEdit;
    qrAtualizaItem: TIBQuery;
    qrProduto: TIBQuery;
    qrAtualiza: TIBQuery;
    tbProduto: TIBQuery;
    qrItem: TIBQuery;
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
    procedure edtDevolucaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnApagaClick(Sender: TObject);
    procedure edtCodProdutoEnter(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtFormapagamentoChange(Sender: TObject);
    procedure edtEdicaoEnter(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2CellClick(Column: TColumn);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtRuaEnter(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtPrecoUniEnter(Sender: TObject);
    procedure edtPrecoTotalEnter(Sender: TObject);
    procedure edtDevolucaoEnter(Sender: TObject);
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
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure edtFormapagamentoEnter(Sender: TObject);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoClick(Sender: TObject);
    procedure edtCodProdutoChange(Sender: TObject);
    procedure dbgItemDblClick(Sender: TObject);
    procedure edtFornecedorButtonClick(Sender: TObject);
    procedure edtRuaButtonClick(Sender: TObject);
    procedure qrNavegacaoAfterOpen(DataSet: TDataSet);
    procedure dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFechaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgConsulta2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    Operacao : Char;
//    Tipo : Char;
    Nav : Integer;
    procedure AtivarEdicao;
    procedure AtivarCodBarraPreco;
    function  ExisteItem:Boolean;
    function  ValidaItem:Boolean;
    function  ValidaEntradadeItem:Boolean;
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
//    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
  public
    Procedure AbreEntrada(Num : Integer);
  end;


var
  Permissao, Pegar : Boolean;
  NovoProduto : Boolean;
  ID, ID2, qtde2  : Integer;
  Devol : String[4];

implementation
uses Main, Principal, Consulta, EntradaR;
{$R *.dfm}

procedure TfrmEntrada.edtPrecoUniChange(Sender: TObject);
begin
  edtPrecoTotal.Value := edtQuantidade.Value * edtPrecoUni.Value;
  if edtMargem.Value > 0 then
    edtPrecompra.Value := StrtoFloatDef(FormatFloat('#0.00',edtPrecoUni.Value-(edtPrecoUni.Value*edtMargem.Value/100)),0); 
end;

procedure TfrmEntrada.Recalcula;
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
    Add('SELECT TOTAL, QUANTIDADE FROM ITEMENTRADA WHERE ITEMENTRADA=:ENTRADA ');
    Params.ParamByName('ENTRADA').AsInteger := StrparaInt(edtCodigo.Text);
    Open;
    edtValorTotal.Value := 0;
    edtQtdeTotal.Value := 0;
    if qrProduto.IsEmpty then
    begin
      Exit;
    end
    else
    begin
      First;
      while not (qrProduto.Eof) do
      begin
        edtValorTotal.Value := edtValorTotal.Value + qrProduto.FieldByName('TOTAL').AsFloat;
        edtQtdeTotal.Value := edtQtdeTotal.Value + qrProduto.FieldByName('QUANTIDADE').AsInteger;
        qrProduto.Next;
      end;
    end;
  end;}
  if (Trim(edtFormaPagamento.text) <> '') and (edtFormaPagamento.text <> '0') then
    edtValorQuitado.Value := ( (edtValorTotal.Value * (1 -  edtDesconto.Value/100)) * (1 - (LerDescontoFormaPagamento(edtFormaPagamento.text)/100)) );
end;

procedure TfrmEntrada.dbgProdutoCellClick(Column: TColumn);
begin
  PegaItem;
  edtCodProduto.SetFocus;
end;

procedure TfrmEntrada.PegaItem;
begin
  with dbgProduto do
  begin
    edtCodProduto.Text := DataSource.DataSet.FieldByName('CODBARRA').AsString;
    edtDescricao.text := DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    edtEdicao.text := DataSource.DataSet.FieldByName('EDICAO').AsString;
    edtQuantidade.text := DataSource.DataSet.FieldByName('QUANTIDADE').AsString;
    edtprecoUni.text := DataSource.DataSet.FieldByName('VALORUNI').AsString;
    edtDevolucao.date := DataSource.DataSet.FieldByName('DEVOLUCAO').AsDateTime;
    id2 := DataSource.DataSet.FieldByName('ID').asInteger;
    Devol := DataSource.DataSet.FieldByName('SIT').AsString;
    qtde2 := DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
    if DataSource.DataSet.FieldByName('RUA').AsString <> '' then
      edtRua.text := LerRua(DataSource.DataSet.FieldByName('RUA').AsString);
  end;
  Pegar := True;
end;

procedure TfrmEntrada.PegaItem2;
begin
  dbgProduto.SelectedIndex := 0;
  with dbgProduto do
  begin
    edtCodProduto.Text := DataSource.DataSet.FieldByName('CODBARRA').AsString;
    edtDescricao.text := DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    edtEdicao.text := DataSource.DataSet.FieldByName('EDICAO').AsString;
    edtQuantidade.text := DataSource.DataSet.FieldByName('QUANTIDADE').AsString;
    edtprecoUni.text := DataSource.DataSet.FieldByName('VALORUNI').AsString;
    edtDevolucao.date := DataSource.DataSet.FieldByName('DEVOLUCAO').AsDateTime;
    id2 := DataSource.DataSet.FieldByName('ID').asInteger;
    Devol := DataSource.DataSet.FieldByName('SIT').AsString;
    qtde2 := DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
    if DataSource.DataSet.FieldByName('RUA').AsString <> '' then
      edtRua.text := LerRua(DataSource.DataSet.FieldByName('RUA').AsString);
  end;
end;

function TfrmEntrada.validaSalva:boolean;
begin
  result := false;
  if trim(edtDescFornecedor.Caption) = '' then
  begin
    Exclusao2('Digite o Fornecedor.','Aviso');
    edtFornecedor.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmEntrada.Altera:boolean;
begin
  result := false;
  if not (validaAltera) then
    exit;

//  if caixa = caixaatual('ENTRADA',edtCodigo.text) then
//  begin
  with qrCadastro,qrCadastro.SQL do
  begin
    Clear;
    Add('UPDATE  ENTRADA  SET               ');
    Add('  DATA=:DATA,                      ');
    Add('  HORA=:HORA,                      ');
    Add('  MARGEM=:MARGEM,                  ');
    Add('  ENVIARDESPESAS=:ENVIARDESPESAS,  ');
    Add('  FORNECEDOR=:FORNECEDOR,          ');
    Add('  FORMAPAGAMENTO=:FORMAPAGAMENTO,  ');
    Add('  DESCONTO=:DESCONTO,              ');
    Add('  QUITACAO=:QUITACAO               ');
    Add('WHERE                              ');
    Add('  ENTRADA=:ENTRADA                 ');
    ParamByName('ENTRADA'       ).asInteger := strtoint(edtCodigo.text);
    ParamByName('DATA'          ).AsDateTime  := (edtCadastro.date);
    ParamByName('HORA'          ).asDateTime  := (StrToTimeDef(edthora.text,0));
    ParamByName('MARGEM'        ).asFloat   := edtMargem.Value;
    ParamByName('ENVIARDESPESAS').asString  := BparaS(edtEnviarDespesa.Checked);
    ParamByName('FORNECEDOR'    ).asInteger := strtoint(edtFornecedor.text);
    ParamByName('FORMAPAGAMENTO').asInteger := strtointdef(edtFormaPagamento.text,1);
    ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
    ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
//      if edtEnviarDespesa.Checked then
//      begin
//        if ExisteMovimento('Compra de Mercadorias',strtoint(edtCodigo.text)) then
//          GeraMovimentacao(edtCadastro.date, 'Compra de Mercadorias','DÉBITO',edtValorQuitado.Value,strparaint(edtFormaPagamento.text),strtoint(edtCodigo.text),'A')
//        else
//          GeraMovimentacao(edtCadastro.date, 'Compra de Mercadorias','DÉBITO',edtValorQuitado.Value,strparaint(edtFormaPagamento.text),strtoint(edtCodigo.text),'I');
//      end;
    result := true;
  end;
//  end
//  else
//    exclusao2('Não é possível alterar um caixa anterior','Aviso');
end;

procedure TfrmEntrada.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgProduto);
  CarregaGrid(dbgConsulta2);
  CarregaGrid(dbgItem);
  CarregarCampodePesquisa(Self.Name, cbConsulta);
  NovoProduto := false;
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM ENTRADA ORDER BY ENTRADA';  
  qrNavegacao.Open;
end;

procedure TfrmEntrada.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_ENTRADA');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnConsulta.Enabled := false;
  btnSalva.Enabled := true;
  edtCadastro.Date := now;
  edtHora.text := copy(timeToStr(now),1,5);
  Operacao := 'I';
  edtEnviarDespesa.Enabled := true;
  edtMargem.SetFocus;
  Permissao := true;
  Pegar := false;
  AtualizaGrid;
  ID :=0;
end;

procedure TfrmEntrada.btnAlteraClick(Sender: TObject);
begin
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtEnviarDespesa.Enabled := False;
  operacao := 'O';
  Id := UltimoId(StrToInt(edtCodigo.text), 'ITEMENTRADA') + 2;
  if caixa = caixaatual('ENTRADA',edtCodigo.text) then
    Permissao := true
  else
    Permissao := false;
end;

procedure TfrmEntrada.Exclui;
begin
  if (ExisteRegistro) then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM ENTRADA WHERE ENTRADA=:ENTRADA ');
         Params.ParamByName('ENTRADA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         while not tbProduto.IsEmpty do
         begin
           PegaItem2;
           btnApaga.Click;
         end;
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmEntrada.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmEntrada.LimpaCampos;
begin
  edtCodigo.text := '';
  edtCadastro.Text := '';
  edtHora.text := '';
  edtMargem.Value := 0;
  edtFornecedor.Text := '';
  edtFormaPagamento.Text := '';
  edtQtdeTotal.Value := 0;
  edtValorTotal.Value := 0;
  edtDesconto.Value := 0;
  edtValorQuitado.Value := 0;
  edtEnviarDespesa.Checked :=false;
  tbProduto.Close;
  cdsProduto.Close;
  LimpaCampoItem;
  edtDevolucao.Clear;
end;

procedure TfrmEntrada.btnExcluiClick(Sender: TObject);
begin
  if Exclusao('Deseja excluir esse registro?','Exclusão') then
  begin
    Exclui;
    fpBody.enabled := false;
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    btnExclui.Enabled := false;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
    edtEnviarDespesa.Enabled := False;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmEntrada.FPrior;
begin
  qrNavegacao.Prior;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmEntrada.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
  btnConsulta.Enabled := true;
  edtEnviarDespesa.Enabled := False;
end;

procedure TfrmEntrada.btnSalvaClick(Sender: TObject);
begin
  if Altera then
  begin
    edicao;
    //navegacao;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
    fpBody.Enabled := false;
    AtualizaNavegacao;
    edtEnviarDespesa.Enabled := False;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmEntrada.Navegacao;
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

procedure TfrmEntrada.Edicao;
begin
  if existeRegistro then
  begin
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
  end;
end;

procedure TfrmEntrada.FFirst;
begin
  qrNavegacao.First;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmEntrada.FNext;
begin
  qrNavegacao.Next;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmEntrada.FLast;
begin
  qrNavegacao.Last;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmEntrada.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmEntrada.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmEntrada.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmEntrada.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmEntrada.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if Key = VK_RETURN then
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
     btnCancela.Click;
 end
// else if Key = VK_ESCAPE then
// begin
//   edtFormaPagamento.SetFocus
// end
 else if key = Vk_F10 then
 begin
   edtConsulta.SetFocus;
 end;
end;

procedure TfrmEntrada.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmEntrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgProduto);
  SalvaGrid(dbgConsulta2);
  SalvaGrid(dbgItem);
  SalvarCampodePesquisa(Self.Name, cbConsulta.Text);
  loEntrada := nil;
  Action := caFree;
end;

procedure TfrmEntrada.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text             := FieldByName('ENTRADA'       ).asString;
    edtCadastro.date           := FieldByName('DATA'          ).AsDateTime;
    edthora.text               := HpV(FieldByName('HORA'     ).asDateTime);
    edtMargem.text             := FieldByName('MARGEM'        ).asString;
    edtEnviarDespesa.Checked   := SparaB(FieldByName('ENVIARDESPESAS').asString);
    edtFormaPagamento.text     := FieldByName('FORMAPAGAMENTO').asString;
    edtFornecedor.text         := FieldByName('FORNECEDOR'    ).asString;
    edtDesconto.text           := FieldByName('DESCONTO'      ).asString;
    edtValorQuitado.text       := FieldByName('QUITACAO'      ).asString;
    Operacao := 'O';

    if ExisteRegistro then
      AtualizaGrid;
  end;
  edicao;
end;

procedure TfrmEntrada.edtDevolucaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    if NovoProduto then
    begin
      if not (ValidaItem) then
      begin
        exclusao2('Preencha corretamente os campos','Aviso');
        exit;
      end;
      if ExisteProduto(FormataCodBarra(edtCodProduto.text)) then
      begin
        Exclusao2('Esse produto já está Cadastrado','Aviso');
        LimpaCampoItem;
        edtCodProduto.SetFocus;
        Exit;
      end
      else
      begin
        with qrProduto,qrProduto.SQL do
        begin
          Close;
          Clear;
          Add('INSERT INTO  ITEM (            ');
          Add('  ITEM,                        ');
          Add('  CADASTRO,                    ');
          Add('  DESCRICAO,                   ');
          Add('  GRUPO,                       ');
          Add('  CODBARRA,                    ');
          Add('  EDICAO,                      ');
          Add('  PRECOVENDA,                  ');
          Add('  PRECOCOMPRA,                 ');
          Add('  DESHABILITADO,               ');
          Add('  USARCODBARRA                 ');
          Add('  ) VALUES (                   ');
          Add('  :ITEM,                       ');
          Add('  :CADASTRO,                   ');
          Add('  :DESCRICAO,                  ');
          Add('  :GRUPO,                      ');
          Add('  :CODBARRA,                   ');
          Add('  :EDICAO,                     ');
          Add('  :PRECOVENDA,                 ');
          Add('  :PRECOCOMPRA,                ');
          Add('  :DESHABILITADO,              ');
          Add('  :USARCODBARRA           )    ');
          ParamByName('ITEM'         ).AsInteger := strtoint(SequencialUser('G_ITEM'));
          ParamByName('CADASTRO'     ).AsDateTime  := (Date);
          ParamByName('CODBARRA'     ).AsString  := FormataCodBarra(edtCodProduto.text);
          ParamByName('DESCRICAO'    ).AsString  := edtDescricao.text;
          ParamByName('EDICAO'       ).AsString  := BparaS(edtEdicao.AsInteger > 0);
          ParamByName('GRUPO'        ).AsInteger := ReceberGrupo;
          ParamByName('PRECOVENDA'   ).AsFloat   := edtPrecoUni.value;
          ParamByName('PRECOCOMPRA'  ).AsFloat   := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0);
//(edtPrecoUni.value-((edtPrecoUni.value*edtMargem.Value)/100))
//          else
//            ParamByName('PRECOCOMPRA'  ).AsFloat   := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0);//ReceberValorUni;
          ParamByName('DESHABILITADO').AsString  := 'N';
          ParamByName('USARCODBARRA' ).AsString   := BparaS(length(edtCodProduto.text) = 13);
          ExecSQL;
          frmPrincipal.ibtransacao.Commit;
          Exclusao2('Produto foi Salvo corretamente.','Aviso');
          NovoProduto := false;
          edtDescricao.ReadOnly := true;
          with frmPrincipal.cds do
          begin
             Append;
             FieldByName('CODBARRA'   ).AsString := FormataCodBarra(edtCodProduto.text);
             FieldByName('DESCRICAO'  ).AsString := edtDescricao.text;
             FieldByName('EDICAO'     ).AsString := BparaS(edtEdicao.AsInteger > 0);
             FieldByName('PRECOVENDA' ).AsFloat  := edtPrecoUni.Value;
             FieldByName('PRECOCOMPRA').AsFloat  := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0);//edtPrecoUni.Value;
             Post;
          end;
        end;
      end;
    end;

    if not Pegar then
    begin

      if ValidaEntradadeItem then
        SalvaItem;
    end
    else
      SalvaItem;

    edtCodProduto.SetFocus;
    LimpaCampoItem;
  end
//  else if Key = VK_ESCAPE then
//    edtFormaPagamento.SetFocus
  else if (Shift=[ssCtrl]) and ((key=90) or (key=122)) and (TEdit(Sender).Tag=10) then
    LimpaCampoItem;
end;

procedure TfrmEntrada.btnApagaClick(Sender: TObject);
Var
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
    Add('DELETE FROM ITEMENTRADA WHERE CODBARRA =:CODBARRA  AND EDICAO=:EDICAO AND ITEMENTRADA=:ITEM AND QUANTIDADE=:QTDE AND ID=:ID');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodProduto.text);
    Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
    Params.ParamByName('QTDE').AsInteger := edtQuantidade.AsInteger;
    Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
    Params.ParamByName('ID').AsInteger := id2;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
//    AtualizaEstoque((edtQuantidade.AsInteger*-1),FormataCodBarra(edtCodProduto.text),edtedicao.AsInteger);
    LimpaCampoItem;
  end;
  Recalcula;
end;

procedure TfrmEntrada.LimpaCampoItem;
begin
  edtCodProduto.Clear;
  edtDescricao.Clear;
  edtQuantidade.AsInteger := 1;
  edtRua.Clear;
  edtEdicao.AsInteger := 0;
  edtPrecoUni.Value := 0;
  edtPrecoTotal.Value := 0;
  edtPrecompra.Value := 0;
//  edtDevolucao.Clear;
end;

procedure TfrmEntrada.SalvaItem;
var
  Acho, localizou : Boolean;
  Q : Integer;
  T : Double;
  Codi, Pre : String;
  Edi : Integer;
begin
  if not (ValidaItem) then
  begin
    exclusao2('Preencha corretamente os campos','Aviso');
    exit;
  end;
  Q := 0;
  T := 0;
  if Pegar then
  begin
    if (Devol <> 'SIM') then
    begin

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
        begin
          Edit;
          FieldByname('QUANTIDADE').AsInteger := edtQuantidade.AsInteger;
          FieldByname('VALORUNI'  ).AsFloat   := edtPrecoUni.Value;
          FieldByname('TOTAL'     ).AsFloat   := edtPrecoTotal.value;
          FieldByName('RUA'       ).AsString  := LerDescricaoPorCampo('LOCALIZACAO',StrToIntdef(edtRua.text,0));
          if edtDevolucao.date <> 0 then
            FieldByName('DEVOLUCAO' ).AsDateTime:= edtDevolucao.date
          else
            FieldByName('DEVOLUCAO' ).AsVariant := Null;
          Post;
        end;
      end;

      with qrProduto,qrProduto.SQL do
      begin
        Close;
        Clear;
        Add('UPDATE ITEMENTRADA SET     ');
        Add('  QUANTIDADE=:QUANTIDADE,  ');
        Add('  PRECOCOMPRA=:PRECOCOMPRA,');
        Add('  VALORUNI=:VALORUNI,      ');
        Add('  TOTAL=:TOTAL,            ');
        Add('  DEVOLUCAO=:DEVOLUCAO,    ');
        Add('  RUA=:RUA                 ');
        Add('WHERE                      ');
        Add('  ITEMENTRADA=:ITEMENTRADA ');
        Add('AND                        ');
        Add('  CODBARRA=:CODBARRA       ');
        Add('AND                        ');
        Add('  ID=:ID                   ');
        Add('AND                        ');
        Add('  EDICAO=:EDICAO           ');
        ParamByName('ITEMENTRADA'  ).AsInteger := strParaint(edtCodigo.text);
        ParamByName('CODBARRA'     ).AsString  := FormataCodBarra(edtCodProduto.text);
        ParamByName('ID'           ).AsInteger := id2;
        ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
        ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
        ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
        ParamByName('PRECOCOMPRA'  ).AsFloat   := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0)*edtQuantidade.AsInteger; //PegarPrecoCompra(FormataCodBarra(edtCodProduto.text))* edtQuantidade.AsInteger;
        ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
        ParamByName('DEVOLUCAO'    ).AsDateTime:= (edtDevolucao.Date);
        ParamByName('RUA'          ).AsInteger := strTointDef(edtRua.text,0);
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
//        AtualizaEstoque((edtQuantidade.AsInteger-qtde2),FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
        Pegar := False;
        qtde2 := 0;
      end;
    end
    else
    begin
      Exclusao2('Não é possível alterar um produto já devolvido','Aviso');
    end;
  end
  else
  begin
    if not ExisteProdutoDevolvidoHoje(FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger, edtCadastro.Date) then
    begin
      with cdsproduto do
      begin
        First;
        localizou := False;
        while not (Eof) and not (Localizou) do
        begin
          Edi  := cdsproduto.FieldByName('EDICAO').AsInteger;
          Codi := cdsproduto.FieldByName('CODBARRA').AsString;
          Pre  := FormatFloat('#0.00', cdsproduto.FieldByName('VALORUNI').AsFloat);
          if ( Edi = edtEdicao.AsInteger) then
          begin
            if ( Pre = FormatFloat('#0.00', edtPrecoUni.Value)) then
            begin
              if (Codi = FormataCodBarra(edtCodProduto.text) ) then
              begin
                if (FieldByName('SIT').AsString <> 'SIM') then
                begin
                  if (FieldByName('DEVOLUCAO').AsDateTime = edtDevolucao.Date) then
                  begin
                    Localizou := True;
                    Edit;
                    Q := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                    T := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                    FieldByName('RUA'       ).AsString   := LerDescricaoPorCampo('LOCALIZACAO',StrToIntdef(edtRua.text,0));
                    FieldByName('QUANTIDADE').asinteger := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                    FieldByName('TOTAL').asFloat  := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                    Post;
                  end
                  else if FieldByName('DEVOLUCAO').AsString = '' then
                  begin
                    Localizou := True;
                    Edit;
                    Q := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                    T := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                    FieldByName('RUA'       ).AsString   := LerDescricaoPorCampo('LOCALIZACAO',StrToIntDef(edtRua.text,0));
                    FieldByName('QUANTIDADE').asinteger := cdsproduto.FieldByName('QUANTIDADE').asinteger + edtQuantidade.AsInteger;
                    FieldByName('TOTAL').asFloat  := cdsproduto.FieldByName('TOTAL').asFloat + edtPrecoTotal.value;
                    Post;
                  end;
                end;
              end;
            end;
          end;
          Next;
        end;
        if not Localizou then
        begin
          Append;
          FieldByName('CODBARRA'  ).asString   := FormataCodbarra(edtCodProduto.text);
          FieldByName('DESCRICAO' ).asString   := edtDescricao.Text;
          FieldByName('ID'        ).asinteger  := id;
          FieldByName('EDICAO'    ).asinteger  := edtEdicao.AsInteger;
          FieldByName('QUANTIDADE').asinteger  := edtQuantidade.AsInteger;
          FieldByName('RUA'       ).AsString   := LerDescricaoPorCampo('LOCALIZACAO',StrToIntDef(edtRua.text,0));
          if edtDevolucao.Date <> 0 then
            FieldByName('DEVOLUCAO' ).AsDateTime := edtDevolucao.date
          else
            FieldByName('DEVOLUCAO' ).AsVariant := Null;
          FieldByName('VALORUNI'  ).asFloat    := edtPrecoUni.Value;
          FieldByName('TOTAL'      ).asFloat   := edtPrecoTotal.value;
          Post;
        end;
      end;
      with qrProduto,qrProduto.SQL do
      begin
        Close;
        Clear;
        if not localizou then
        begin
          Add('INSERT INTO ITEMENTRADA (  ');
          Add('  ITEMENTRADA,             ');
          Add('  CODBARRA,                ');
          Add('  ID,                      ');
          Add('  EDICAO,                  ');
          Add('  PRECOCOMPRA,             ');
          Add('  QUANTIDADE,              ');
          Add('  VALORUNI,                ');
          Add('  TOTAL,                   ');
          Add('  DEVOLUCAO,               ');
          Add('  SITUACAO,                ');
          Add('  RUA                      ');
          Add('  ) VALUES (               ');
          Add('  :ITEMENTRADA,            ');
          Add('  :CODBARRA,               ');
          Add('  :ID,                     ');
          Add('  :EDICAO,                 ');
          Add('  :PRECOCOMPRA,            ');
          Add('  :QUANTIDADE,             ');
          Add('  :VALORUNI,               ');
          Add('  :TOTAL,                  ');
          Add('  :DEVOLUCAO,              ');
          Add('  :SITUACAO,               ');
          Add('  :RUA           )         ');
          ParamByName('ITEMENTRADA'  ).AsInteger := strParaint(edtCodigo.text);
          ParamByName('CODBARRA'     ).AsString  := FormataCodBarra(edtCodProduto.text);
          ParamByName('ID'           ).AsInteger := id;
          ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
          ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
          ParamByName('PRECOCOMPRA'  ).AsFloat   := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0)*edtQuantidade.AsInteger;//PegarPrecoCompra(FormataCodBarra(edtCodProduto.text)) * edtQuantidade.AsInteger;
          ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
          ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
          ParamByName('DEVOLUCAO'    ).AsDateTime  := (edtDevolucao.Date);
          ParamByName('SITUACAO'     ).AsString  := 'NÃO';
          ParamByName('RUA'          ).AsInteger := strparaint(edtRua.text);
          ExecSQL;
          frmPrincipal.ibtransacao.Commit;
          id := id +1;
//          AtualizaEstoque(edtQuantidade.AsInteger,FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
        end
        else
        begin
          Add('UPDATE ITEMENTRADA SET          ');
          Add('  QUANTIDADE  =:QUANTIDADE,     ');
          Add('  TOTAL       =:TOTAL,          ');
          Add('  PRECOCOMPRA =:PRECOCOMPRA,    ');
          Add('  RUA         =:RUA             ');
          Add('WHERE                           ');
          Add('  ITEMENTRADA=:ITEMENTRADA      ');
          Add('AND                             ');
          Add('  CODBARRA=:CODBARRA            ');
          Add('AND                             ');
          Add('  EDICAO      =:EDICAO          ');
          Add('AND                             ');
          Add('  SITUACAO    =:SITUACAO        ');
          Add('AND                             ');
          Add('  DEVOLUCAO   =:DEVOLUCAO       ');
          Add('AND                             ');
          Add('  VALORUNI    =:VALORUNI        ');
          ParamByName('ITEMENTRADA'  ).AsInteger := strParaint(edtCodigo.text);
          ParamByName('CODBARRA'     ).AsString  := FormataCodBarra(edtCodProduto.text);
          ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
          ParamByName('QUANTIDADE'   ).AsInteger := Q;//cdsProduto.FieldByName('QUANTIDADE').asInteger;//edtQuantidade.AsInteger;
          ParamByName('PRECOCOMPRA'  ).AsFloat   := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0)*Q;//PegarPrecoCompra(FormataCodBarra(edtCodProduto.text)) * Q;
          ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
          ParamByName('TOTAL'        ).AsFloat   := T;//cdsProduto.FieldByName('TOTAL').asFloat;//edtPrecoTotal.value;
          ParamByName('DEVOLUCAO'    ).AsDateTime := edtDevolucao.Date;
          ParamByName('SITUACAO'     ).AsString  := 'NÃO';
          ParamByName('RUA'          ).AsInteger := strparaint(edtRua.text);
          ExecSQL;
          frmPrincipal.ibtransacao.Commit;
          ID := ID +1;
//          AtualizaEstoque(edtQuantidade.AsInteger,FormataCodBarra(edtCodProduto.text),edtEdicao.AsInteger);
        end;
      end;
    end
    else
    begin
      Exclusao2('Não é possível dar entrada num produto devolvido','Aviso');
    end;
  end;
//  cdsProduto.Last;
  with frmPrincipal.cds do
  begin
    First;
    if Locate('CODBARRA',FormataCodBarra(edtCodProduto.Text),[loPartialKey]) then
    begin
      Edit;
      FieldByName('PRECOCOMPRA').AsFloat := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0);
      FieldByName('PRECOVENDA' ).AsFloat := edtPrecoUni.Value;
      Post;
    end;
  end;

  with qrAtualizaItem, qrAtualizaItem.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('UPDATE ITEM SET PRECOCOMPRA=:PRECOCOMPRA , PRECOVENDA=:PRECOVENDA WHERE CODBARRA=:COD ');
    ParamByName('COD').AsString := FormataCodBarra(edtCodProduto.Text);
    ParamByName('PRECOCOMPRA').AsFloat := StrtoFloatDef(FormatFloat('#0.00',edtPrecompra.Value),0);
    ParamByName('PRECOVENDA' ).AsFloat := edtPrecoUni.Value;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
  end;
  LimpaCampoItem;
  ReCalcula;
end;


function TfrmEntrada.ExisteItem: Boolean;
begin
  result := false;
  with qrAtualiza,qrAtualiza.SQL do
  begin
    Database := frmPrincipal.dba;
    close;
    Clear;
    Add('SELECT CODBARRA FROM ITEMENTRADA WHERE CODBARRA=:CODBARRA AND EDICAO=:EDICAO AND ITEMENTRADA=:ITEM ');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(edtCodProduto.text);
    Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
    Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
    Open;
    if qrAtualiza.RecordCount > 0 then
       Result := true;
  end;
end;

procedure TfrmEntrada.edtCodProdutoEnter(Sender: TObject);
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
    edtEnviarDespesa.Enabled := False;
  end;
end;

function TfrmEntrada.Salva: boolean;
begin
  result := false;
  if not (validaSalva) then
    exit;
  with qrCadastro,qrCadastro.SQL do
  begin
    Clear;
    Add('INSERT INTO ENTRADA  (          ');
    Add('  ENTRADA,                      ');
    Add('  DATA,                         ');
    Add('  HORA,                         ');
    Add('  MARGEM,                       ');
    Add('  ENVIARDESPESAS,               ');
    Add('  FORNECEDOR,                   ');
    Add('  DESCONTO,                     ');
    Add('  QUITACAO,                     ');
    Add('  CAIXA                         ');
    Add(') VALUES (                      ');
    Add('  :ENTRADA,                     ');
    Add('  :DATA,                        ');
    Add('  :HORA,                        ');
    Add('  :MARGEM,                      ');
    Add('  :ENVIARDESPESAS,              ');
    Add('  :FORNECEDOR,                  ');
    Add('  :DESCONTO,                    ');
    Add('  :QUITACAO,                    ');
    Add('  :CAIXA                        ');
    Add(')                               ');
    Params.ParamByName('ENTRADA'       ).asInteger := strtoint(edtCodigo.text);
    Params.ParamByName('DATA'          ).AsDateTime  := (edtCadastro.date);
    Params.ParamByName('HORA'          ).asDateTime  := (StrToTimeDef(edthora.text,0));
    Params.ParamByName('MARGEM'        ).asFloat   := edtMargem.Value;
    Params.ParamByName('ENVIARDESPESAS').asString  := BparaS(edtEnviarDespesa.Checked);
    Params.ParamByName('FORNECEDOR'    ).asInteger := strparaint(edtFornecedor.text);
    Params.ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
    Params.ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
    Params.ParamByName('CAIXA'         ).asInteger := Caixa;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;    
    //UpdCodigo('ENTRADA', strtoint(edtCodigo.text));
    result := true;
  end;
end;

function TfrmEntrada.validaAltera: boolean;
begin
  result := false;
  if not ValidaSalva then
    exit;
//  if cdsProduto.IsEmpty then
//  begin
//    exclusao2('Insira Produtos para efetuar a entrada.','Aviso');
//    edtCodProduto.SetFocus;
//    exit;
//  end;
  result := true;
end;

procedure TfrmEntrada.AtualizaGrid;
begin
  if edtCodigo.text = '' then
    Exit;
  cdsProduto.Close;
  with tbProduto,tbProduto.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT ITEMENTRADA.CODBARRA AS CODBARRA, ITEM.DESCRICAO AS DESCRICAO, LOCALIZACAO.DESCRICAO AS RUA, ITEMENTRADA.VALORUNI AS VALORUNI, ITEMENTRADA.SITUACAO AS SIT, ');
    Add(' ITEMENTRADA.TOTAL AS TOTAL, ITEMENTRADA.DEVOLUCAO AS DEVOLUCAO, ITEMENTRADA.QUANTIDADE AS QUANTIDADE, ITEMENTRADA.EDICAO AS EDICAO, ITEMENTRADA.ID AS ID  ');
    Add(' FROM ITEMENTRADA, ITEM, LOCALIZACAO WHERE ITEMENTRADA=:ENTRADA AND LOCALIZACAO.LOCALIZACAO=ITEMENTRADA.RUA  AND  ITEM.CODBARRA=ITEMENTRADA.CODBARRA       ');
    Params.ParamByName('ENTRADA').AsInteger := strtoint(edtCodigo.Text);
    Open;
  end;
  cdsProduto.open;
  ConfiguraGrid;
  edtValorTotal.Value := 0;
  edtQtdeTotal.Value := 0;
  if not cdsProduto.IsEmpty then
    Recalcula;
end;

function TfrmEntrada.ValidaItem: Boolean;
begin
  result := (trim(edtCodProduto.Text) <> '') and (edtDescricao.Text <> '') and (edtQuantidade.Value > 0) and (edtPrecoUni.Value > 0) and (edtPrecoTotal.Value > 0) and (trim(edtRua.text) <> '') and (LerDescricaoPorCampo('LOCALIZACAO',strtointdef(edtRua.text,0)) <> '');
end;

procedure TfrmEntrada.edtFornecedorChange(Sender: TObject);
begin
  if Trim(edtFornecedor.Text) <> '' then
    edtDescFornecedor.Caption := LerDescricaoPorCampo('FORNECEDOR',strtointDef(edtFornecedor.text,0))
  else
    edtDescFornecedor.Caption := '';
end;

procedure TfrmEntrada.edtFormapagamentoChange(Sender: TObject);
begin
  if (Trim(edtFormaPagamento.Text) <> '') and (edtFormaPagamento.text <> '0') then
  begin
    edtDescFormaPagamento.Caption := LerDescricaoPorCampo('FORMAPAGAMENTO',strtointDef(edtFormaPagamento.text,0));
    edtValorQuitado.Value := ( (edtValorTotal.Value * (1 -  edtDesconto.Value/100)) * (1 - (LerDescontoFormaPagamento(edtFormaPagamento.text)/100)) );
  end
  else
  begin
    edtDescFormaPagamento.Caption := '';
    edtValorQuitado.Value := 0;
  end;
end;

procedure TfrmEntrada.edtEdicaoEnter(Sender: TObject);
begin
  if not ValidaSalva then
    exit;
  if NovoProduto then
    exit;
  AtivarEdicao;
{  if PossuiEdicao(edtCodProduto.Text) then
  begin
    edtEdicao.SetFocus;
  end
  else
  begin
    edtEdicao.Value := 0;
    edtQuantidade.SetFocus;
  end;}
end;

procedure TfrmEntrada.btnConsultaClick(Sender: TObject);
begin
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
    Add('SELECT * FROM ENTRADA ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmEntrada.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    if cbConsulta.Text <> 'DATA' then
      Add('SELECT * FROM ENTRADA WHERE '+cbConsulta.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') )
    else
      Add('SELECT * FROM ENTRADA WHERE '+cbConsulta.Text+' = '''+DataValida(edtConsulta.Text)+''' ');
    Open;
  end;
end;

procedure TfrmEntrada.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta2 do
    begin
      SelectedIndex            := 0;
      edtCodigo.Text           :=  Fields[0].Text;
      edtCadastro.date         :=  Fields[2].AsDateTime;
      edtHora.text             :=  Hpv(Fields[3].AsDateTime);
      edtFornecedor.text       :=  Fields[4].Text;
      edtFormaPagamento.text   :=  Fields[5].Text;
      edtMargem.text           :=  Fields[6].Text;
      edtDesconto.text         :=  Fields[7].Text;
      edtValorQuitado.text     :=  Fields[8].Text;
      edtEnviarDespesa.Checked :=  SparaB(Fields[9].asString);

      if edtCodigo.text <> '' then
      begin
        AtualizaGrid;
//        Recalcula;
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
    //cbConsulta.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
  end
  else if key = VK_ESCAPE then
  begin
    //cbConsulta.ItemIndex := 0;
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
  else if key = Vk_F9 then
  begin
    cbConsulta.SetFocus;
  end;
end;

procedure TfrmEntrada.dbgConsulta2CellClick(Column: TColumn);
begin
  with dbgConsulta2 do
  begin
    edtCodigo.Text           :=  Fields[0].Text;
    edtCadastro.date         :=  Fields[2].AsDateTime;
    edtHora.text             :=  HpV(Fields[3].AsDateTime);
    edtFornecedor.text       :=  Fields[4].Text;
    edtFormaPagamento.text   :=  Fields[5].Text;
    edtMargem.text           :=  Fields[6].Text;
    edtDesconto.text         :=  Fields[7].Text;
    edtValorQuitado.text     :=  Fields[8].Text;
    edtEnviarDespesa.Checked :=  SparaB(Fields[9].asString);

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
  //cbConsulta.ItemIndex := 0;
  edtConsulta.Text := '';
  pConsulta.Visible :=false;
  fpBody.Enabled := false;
  btnConsulta.Enabled := true;
end;

procedure TfrmEntrada.edtDescricaoEnter(Sender: TObject);
begin
  if not ValidaSalva then
    exit;
end;

procedure TfrmEntrada.edtRuaEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmEntrada.edtQuantidadeEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmEntrada.edtPrecoUniEnter(Sender: TObject);
begin
  ValidaSalva;
  if Novoproduto then
    if edtMargem.Value <= 0 then
      edtPrecompra.Enabled := True;
end;

procedure TfrmEntrada.edtPrecoTotalEnter(Sender: TObject);
begin
  ValidaSalva;
  if Novoproduto then
    if edtMargem.Value <= 0 then
      edtPrecompra.Enabled := True;
end;

procedure TfrmEntrada.edtDevolucaoEnter(Sender: TObject);
begin
  ValidaSalva;
end;

procedure TfrmEntrada.ConsultaItem;
begin
  edtCodBarra.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmEntrada.edtCodBarraKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmEntrada.FechaConsultaItem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodProduto.setFocus;
  pItem.Visible := false;
end;

procedure TfrmEntrada.edtCodBarraChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmEntrada.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
      edtCodProduto.text := Floattostr(StrtofloatDef(Fields[0].Text,0));
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;  
end;

procedure TfrmEntrada.dbgItemCellClick(Column: TColumn);
begin
  edtCodProduto.text := Floattostr(StrtofloatDef(dbgItem.Fields[0].Text,0));
  FechaConsultaItem;
end;

procedure TfrmEntrada.pItemExit(Sender: TObject);
begin
  FechaConsultaItem;
end;

procedure TfrmEntrada.edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
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
     btnCancela.Click
   else if ((key=90) or (key=122)) and (TEdit(Sender).Tag=10) then
     LimpaCampoItem;
 end;
// else if Key = VK_ESCAPE then
//   edtFormaPagamento.SetFocus;
end;

procedure TfrmEntrada.edtValorQuitadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if Exclusao('Deseja Salvar e Iniciar novo registro?','Confirmação do Sistema') then
    begin
      btnSalva.Click;
      btnInclui.Click;
    end;
  end;
end;

procedure TfrmEntrada.FlatSpeedButton3Click(Sender: TObject);
begin
  if frmPrincipal.Fornecedores1.Enabled then
    frmPrincipal.Fornecedores1Click(Sender);
end;

procedure TfrmEntrada.FlatSpeedButton1Click(Sender: TObject);
begin
  if frmPrincipal.FormadePagamento1.Enabled then
    frmPrincipal.FormadePagamento1Click(Sender);
end;

procedure TfrmEntrada.FlatSpeedButton2Click(Sender: TObject);
begin
  ConsultaItem;
end;

procedure TfrmEntrada.edtFormapagamentoEnter(Sender: TObject);
begin
  if Trim(edtFormaPagamento.text) = '' then
    edtFormaPagamento.text := '1';
end;

procedure TfrmEntrada.edtCodProdutoKeyPress(Sender: TObject;
  var Key: Char);
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
//      edtDescricao.Text := LerCodBarra(edtCodProduto.Text);
//      edtPrecoUni.Value := LerValorUni(edtCodProduto.Text,'E');
      AtivarCodBarraPreco;
      if edtDescricao.text = '' then
      begin
        if Exclusao('Produto não Cadastrado! Deseja cadastrar agora?','Produto não encontrado' ) then
        begin
          Novoproduto := true;
          edtDescricao.ReadOnly := false;
          exclusao2('Digite a Descrição do Produto. Lembre-se: Caso digite uma edição Diferente de 0 (Zero), é considerado "Possui Edição".','Aviso');
          edtDescricao.SetFocus;
        end;
      end
      else
        edtRua.SetFocus;
    end;
  end;
end;

procedure TfrmEntrada.edtCodigoClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TfrmEntrada.edtCodProdutoChange(Sender: TObject);
begin
  Pegar := False;
end;

procedure TfrmEntrada.AtivarCodBarraPreco;
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
      begin
        edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
        edtPrecompra.Value:= cds.FieldByName('PRECOCOMPRA').AsFloat;
        edtPrecompra.Enabled := edtMargem.Value = 0;
        if edtMargem.Value > 0 then
          edtPrecompra.Value := StrtoFloatDef(FormatFloat('#0.00',edtPrecoUni.Value-(edtPrecoUni.Value*edtMargem.Value/100)),0);
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) < 13 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
        edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
      else
        edtDescricao.Text := '';
      if not (edtDescricao.text = '') then
      begin
        edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
        edtPrecompra.Value:= cds.FieldByName('PRECOCOMPRA').AsFloat;
        edtPrecompra.Enabled := edtMargem.Value = 0;
        if edtMargem.Value > 0 then
          edtPrecompra.Value := StrtoFloatDef(FormatFloat('#0.00',edtPrecoUni.Value-(edtPrecoUni.Value*edtMargem.Value/100)),0);
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) = 13 then
    begin
      {se o codigo for menor que 999.999 (seis caracteres para o codigo)}
      if StrToFloatDef(Copy(edtCodProduto.Text,1,6),0) <= 999999 then
      begin
        if cds.FindKey(['0'+Copy(FormataCodBarra(edtCodProduto.Text),1,12)]) then
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
        begin
          edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
          edtPrecompra.Value:= cds.FieldByName('PRECOCOMPRA').AsFloat;
          edtPrecompra.Enabled := edtMargem.Value = 0;
          if edtMargem.Value > 0 then
            edtPrecompra.Value := StrtoFloatDef(FormatFloat('#0.00',edtPrecoUni.Value-(edtPrecoUni.Value*edtMargem.Value/100)),0);
        end;
      end
      else
      begin
        if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
          edtDescricao.Text := cds.FieldByName('DESCRICAO').AsString
        else
          edtDescricao.Text := '';
        if not (edtDescricao.text = '') then
        begin
          edtPrecoUni.Value := cds.FieldByName('PRECOVENDA').AsFloat;
          edtPrecompra.Value:= cds.FieldByName('PRECOCOMPRA').AsFloat;
          edtPrecompra.Enabled := edtMargem.Value = 0;
          if edtMargem.Value > 0 then
            edtPrecompra.Value := StrtoFloatDef(FormatFloat('#0.00',edtPrecoUni.Value-(edtPrecoUni.Value*edtMargem.Value/100)),0);
        end;
      end;
    end;
  end;
end;

procedure TfrmEntrada.AtivarEdicao;
begin
  with frmPrincipal do
  begin
    cds.First;
    cds.IndexFieldNames := 'CODBARRA';
    if Length(Trim(edtCodProduto.Text)) <= 6 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
      begin
        if SparaB(cds.FieldByName('EDICAO').AsString) then
          edtEdicao.SetFocus
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
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) < 13 then
    begin
      if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
      begin
        if SparaB(cds.FieldByName('EDICAO').AsString) then
          edtEdicao.SetFocus
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
      end;
    end

    else if Length(Trim(edtCodProduto.Text)) = 13 then
    begin
      {se o codigo for menor que 999.999 (seis caracteres para o codigo)}
      if StrToFloatDef(Copy(edtCodProduto.Text,1,6),0) <= 999999 then
      begin
        if cds.FindKey(['0'+Copy(FormataCodBarra(edtCodProduto.Text),1,12)]) then
        begin
          if SparaB(cds.FieldByName('EDICAO').AsString) then
            edtEdicao.SetFocus
          else
          begin
            edtEdicao.Value := 0;
            edtQuantidade.SetFocus;
          end;
        end
        else
        begin
          cds.First;
          if cds.FindKey([FormataCodBarra(edtCodProduto.Text)]) then
          begin
            if SparaB(cds.FieldByName('EDICAO').AsString) then
              edtEdicao.SetFocus
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
          end;
        end;
      end
      else
      begin
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
        end;
      end;
    end;
  end;
end;

procedure TfrmEntrada.AbreEntrada(Num: Integer);
begin
  with qrItem, qrItem.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM ENTRADA WHERE ENTRADA = :ENTRADA  ');
    Params.ParamByName('ENTRADA').AsInteger := Num;
    Open;
    edtCodigo.text             := FieldByName('ENTRADA'       ).asString;
    edtCadastro.date           := FieldByName('DATA'          ).AsDateTime;
    edthora.text               := HpV(FieldByName('HORA'     ).asDateTime);
    edtMargem.text             := FieldByName('MARGEM'        ).asString;
    edtEnviarDespesa.Checked   := SparaB(FieldByName('ENVIARDESPESAS').asString);
    edtFormaPagamento.text     := FieldByName('FORMAPAGAMENTO').asString;
    edtFornecedor.text         := FieldByName('FORNECEDOR'    ).asString;
    edtDesconto.text           := FieldByName('DESCONTO'      ).asString;
    edtValorQuitado.text       := FieldByName('QUITACAO'      ).asString;
    Operacao := 'O';
    if ExisteRegistro then
      AtualizaGrid;
  end;
  edicao;
end;

procedure TfrmEntrada.dbgItemDblClick(Sender: TObject);
begin
  edtCodProduto.text := Floattostr(StrtofloatDef(dbgItem.Fields[0].Text,0));
  FechaConsultaItem;
end;

procedure TfrmEntrada.edtFornecedorButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+76+88, Left+15, 'FORN');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmEntrada.edtRuaButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+115+60+78, Left+331+10, 'RUA');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmEntrada.ConfiguraGrid;
begin
  with cdsProduto do
  begin
    TNumericField(FieldByName('VALORUNI')).DisplayFormat := '#0.00';
    TNumericField(FieldByName('TOTAL'   )).DisplayFormat := '#0.00';
  end;
end;

procedure TfrmEntrada.qrNavegacaoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(qrNavegacao.FieldByName('QUITACAO')).DisplayFormat := '#,##0.00';
  TNumericField(qrNavegacao.FieldByName('DESCONTO')).DisplayFormat := '#,##0.00 %';
  TNumericField(qrNavegacao.FieldByName('MARGEM')).DisplayFormat := '#,##0.00 %';
  TDateTimeField(qrNavegacao.FieldByName('HORA')).DisplayFormat := 'HH:MM';
end;

procedure TfrmEntrada.dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    cbConsulta.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmEntrada.btnFechaClick(Sender: TObject);
begin
  if Operacao = 'O' then
    Altera;

  inherited;
end;

procedure TfrmEntrada.btnImprimirClick(Sender: TObject);
begin
  try
    TButton(Sender).Enabled := False;
    if not ExisteRegistro then
    begin
      Exclusao2('Não existe nenhum registro ativo. Escolha um e tente novamento','Aviso');
      Exit;
    end;
    with TfrmEntradaR.Create(Application) do
    begin
      Entrada := StrtoIntDef(edtCodigo.Text,0);
      PreviewModal;
      Free;
    end;
  finally
    TButton(Sender).Enabled := True;
  end;
end;

procedure TfrmEntrada.dbgItemKeyDown(Sender: TObject; var Key: Word;
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

function TfrmEntrada.ValidaEntradadeItem: Boolean;
var
  qrQ1 : TIBQuery;
begin
  Result := False;
  qrQ1 := TIBQuery.Create(nil);
  try
    qrQ1.Database := frmPrincipal.dba;
    with qrQ1, qrQ1.SQL do
    begin
      Clear;
      Close;
      Add('SELECT                                     ');
      Add('  ITEMENTRADA.ITEMENTRADA                  ');
      Add('FROM                                       ');
      Add('  ENTRADA,                                 ');
      Add('  ITEMENTRADA                              ');
      Add('WHERE                                      ');
      Add('  ITEMENTRADA.CODBARRA=:CODBARRA           ');
      Add('AND                                        ');
      Add('  ITEMENTRADA.SITUACAO <> ''SIM''          ');
      Add('AND                                        ');
      Add('  ITEMENTRADA.EDICAO = :EDICAO             ');
      Add('AND                                        ');
      Add('  ITEMENTRADA.ITEMENTRADA=ENTRADA.ENTRADA  ');
      Add('AND                                        ');
      Add('  ENTRADA.FORNECEDOR=:FORNECEDOR           ');
      ParamByName('CODBARRA'  ).AsString  := FormataCodBarra(edtCodProduto.Text);
      ParamByName('EDICAO'    ).AsInteger := edtEdicao.AsInteger;
      ParamByName('FORNECEDOR').AsInteger := StrtoIntDef(edtFornecedor.Text,0);
      Open;
      if not (IsEmpty) and (edtEdicao.AsInteger > 0) then
        Exclusao2('Este produto está na Entrada nº '+qrQ1.fieldByName('ITEMENTRADA').AsString+'. Não é permitido entrada dupla de mercadoria com edição não devolvida!','Aviso de Entrada Dupla')
      else
        Result := True;
    end;
  finally
    qrQ1.Close;
    qrQ1.Destroy;
  end;
end;

procedure TfrmEntrada.dbgProdutoDrawColumnCell(Sender: TObject;
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

procedure TfrmEntrada.dbgConsulta2DrawColumnCell(Sender: TObject;
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

end.
