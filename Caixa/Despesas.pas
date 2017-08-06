unit Despesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, CurrEdit, ToolEdit, Mask, StdCtrls,
  TFlatEditUnit, Grids, DBGrids, RXDBCtrl, IBCustomDataSet,
  IBQuery, DB;

type
  TfrmDespesas = class(TfrmFormCadatroMini)
    Label16: TLabel;
    edtCadastro: TDateEdit;
    edtCodigo: TEdit;
    Label6: TLabel;
    Label4: TLabel;
    edtCredor: TComboEdit;
    Label14: TLabel;
    edtDescCredor: TLabel;
    Label1: TLabel;
    edtHistorico: TEdit;
    Label8: TLabel;
    edtValor: TCurrencyEdit;
    edtHora: TEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    cbConsulta: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta2: TRxDBGrid;
    FlatSpeedButton3: TFlatSpeedButton;
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
    procedure edtCredorChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2CellClick(Column: TColumn);
    procedure edtHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure edtCredorButtonClick(Sender: TObject);
    procedure qrNavegacaoAfterOpen(DataSet: TDataSet);
    procedure dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    Nav : Integer;
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
    function  Valida:boolean;
//    procedure Navegacao;
    procedure Edicao;
    procedure AtualizaNavegacao;
    procedure SetRegistroNavegacao;
  public
    { Public declarations }
  end;

implementation
uses Main, Principal, Consulta;
{$R *.dfm}

