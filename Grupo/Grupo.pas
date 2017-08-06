unit Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, DB, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, Mask, ToolEdit, StdCtrls, DBCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmGrupo = class(TfrmFormCadatroMini)
    Label1: TLabel;
    Label6: TLabel;
    edtDescricao: TEdit;
    edtCodigo: TEdit;
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
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
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

function TfrmGrupo.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    exclusao2('Digite um Grupo.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmGrupo.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if Operacao = 'I' then
  begin
    with qrCadastro, qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO GRUPO (           ');
      Add('  GRUPO,                      ');
      Add('  DESCRICAO                   ');
      Add(' ) VALUES (                   ');
      Add(' :GRUPO,                      ');
      Add(' :DESCRICAO                   ');
      Add(' )                            ');
      Params.ParamByName('GRUPO').AsInteger    := strtoint(edtCodigo.Text);
      Params.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('GRUPO', strtoint(edtCodigo.text));
      result := true;
    end;
  end;
  if Operacao = 'A' then
  begin
    with qrCadastro, qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE GRUPO SET               ');
      Add('  DESCRICAO =:DESCRICAO        ');
      Add('WHERE                          ');
      Add('  GRUPO=:GRUPO                 ');
      Params.ParamByName('GRUPO').AsInteger    := strtoint(edtCodigo.Text);
      Params.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmGrupo.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM GRUPO ORDER BY GRUPO';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmGrupo.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_GRUPO');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := false;
  edtDescricao.SetFocus;
  Operacao := 'I';
end;

procedure TfrmGrupo.btnAlteraClick(Sender: TObject);
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
procedure TfrmGrupo.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM GRUPO WHERE GRUPO=:GRUPO  ');
         Params.ParamByName('GRUPO').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmGrupo.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmGrupo.LimpaCampos;
begin
  edtCodigo.text := '';
  edtDescricao.text := '';
end;

procedure TfrmGrupo.btnExcluiClick(Sender: TObject);
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

procedure TfrmGrupo.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmGrupo.btnCancelaClick(Sender: TObject);
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

procedure TfrmGrupo.btnSalvaClick(Sender: TObject);
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

{procedure TfrmGrupo.Navegacao;
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

procedure TfrmGrupo.Edicao;
begin
  if existeRegistro then
  begin
    btnConsulta.Enabled := True;
    btnInclui.Enabled := true;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    btnCancela.Enabled := false;
    btnSalva.Enabled := false;
  end;
end;

procedure TfrmGrupo.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmGrupo.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmGrupo.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmGrupo.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmGrupo.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmGrupo.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmGrupo.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmGrupo.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = VK_F10) then
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

procedure TfrmGrupo.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loGrupo := nil;
  Action := caFree;
end;

procedure TfrmGrupo.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('GRUPO'    ).AsString;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
  end;
  edicao;
end;

procedure TfrmGrupo.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM GRUPO ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmGrupo.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM GRUPO WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmGrupo.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtDescricao.Text     := Fields[1].Text;
    end;
//    edtCampo.ItemIndex := 0;
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

procedure TfrmGrupo.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtDescricao.text     := Fields[1].Text;
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

procedure TfrmGrupo.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    if Exclusao('Deseja Salvar e Iniciar novo registro?','Confirmação do Sistema') then
    begin
      btnSalva.Click;
      btnInclui.Click;
    end;
  end;
end;

procedure TfrmGrupo.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmGrupo.dbgConsultaDrawColumnCell(Sender: TObject;
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
