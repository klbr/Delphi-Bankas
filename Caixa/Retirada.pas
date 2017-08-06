unit Retirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, Mask, CurrEdit, ToolEdit, StdCtrls, Grids,
  TFlatSpeedButtonUnit, ComCtrls, ExtCtrls, TFlatPanelUnit, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, DB;

type
  TfrmRetirada = class(TfrmFormCadatroMini)
    Label6: TLabel;
    edtCodigo: TEdit;
    edtCadastro: TDateEdit;
    Label16: TLabel;
    edtHistorico: TEdit;
    edtValor: TCurrencyEdit;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    edtHora: TEdit;
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
    procedure edtHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrNavegacaoAfterOpen(DataSet: TDataSet);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
    function  Valida:boolean;
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

function TfrmRetirada.valida:boolean;
begin
  result := false;
  if edtvalor.Value <= 0 then
  begin
    exclusao2('Digite a quantia da Retirada.','Aviso');
    edtValor.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmRetirada.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO RETIRADA (      ');
      Add('  RETIRADA,                 ');
      Add('  CADASTRO,                 ');
      Add('  HORA,                     ');
      Add('  VALOR,                    ');
      Add('  HISTORICO,                ');
      Add('  CAIXA                     ');
      Add(') VALUES (                  ');
      Add('  :RETIRADA,                ');
      Add('  :CADASTRO,                ');
      Add('  :HORA,                    ');
      Add('  :VALOR,                   ');
      Add('  :HISTORICO,               ');
      Add('  :CAIXA                    ');
      Add(')                           ');
      ParamByName('RETIRADA'  ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'  ).AsDateTime  := (edtCadastro.date);
      ParamByName('HORA'      ).AsDateTime  := (StrToTimeDef(edtHora.text,0));
      ParamByName('VALOR'     ).asFloat   := edtValor.Value;
      ParamByName('HISTORICO' ).asString  := edtHistorico.Text;
      ParamByName('CAIXA'     ).asInteger := Caixa;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
//      UpdCodigo('RETIRADAS', strtoint(edtCodigo.text));
      ApagaMovimento('Retirada','DÉBITO',1,StrToIntDef(edtCodigo.text, 0));
      GeraMovimentacao(edtCadastro.date, 'Retirada','DÉBITO',edtValor.Value, 1 ,strtoint(edtCodigo.text));
      result := true;
    end;
  end
  else if (Operacao = 'A')  then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  RETIRADA  SET       ');
      Add('  CADASTRO =:CADASTRO,      ');
      Add('  HORA =:HORA,              ');
      Add('  VALOR =:VALOR,            ');
      Add('  HISTORICO =:HISTORICO     ');
      Add('WHERE                       ');
      Add('  RETIRADA=:RETIRADA        ');
      ParamByName('RETIRADA').asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'  ).AsDateTime  := (edtCadastro.date);
      ParamByName('HORA'      ).AsDateTime  := (StrToTimeDef(edtHora.text,0));
      ParamByName('VALOR'     ).asFloat   := edtValor.Value;
      ParamByName('HISTORICO' ).asString  := edtHistorico.Text;
      ApagaMovimento('Retirada','DÉBITO',1,StrToIntDef(edtCodigo.text, 0));
      GeraMovimentacao(edtCadastro.date, 'Retirada','DÉBITO',edtValor.Value, 1 ,strtoint(edtCodigo.text));
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end
  else
    exclusao2('Não é possível alterar um caixa anterior','Aviso');
end;

procedure TfrmRetirada.FormShow(Sender: TObject);
begin
  if not CaixaAberto then
  begin
    Exclusao2('Você pode apenas fazer retiradas com o caixa aberto.','Aviso');
    Close;
  end;
  CarregaGrid(dbgConsulta);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM RETIRADA ORDER BY RETIRADA';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmRetirada.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_RETIRADAS');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtValor.SetFocus;
  edtCadastro.date := now;
  edtHora.text := copy(TimetoStr(now),1,5);
  Operacao := 'I';
end;

procedure TfrmRetirada.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtCadastro.SetFocus;
end;
procedure TfrmRetirada.Exclui;
begin
  if (ExisteRegistro) then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM RETIRADA WHERE RETIRADA=:RETIRADA  ');
         Params.ParamByName('RETIRADA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
         ApagaMovimento('Retirada','DÉBITO',1,StrToIntDef(edtCodigo.text, 0));
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmRetirada.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmRetirada.LimpaCampos;
begin
  edtCodigo.text := '';
  edtHistorico.text := '';
  edtHora.text := '';
  edtValor.Value := 0;
  edtCadastro.text := '';
end;

procedure TfrmRetirada.btnExcluiClick(Sender: TObject);
begin
  if exclusao('Deseja excluir esse registro?','Exclusão') then
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

procedure TfrmRetirada.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;  
end;

procedure TfrmRetirada.btnCancelaClick(Sender: TObject);
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

procedure TfrmRetirada.btnSalvaClick(Sender: TObject);
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
    AtualizaNavegacao;
  end
  else
  begin
    exclusao2('Não foi possível salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmRetirada.Navegacao;
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

procedure TfrmRetirada.Edicao;
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

procedure TfrmRetirada.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;
end;

Procedure TfrmRetirada.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;
end;

Procedure TfrmRetirada.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;     
end;

procedure TfrmRetirada.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmRetirada.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmRetirada.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmRetirada.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmRetirada.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = Vk_f10) then
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

procedure TfrmRetirada.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmRetirada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loRetirada := nil;
  Action := caFree;
end;

procedure TfrmRetirada.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('RETIRADA' ).AsString;
    edtCadastro.date      := FieldByName('CADASTRO' ).AsDateTime;
    edtHora.text          := Hpv(FieldByName('HORA').AsDateTime);
    edtValor.text         := FieldByName('VALOR'    ).AsString;
    edtHistorico.text     := FieldByName('HISTORICO').AsString;
  end;
  edicao;
end;

procedure TfrmRetirada.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM RETIRADA ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmRetirada.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM RETIRADA WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmRetirada.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text           := Fields[0].Text;
      edtCadastro.date         :=  Fields[2].AsDateTime;
      edtHora.text             :=  HpV(Fields[3].AsDateTime);
      edtValor.text            :=  Fields[4].Text;
      edtHistorico.text        :=  Fields[5].Text;
    end;
    btnFirst.Visible := true;
    btnPrior.Visible := true;
    btnNext.Visible := true;
    btnLast.Visible := true;
    Edicao;
    //edtCampo.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;
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
    Edicao;
  end
  else if Key = VK_f9 then
  begin
    edtCampo.SetFocus;
  end;  
end;

procedure TfrmRetirada.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text           := Fields[0].Text;
    edtCadastro.Date         :=  Fields[2].AsDateTime;
    edtHora.text             :=  Hpv(Fields[3].AsDateTime);
    edtValor.text            :=  Fields[4].Text;
    edtHistorico.text        :=  Fields[5].Text;
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
  Edicao;
end;

procedure TfrmRetirada.edtHistoricoKeyPress(Sender: TObject;
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

procedure TfrmRetirada.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmRetirada.qrNavegacaoAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('HORA'    )).DisplayFormat := 'HH:MM';
end;

procedure TfrmRetirada.dbgConsultaDrawColumnCell(Sender: TObject;
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
