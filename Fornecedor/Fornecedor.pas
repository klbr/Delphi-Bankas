unit Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, DB, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, Mask, ToolEdit, StdCtrls, Grids, DBGrids,
  RXDBCtrl, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmFornecedor = class(TfrmFormCadatroMini)
    edtCadastro: TDateEdit;
    Label16: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtRazaoSocial: TEdit;
    Label3: TLabel;
    edtFantasia: TEdit;
    Label4: TLabel;
    edtEndereco: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    Label7: TLabel;
    edtCidade: TEdit;
    Label8: TLabel;
    edtCep: TMaskEdit;
    Label10: TLabel;
    edtEmail: TEdit;
    Label11: TLabel;
    edtURL: TEdit;
    Label12: TLabel;
    edtOBS: TEdit;
    Label9: TLabel;
    edtdddComercial: TMaskEdit;
    edtComercial: TMaskEdit;
    edtDDDcomercial2: TMaskEdit;
    edtComercial2: TMaskEdit;
    edtdddComercial3: TMaskEdit;
    edtComercial3: TMaskEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label17: TLabel;
    Label18: TLabel;
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
    procedure LimpaCampos;
    procedure FPrior;
    procedure FFirst;
    Procedure FNext;
    procedure FLast;
    function  valida:boolean;
//    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
    procedure SetRegistroNavegacao;
  public
    { Public declarations }
  end;

implementation
uses Main, Principal;
{$R *.dfm}

