unit Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, Grids, DBGrids, RXDBCtrl, CurrEdit, StdCtrls,
  ToolEdit, Mask, ASGSQLite, DB, TFlatSpeedButtonUnit, ComCtrls, ExtCtrls,
  TFlatPanelUnit, TFlatEditUnit, TFlatCheckBoxUnit;

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
    pConsultaRapida: TFlatPanel;
    Label18: TLabel;
    dbgConsulta: TRxDBGrid;
    edtCampo: TFlatEdit;
    edtDesconto: TCurrencyEdit;
    Label10: TLabel;
    dsProduto: TDataSource;
    qrProduto: TASQLiteQuery;
    tbProduto: TASQLiteQuery;
    qrConsulta: TASQLiteQuery;
    dsConsulta: TDataSource;
    Label14: TLabel;
    edtCliente: TComboEdit;
    edtDescCLiente: TLabel;
    qrAtualiza: TASQLiteQuery;
    edtHora: TEdit;
    procedure edtPrecoUniChange(Sender: TObject);
    procedure dbgProdutoCellClick(Column: TColumn);
    procedure edtFormapagamentoButtonClick(Sender: TObject);
    procedure dbgConsultaCellClick(Column: TColumn);
    procedure edtFuncionarioButtonClick(Sender: TObject);
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
    procedure pConsultaRapidaExit(Sender: TObject);
    procedure edtCampoChange(Sender: TObject);
    procedure edtCodProdutoEnter(Sender: TObject);
    procedure edtFuncionarioChange(Sender: TObject);
    procedure edtFormapagamentoChange(Sender: TObject);
    procedure edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtCampoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Operacao : Char;
    Tipo : Char;
    function  ExisteItem:Boolean;
    function  ValidaItem:Boolean;
    procedure SalvaItem;
    procedure Recalcula;
    procedure PegaItem;
    procedure AbreConsulta;
    procedure ConsultaRapidaOK;
    procedure ConsultaRapida;
    procedure LimpaCampoItem;
    procedure AtualizaGrid;
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
    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
  public
    { Public declarations }
  end;

implementation
uses Main, Principal;

{$R *.dfm}

procedure TfrmSaida.edtPrecoUniChange(Sender: TObject);
begin
  edtPrecoTotal.Value := edtQuantidade.Value * edtPrecoUni.Value;
end;

procedure TfrmSaida.Recalcula;
begin
  with qrProduto,qrProduto.SQL do
  begin
    Close;
    Clear;
    Add('SELECT TOTAL, QUANTIDADE FROM ITEMSAIDA WHERE ITEMSAIDA=:SAIDA ');
    Params.ParamByName('SAIDA').AsInteger := StrparaInt(edtCodigo.Text);
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
  end;
  if Trim(edtFormaPagamento.text) <> '' then
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
    edtCodProduto.Text := Fields[0].AsString;
    edtDescricao.text := Fields[1].AsString;
    edtEdicao.value := Fields[2].AsInteger;
    edtQuantidade.value := Fields[3].AsInteger;
    edtprecoUni.value := Fields[4].AsFloat;
  end;
end;

procedure TfrmSaida.edtFormapagamentoButtonClick(Sender: TObject);
begin
  tipo := 'F';
  AbreConsulta;
end;

procedure TfrmSaida.AbreConsulta;
begin
  with qrConsulta, qrConsulta.SQL do
  begin
    Close;
    Clear;
    if tipo = 'F' then
    begin
      Add('SELECT FORMAPAGAMENTO AS CODIGO, DESCRICAO FROM FORMAPAGAMENTO ');
      pConsultaRapida.Top := 322;
      pconsultarapida.Left := 73;
    end
    else if Tipo = 'U' then
    begin
      Add('SELECT FUNCIONARIO AS CODIGO, DESCRICAO FROM FUNCIONARIO ');
      pConsultaRapida.Top := 39;
      pconsultarapida.Left := 407;
    end
    else
    begin
      Add('SELECT CLIENTE AS CODIGO, DESCRICAO FROM CLIENTE ');
      pConsultaRapida.Top := 80;
      pconsultarapida.Left := 125;
    end;
    Open;
  end;
  pConsultaRapida.Visible := true;
  edtCampo.SetFocus;
