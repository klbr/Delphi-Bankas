unit Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatGroupBoxUnit, StdCtrls, TFlatComboBoxUnit,
  TFlatEditUnit, TFlatHintUnit, DB, TFlatSpeedButtonUnit, ComCtrls, ExtCtrls,
  TFlatPanelUnit, TFlatCheckBoxUnit, TFlatButtonUnit, Buttons, Mask, ToolEdit,
  DBTables, IBCustomDataSet, IBQuery;

type
  TfrmUsuario = class(TfrmFormCadatroMini)
    Label1: TLabel;
    Label5: TLabel;
    edtDescricao: TFlatEdit;
    cbGrupo: TFlatComboBox;
    gbLogin: TFlatGroupBox;
    Label2: TLabel;
    l1: TLabel;
    l2: TLabel;
    edtLogin: TFlatEdit;
    edtSenha1: TFlatEdit;
    edtSenha2: TFlatEdit;
    Label6: TLabel;
    edtCodigo: TFlatEdit;
    btnAlterarSenha: TFlatButton;
    gbAcesso: TFlatGroupBox;
    cbCadastro: TFlatCheckBox;
    cbCliente: TFlatCheckBox;
    cbCredor: TFlatCheckBox;
    cbGrupos: TFlatCheckBox;
    cbFormapagamento: TFlatCheckBox;
    cbFornecedor: TFlatCheckBox;
    cbFuncionario: TFlatCheckBox;
    cbMercadorias: TFlatCheckBox;
    cbRua: TFlatCheckBox;
    cbMovimentacao: TFlatCheckBox;
    cbCaixa: TFlatCheckBox;
    cbLancamento: TFlatCheckBox;
    cbRetirada: TFlatCheckBox;
    cbSaida: TFlatCheckBox;
    cbEntrada: TFlatCheckBox;
    cbDespesas: TFlatCheckBox;
    cbFiado: TFlatCheckBox;
    cbRelatorios: TFlatCheckBox;
    cbDevolucao: TFlatCheckBox;
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
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
    procedure TimerTimer(Sender: TObject);
    procedure cbCadastroClick(Sender: TObject);
  private
  OPeracao : Char;
  Nav : Integer;
  protected
    function  Salva:boolean;
    procedure Exclui;
    function  ExisteRegistro: boolean;
    procedure LimpaCampos;
    procedure FPrior;
    procedure FFirst;
    Procedure FNext;
    procedure FLast;
    function  valida:boolean;
    procedure SetAcesso;
    procedure Edicao;
    procedure AtualizaNavegacao;
  public
    { Public declarations }
  end;

implementation
uses Main, AlteraSenha, Principal;
{$R *.dfm}

