unit Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, DB, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, Mask, TFlatMaskEditUnit, StdCtrls,
  TFlatEditUnit, CurrEdit, ToolEdit, RXCtrls, TFlatCheckBoxUnit,
  TFlatGroupBoxUnit, Barcode, Grids, DBGrids, RXDBCtrl, DBTables, Buttons,
  abarra, IBCustomDataSet, IBQuery;

type
  TfrmItem = class(TfrmFormCadatroMini)
    Label6: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtDescGrupo: TLabel;
    edtCadastro: TDateEdit;
    edtCodigo: TEdit;
    edtGrupo: TComboEdit;
    p1: TFlatPanel;
    Label5: TLabel;
    edtPrecoCompra: TCurrencyEdit;
    Label3: TLabel;
    edtPrecoVenda: TCurrencyEdit;
    Label10: TLabel;
    Label4: TLabel;
    edtLucro: TCurrencyEdit;
    barra: TBarcode;
    gbOp: TFlatGroupBox;
    cbEdicao: TFlatCheckBox;
    cbDesHabilitado: TFlatCheckBox;
    cbCodBarra: TFlatCheckBox;
    edtCodBarra: TEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label17: TLabel;
    Label7: TLabel;
    edtCampo: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta2: TRxDBGrid;
    FlatSpeedButton3: TFlatSpeedButton;
    Label8: TLabel;
    edtLucroMargem: TCurrencyEdit;
    ab: TABarra;
    SpeedButton1: TSpeedButton;
    edtDescricao: TComboBox;
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
    procedure edtCodBarraExit(Sender: TObject);
    procedure cbCodBarraExit(Sender: TObject);
    procedure edtPrecoCompraChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaCellClick(Column: TColumn);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtLucroKeyPress(Sender: TObject; var Key: Char);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsulta2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtLucroChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  public
    { Public declarations }
  end;

implementation
uses Main, Principal, Consulta;

{$R *.dfm}

function TfrmItem.valida:boolean;
begin
  result := false;
  if trim(edtDescricao.text) = '' then
  begin
    exclusao2('Digite o nome do Cliente.','Aviso');
    edtDescricao.setFocus;
    exit;
  end;
  if trim(edtGrupo.text) = '' then
  begin
    exclusao2('Digite um grupo.','Aviso');
    edtGrupo.setFocus;
    exit;
  end;

  if edtPrecoVenda.value <= 0 then
  begin
    exclusao2('Digite um preço válido.','Aviso');
    edtPrecoVenda.setFocus;
    exit;
  end;
  result := true;
end;

