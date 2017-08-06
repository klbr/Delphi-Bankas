unit FormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, DB, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, Mask, ToolEdit, StdCtrls, RXSpin,
  TFlatGroupBoxUnit, CurrEdit, Grids, DBGrids, RXDBCtrl, DBTables,
  IBCustomDataSet, IBQuery;

type
  TfrmFormaPagamento = class(TfrmFormCadatroMini)
    Label1: TLabel;
    Label6: TLabel;
    edtDescricao: TEdit;
    edtCodigo: TEdit;
    Label8: TLabel;
    edtDesconto: TCurrencyEdit;
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
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
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

function TfrmFormaPagamento.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    exclusao2('Digite uma forma de pagamento.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmFormaPagamento.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO FORMAPAGAMENTO (  ');
      Add('  FORMAPAGAMENTO,             ');
      Add('  DESCRICAO,                  ');
      Add('  DESCONTO                    ');
      Add(') VALUES (                    ');
      Add('  :FORMAPAGAMENTO,            ');
      Add('  :DESCRICAO,                 ');
      Add('  :DESCONTO                   ');
      Add(')                             ');
      Params.ParamByName('FORMAPAGAMENTO'    ).asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO').asString  := edtDescricao.text;
      Params.ParamByName('DESCONTO' ).asFloat   := edtDesconto.Value;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('FORMAPAGAMENTO', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if Operacao = 'A' then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  FORMAPAGAMENTO  SET      ');
      Add('  DESCRICAO =:DESCRICAO,         ');
      Add('  DESCONTO =:DESCONTO            ');
      Add('WHERE                            ');
      Add('  FORMAPAGAMENTO=:FORMAPAGAMENTO ');
      Params.ParamByName('FORMAPAGAMENTO').asInteger := strtoint(edtCodigo.text);
      Params.ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      Params.ParamByName('DESCONTO'      ).asFloat   := edtDesconto.Value;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmFormaPagamento.FormShow(Sender: TObject);
begin
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM FORMAPAGAMENTO ORDER BY FORMAPAGAMENTO';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmFormaPagamento.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_FORMAPAGAMENTO');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;
  edtDescricao.SetFocus;
  Operacao := 'I';
end;

procedure TfrmFormaPagamento.btnAlteraClick(Sender: TObject);
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
procedure TfrmFormaPagamento.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM FORMAPAGAMENTO WHERE FORMAPAGAMENTO=:FORMAPAGAMENTO  ');
         Params.ParamByName('FORMAPAGAMENTO').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmFormaPagamento.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmFormaPagamento.LimpaCampos;
begin
  edtCodigo.text := '';
  edtDescricao.text := '';
  edtDesconto.Value := 0;
end;

procedure TfrmFormaPagamento.btnExcluiClick(Sender: TObject);
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

procedure TfrmFormaPagamento.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

procedure TfrmFormaPagamento.btnCancelaClick(Sender: TObject);
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

procedure TfrmFormaPagamento.btnSalvaClick(Sender: TObject);
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
    exclusao2('Não foi possível savar o resgistro','Aviso');
  end;
end;

{procedure TfrmFormaPagamento.Navegacao;
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

procedure TfrmFormaPagamento.Edicao;
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

procedure TfrmFormaPagamento.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

Procedure TfrmFormaPagamento.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

Procedure TfrmFormaPagamento.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
    //Navegacao;
  end;
end;

procedure TfrmFormaPagamento.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmFormaPagamento.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmFormaPagamento.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmFormaPagamento.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmFormaPagamento.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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

procedure TfrmFormaPagamento.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  //Navegacao;
end;

procedure TfrmFormaPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loFormaPagamento := nil;
  Action := caFree;
end;

procedure TfrmFormaPagamento.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('FORMAPAGAMENTO').AsString;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
    edtDesconto.text      := FieldByName('DESCONTO' ).AsString;
  end;
  edicao;
end;

procedure TfrmFormaPagamento.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM FORMAPAGAMENTO ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtCampo.SetFocus;
end;

procedure TfrmFormaPagamento.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM FORMAPAGAMENTO WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmFormaPagamento.edtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtDescricao.Text     := Fields[1].Text;
      edtDesconto.Text      := Fields[2].Text;
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
  end;
end;

procedure TfrmFormaPagamento.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtDescricao.text     := Fields[1].Text;
    edtDesconto.Text      := Fields[2].Text;
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

procedure TfrmFormaPagamento.edtDescontoKeyPress(Sender: TObject;
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

procedure TfrmFormaPagamento.dbgConsultaDrawColumnCell(Sender: TObject;
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
