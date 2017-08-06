unit TipoPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, Mask, ToolEdit, StdCtrls, ASGSQLite, DB,
  TFlatSpeedButtonUnit, ComCtrls, ExtCtrls, TFlatPanelUnit;

type
  TfrmTipoPagamento = class(TfrmFormCadatroMini)
    Label1: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    edtDescricao: TEdit;
    edtCadastro: TDateEdit;
    edtCodigo: TEdit;
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
  private
  OPeracao : Char;
  protected
    function Salva:boolean;
    procedure Exclui;
    function  ExisteRegistro: boolean;
    procedure LimpaCampos;
    procedure FPrior;
    procedure FFirst;
    Procedure FNext;
    procedure FLast;
    function  valida:boolean;
    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
    procedure SetRegistroNavegacao;
  public
    { Public declarations }
  end;

var
  frmTipoPagamento: TfrmTipoPagamento;

implementation
uses Main, FormConsulta;
{$R *.dfm}

function TfrmTipoPagamento.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    messagebox(0,'Digite um Tipo de Pagamento.','Aviso', MB_OK);
    edtDescricao.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmTipoPagamento.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO TIPOPAGAMENTO (   ');
      Add('  GRUPO,                      ');
      Add('  CADASTRO,                   ');
      Add('  DESCRICAO                   ');
      Add(') VALUES (                    ');
      Add('  :GRUPO,                     ');
      Add('  :CADASTRO,                  ');
      Add('  :DESCRICAO                  ');
      Add(')                             ');
      Params.ParamByName('TIPOPAGAMENTO').asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO'    ).asString  := edtDescricao.text;
      Params.ParamByName('CADASTRO'     ).asDate    := edtCadastro.date;
      ExecSQL;
      UpdCodigo('TIPOPAGAMENTO', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if (Operacao = 'A') and (valida) then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  TIPOPAGAMENTO  SET     ');
      Add('  DESCRICAO =:DESCRICAO,       ');
      Add('  CADASTRO  =:CADASTRO         ');
      Add('WHERE                          ');
      Add('  TIPOPAGAMENTO=:TIPOPAGAMENTO ');
      Params.ParamByName('TIPOPAGAMENTO').asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO'    ).asString  := edtDescricao.text;
      Params.ParamByName('CADASTRO'     ).asDate    := edtCadastro.date;
      ExecSQL;
      result := true;
    end;
  end;
end;

procedure TfrmTipoPagamento.FormShow(Sender: TObject);
begin
  if not ConectaBanco(dbCadastro) then
  begin
    Messagebox(0,'Não foi possível conectar ao banco.', 'Erro no Sistema',MB_OK+MB_ICONEXCLAMATION);
    Close;
  end
  else
    qrNavegacao.Open;
end;

procedure TfrmTipoPagamento.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('TIPOPAGAMENTO');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  edtDescricao.SetFocus;
  edtCadastro.Date := now;
  Operacao := 'I';
end;

procedure TfrmTipoPagamento.btnAlteraClick(Sender: TObject);
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
procedure TfrmTipoPagamento.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM TIPOPAGAMENTO WHERE TIPOPAGAMENTO=:TIPOPAGAMENTO  ');
         Params.ParamByName('TIPOPAGAMENTO').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
       end;
    except
      Messagebox(0,'Não foi possível apagar o registro.','Aviso', MB_OK);
    end;
  end;
end;

function  TfrmTipoPagamento.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '') or (edtCodigo.Text <> '0');
end;

procedure TfrmTipoPagamento.LimpaCampos;
begin
  edtCodigo.text := '';
  edtDescricao.text := '';
  edtCadastro.text := '';
end;

procedure TfrmTipoPagamento.btnExcluiClick(Sender: TObject);
begin
  if messagebox(0,'Deseja excluir esse registro?','Exclusão',MB_YESNO+MB_ICONQUESTION) = ID_YES then
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

procedure TfrmTipoPagamento.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
    Navegacao;
  end;
end;

procedure TfrmTipoPagamento.btnCancelaClick(Sender: TObject);
begin
  limpaCampos;
  fpBody.enabled := false;
  btnInclui.Enabled := true;
  btnAltera.Enabled := false;
  btnExclui.Enabled := false;
  btnCancela.Enabled := false;
  btnSalva.Enabled := false;
end;

procedure TfrmTipoPagamento.btnSalvaClick(Sender: TObject);
begin
  if Salva then
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
    MessageBox(0,'Não foi possível salvar o resgistro','Aviso', MB_OK);
  end;
end;

procedure TfrmTipoPagamento.Navegacao;
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

procedure TfrmTipoPagamento.Edicao;
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

procedure TfrmTipoPagamento.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
    Navegacao;
  end;
end;

Procedure TfrmTipoPagamento.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
    Navegacao;
  end;
end;

Procedure TfrmTipoPagamento.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
    Navegacao;
  end;
end;

procedure TfrmTipoPagamento.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmTipoPagamento.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmTipoPagamento.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmTipoPagamento.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmTipoPagamento.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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
end;

procedure TfrmTipoPagamento.AtualizaNavegacao;
begin
  qrNavegacao.Close;
  qrNavegacao.Open;
end;

procedure TfrmTipoPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmTipoPagamento := nil;
  Action := caFree;
end;

procedure TfrmTipoPagamento.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('TIPOPAGAMENTO').AsString;
    edtCadastro.text      := FieldByName('CADASTRO'     ).AsString;
    edtDescricao.text     := FieldByName('DESCRICAO'    ).AsString;
  end;
  edicao;
end;

end.