function  TfrmItem.Salva:boolean;
begin
  result := false;
  if not (valida) then
    exit;
  if (Operacao = 'I') then
  begin
    if ExisteProduto(FormataCodBarra(edtCodBarra.text)) then
    begin
      Exclusao2('Produto já está Cadastrado','Aviso');
      Exit;
    end
    else
    begin
      with qrCadastro,qrCadastro.SQL do
      begin
        Clear;
        Add('INSERT INTO ITEM (              ');
        Add('  ITEM,                         ');
        Add('  CADASTRO,                     ');
        Add('  DESCRICAO,                    ');
        Add('  GRUPO,                        ');
        Add('  PRECOVENDA,                   ');
        Add('  PRECOCOMPRA,                  ');
        Add('  DESHABILITADO,                ');
        Add('  CODBARRA,                     ');
        Add('  EDICAO,                       ');
        Add('  USARCODBARRA                  ');
        Add(') VALUES (                      ');
        Add('  :ITEM,                        ');
        Add('  :CADASTRO,                    ');
        Add('  :DESCRICAO,                   ');
        Add('  :GRUPO,                       ');
        Add('  :PRECOVENDA,                  ');
        Add('  :PRECOCOMPRA,                 ');
        Add('  :DESHABILITADO,               ');
        Add('  :CODBARRA,                    ');
        Add('  :EDICAO,                      ');
        Add('  :USARCODBARRA                 ');
        Add(')                               ');
        ParamByName('ITEM'          ).asInteger := strtoint(edtCodigo.text);
        ParamByName('CADASTRO'      ).AsDateTime := (edtCadastro.date);
        ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
        ParamByName('GRUPO'         ).asInteger := strparaint(edtGrupo.text);
        ParamByName('DESHABILITADO' ).AsString  := BparaS(cbDesHabilitado.Checked);
        ParamByName('PRECOVENDA'    ).asFloat   := edtPrecoVenda.Value;
        ParamByName('PRECOCOMPRA'   ).asFloat   := edtPrecoCompra.Value;
        ParamByName('CODBARRA'      ).asString  := FormataCodBarra(edtCodBarra.text);
        ParamByName('EDICAO'        ).AsString  := BparaS(cbEdicao.Checked);
        ParamByName('USARCODBARRA'  ).AsString  := BparaS(cbCodBarra.Checked);
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
        //UpdCodigo('ITEM', strtoint(edtCodigo.text));
        result := true;
        with frmPrincipal.cds do
        begin
           Append;
           FieldByName('CODBARRA' ).AsString := FormataCodBarra(edtCodBarra.text);
           FieldByName('DESCRICAO').AsString := edtDescricao.text;
           FieldByName('EDICAO'   ).AsString := BparaS(cbEdicao.Checked);
           Post;
        end;
      end;
    end;
  end;
  if (Operacao = 'A') then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  ITEM  SET                  ');
      Add('  CADASTRO = :CADASTRO,            ');
      Add('  DESCRICAO = :DESCRICAO,          ');
      Add('  GRUPO = :GRUPO,                  ');
      Add('  DESHABILITADO = :DESHABILITADO,  ');
      Add('  PRECOVENDA = :PRECOVENDA,        ');
      Add('  PRECOCOMPRA = :PRECOCOMPRA,      ');
      Add('  CODBARRA = :CODBARRA,            ');
      Add('  EDICAO = :EDICAO,                ');
      Add('  USARCODBARRA= :USARCODBARRA      ');
      Add('WHERE                              ');
      Add('  ITEM = :ITEM                     ');
      ParamByName('ITEM'          ).asInteger := strtoint(edtCodigo.text);
      ParamByName('CADASTRO'      ).AsDateTime := (edtCadastro.date);
      ParamByName('DESCRICAO'     ).asString  := edtDescricao.text;
      ParamByName('GRUPO'         ).asInteger := strparaint(edtGrupo.text);
      ParamByName('DESHABILITADO' ).AsString  := BparaS(cbDesHabilitado.Checked);
      ParamByName('PRECOVENDA'    ).asFloat   := edtPrecoVenda.Value;
      ParamByName('PRECOCOMPRA'   ).asFloat   := edtPrecoCompra.Value;
      ParamByName('CODBARRA'      ).asString  := FormataCodBarra(edtCodBarra.text);
      ParamByName('EDICAO'        ).AsString  := BparaS(cbEdicao.Checked);
      ParamByName('USARCODBARRA'  ).AsString  := BparaS(cbCodBarra.Checked);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
    end;
  end;
end;

procedure TfrmItem.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgConsulta2);
  CarregarCampodePesquisa(Self.Name, edtCampo);
  frmPrincipal.cds.First;
  edtDescricao.Items.Clear;
  while not frmPrincipal.cds.eof do
  begin
    edtDescricao.items.Add(frmPrincipal.cds.FieldByName('DESCRICAO').asstring);
    frmPrincipal.cds.Next;
  end;
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM ITEM ORDER BY ITEM';  
  qrNavegacao.Open;
  Flast;
end;

procedure TfrmItem.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_ITEM');
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;
  edtGrupo.SetFocus;
  edtCadastro.Date := now;
  Operacao := 'I';