end;

procedure TfrmSaida.dbgConsultaCellClick(Column: TColumn);
begin
  ConsultaRapidaOK;
end;

procedure TfrmSaida.ConsultaRapidaOK;
begin
  if not qrConsulta.IsEmpty then
  begin
    with dbgConsulta do
    begin
      if Tipo = 'F' then
      begin
        edtFormaPagamento.Text := Fields[0].AsString;
        edtDescFormaPagamento.Caption := Fields[1].AsString;
        edtDesconto.SetFocus;
      end
      else if Tipo = 'U'  then
      begin
        edtFuncionario.Text := Fields[0].AsString;
        edtDescFuncionario.Caption := Fields[1].AsString;
        edtCliente.SetFocus;
      end
      else
      begin
        edtCliente.Text := Fields[0].AsString;
        edtDescCliente.Caption := Fields[1].AsString;
        edtCodProduto.SetFocus;
      end;
    end;
  end;
  pConsultaRapida.Visible := false;
  qrConsulta.Close;
  edtCampo.Text := '';
end;

procedure TfrmSaida.ConsultaRapida;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Clear;
    if tipo = 'F' then
    begin
      Add('SELECT FORMAPAGAMENTO AS CODIGO, DESCRICAO FROM FORMAPAGAMENTO WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+' ');
    end
    else if Tipo = 'U' then
    begin
      Add('SELECT FUNCIONARIO AS CODIGO, DESCRICAO FROM FUNCIONARIO WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+' ');
    end
    else
    begin
      Add('SELECT CLIENTE AS CODIGO, DESCRICAO FROM CLIENTE WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+' ');
    end;
    Open;
  end;
end;

procedure TfrmSaida.edtFuncionarioButtonClick(Sender: TObject);
begin
  tipo := 'U';
  AbreConsulta;
end;

function TfrmSaida.validaSalva:boolean;
begin
  result := false;
  if trim(edtFuncionario.text) = '' then
  begin
    Exclusao2('Digite o Funcionário.','Aviso');
    edtFuncionario.setFocus;
    exit;
  end;
  if trim(edtCliente.text) = '' then
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

  if caixa = caixaatual('SAIDA',edtCodigo.text)  then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  SAIDA    SET               ');
      Add('  DATA=:DATA,                      ');
      Add('  HORA=:HORA,                      ');
      Add('  FUNCIONARIO=:FUNCIONARIO,        ');
      Add('  CLIENTE=:CLIENTE,                ');
      Add('  FORMAPAGAMENTO=:FORMAPAGAMENTO,  ');
      Add('  DESCONTO=:DESCONTO,              ');
      Add('  QUITACAO=:QUITACAO               ');
      Add('WHERE                              ');
      Add('  SAIDA=:SAIDA                     ');
      Params.ParamByName('SAIDA'         ).asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DATA'          ).asDate    := edtCadastro.date;
      Params.ParamByName('HORA'          ).asTime    := StrToTime(edthora.text);
      Params.ParamByName('FUNCIONARIO'   ).asInteger := strparaint(edtFuncionario.Text);
      Params.ParamByName('CLIENTE'       ).asinteger := strparaint(edtCliente.text);
      Params.ParamByName('FORMAPAGAMENTO').asInteger := strtointdef(edtFormaPagamento.text,0);
      Params.ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
      Params.ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
      ExecSQL;
      GeraMovimentacao(edtCadastro.date, 'Venda de Mercadorias','CRÉDITO',edtValorQuitado.Value,strparaint(edtFormaPagamento.text),strtoint(edtCodigo.text),'A');
      result := true;
    end;
  end
  else
    exclusao2('Não é possível alterar um caixa anterior','Aviso');
end;

procedure TfrmSaida.FormShow(Sender: TObject);
begin
  if not ConectaBanco(dbCadastro) then
  begin
    Exclusao2('Não foi possível conectar ao banco.', 'Erro no Sistema');
    Close;
  end
  else
  begin
    with qrNavegacao,qrNavegacao.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM SAIDA WHERE BAIXADO=:FALSE ');
      Params.ParamByName('FALSE').AsBoolean := False;
      Open;
    end;
  end;
end;

procedure TfrmSaida.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('SAIDA');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  edtCadastro.Date := now;
  edtHora.text := copy(timeToStr(now),1,5);
  Operacao := 'I';
  edtFuncionario.SetFocus;
end;

procedure TfrmSaida.btnAlteraClick(Sender: TObject);
begin
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
end;

procedure TfrmSaida.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM SAIDA WHERE SAIDA=:SAIDA  ');
         Params.ParamByName('SAIDA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         Close;
         Clear;
         Add('DELETE FROM MOVIMENTO WHERE CODIGO=:SAIDA AND TIPO=''CRÉDITO'' AND DESCRICAO=''Venda de Mercadorias'' ');
         Params.ParamByName('SAIDA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmSaida.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '') or (edtCodigo.Text <> '0');
end;

{procedure TfrmUsuario.Consulta;
var
  vConsulta : TfrmConsulta;
begin
  vConsulta := TfrmConsulta.
end;}

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
  tbProduto.Close;
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
    btnExclui.Enabled := false;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmSaida.FPrior;
begin
  qrNavegacao.Prior;
  SetRegistroNavegacao;
  Navegacao;
end;

procedure TfrmSaida.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
end;

procedure TfrmSaida.btnSalvaClick(Sender: TObject);
begin
  if Altera then
  begin
    edicao;
    navegacao;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    fpBody.Enabled := false;
    AtualizaNavegacao;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

procedure TfrmSaida.Navegacao;
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
end;

procedure TfrmSaida.Edicao;
begin
  if existeRegistro then
  begin
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
  end;
end;

procedure TfrmSaida.FFirst;
begin
  qrNavegacao.First;
  SetRegistroNavegacao;
  Navegacao;
end;

Procedure TfrmSaida.FNext;
begin
  qrNavegacao.Next;
  SetRegistroNavegacao;
  Navegacao;
end;

Procedure TfrmSaida.FLast;
begin
  qrNavegacao.Last;
  SetRegistroNavegacao;
  Navegacao;
end;

procedure TfrmSaida.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmSaida.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmSaida.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmSaida.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmSaida.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
 if Key = VK_NEXT then
   FNext;
 if Key = VK_PRIOR then
   FPrior;
 if Key = VK_END then
   FLast;
 if Key = VK_HOME then
   FFirst;
 if Key = VK_INSERT then
   edtFormaPagamento.SetFocus;
end;

procedure TfrmSaida.AtualizaNavegacao;
begin
  with qrNavegacao,qrNavegacao.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM SAIDA WHERE BAIXADO=:FALSE ');
    Params.ParamByName('FALSE').AsBoolean := False;
    Open;
  end;
end;

procedure TfrmSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  loSaida := nil;
  Action := caFree;
end;

procedure TfrmSaida.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text             := FieldByName('SAIDA'         ).asString;
    edtCadastro.date           := FieldByName('DATA'          ).AsDateTime;
    edthora.text               := FieldByName('HORA'          ).asString;
    edtCliente.text            := FieldByName('CLIENTE'       ).asString;
    edtFuncionario.text        := FieldByName('FUNCIONARIO'   ).asString;
    edtFormaPagamento.text     := FieldByName('FORMAPAGAMENTO').asString;
    edtDesconto.Value          := FieldByName('DESCONTO'      ).asFloat;
    edtValorQuitado.Value      := FieldByName('QUITACAO'      ).asFloat;
    Operacao := 'O';

    AtualizaGrid;
    Recalcula;
  end;
  edicao;
end;

procedure TfrmSaida.btnApagaClick(Sender: TObject);
begin
  if Exclusao('Tem certeza que quer excluir esse item da entrada?','Aviso de Exclusão') then
  begin
    with qrProduto, qrProduto.SQL do
    begin
      Clear;
      Add('DELETE FROM ITEMSAIDA WHERE CODBARRA =:CODBARRA  AND EDICAO=:EDICAO AND ITEMSAIDA=:ITEM ');
      Params.ParamByName('CODBARRA').AsInteger := strparaint(edtCodProduto.text);
      Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
      Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
      ExecSQL;
      AtualizaGrid;
      LimpaCampoItem;
      Recalcula;
    end;
  end;
end;

procedure TfrmSaida.LimpaCampoItem;
begin
  edtCodProduto.Clear;
  edtDescricao.Clear;
  edtQuantidade.AsInteger := 1;
  edtEdicao.AsInteger := 0;
  edtPrecoUni.Value := 0;
  edtPrecoTotal.Value := 0;
end;

procedure TfrmSaida.SalvaItem;
begin
  if not ValidaItem then
  begin
    exclusao2('Preencha corretamente os campos','Aviso');
    exit;
  end;
  if ExisteItem then
  begin
    if exclusao('Deseja atualizar este produto?','Aviso de Alteração') then
    begin
      with qrProduto,qrProduto.SQL do
      begin
        Close;
        Clear;
        Add('UPDATE ITEMSAIDA   SET         ');
        Add('  DESCRICAO=:DESCRICAO,        ');
        Add('  QUANTIDADE=:QUANTIDADE,      ');
        Add('  VALORUNI=:VALORUNI,          ');
        Add('  TOTAL=:TOTAL                 ');
        Add('WHERE                          ');
        Add('  ITEMSAIDA=:ITEMSAIDA         ');
        Add('AND                            ');
        Add('  CODBARRA=:CODBARRA           ');
        Add('AND                            ');
        Add('  EDICAO=:EDICAO               ');
        Params.ParamByName('ITEMSAIDA'    ).AsInteger := strParaint(edtCodigo.text);
        Params.ParamByName('CODBARRA'     ).AsInteger := strParaint(edtCodProduto.text);
        Params.ParamByName('DESCRICAO'    ).AsString  := edtDescricao.text;
        Params.ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
        Params.ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
        Params.ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
        Params.ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
        ExecSQL;
      end;
    end;
  end
  else
  begin
    with qrProduto,qrProduto.SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO ITEMSAIDA   (  ');
      Add('  ITEMSAIDA,               ');
      Add('  CODBARRA,                ');
      Add('  DESCRICAO,               ');
      Add('  EDICAO,                  ');
      Add('  QUANTIDADE,              ');
      Add('  VALORUNI,                ');
      Add('  TOTAL                    ');
      Add('  ) VALUES (               ');
      Add('  :ITEMSAIDA,              ');
      Add('  :CODBARRA,               ');
      Add('  :DESCRICAO,              ');
      Add('  :EDICAO,                 ');
      Add('  :QUANTIDADE,             ');
      Add('  :VALORUNI,               ');
      Add('  :TOTAL  )                ');
      Params.ParamByName('ITEMSAIDA'    ).AsInteger := strParaint(edtCodigo.text);
      Params.ParamByName('CODBARRA'     ).AsInteger := strParaint(edtCodProduto.text);
      Params.ParamByName('DESCRICAO'    ).AsString  := edtDescricao.text;
      Params.ParamByName('EDICAO'       ).AsInteger := edtEdicao.AsInteger;
      Params.ParamByName('QUANTIDADE'   ).AsInteger := edtQuantidade.AsInteger;
      Params.ParamByName('VALORUNI'     ).AsFloat   := edtPrecoUni.Value;
      Params.ParamByName('TOTAL'        ).AsFloat   := edtPrecoTotal.value;
      ExecSQL;
    end;
  end;
  LimpaCampoItem;
  AtualizaGrid;
  ReCalcula;
end;


function TfrmSaida.ExisteItem: Boolean;
begin
  result := false;
  with qrAtualiza,qrAtualiza.SQL do
  begin
    close;
    Clear;
    Add('SELECT CODBARRA FROM ITEMSAIDA WHERE CODBARRA=:CODBARRA AND EDICAO=:EDICAO AND ITEMSAIDA=:ITEM ');
    Params.ParamByName('CODBARRA').AsString := edtCodProduto.text;
    Params.ParamByName('EDICAO').AsInteger := edtedicao.AsInteger;
    Params.ParamByName('ITEM').AsInteger := strtoint(edtCodigo.text);
    Open;
    if qrAtualiza.RecordCount > 0 then
       Result := true;
  end;
end;

procedure TfrmSaida.pConsultaRapidaExit(Sender: TObject);
begin
  qrConsulta.Close;
  pConsultaRapida.Visible := false;
  edtCampo.Text := '';
end;

procedure TfrmSaida.edtCampoChange(Sender: TObject);
begin
  ConsultaRapida;
end;

procedure TfrmSaida.edtCodProdutoEnter(Sender: TObject);
begin
  if Operacao = 'O' then
   exit;
  if Salva then
  begin
    operacao := 'O';
    edicao;
    navegacao;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := true;
    AtualizaNavegacao;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

function TfrmSaida.Salva: boolean;
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
    Add('  BAIXADO,                      ');
    Add('  CAIXA                         ');    
    Add(') VALUES (                      ');
    Add('  :SAIDA,                       ');
    Add('  :DATA,                        ');
    Add('  :HORA,                        ');
    Add('  :FUNCIONARIO,                 ');
    Add('  :CLIENTE,                     ');
    Add('  :DESCONTO,                    ');
    Add('  :QUITACAO,                    ');
    Add('  :BAIXADO,                     ');
    Add('  :CAIXA                        ');
    Add(')                               ');
    Params.ParamByName('SAIDA'         ).asInteger := strtoint(edtCodigo.text);
    Params.ParamByName('DATA'          ).asDate    := edtCadastro.date;
    Params.ParamByName('HORA'          ).asTime    := StrToTime(edthora.text);
    Params.ParamByName('CLIENTE'       ).asInteger := strparaint(edtCliente.text);
    Params.ParamByName('FUNCIONARIO'   ).asInteger := strparaint(edtFuncionario.Text);
    Params.ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
    Params.ParamByName('QUITACAO'      ).asFloat   := edtValorQuitado.Value;
    Params.ParamByName('BAIXADO'       ).asBoolean := False;
    Params.ParamByName('CAIXA'         ).asInteger := Caixa;
    ExecSQL;
    UpdCodigo('SAIDA', strtoint(edtCodigo.text));
    result := true;
    GeraMovimentacao(edtCadastro.date, 'Venda de Mercadorias','CRÉDITO',0,0,strtoint(edtCodigo.text),'I');
  end;
end;

function TfrmSaida.validaAltera: boolean;
begin
  result := false;
  if trim(edtFormaPagamento.text) = '' then
  begin
    exclusao2('Digite a Forma de pagamento.','Aviso');
    edtFormaPagamento.setFocus;
    exit;
  end;
  if tbProduto.IsEmpty then
  begin
    exclusao2('Insira Produtos para efetuar a entrada.','Aviso');
    edtCodProduto.SetFocus;
    exit;
  end;
  result := true;
end;

procedure TfrmSaida.AtualizaGrid;
begin
  with tbProduto,tbProduto.SQL do
  begin
    Close;
    Clear;
    Add('SELECT CODBARRA, DESCRICAO, VALORUNI, TOTAL, QUANTIDADE, EDICAO FROM ITEMSAIDA WHERE ITEMSAIDA=:SAIDA ');
    Params.ParamByName('SAIDA').AsInteger := strtoint(edtCodigo.Text);
    Open;
  end;
end;

function TfrmSaida.ValidaItem: Boolean;
begin
  result := (trim(edtCodProduto.Text) <> '') and (edtDescricao.Text <> '') and (edtQuantidade.Value > 0) and (edtPrecoUni.Value > 0) and (edtPrecoTotal.Value > 0);
end;

procedure TfrmSaida.edtFuncionarioChange(Sender: TObject);
begin
  if Trim(edtFuncionario.Text) <> '' then
    edtDescFuncionario.Caption := LerDescricaoPorCampo('FUNCIONARIO',strtoint(edtFuncionario.text))
  else
    edtDescFuncionario.Caption := '';
end;

procedure TfrmSaida.edtFormapagamentoChange(Sender: TObject);
begin
  if Trim(edtFormaPagamento.Text) <> '' then
  begin
    edtDescFormaPagamento.Caption := LerDescricaoPorCampo('FORMAPAGAMENTO',strtoint(edtFormaPagamento.text));
    edtValorQuitado.Value := ( (edtValorTotal.Value * (1 -  edtDesconto.Value/100)) * (1 - (LerDescontoFormaPagamento(edtFormaPagamento.text)/100)) );
  end
  else
  begin
    edtDescFormaPagamento.Caption := '';
    edtValorQuitado.Value := 0;
  end;
end;

procedure TfrmSaida.edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    SalvaItem;
    edtCodProduto.SetFocus;
    REcalcula;    
  end;
  if Key = VK_INSERT then
    edtFormaPagamento.SetFocus;
end;

procedure TfrmSaida.edtCodProdutoExit(Sender: TObject);
begin
  if Trim(edtCodProduto.text) <> '' then
  begin
    edtDescricao.Text := LerCodBarra(edtCodProduto.Text);
    edtPrecoUni.Value := LerValorUni(edtCodProduto.Text,'S');
    if edtDescricao.text = '' then
    begin
      ShowMessage('Produto não Cadastrado!');
    end
    else if PossuiEdicao(edtCodProduto.Text) then
    begin
      edtEdicao.SetFocus;
    end
    else
    begin
      edtEdicao.Value := 0;
      edtQuantidade.SetFocus;
    end;
  end;
end;

procedure TfrmSaida.edtClienteButtonClick(Sender: TObject);
begin
  tipo := 'C';
  AbreConsulta;
end;

procedure TfrmSaida.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strparaint(edtCliente.text))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmSaida.edtQuantidadeExit(Sender: TObject);
begin
  if LerQuantidade(edtCodProduto.text, edtEdicao.Text) - edtQuantidade.AsInteger < 0 then
    exclusao2('A quantidade ultrapassou o seu estoque','Aviso');
end;

procedure TfrmSaida.edtCampoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
  if Key = VK_RETURN then
  begin
    if not qrConsulta.IsEmpty then
    begin
      dbgConsulta.SelectedIndex := 0;
      if tipo = 'F' then
      begin
        edtFormaPagamento.Text := dbgConsulta.Fields[0].Text;
        edtDescFormaPagamento.Caption := dbgConsulta.Fields[1].Text;
        edtDesconto.SetFocus;
      end
      else if  tipo = 'U' then
      begin
        edtFuncionario.Text := dbgConsulta.Fields[0].Text;
        edtDescFuncionario.Caption := dbgConsulta.Fields[1].Text;
        edtCliente.SetFocus;
      end
      else
      begin
        edtCliente.Text := dbgConsulta.Fields[0].Text;
        edtDescCliente.Caption := dbgConsulta.Fields[1].Text;
        edtCodProduto.SetFocus;
      end;
    end;
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
end;

end.
