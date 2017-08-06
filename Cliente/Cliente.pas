unit Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, StdCtrls, TFlatEditUnit, Mask,
  TFlatMaskEditUnit, TFlatComboBoxUnit, ToolEdit, Grids, DBGrids, RXDBCtrl,
  CurrEdit, TFlatCheckBoxUnit, TFlatGroupBoxUnit, IBCustomDataSet, IBQuery,
  DB;

type
  TfrmCliente = class(TfrmFormCadatroMini)
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtCadastro: TDateEdit;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtCep: TMaskEdit;
    edtOcupacao: TEdit;
    edtNascimento: TDateEdit;
    edtEstadocivil: TComboBox;
    edtdddResidencial: TMaskEdit;
    edtResidencial: TMaskEdit;
    edtComercial: TMaskEdit;
    edtdddComercial: TMaskEdit;
    edtCelular: TMaskEdit;
    edtdddCelular: TMaskEdit;
    edtEmail: TEdit;
    edtURL: TEdit;
    edtOBS: TEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    dbgConsulta: TRxDBGrid;
    edtCampo: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    edtConsulta: TEdit;
    FlatGroupBox1: TFlatGroupBox;
    cbFiado: TFlatCheckBox;
    edtLimite: TCurrencyEdit;
    Label19: TLabel;
    edtSaldo: TCurrencyEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtDivida: TCurrencyEdit;
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
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaCellClick(Column: TColumn);
    procedure edtLimiteChange(Sender: TObject);
    procedure edtSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
  OPeracao : Char;
  Nav : Integer;
  protected
    function  Salva:boolean;
    procedure Exclui;
    function  ExisteRegistro: boolean;
    procedure SetRegistroNavegacao;
    procedure LimpaCampos;
    procedure FPrior;
    procedure FFirst;
    Procedure FNext;
    procedure FLast;
    function  valida:boolean;
//    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
//    procedure LerFiadoCliente(const Cliente : Integer);
  public
    { Public declarations }
  end;

//var
//  frmCliente: TfrmCliente;

implementation
uses Main, Principal;
{$R *.dfm}