end;

procedure TfrmItem.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  fpBody.Enabled := true;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnCancela.Enabled := true;
  btnExclui.Enabled := false;
  btnSalva.Enabled := true;
  btnConsulta.Enabled := False;
  edtGrupo.SetFocus;
end;
procedure TfrmItem.Exclui;
begin
  if ExisteRegistro then
  begin
    try
       with qrCadastro,qrCadastro.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM ITEM WHERE ITEM=:ITEM  ');
         Params.ParamByName('ITEM').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmItem.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmItem.LimpaCampos;
begin
  edtCodigo.text        := '';
  edtCadastro.text      := '';
  edtDescricao.text     := '';
  edtgrupo.text         := '';
  edtPrecoVenda.Value   := 0;
  edtPrecoCompra.Value  := 0;
  cbDesHabilitado.Checked := false;
  edtCodBarra.text      := '';
  cbEdicao.Checked      := false;
  cbCodBarra.Checked    := false;
  barra.Digits := '0000000000000';
end;

procedure TfrmItem.btnExcluiClick(Sender: TObject);
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

procedure TfrmItem.FPrior;
begin
  qrNavegacao.Prior;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmItem.btnCancelaClick(Sender: TObject);
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

procedure TfrmItem.btnSalvaClick(Sender: TObject);
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

{procedure TfrmItem.Navegacao;
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

procedure TfrmItem.Edicao;
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

procedure TfrmItem.FFirst;
begin
  qrNavegacao.First;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmItem.FNext;
begin
  qrNavegacao.Next;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

Procedure TfrmItem.FLast;
begin
  qrNavegacao.Last;
  SetRegistroNavegacao;
  Nav := qrNavegacao.RecNo; 
end;

procedure TfrmItem.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmItem.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmItem.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmItem.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmItem.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = vk_f10) then
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

procedure TfrmItem.AtualizaNavegacao;
begin
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Close;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgConsulta2);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  if (LerIniInteiro('BANCO','ATUALIZA') = 1) then
  begin
    with frmPrincipal do
    begin
      Query.Database := Principal.frmPrincipal.dba;
      Query.Close;
      Query.Open;
      cds.Close;
      cds.Open;
    end;
  end;
  loItem := nil;
  Action := caFree;
end;

procedure TfrmItem.SetRegistroNavegacao;
begin
  with qrNavegacao do
  begin
    edtCodigo.text        := FieldByName('ITEM').AsString;
    edtCadastro.date      := FieldByName('CADASTRO').AsDateTime;
    edtDescricao.text     := FieldByName('DESCRICAO').AsString;
    edtGrupo.text         := FieldByName('GRUPO').AsString;
    edtPrecoVenda.text    := FieldByName('PRECOVENDA').AsString;
    edtPrecoCompra.text   := FieldByName('PRECOCOMPRA').AsString;
    cbDesHabilitado.Checked:= SparaB(FieldByName('DESHABILITADO').AsString);
    edtCodBarra.text      := FieldByName('CODBARRA').AsString;
    cbEdicao.Checked      := SparaB(FieldByName('EDICAO').AsString);
    cbCodBarra.Checked    := SparaB(FieldByName('USARCODBARRA').AsString);
    if cbCodBarra.Checked then
      Barra.Digits := Copy(edtCodBarra.text,1,12)
    else
      barra.Visible := false;
  end;
  edicao;
end;

procedure TfrmItem.edtCodBarraExit(Sender: TObject);
begin
  if (barra.Visible) and (length(edtCodBarra.text) = 13) then
  begin
    barra.Digits := copy(edtCodBarra.text,1,12);
    barra.BarcodeType := btEAN13;
  end;
end;

procedure TfrmItem.cbCodBarraExit(Sender: TObject);
begin
  barra.Visible := cbCodBarra.Checked
end;