function TfrmUsuario.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    Exclusao2('Digite seu nome.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;

  if trim(edtlogin.text) = '' then
  begin
    Exclusao2('Digite seu login.','Aviso');
    edtlogin.setFocus;
    exit;
  end;

  if (trim(edtsenha1.text) = '') and (edtSenha1.Visible) then
  begin
    Exclusao2('Digite uma senha.','Aviso');
    edtsenha1.setFocus;
    exit;
  end;

  if (trim(edtSenha2.text) = '') and (edtSenha2.Visible) then
  begin
    Exclusao2('Redigite a senha.','Aviso');
    edtsenha2.setFocus;
    exit;
  end;

  if (edtSenha1.text <> edtsenha2.text) and (edtSenha1.Visible) then
  begin
    Exclusao2('Digite corretamente as duas senhas','Aviso');
    edtsenha1.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmUsuario.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO USUARIO (          ');
      Add('  USUARIO,                     ');
      Add('  DESCRICAO,                   ');
      Add('  LOGIN,                       ');
      Add('  SENHA,                       ');
      Add('  GRUPO                        ');
      Add(') VALUES (                     ');
      Add('  :USUARIO,                    ');
      Add('  :DESCRICAO,                  ');
      Add('  :LOGIN,                      ');
      Add('  :SENHA,                      ');
      Add('  :GRUPO                       ');
      Add(')                              ');
      Params.ParamByName('USUARIO'  ).asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO').asString  := edtDescricao.text;
      Params.ParamByName('LOGIN'    ).asString  := edtLogin.text;
      Params.ParamByName('SENHA'    ).asString  := Codifica(edtSenha1.text,Length(edtSenha1.text));
      Params.ParamByName('GRUPO'    ).asString  := cbGrupo.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('USUARIO', strtoint(edtCodigo.text));
      cbGrupo.Items.IndexOf(cbGrupo.Text);
      Clear;
      Add('INSERT INTO ACESSO (   ');
      Add('  USUARIO,             ');
      Add('  CADASTRO,            ');
      Add('  CLIENTE,             ');
      Add('  CREDOR,              ');
      Add('  GRUPO,               ');
      Add('  FORMAPAGAMENTO,      ');
      Add('  FORNECEDORES,        ');
      Add('  FUNCIONARIOS,        ');
      Add('  MERCADORIAS,         ');
      Add('  RUA,                 ');
      Add('  MOVIMENTACAO,        ');
      Add('  CAIXA,               ');
      Add('  LANCAMENTOS,         ');
      Add('  RETIRADAS,           ');
      Add('  SAIDAS,              ');
      Add('  ENTRADAS,            ');
      Add('  DESPESAS,            ');
      Add('  DEVOLUCAO,           ');
      Add('  FIADO,               ');
      Add('  RELATORIO            ');
      Add('  ) VALUES (           ');
      Add('  :USUARIO,            ');
      Add('  :CADASTRO,           ');
      Add('  :CLIENTE,            ');
      Add('  :CREDOR,             ');
      Add('  :GRUPO,              ');
      Add('  :FORMAPAGAMENTO,     ');
      Add('  :FORNECEDORES,       ');
      Add('  :FUNCIONARIOS,       ');
      Add('  :MERCADORIAS,        ');
      Add('  :RUA,                ');
      Add('  :MOVIMENTACAO,       ');
      Add('  :CAIXA,              ');
      Add('  :LANCAMENTOS,        ');
      Add('  :RETIRADAS,          ');
      Add('  :SAIDAS,             ');
      Add('  :ENTRADAS,           ');
      Add('  :DESPESAS,           ');
      Add('  :DEVOLUCAO,          ');
      Add('  :FIADO,              ');
      Add('  :RELATORIO           ');
      Add('  )                    ');
      Params.ParamByName('USUARIO'       ).AsInteger := strtoint(edtCodigo.text);
      Params.ParamByName('CADASTRO'      ).AsString  := BparaS(cbCadastro.Checked);
      Params.ParamByName('CLIENTE'       ).AsString  := BparaS(cbCliente.Checked);
      Params.ParamByName('CREDOR'        ).AsString  := BparaS(cbCredor.Checked);
      Params.ParamByName('GRUPO'         ).AsString  := BparaS(cbGrupos.Checked);
      Params.ParamByName('FORMAPAGAMENTO').AsString  := BparaS(cbFormaPagamento.Checked);
      Params.ParamByName('FORNECEDORES'  ).AsString  := BparaS(cbFornecedor.Checked);
      Params.ParamByName('FUNCIONARIOS'  ).AsString  := BparaS(cbFuncionario.Checked);
      Params.ParamByName('MERCADORIAS'   ).AsString  := BparaS(cbMercadorias.Checked);
      Params.ParamByName('RUA'           ).AsString  := BparaS(cbRua.Checked);
      Params.ParamByName('MOVIMENTACAO'  ).AsString  := BparaS(cbMovimentacao.Checked);
      Params.ParamByName('CAIXA'         ).AsString  := BparaS(cbCaixa.Checked);
      Params.ParamByName('LANCAMENTOS'   ).AsString  := BparaS(cbLancamento.Checked);
      Params.ParamByName('RETIRADAS'     ).AsString  := BparaS(cbRetirada.Checked);
      Params.ParamByName('SAIDAS'        ).AsString  := BparaS(cbSaida.Checked);
      Params.ParamByName('ENTRADAS'      ).AsString  := BparaS(cbEntrada.Checked);
      Params.ParamByName('DESPESAS'      ).AsString  := BparaS(cbDespesas.Checked);
      Params.ParamByName('DEVOLUCAO'     ).AsString  := BparaS(cbDevolucao.Checked);
      Params.ParamByName('FIADO'         ).AsString  := BparaS(cbfiado.Checked);
      Params.ParamByName('RELATORIO'     ).AsString  := BparaS(cbRelatorios.Checked);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
  if (Operacao = 'A') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  USUARIO  SET           ');
      Add('  DESCRICAO =:DESCRICAO,       ');
      Add('  LOGIN     =:LOGIN,           ');
      Add('  GRUPO     =:GRUPO            ');
      Add('WHERE                          ');
      Add('  USUARIO   =:USUARIO          ');
      Params.ParamByName('USUARIO'  ).asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO').asString  := edtDescricao.text;
      Params.ParamByName('LOGIN'    ).asString  := edtLogin.text;
      Params.ParamByName('GRUPO'    ).asString  := cbGrupo.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      cbGrupo.Items.IndexOf(cbGrupo.Text);
      Clear;
      Add('UPDATE ACESSO SET      ');
      Add('  CADASTRO=:CADASTRO,  ');
      Add('  CLIENTE=:CLIENTE,    ');
      Add('  CREDOR=:CREDOR,      ');
      Add('  GRUPO=:GRUPO,        ');
      Add('  FORMAPAGAMENTO=:FORMAPAGAMENTO, ');
      Add('  FORNECEDORES=:FORNECEDORES,     ');
      Add('  FUNCIONARIOS=:FUNCIONARIOS,     ');
      Add('  MERCADORIAS=:MERCADORIAS,       ');
      Add('  RUA=:RUA,            ');
      Add('  MOVIMENTACAO=:MOVIMENTACAO,     ');
      Add('  CAIXA=:CAIXA,        ');
      Add('  LANCAMENTOS=:LANCAMENTOS,       ');
      Add('  RETIRADAS=:RETIRADAS,');
      Add('  SAIDAS=:SAIDAS,      ');
      Add('  ENTRADAS=:ENTRADAS,  ');
      Add('  DESPESAS=:DESPESAS,  ');
      Add('  DEVOLUCAO=:DEVOLUCAO,');
      Add('  FIADO=:FIADO,        ');
      Add('  RELATORIO=:RELATORIO ');
      Add(' WHERE USUARIO=:USUARIO');
      Params.ParamByName('USUARIO').AsInteger := strtoint(edtCodigo.text);
      Params.ParamByName('CADASTRO'      ).AsString  := BparaS(cbCadastro.Checked);
      Params.ParamByName('CLIENTE'       ).AsString  := BparaS(cbCliente.Checked);
      Params.ParamByName('CREDOR'        ).AsString  := BparaS(cbCredor.Checked);
      Params.ParamByName('GRUPO'         ).AsString  := BparaS(cbGrupos.Checked);
      Params.ParamByName('FORMAPAGAMENTO').AsString  := BparaS(cbFormaPagamento.Checked);
      Params.ParamByName('FORNECEDORES'  ).AsString  := BparaS(cbFornecedor.Checked);
      Params.ParamByName('FUNCIONARIOS'  ).AsString  := BparaS(cbFuncionario.Checked);
      Params.ParamByName('MERCADORIAS'   ).AsString  := BparaS(cbMercadorias.Checked);
      Params.ParamByName('RUA'           ).AsString  := BparaS(cbRua.Checked);
      Params.ParamByName('MOVIMENTACAO'  ).AsString  := BparaS(cbMovimentacao.Checked);
      Params.ParamByName('CAIXA'         ).AsString  := BparaS(cbCaixa.Checked);
      Params.ParamByName('LANCAMENTOS'   ).AsString  := BparaS(cbLancamento.Checked);
      Params.ParamByName('RETIRADAS'     ).AsString  := BparaS(cbRetirada.Checked);
      Params.ParamByName('SAIDAS'        ).AsString  := BparaS(cbSaida.Checked);
      Params.ParamByName('ENTRADAS'      ).AsString  := BparaS(cbEntrada.Checked);
      Params.ParamByName('DESPESAS'      ).AsString  := BparaS(cbDespesas.Checked);
      Params.ParamByName('DEVOLUCAO'     ).AsString  := BparaS(cbDevolucao.Checked);
      Params.ParamByName('FIADO'         ).AsString  := BparaS(cbfiado.Checked);
      Params.ParamByName('RELATORIO'     ).AsString  := BparaS(cbRelatorios.Checked);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM USUARIO ORDER BY USUARIO';  
  qrNavegacao.Open;
  FLast;
end;

procedure TfrmUsuario.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_USUARIO');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  edtDescricao.SetFocus;
  edtSenha1.Visible := true;
  edtSenha2.Visible := true;
  l1.Visible := true;
  l2.Visible := true;
  btnAlterarSenha.Visible := false;
  Operacao := 'I';
end;

procedure TfrmUsuario.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  edtDescricao.SetFocus;
end;
procedure TfrmUsuario.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM USUARIO WHERE USUARIO=:USUARIO  ');
         Params.ParamByName('USUARIO').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmUsuario.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmUsuario.LimpaCampos;
begin
  edtCodigo.text := '';
  edtDescricao.text := '';
  edtLogin.text := '';
  edtSenha1.text := '';
  edtSenha2.Text := '';
  cbGrupo.Text := '';
  
end;

procedure TfrmUsuario.btnAlterarSenhaClick(Sender: TObject);
begin
  with TfrmAlteraSenha.Create(application) do
  begin
    Codigo := strparaint(edtCodigo.text);
    showmodal;
    free;
  end;
end;

procedure TfrmUsuario.btnExcluiClick(Sender: TObject);
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

procedure TfrmUsuario.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    edtCodigo.text := inttostr(FieldByName('USUARIO').AsInteger);
    edtDescricao.text := FieldByName('DESCRICAO').AsString;
    edtLogin.Text := FieldByName('LOGIN').AsString;
    cbGrupo.Items.IndexOf(FieldByName('GRUPO').AsString);
    SetAcesso;
    edicao;
    //Navegacao;
  end;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmUsuario.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
end;

procedure TfrmUsuario.btnSalvaClick(Sender: TObject);
begin
  if edtLogin.text = 'root' then
  begin
    Exclusao2('Escolha outro nome de usuario','Aviso');
    Exit;
  end;
  if Salva then
  begin
    edicao;
    //navegacao;
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
    Exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmUsuario.Navegacao;
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

procedure TfrmUsuario.Edicao;
begin
  if existeRegistro then
  begin
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
  end;
  edtSenha1.Visible := false;
  edtSenha2.Visible := false;
  l1.Visible := false;
  l2.Visible := false;
  btnAlterarSenha.Visible := true;
end;

procedure TfrmUsuario.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    edtCodigo.text := FieldByName('USUARIO').AsString;
    edtDescricao.text := FieldByName('DESCRICAO').AsString;
    edtLogin.Text := FieldByName('LOGIN').AsString;
    cbGrupo.Items.IndexOf(FieldByName('GRUPO').AsString);
    SetAcesso;
    edicao;
    //Navegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmUsuario.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    edtCodigo.text := inttostr(FieldByName('USUARIO').AsInteger);
    edtDescricao.text := FieldByName('DESCRICAO').AsString;
    edtLogin.Text := FieldByName('LOGIN').AsString;
    cbGrupo.Items.IndexOf(FieldByName('GRUPO').AsString);
    SetAcesso;
    edicao;
  end;
  Nav := qrNavegacao.RecNo;
end;

Procedure TfrmUsuario.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    edtCodigo.text := inttostr(FieldByName('USUARIO').AsInteger);
    edtDescricao.text := FieldByName('DESCRICAO').AsString;
    edtLogin.Text := FieldByName('LOGIN').AsString;
    cbGrupo.Items.IndexOf(FieldByName('GRUPO').AsString);
    SetAcesso;
    edicao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmUsuario.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmUsuario.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmUsuario.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmUsuario.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmUsuario.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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
 end;
end;

procedure TfrmUsuario.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  loUsuario := nil;
  Action := caFree;
end;

procedure TfrmUsuario.SetAcesso;
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM ACESSO WHERE USUARIO=:USUARIO ');
    Params.ParamByName('USUARIO').AsInteger := qrNavegacao.FieldByName('USUARIO').AsInteger;
    Open;
    cbCadastro.Checked        := SparaB(FieldByName('CADASTRO'      ).AsString);
    cbCliente.Checked         := SparaB(FieldByName('CLIENTE'       ).AsString);
    cbCredor.Checked          := SparaB(FieldByName('CREDOR'        ).AsString);
    cbGrupos.Checked          := SparaB(FieldByName('GRUPO'         ).AsString);
    cbFormaPagamento.Checked  := SparaB(FieldByName('FORMAPAGAMENTO').AsString);
    cbFornecedor.Checked      := SparaB(FieldByName('FORNECEDORES'  ).AsString);
    cbFuncionario.Checked     := SparaB(FieldByName('FUNCIONARIOS'  ).AsString);
    cbMercadorias.Checked     := SparaB(FieldByName('MERCADORIAS'   ).AsString);
    cbRua.Checked             := SparaB(FieldByName('RUA'           ).AsString);
    cbMovimentacao.Checked    := SparaB(FieldByName('MOVIMENTACAO'  ).AsString);
    cbCaixa.Checked           := SparaB(FieldByName('CAIXA'         ).AsString);
    cbLancamento.Checked      := SparaB(FieldByName('LANCAMENTOS'   ).AsString);
    cbREtirada.Checked        := SparaB(FieldByName('RETIRADAS'     ).AsString);
    cbSaida.Checked           := SparaB(FieldByName('SAIDAS'        ).AsString);
    cbEntrada.Checked         := SparaB(FieldByName('ENTRADAS'      ).AsString);
    cbDespesas.Checked        := SparaB(FieldByName('DESPESAS'      ).AsString);
    cbDevolucao.Checked       := SparaB(FieldByName('DEVOLUCAO'     ).AsString);
    cbFiado.Checked           := SparaB(FieldByName('FIADO'         ).AsString);
    cbRelatorios.Checked      := SparaB(FieldByName('RELATORIO'     ).AsString);
    Close;
  end;
end;

procedure TfrmUsuario.TimerTimer(Sender: TObject);
begin
  cbCadastro.Checked := (cbCliente.Checked) or (cbCredor.Checked) or (cbGrupos.Checked) or
     (cbFormaPagamento.Checked) or (cbFornecedor.Checked) or (cbFuncionario.Checked) or
     (cbMercadorias.Checked) or (cbRua.Checked);

  cbMovimentacao.Checked := (cbCaixa.Checked) or (cbLancamento.Checked) or (cbREtirada.Checked) or
    (cbSaida.Checked) or (cbEntrada.Checked) or (cbDespesas.Checked) or (cbDevolucao.Checked) or (cbFiado.Checked);


  if not cbCadastro.Checked then
  begin
    cbCliente.Checked         := false;
    cbCredor.Checked          := false;
    cbGrupos.Checked          := false;
    cbFormaPagamento.Checked  := false;
    cbFornecedor.Checked      := false;
    cbFuncionario.Checked     := false;
    cbMercadorias.Checked     := false;
    cbRua.Checked             := false;
  end;
  if not cbMovimentacao.Checked then
  begin
    cbCaixa.Checked      := false;
    cbLancamento.Checked := false;
    cbREtirada.Checked   := false;
    cbSaida.Checked      := false;
    cbEntrada.Checked    := false;
    cbDespesas.Checked   := false;
    cbDevolucao.Checked  := false;
    cbFiado.Checked      := false;
  end;
  Timer.Enabled := false;
end;

procedure TfrmUsuario.cbCadastroClick(Sender: TObject);
begin
  Timer.Enabled := True;
end;

end.