function TfrmFornecedor.valida:boolean;
begin
  result := false;
  if trim(edtFantasia.text) = '' then
  begin
    Exclusao2('Digite um Fornecedor.','Aviso');
    edtFantasia.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmFornecedor.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO FORNECEDOR (      ');
      Add('  FORNECEDOR,                 ');
      Add('  CADASTRO,                   ');
      Add('  RAZAOSOCIAL,                ');
      Add('  DESCRICAO,                  ');
      Add('  ENDERECO,                   ');
      Add('  BAIRRO,                     ');
      Add('  CIDADE,                     ');
      Add('  CEP,                        ');
      Add('  DDDCOMERCIAL,               ');
      Add('  COMERCIAL,                  ');
      Add('  DDDCOMERCIAL2,              ');
      Add('  COMERCIAL2,                 ');
      Add('  DDDCOMERCIAL3,              ');
      Add('  COMERCIAL3,                 ');
      Add('  EMAIL,                      ');
      Add('  URL,                        ');
      Add('  OBS                         ');
      Add(') VALUES (                    ');
      Add('  :FORNECEDOR,                ');
      Add('  :CADASTRO,                  ');
      Add('  :RAZAOSOCIAL,               ');
      Add('  :DESCRICAO,                 ');
      Add('  :ENDERECO,                  ');
      Add('  :BAIRRO,                    ');
      Add('  :CIDADE,                    ');
      Add('  :CEP,                       ');
      Add('  :DDDCOMERCIAL,              ');
      Add('  :COMERCIAL,                 ');
      Add('  :DDDCOMERCIAL2,             ');
      Add('  :COMERCIAL2,                ');
      Add('  :DDDCOMERCIAL3,             ');
      Add('  :COMERCIAL3,                ');
      Add('  :EMAIL,                     ');
      Add('  :URL,                       ');
      Add('  :OBS                        ');
      Add(')                             ');
      ParamByName('FORNECEDOR'   ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'     ).AsDateTime  := (edtCadastro.date);
      ParamByName('RAZAOSOCIAL'  ).asString  := edtRazaosocial.text;
      ParamByName('DESCRICAO'    ).asString  := edtFantasia.text;
      ParamByName('ENDERECO'     ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'       ).asString  := edtBairro.text;
      ParamByName('CIDADE'       ).asString  := edtCidade.text;
      ParamByName('CEP'          ).asString  := edtCep.text;
      ParamByName('DDDCOMERCIAL' ).asString  := edtdddcomercial.text;
      ParamByName('COMERCIAL'    ).asString  := edtComercial.text;
      ParamByName('DDDCOMERCIAL2').asString  := edtdddcomercial2.text;
      ParamByName('COMERCIAL2'   ).asString  := edtComercial2.text;
      ParamByName('DDDCOMERCIAL3').asString  := edtdddcomercial3.text;
      ParamByName('COMERCIAL3'   ).asString  := edtComercial3.text;
      ParamByName('EMAIL'        ).asString  := edtEmail.text;
      ParamByName('URL'          ).asString  := edtURL.text;
      ParamByName('OBS'          ).asString  := edtOBS.text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('FORNECEDOR', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if (Operacao = 'A') and (valida) then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  FORNECEDOR  SET        ');
      Add('  CADASTRO  =:CADASTRO,        ');
      Add('  RAZAOSOCIAL =:RAZAOSOCIAL,   ');
      Add('  DESCRICAO =:DESCRICAO,       ');
      Add('  ENDERECO =:ENDERECO,         ');
      Add('  BAIRRO =:BAIRRO,             ');
      Add('  CIDADE = :CIDADE,            ');
      Add('  CEP = :CEP,                  ');
      Add('  DDDCOMERCIAL =:DDDCOMERCIAL, ');
      Add('  COMERCIAL=:COMERCIAL,        ');
      Add('  DDDCOMERCIAL2=:DDDCOMERCIAL2,');
      Add('  COMERCIAL2=:COMERCIAL2,      ');
      Add('  DDDCOMERCIAL3=:DDDCOMERCIAL3,');
      Add('  COMERCIAL3=:COMERCIAL3,      ');
      Add('  EMAIL=:EMAIL,                ');
      Add('  URL=:URL,                    ');
      Add('  OBS=:OBS                     ');
      Add('WHERE                          ');
      Add('  FORNECEDOR=:FORNECEDOR       ');
      ParamByName('FORNECEDOR'   ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'     ).AsDateTime  := (edtCadastro.date);
      ParamByName('RAZAOSOCIAL'  ).asString  := edtRazaosocial.text;
      ParamByName('DESCRICAO'    ).asString  := edtFantasia.text;
      ParamByName('ENDERECO'     ).asString  := edtEndereco.text;
      ParamByName('BAIRRO'       ).asString  := edtBairro.text;
      ParamByName('CIDADE'       ).asString  := edtCidade.text;
      ParamByName('CEP'          ).asString  := edtCep.text;
      ParamByName('DDDCOMERCIAL' ).asString  := edtdddcomercial.text;
      ParamByName('COMERCIAL'    ).asString  := edtComercial.text;
      ParamByName('DDDCOMERCIAL2').asString  := edtdddcomercial2.text;
      ParamByName('COMERCIAL2'   ).asString  := edtComercial2.text;
      ParamByName('DDDCOMERCIAL3').asString  := edtdddcomercial3.text;
      ParamByName('COMERCIAL3'   ).asString  := edtComercial3.text;
      ParamByName('EMAIL'        ).asString  := edtEmail.text;
      ParamByName('URL'          ).asString  := edtURL.text;
      ParamByName('OBS'          ).asString  := edtOBS.text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmFornecedor.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FORNECEDOR';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmFornecedor.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_FORNECEDOR');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;
  edtRazaoSocial.SetFocus;
  edtCadastro.Date := now;
  Operacao := 'I';
end;

procedure TfrmFornecedor.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;  
  edtRazaoSocial.SetFocus;
end;
procedure TfrmFornecedor.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM FORNECEDOR WHERE FORNECEDOR=:FORNECEDOR  ');
         Params.ParamByName('FORNECEDOR').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      Exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmFornecedor.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmFornecedor.LimpaCampos;
begin
  edtCodigo.text := '';
  edtCadastro.text := '';
  edtRazaoSocial.text := '';
  edtFantasia.text := '';
  edtendereco.text :='';
  edtCidade.text := '';
  edtBairro.text := '';
  edtCep.text := '';
  edtComercial.text := '';
  edtdddcomercial.text := '';
  edtdddcomercial2.text :='';
  edtcomercial2.text := '';
  edtdddcomercial3.text :='';
  edtcomercial3.text := '';
  edtemail.text := '';
  edturl.text :='';
  edtobs.text :='';
end;

procedure TfrmFornecedor.btnExcluiClick(Sender: TObject);
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
    btnConsulta.Enabled := True;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmFornecedor.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

procedure TfrmFornecedor.btnCancelaClick(Sender: TObject);
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

procedure TfrmFornecedor.btnSalvaClick(Sender: TObject);
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
    Exclusao2('Não foi possível savar o resgistro','Aviso');
  end;
end;

{procedure TfrmFornecedor.Navegacao;
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

procedure TfrmFornecedor.Edicao;
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

procedure TfrmFornecedor.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

Procedure TfrmFornecedor.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

Procedure TfrmFornecedor.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

procedure TfrmFornecedor.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmFornecedor.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmFornecedor.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmFornecedor.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmFornecedor.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (Key = Vk_F10) then
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

procedure TfrmFornecedor.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  //Navegacao;
end;

procedure TfrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loFornecedor := nil;
  Action := caFree;
end;

procedure TfrmFornecedor.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('FORNECEDOR'   ).AsString;
    edtCadastro.Date      := FieldByName('CADASTRO'     ).AsDateTime;
    edtRazaosocial.text   := FieldByName('RAZAOSOCIAL'  ).asString;
    edtFantasia.text      := FieldByName('DESCRICAO'    ).asString;
    edtEndereco.text      := FieldByName('ENDERECO'     ).asString;
    edtBairro.text        := FieldByName('BAIRRO'       ).asString;
    edtCidade.text        := FieldByName('CIDADE'       ).asString;
    edtCep.text           := FieldByName('CEP'          ).asString;
    edtdddcomercial.text  := FieldByName('DDDCOMERCIAL' ).asString;
    edtComercial.text     := FieldByName('COMERCIAL'    ).asString;
    edtdddcomercial2.text := FieldByName('DDDCOMERCIAL2').asString;
    edtComercial2.text    := FieldByName('COMERCIAL2'   ).asString;
    edtdddcomercial3.text := FieldByName('DDDCOMERCIAL3').asString;
    edtComercial3.text    := FieldByName('COMERCIAL3'   ).asString;
    edtEmail.text         := FieldByName('EMAIL'        ).asString;
    edtURL.text           := FieldByName('URL'          ).asString;
    edtOBS.text           := FieldByName('OBS'          ).asString;
  end;
  edicao;
end;

procedure TfrmFornecedor.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM FORNECEDOR ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmFornecedor.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM FORNECEDOR WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmFornecedor.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtCadastro.date      := Fields[1].AsDateTime;
      edtFantasia.Text      := Fields[2].Text;
      edtRazaosocial.text   := Fields[3].Text;
      edtEndereco.text      := Fields[4].Text;
      edtBairro.text        := Fields[5].Text;
      edtCidade.text        := Fields[6].Text;
      edtCep.text           := Fields[7].Text;
      edtdddcomercial.text  := Fields[8].Text;
      edtComercial.text     := Fields[9].Text;
      edtdddcomercial2.text := Fields[10].Text;
      edtComercial2.text    := Fields[11].Text;
      edtdddcomercial3.text := Fields[12].Text;
      edtComercial3.text    := Fields[13].Text;
      edtEmail.text         := Fields[14].Text;
      edtURL.text           := Fields[15].Text;
      edtOBS.text           := Fields[16].Text;
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

procedure TfrmFornecedor.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtCadastro.date      := Fields[1].AsDateTime;
    edtFantasia.Text      := Fields[2].Text;
    edtRazaosocial.text   := Fields[3].Text;
    edtEndereco.text      := Fields[4].Text;
    edtBairro.text        := Fields[5].Text;
    edtCidade.text        := Fields[6].Text;
    edtCep.text           := Fields[7].Text;
    edtdddcomercial.text  := Fields[8].Text;
    edtComercial.text     := Fields[9].Text;
    edtdddcomercial2.text := Fields[10].Text;
    edtComercial2.text    := Fields[11].Text;
    edtdddcomercial3.text := Fields[12].Text;
    edtComercial3.text    := Fields[13].Text;
    edtEmail.text         := Fields[14].Text;
    edtURL.text           := Fields[15].Text;
    edtOBS.text           := Fields[16].Text;
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

procedure TfrmFornecedor.edtOBSKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFornecedor.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmFornecedor.dbgConsultaDrawColumnCell(Sender: TObject;
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