procedure TfrmItem.edtPrecoCompraChange(Sender: TObject);
begin
  edtLucro.Value := edtPrecoVenda.Value - edtPrecoCompra.Value;
  if edtPrecoVenda.Value > 0 then
    edtLucroMargem.Value := Round((1 - edtPrecoCompra.Value/edtPrecoVenda.Value)*100)
  else
    edtLucroMargem.Value := 100;
end;

procedure TfrmItem.btnConsultaClick(Sender: TObject);
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
    Add('SELECT * FROM ITEM ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmItem.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM ITEM WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmItem.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta2 do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtCadastro.date      := Fields[1].AsDateTime;
      edtDescricao.text     := Fields[2].Text;
      edtGrupo.text         :=  Fields[3].Text;
      edtCodBarra.text      :=  Fields[4].Text;
      cbEdicao.Checked      :=  SparaB(Fields[5].AsString);
      edtPrecoVenda.text    :=  Fields[6].Text;
      edtPrecoCompra.text   :=  Fields[7].Text;
      cbDesHabilitado.Checked:= SparaB(Fields[8].AsString);
      cbCodBarra.Checked    :=  SparaB(Fields[9].AsString);
    end;
    edtCampo.ItemIndex := 0;
    edtConsulta.Text := '';
    pConsulta.Visible :=false;
    fpBody.Enabled := false;
    btnConsulta.Enabled := true;

    if cbCodBarra.Checked then
      Barra.Digits := Copy(edtCodBarra.text,1,12)
    else
    barra.Visible := false;
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
    ////edtCampo.ItemIndex := 0;
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

procedure TfrmItem.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta2 do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtCadastro.Date      := Fields[1].AsDateTime;
    edtDescricao.text     := Fields[2].Text;
    edtGrupo.text         :=  Fields[3].Text;
    edtCodBarra.text      :=  Fields[4].Text;
    cbEdicao.Checked      :=  SparaB(Fields[5].AsString);
    edtPrecoVenda.text    :=  Fields[6].Text;
    edtPrecoCompra.text   :=  Fields[7].Text;
    cbDesHabilitado.Checked:= SparaB(Fields[8].AsString);
    cbCodBarra.Checked    :=  SparaB(Fields[9].AsString);
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
  if cbCodBarra.Checked then
    Barra.Digits := Copy(edtCodBarra.text,1,12)
  else
    barra.Visible := false;
end;

procedure TfrmItem.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
    edtDescGrupo.Caption := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0))
  else
    edtDescGrupo.Caption := '';
end;

procedure TfrmItem.edtLucroKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmItem.FlatSpeedButton3Click(Sender: TObject);
begin
  if frmPrincipal.Grupo2.Enabled then
    frmPrincipal.Grupo2Click(Sender);
end;

procedure TfrmItem.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SelectNext(ActiveControl, true, true);
    if Trim(edtGrupo.Text) = '' then
    begin
      edtDescGrupo.Caption := '';
    end
    else
    begin
      edtDescGrupo.caption := LerDescricaoPorCampo('GRUPO', strtointDef(edtGrupo.text,0) );
    end;
  end;
end;

procedure TfrmItem.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(loItem.Top+142,loItem.Left+228,'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := s;
end;

procedure TfrmItem.dbgConsulta2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmItem.dbgConsulta2DrawColumnCell(Sender: TObject;
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

procedure TfrmItem.edtLucroChange(Sender: TObject);
begin
  inherited;
  if edtPrecoVenda.Value > 0 then
    edtLucroMargem.Value := Round((1 - edtPrecoCompra.Value/edtPrecoVenda.Value)*100)
  else
    edtLucroMargem.Value := 100;
end;

procedure TfrmItem.SpeedButton1Click(Sender: TObject);
begin
  ab.Codigo := FormatFloat('000000000000' ,Strtofloat(edtCodBarra.Text));
  edtCodBarra.Text := ab.Codigo+ab.Digito;
end;

end.