function TfrmCliente.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    Exclusao2('Digite o nome do Cliente.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  if cbFiado.Checked then
  begin
    if edtLimite.Value <= 0 then
    begin
      Exclusao2('Digite um Limite para o Cliente','Aviso');
      edtLimite.SetFocus;
      Exit;
    end;
  end
  else
  begin
    edtLimite.Value := 0;
    edtDivida.Value := 0;
  end;
  result := true;
end;

function  TfrmCliente.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO CLIENTE  (          ');
      Add('  CLIENTE,                      ');
      Add('  CADASTRO,                     ');
      Add('  DESCRICAO,                    ');
      Add('  ENDERECO,                     ');
      Add('  BAIRRO,                       ');
      Add('  CIDADE,                       ');
      Add('  CEP,                          ');
      Add('  NASCIMENTO,                   ');
      Add('  ESTADOCIVIL,                  ');
      Add('  OCUPACAO,                     ');
      Add('  DDDRESIDENCIAL,               ');
      Add('  RESIDENCIAL,                  ');
      Add('  DDDCOMERCIAL,                 ');
      Add('  COMERCIAL,                    ');
      Add('  DDDCELULAR,                   ');
      Add('  CELULAR,                      ');
      Add('  EMAIL,                        ');
      Add('  URL,                          ');
      Add('  OBS,                          ');
      Add('  USARFIADO,                    ');
      Add('  LIMITE                        ');
      Add(') VALUES (                      ');
      Add('  :CLIENTE,                     ');
      Add('  :CADASTRO,                    ');
      Add('  :DESCRICAO,                   ');
      Add('  :ENDERECO,                    ');
      Add('  :BAIRRO,                      ');
      Add('  :CIDADE,                      ');
      Add('  :CEP,                         ');
      Add('  :NASCIMENTO,                  ');
      Add('  :ESTADOCIVIL,                 ');
      Add('  :OCUPACAO,                    ');
      Add('  :DDDRESIDENCIAL,              ');
      Add('  :RESIDENCIAL,                 ');
      Add('  :DDDCOMERCIAL,                ');
      Add('  :COMERCIAL,                   ');
      Add('  :DDDCELULAR,                  ');
      Add('  :CELULAR,                     ');
      Add('  :EMAIL,                       ');
      Add('  :URL,                         ');
      Add('  :OBS,                         ');
      Add('  :USARFIADO,                   ');
      Add('  :LIMITE                       ');
      Add(')                               ');
      ParamByName('CLIENTE'       ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'      ).AsDateTime  := (edtCadastro.date);
      ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      ParamByName('ENDERECO'      ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'        ).asString  := edtBairro.text;
      ParamByName('CIDADE'        ).asString  := edtCidade.text;
      ParamByName('CEP'           ).asString  := edtCEP.text;
      ParamByName('NASCIMENTO'    ).asDateTime :=(edtNascimento.date);
      ParamByName('ESTADOCIVIL'   ).asString  := edtEstadocivil.text;
      ParamByName('OCUPACAO'      ).asString  := edtOcupacao.text;
      ParamByName('DDDRESIDENCIAL').asString  := edtdddResidencial.text;
      ParamByName('RESIDENCIAL'   ).asString  := edtResidencial.text;
      ParamByName('DDDCOMERCIAL'  ).asString  := edtdddComercial.text;
      ParamByName('COMERCIAL'     ).asString  := edtComercial.text;
      ParamByName('DDDCELULAR'    ).asString  := edtdddCelular.text;
      ParamByName('CELULAR'       ).asString  := edtCelular.text;
      ParamByName('EMAIL'         ).asString  := edtEmail.text;
      ParamByName('URL'           ).asString  := edtURL.text;
      ParamByName('OBS'           ).asString  := edtOBs.text;
      ParamByName('LIMITE'        ).AsFloat   := edtLimite.Value;
      ParamByName('USARFIADO'     ).AsString  := BparaS(cbFiado.Checked);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('CLIENTE', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if Operacao = 'A' then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  CLIENTE  SET               ');
      Add('  CADASTRO = :CADASTRO,            ');
      Add('  DESCRICAO = :DESCRICAO,          ');
      Add('  ENDERECO = :ENDERECO,            ');
      Add('  BAIRRO = :BAIRRO,                ');
      Add('  CIDADE = :CIDADE,                ');
      Add('  CEP = :CEP,                      ');
      Add('  NASCIMENTO = :NASCIMENTO,        ');
      Add('  ESTADOCIVIL = :ESTADOCIVIL,      ');
      Add('  OCUPACAO = :OCUPACAO,            ');
      Add('  DDDRESIDENCIAL = :DDDRESIDENCIAL,');
      Add('  RESIDENCIAL = :RESIDENCIAL,      ');
      Add('  DDDCOMERCIAL = :DDDCOMERCIAL,    ');
      Add('  COMERCIAL = :COMERCIAL,          ');
      Add('  DDDCELULAR = :DDDCELULAR,        ');
      Add('  CELULAR = :CELULAR,              ');
      Add('  EMAIL = :EMAIL,                  ');
      Add('  URL = :URL,                      ');
      Add('  OBS = :OBS,                      ');
      Add('  USARFIADO = :USARFIADO,          ');
      Add('  LIMITE = :LIMITE                 ');
      Add('WHERE                              ');
      Add('  CLIENTE = :CLIENTE               ');
      ParamByName('CLIENTE'       ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'      ).AsDateTime  := (edtCadastro.date);
      ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      ParamByName('ENDERECO'      ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'        ).asString  := edtBairro.text;
      ParamByName('CIDADE'        ).asString  := edtCidade.text;
      ParamByName('CEP'           ).asString  := edtCEP.text;
      ParamByName('NASCIMENTO'    ).asDateTime  := (edtNascimento.date);
      ParamByName('ESTADOCIVIL'   ).asString  := edtEstadocivil.text;
      ParamByName('OCUPACAO'      ).asString  := edtOcupacao.text;
      ParamByName('DDDRESIDENCIAL').asString  := edtdddResidencial.text;
      ParamByName('RESIDENCIAL'   ).asString  := edtResidencial.text;
      ParamByName('DDDCOMERCIAL'  ).asString  := edtdddComercial.text;
      ParamByName('COMERCIAL'     ).asString  := edtComercial.text;
      ParamByName('DDDCELULAR'    ).asString  := edtdddCelular.text;
      ParamByName('CELULAR'       ).asString  := edtCelular.text;
      ParamByName('EMAIL'         ).asString  := edtEmail.text;
      ParamByName('URL'           ).asString  := edtURL.text;
      ParamByName('OBS'           ).asString  := edtOBs.text;
      ParamByName('LIMITE'        ).AsFloat := edtLimite.Value;
      ParamByName('USARFIADO'     ).AsString := BparaS(cbFiado.Checked);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
  AtualizaNavegacao;
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta);
  nav := 0;
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM CLIENTE ORDER BY CLIENTE';
  qrNavegacao.Open;
  FLast;
end;

procedure TfrmCliente.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_CLIENTE');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtDescricao.SetFocus;
  edtCadastro.Date := now;
  Operacao := 'I';
end;

procedure TfrmCliente.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtDescricao.SetFocus;
end;
procedure TfrmCliente.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         Close;
         Clear;
         Add('DELETE FROM CLIENTE WHERE CLIENTE=:CLIENTE  ');
         ParamByName('CLIENTE').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmCliente.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmCliente.LimpaCampos;
begin
  edtCodigo.text        := '';
  edtCadastro.text      := '';
  edtDescricao.text     := '';
  edtEndereco.text      := '';
  edtBairro.text        := '';
  edtCidade.text        := '';
  edtCEP.text           := '';
  edtNascimento.text    := '';
  edtEstadocivil.text   := '';
  edtOcupacao.text      := '';
  edtdddResidencial.text:= '';
  edtResidencial.text   := '';
  edtdddComercial.text  := '';
  edtComercial.text     := '';
  edtdddCelular.text    := '';
  edtCelular.text       := '';
  edtEmail.text         := '';
  edtURL.text           := '';
  edtOBs.text           := '';
  cbFiado.Checked       := False;
  edtDivida.Value       := 0;
  edtLimite.value       := 0;
  edtSaldo.value        := 0;
end;

procedure TfrmCliente.btnExcluiClick(Sender: TObject);
begin
  if Exclusao('','') then
  begin
    Exclui;
    fpBody.enabled := false;
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    btnExclui.Enabled := false;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := true;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmCliente.FPrior;
begin
  qrNavegacao.Prior;
  Nav := qrNavegacao.RecNo;
  SetRegistroNavegacao;
  //Navegacao;
end;

procedure TfrmCliente.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
  btnConsulta.Enabled := true;
end;

procedure TfrmCliente.btnSalvaClick(Sender: TObject);
begin
  if Salva then
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
  end
  else
  begin
    Exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmCliente.Navegacao;
begin
  if qrNavegacao.RecordCount = 0 then
  begin
    btnFirst.Enabled := false;
    btnPrior.Enabled := false;
    btnNext.Enabled := False;
    btnLast.Enabled := False;
  end
  else
  begin
    if qrNavegacao.RecordCount =1 then
    begin
      btnFirst.Enabled := false;
      btnPrior.Enabled := false;
      btnNext.Enabled := True;
      btnLast.Enabled := True;
    end
    else if qrNavegacao.RecNo = qrNavegacao.RecordCount then
    begin
      btnFirst.Enabled := True;
      btnPrior.Enabled := True;
      btnNext.Enabled := True;
      btnLast.Enabled := True;
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

procedure TfrmCliente.Edicao;
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

procedure TfrmCliente.FFirst;
begin
  qrNavegacao.First;
  Nav := qrnavegacao.RecNo;
  SetRegistroNavegacao;
  //Navegacao;
end;

Procedure TfrmCliente.FNext;
begin
  qrNavegacao.Next;
  Nav := qrNavegacao.RecNo;
  SetRegistroNavegacao;
  //Navegacao;
end;

Procedure TfrmCliente.FLast;
begin
  qrNavegacao.Last;
  Nav := qrnavegacao.RecNo;
  SetRegistroNavegacao;
  //Navegacao;
end;

procedure TfrmCliente.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmCliente.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmCliente.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmCliente.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmCliente.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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
 else if key = Vk_F10 then
 begin
   edtConsulta.SetFocus;
 end;
end;

procedure TfrmCliente.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loCliente := nil;
  Action := caFree;
end;

procedure TfrmCliente.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('CLIENTE').AsString;
    edtCadastro.date      := FieldByName('CADASTRO').AsDateTime;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
    edtEndereco.text      := FieldByName('ENDERECO').AsString;
    edtBairro.text        := FieldByName('BAIRRO').AsString;
    edtCidade.text        := FieldByName('CIDADE').AsString;
    edtCEP.text           := FieldByName('CEP').AsString;
    edtNascimento.text    := FieldByName('NASCIMENTO').AsString;
    edtEstadocivil.text   := FieldByName('ESTADOCIVIL').AsString;
    edtOcupacao.text      := FieldByName('OCUPACAO').AsString;
    edtdddResidencial.text:= FieldByName('DDDRESIDENCIAL').AsString;
    edtResidencial.text   := FieldByName('RESIDENCIAL').AsString;
    edtdddComercial.text  := FieldByName('DDDCOMERCIAL').AsString;
    edtComercial.text     := FieldByName('COMERCIAL').AsString;
    edtdddCelular.text    := FieldByName('DDDCELULAR').AsString;
    edtCelular.text       := FieldByName('CELULAR').AsString;
    edtEmail.text         := FieldByName('EMAIL').AsString;
    edtURL.text           := FieldByName('URL').AsString;
    edtOBs.text           := FieldByName('OBS').AsString;
    cbFiado.Checked       := SparaB(FieldByName('USARFIADO').AsString);
    edtLimite.Value       := FieldByName('LIMITE').AsFloat;
    edtDivida.Value       := FieldByName('CREDITO').AsFloat;
  end;
//  if existeRegistro then
//    LerFiadoCliente(qrNavegacao.FieldByName('CLIENTE').AsInteger);
  edicao;
end;

procedure TfrmCliente.btnConsultaClick(Sender: TObject);
begin
  btnConsulta.Enabled := false;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnExclui.Enabled :=false;
  btnCancela.Enabled := false;
  btnSalva.Enabled :=false;
  btnFirst.Visible := false;
  btnPrior.Visible := false;
  btnNext.Visible := false;
  btnLast.Visible := false;
  with qrConsulta2,qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CLIENTE ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmCliente.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    if edtCampo.Text <> 'NASCIMENTO' then
      Add('SELECT * FROM CLIENTE WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') )
    else
      Add('SELECT * FROM CLIENTE WHERE '+edtCampo.Text+' = '+edtConsulta.Text);

//    Add('SELECT * FROM CLIENTE WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmCliente.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtCadastro.Date      := Fields[1].AsDateTime;
      edtDescricao.text     := Fields[2].Text;
      edtEndereco.text      := Fields[3].Text;
      edtBairro.text        := Fields[4].Text;
      edtCidade.text        := Fields[5].Text;
      edtCEP.text           := Fields[6].Text;
      edtNascimento.text    := Fields[7].Text;
      edtEstadocivil.text   := Fields[8].Text;
      edtOcupacao.text      := Fields[9].Text;
      edtdddResidencial.text:= Fields[10].Text;
      edtResidencial.text   := Fields[11].Text;
      edtdddComercial.text  := Fields[12].Text;
      edtComercial.text     := Fields[13].Text;
      edtdddCelular.text    := Fields[14].Text;
      edtCelular.text       := Fields[15].Text;
      edtEmail.text         := Fields[16].Text;
      edtURL.text           := Fields[17].Text;
      edtOBs.text           := Fields[18].Text;
    end;
    //edtCampo.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
    btnConsulta.Enabled := true;
    btnFirst.Visible := true;
    btnPrior.Visible := true;
    btnNext.Visible := true;
    btnLast.Visible := true;
    if existeregistro then
      btnExclui.Enabled := true;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
  end
  else if key = VK_ESCAPE then
  begin
    //edtCampo.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
    btnFirst.Visible := true;
    btnPrior.Visible := true;
    btnNext.Visible := true;
    btnLast.Visible := true;
    if existeregistro then
      btnExclui.Enabled := true;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
  end
  else if Key = VK_F9 then
  begin
    edtCampo.SetFocus;
  end;
end;

procedure TfrmCliente.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtCadastro.date      := Fields[1].AsDateTime;
    edtDescricao.text     := Fields[2].Text;
    edtEndereco.text      := Fields[3].Text;
    edtBairro.text        := Fields[4].Text;
    edtCidade.text        := Fields[5].Text;
    edtCEP.text           := Fields[6].Text;
    edtNascimento.text    := Fields[7].Text;
    edtEstadocivil.text   := Fields[8].Text;
    edtOcupacao.text      := Fields[9].Text;
    edtdddResidencial.text:= Fields[10].Text;
    edtResidencial.text   := Fields[11].Text;
    edtdddComercial.text  := Fields[12].Text;
    edtComercial.text     := Fields[13].Text;
    edtdddCelular.text    := Fields[14].Text;
    edtCelular.text       := Fields[15].Text;
    edtEmail.text         := Fields[16].Text;
    edtURL.text           := Fields[17].Text;
    edtOBs.text           := Fields[18].Text;
  end;
  //edtCampo.ItemIndex := 0;
  edtConsulta.Text := '';
  pConsulta.Visible :=false;
  fpBody.Enabled := false;
  btnConsulta.Enabled := true;
  btnFirst.Visible := true;
  btnPrior.Visible := true;
  btnNext.Visible := true;
  btnLast.Visible := true;
  if existeregistro then
    btnExclui.Enabled := true;
  btnInclui.Enabled := true;
  btnAltera.Enabled := true;
end;

procedure TfrmCliente.edtLimiteChange(Sender: TObject);
begin
  edtSaldo.Value := (edtLimite.value - edtDivida.Value);
end;

procedure TfrmCliente.edtSaldoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCliente.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmCliente.dbgConsultaDrawColumnCell(Sender: TObject;
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
