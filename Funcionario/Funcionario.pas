unit Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, DB, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, StdCtrls, Mask, ToolEdit, CurrEdit, Grids,
  DBGrids, RXDBCtrl, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmFuncionario = class(TfrmFormCadatroMini)
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
    Label17: TLabel;
    edtComissao: TCurrencyEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    edtCampo: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta: TRxDBGrid;
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
    procedure edtOBSKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
  OPeracao : Char;
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
  public
    { Public declarations }
  end;

implementation
uses Main, Principal;

{$R *.dfm}

function TfrmFuncionario.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    exclusao2('Digite o nome do Funcionario.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmFuncionario.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO FUNCIONARIO (       ');
      Add('  FUNCIONARIO,                  ');
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
      Add('  COMISSAO,                     ');
      Add('  OBS                           ');
      Add(') VALUES (                      ');
      Add('  :FUNCIONARIO,                 ');
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
      Add('  :COMISSAO,                    ');
      Add('  :OBS                          ');
      Add(')                               ');
      ParamByName('FUNCIONARIO'   ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'      ).AsDateTime  := (edtCadastro.date);
      ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      ParamByName('ENDERECO'      ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'        ).asString  := edtBairro.text;
      ParamByName('CIDADE'        ).asString  := edtCidade.text;
      ParamByName('CEP'           ).asString  := edtCEP.text;
      ParamByName('NASCIMENTO'    ).AsDateTime  := (edtNascimento.date);
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
      ParamByName('COMISSAO'      ).asFloat   := edtComissao.Value;
      ParamByName('OBS'           ).asString  := edtOBs.text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('FUNCIONARIO', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if (Operacao = 'A') and (valida) then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  FUNCIONARIO  SET           ');
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
      Add('  COMISSAO = :COMISSAO,            ');
      Add('  OBS = :OBS                       ');
      Add('WHERE                              ');
      Add('  FUNCIONARIO = :FUNCIONARIO       ');
      ParamByName('FUNCIONARIO'   ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'      ).AsDateTime  := (edtCadastro.date);
      ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      ParamByName('ENDERECO'      ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'        ).asString  := edtBairro.text;
      ParamByName('CIDADE'        ).asString  := edtCidade.text;
      ParamByName('CEP'           ).asString  := edtCEP.text;
      ParamByName('NASCIMENTO'    ).AsDateTime := (edtNascimento.date);
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
      ParamByName('COMISSAO'      ).asFloat   := edtComissao.Value;
      ParamByName('OBS'           ).asString  := edtOBs.text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmFuncionario.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM FUNCIONARIO ORDER BY FUNCIONARIO';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmFuncionario.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_FUNCIONARIO');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  edtDescricao.SetFocus;
  edtCadastro.date := now;
  btnConsulta.Enabled := False;  
  Operacao := 'I';
end;

procedure TfrmFuncionario.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;
  edtDescricao.SetFocus;
end;
procedure TfrmFuncionario.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM FUNCIONARIO WHERE FUNCIONARIO=:FUNCIONARIO  ');
         Params.ParamByName('FUNCIONARIO').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmFuncionario.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmFuncionario.LimpaCampos;
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
  edtComissao.value     := 0;
end;

procedure TfrmFuncionario.btnExcluiClick(Sender: TObject);
begin
  if exclusao('','') then
  begin
    Exclui;
    fpBody.enabled := false;
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    btnExclui.Enabled := false;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := True;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmFuncionario.FPrior;
begin
  qrNavegacao.Prior;
  SetRegistroNavegacao;
  //Navegacao;
end;

procedure TfrmFuncionario.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
  btnConsulta.Enabled := True;  
end;

procedure TfrmFuncionario.btnSalvaClick(Sender: TObject);
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
    btnConsulta.Enabled := True;
    fpBody.Enabled := false;
    AtualizaNavegacao;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmFuncionario.Navegacao;
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

procedure TfrmFuncionario.Edicao;
begin
  if existeRegistro then
  begin
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
    btnConsulta.Enabled := True;
  end;
end;

procedure TfrmFuncionario.FFirst;
begin
  qrNavegacao.First;
  SetRegistroNavegacao;
  //Navegacao;
end;

Procedure TfrmFuncionario.FNext;
begin
  qrNavegacao.Next;
  SetRegistroNavegacao;
  //Navegacao;
end;

Procedure TfrmFuncionario.FLast;
begin
  qrNavegacao.Last;
  SetRegistroNavegacao;
  //Navegacao;
end;

procedure TfrmFuncionario.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmFuncionario.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmFuncionario.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmFuncionario.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmFuncionario.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) OR (kEY= vk_f9) then
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

procedure TfrmFuncionario.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  //Navegacao;
end;

procedure TfrmFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loFuncionario := nil;
  Action := caFree;
end;

procedure TfrmFuncionario.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('FUNCIONARIO').AsString;
    edtCadastro.date      := FieldByName('CADASTRO').AsDateTime;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
    edtEndereco.text      := FieldByName('ENDERECO').AsString;
    edtBairro.text        := FieldByName('BAIRRO').AsString;
    edtCidade.text        := FieldByName('CIDADE').AsString;
    edtCEP.text           := FieldByName('CEP').AsString;
    edtNascimento.date    := FieldByName('NASCIMENTO').AsDateTime;
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
    edtComissao.text      := FieldByName('COMISSAO').AsString;
  end;
  edicao;
end;

procedure TfrmFuncionario.btnConsultaClick(Sender: TObject);
begin
  btnConsulta.Enabled := False;
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
    Add('SELECT * FROM FUNCIONARIO ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmFuncionario.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM FUNCIONARIO WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmFuncionario.edtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtCadastro.date      := Fields[1].AsDateTime;
      edtDescricao.text     := Fields[2].Text;
      edtEndereco.text      := Fields[3].Text;
      edtCidade.text        := Fields[4].Text;
      edtBairro.text        := Fields[5].Text;
      edtCEP.text           := Fields[6].Text;
      edtNascimento.date    := Fields[7].AsDateTime;
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
      edtComissao.text      := Fields[18].Text;
      edtOBs.text           := Fields[19].Text;
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
  else if Key = VK_f9 then
  begin
    edtCampo.SetFocus;
  end;
end;

procedure TfrmFuncionario.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtCadastro.date      := Fields[1].AsDateTime;
    edtDescricao.text     := Fields[2].Text;
    edtEndereco.text      := Fields[3].Text;
    edtCidade.text        := Fields[4].Text;
    edtBairro.text        := Fields[5].Text;
    edtCEP.text           := Fields[6].Text;
    edtNascimento.date    := Fields[7].AsDateTime;
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
    edtComissao.text      := Fields[18].Text;
    edtOBs.text           := Fields[19].Text;
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

procedure TfrmFuncionario.edtOBSKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFuncionario.dbgConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmFuncionario.dbgConsultaDrawColumnCell(Sender: TObject;
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