function TfrmDespesas.valida:boolean;
begin
  result := false;
  if edtvalor.Value <= 0 then
  begin
    exclusao2('Digite a quantia da Despesa.','Aviso');
    edtValor.setFocus;
    exit;
  end;
  if trim(edtCredor.text) = '' then
  begin
    exclusao2('Digite o Credor.','Aviso');
    edtHistorico.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmDespesas.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO DESPESAS (      ');
      Add('  DESPESAS,                 ');
      Add('  CADASTRO,                 ');
      Add('  HORA,                     ');
      Add('  VALOR,                    ');
      Add('  HISTORICO,                ');
      Add('  CREDOR,                   ');
      Add('  CAIXA                     ');
      Add(') VALUES (                  ');
      Add('  :DESPESAS,                ');
      Add('  :CADASTRO,                ');
      Add('  :HORA,                    ');
      Add('  :VALOR,                   ');
      Add('  :HISTORICO,               ');
      Add('  :CREDOR,                  ');
      Add('  :CAIXA                    ');
      Add(')                           ');
      ParamByName('DESPESAS'  ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'  ).AsDateTime  := (edtCadastro.date);
      ParamByName('HORA'      ).AsDateTime  := (StrToTimeDef(edtHora.text, 0));
      ParamByName('VALOR'     ).asFloat   := edtValor.Value;
      ParamByName('HISTORICO' ).asString  := edtHistorico.Text;
      ParamByName('CREDOR'    ).asInteger := strparaint(edtCredor.text);
      ParamByName('CAIXA'     ).asInteger := Caixa;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
//      UpdCodigo('DESPESAS', strtoint(edtCodigo.text));
      ApagaMovimento('Despesas','D�BITO',1,StrToIntDef(edtCodigo.text, 0));
      GeraMovimentacao(edtCadastro.date, 'Despesas','D�BITO',edtValor.Value, 1 ,strtoint(edtCodigo.text));
      result := true;
    end;
  end
  else if (Operacao = 'A')  then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  DESPESAS  SET       ');
      Add('  CADASTRO =:CADASTRO,      ');
      Add('  HORA =:HORA,              ');
      Add('  VALOR =:VALOR,            ');
      Add('  HISTORICO =:HISTORICO,    ');
      Add('  CREDOR =:CREDOR           ');
      Add('WHERE                       ');
      Add('  DESPESAS=:DESPESAS        ');
      ParamByName('DESPESAS'  ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'  ).AsDateTime  := (edtCadastro.date);
      ParamByName('HORA'      ).AsDateTime  := (StrToTimeDef(edtHora.text,0));
      ParamByName('VALOR'     ).asFloat   := edtValor.Value;
      ParamByName('HISTORICO' ).asString  := edtHistorico.Text;
      ParamByName('CREDOR'    ).asInteger := strparaint(edtCredor.text);
      ApagaMovimento('Despesas','D�BITO',1,StrToIntDef(edtCodigo.text, 0));
      GeraMovimentacao(edtCadastro.date, 'Despesas','D�BITO',edtValor.Value, 1 ,strtoint(edtCodigo.text));
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end
  else
    exclusao2('N�o � poss�vel alterar um caixa anterior','Aviso');
end;

procedure TfrmDespesas.FormShow(Sender: TObject);
begin
  if not CaixaAberto then
  begin
    Exclusao2('Voc� pode apenas fazer despesas com o caixa aberto.','Aviso');
    Close;
  end;
  CarregaGrid(dbgConsulta2);
  CarregarCampodePesquisa(Self.Name, cbConsulta);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM DESPESAS ORDER BY DESPESAS';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmDespesas.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_DESPESAS');
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

procedure TfrmDespesas.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtValor.SetFocus;
end;
procedure TfrmDespesas.Exclui;
begin
  if (ExisteRegistro) then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM DESPESAS WHERE DESPESAS=:DESPESAS  ');
         Params.ParamByName('DESPESAS').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
         ApagaMovimento('Despesas','D�BITO',1,StrToIntDef(edtCodigo.text, 0));
       end;
    except
      exclusao2('N�o foi poss�vel apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmDespesas.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmDespesas.LimpaCampos;
begin
  edtCodigo.text := '';
  edtHistorico.text := '';
  edtHora.text := '';
  edtValor.Value := 0;
  edtCadastro.text := '';
  edtCredor.text := '';
end;

procedure TfrmDespesas.btnExcluiClick(Sender: TObject);
begin
  if exclusao('Deseja excluir esse registro?','Exclus�o') then
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

procedure TfrmDespesas.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmDespesas.btnCancelaClick(Sender: TObject);
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

procedure TfrmDespesas.btnSalvaClick(Sender: TObject);
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
    exclusao2('N�o foi poss�vel salvar o resgistro','Aviso');
  end;
end;

{procedure TfrmDespesas.Navegacao;
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

procedure TfrmDespesas.Edicao;
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

procedure TfrmDespesas.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmDespesas.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;
end;

Procedure TfrmDespesas.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmDespesas.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmDespesas.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmDespesas.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmDespesas.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmDespesas.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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

procedure TfrmDespesas.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmDespesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta2);
  SalvarCampodePesquisa(Self.Name, cbConsulta.Text);
  loDespesas := nil;
  Action := caFree;
end;

procedure TfrmDespesas.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('DESPESAS' ).AsString;
    edtCadastro.date      := FieldByName('CADASTRO' ).AsDateTime;
    edtHora.text          := HpV(FieldByName('HORA').AsDateTime);
    edtValor.text         := FieldByName('VALOR'    ).AsString;
    edtHistorico.text     := FieldByName('HISTORICO').AsString;
    edtCredor.text        := FieldByName('CREDOR'   ).AsString;
  end;
  edicao;
end;

procedure TfrmDespesas.edtCredorChange(Sender: TObject);
begin
  if Trim(edtCredor.Text) = '' then
    edtDescCredor.Caption := ''
  else
    edtDescCredor.caption := LerDescricaoPorCampo('CREDOR', strtointdef(edtCredor.text,0) );
end;

procedure TfrmDespesas.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM DESPESAS ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmDespesas.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM DESPESAS WHERE '+cbConsulta.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmDespesas.edtConsultaKeyDown(Sender: TObject; var Key: Word;
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
      edtValor.text            :=  Fields[4].Text;
      edtHistorico.text        :=  Fields[5].Text;
      edtCredor.text           :=  Fields[6].Text;
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
  else if key = Vk_F9 then
  begin
    cbConsulta.SetFocus;
  end;
end;

procedure TfrmDespesas.dbgConsulta2CellClick(Column: TColumn);
begin
  with dbgConsulta2 do
  begin
    SelectedIndex            := 0;
    edtCodigo.Text           :=  Fields[0].Text;
    edtCadastro.date         :=  Fields[2].AsDateTime;
    edtHora.text             :=  Hpv(Fields[3].AsDateTime);
    edtValor.text            :=  Fields[4].Text;
    edtHistorico.text        :=  Fields[5].Text;
    edtCredor.text           :=  Fields[6].Text;
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

procedure TfrmDespesas.edtHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if Exclusao('Deseja Salvar e Iniciar novo registro?','Confirma��o do Sistema') then
    begin
      btnSalva.Click;
      btnInclui.Click;
    end;
  end;
end;

procedure TfrmDespesas.FlatSpeedButton3Click(Sender: TObject);
begin
  if frmPrincipal.Credor1.Enabled then
    frmPrincipal.Credor1Click(Sender);
end;

procedure TfrmDespesas.edtCredorButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+96+78, Left+15, 'CRED');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmDespesas.qrNavegacaoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(qrNavegacao.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TDateTimeField(qrNavegacao.FieldByName('HORA')).DisplayFormat := 'HH:MM';
end;

procedure TfrmDespesas.dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    cbConsulta.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmDespesas.dbgConsulta2DrawColumnCell(Sender: TObject;
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
