unit Credor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, StdCtrls, TFlatSpeedButtonUnit,
  ComCtrls, ExtCtrls, TFlatPanelUnit, Grids, DBGrids, RXDBCtrl, IBCustomDataSet, IBQuery,
  DB;

type
  TfrmCredor = class(TfrmFormCadatroMini)
    Label6: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    edtCampo: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta2: TRxDBGrid;
//    dbgConsulta: TRxDBGrid;
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
    procedure dbgConsulta2CellClick(Column: TColumn);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
  OPeracao : Char;
  Nav :Integer;
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

function TfrmCredor.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    exclusao2('Digite um Credor.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmCredor.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if Operacao = 'I' then
  begin
    with qrCadastro, qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO CREDOR (          ');
      Add('  CREDOR,                     ');
      Add('  DESCRICAO                   ');
      Add(' ) VALUES (                   ');
      Add(' :CREDOR,                     ');
      Add(' :DESCRICAO                   ');
      Add(' )                            ');
      Params.ParamByName('CREDOR'   ).AsInteger:= strtoint(edtCodigo.Text);
      Params.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      //UpdCodigo('CREDOR', strtoint(edtCodigo.text));
      result := true;
    end;
  end
  else  if Operacao = 'A' then
  begin
    with qrCadastro, qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE CREDOR SET              ');
      Add('  DESCRICAO =:DESCRICAO        ');
      Add('WHERE                          ');
      Add('  CREDOR=:CREDOR               ');
      Params.ParamByName('CREDOR').AsInteger    := strtoint(edtCodigo.Text);
      Params.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmCredor.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta2);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM CREDOR ORDER BY CREDOR';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmCredor.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_CREDOR');
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

procedure TfrmCredor.btnAlteraClick(Sender: TObject);
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
procedure TfrmCredor.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM CREDOR WHERE CREDOR=:CREDOR  ');
         Params.ParamByName('CREDOR').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmCredor.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmCredor.LimpaCampos;
begin
  edtCodigo.text := '';
  edtDescricao.text := '';
end;

procedure TfrmCredor.btnExcluiClick(Sender: TObject);
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
    btnConsulta.Enabled := true;
    limpacampos;
    atualizaNavegacao;
  end;
end;

procedure TfrmCredor.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmCredor.btnCancelaClick(Sender: TObject);
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

procedure TfrmCredor.btnSalvaClick(Sender: TObject);
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

{procedure TfrmCredor.Navegacao;
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

procedure TfrmCredor.Edicao;
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

procedure TfrmCredor.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmCredor.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmCredor.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmCredor.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmCredor.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmCredor.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmCredor.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmCredor.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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

procedure TfrmCredor.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmCredor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta2);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loCredor := nil;
  Action := caFree;
end;

procedure TfrmCredor.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('CREDOR'   ).AsString;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
  end;
  edicao;
end;

procedure TfrmCredor.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM CREDOR ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmCredor.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CREDOR WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmCredor.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta2 do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtDescricao.Text      := Fields[1].Text;
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
  else if key = Vk_F9 then
  begin
    edtCampo.SetFocus;
  end;
end;

procedure TfrmCredor.dbgConsulta2CellClick(Column: TColumn);
begin
  with dbgConsulta2 do
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

procedure TfrmCredor.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCredor.dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmCredor.dbgConsulta2DrawColumnCell(Sender: TObject;
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
