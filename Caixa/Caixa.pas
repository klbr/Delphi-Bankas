unit Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, CurrEdit, Mask, ToolEdit, StdCtrls, Grids,
  DBGrids, RXDBCtrl, TFlatEditUnit, IBCustomDataSet, IBQuery, DB;

type
  TfrmCaixa = class(TfrmFormCadatroMini)
    Label6: TLabel;
    edtCodigo: TEdit;
    edtAbertura: TDateEdit;
    Label16: TLabel;
    edtHistorico: TEdit;
    Label1: TLabel;
    edtFechamento: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtCaixaAbertura: TCurrencyEdit;
    edtCaixaFechamento: TCurrencyEdit;
    dbgCaixa: TRxDBGrid;
//    qrMovimento: TASQLiteQuery;
    dsMovimento: TDataSource;
    edtHoraAbertura: TEdit;
    edtHoraFechamento: TEdit;
    pConsulta: TFlatPanel;
    Panel1: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    edtCampo: TComboBox;
    edtConsulta: TEdit;
    dbgConsulta: TRxDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    edtCredito: TFlatEdit;
    edtDebito: TFlatEdit;
    edtSaldo: TFlatEdit;
    Label10: TLabel;
    Label12: TLabel;
    edtCA: TFlatEdit;
    Label13: TLabel;
    Label14: TLabel;
    qrMovimento: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaCellClick(Column: TColumn);
    procedure edtCodigoClick(Sender: TObject);
    procedure qrMovimentoAfterOpen(DataSet: TDataSet);
    procedure qrNavegacaoAfterOpen(DataSet: TDataSet);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    OPeracao : Char;
    Nav : integer;
    procedure AtualizaGrid;
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
  end;

implementation
uses Main, Principal;
{$R *.dfm}

function TfrmCaixa.valida:boolean;
begin
  result := exclusao('Deseja prosseguir?','Abertura/Fechamento');
end;

function  TfrmCaixa.Salva:boolean;
var
  Qr : TIBQuery;
  DEBITO, CREDITO : Double;
begin
  result := false;
  if not valida then
    exit;

  if Operacao = 'I' then
  begin
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('INSERT INTO CAIXA (           ');
      Add('  CAIXA,                      ');
      Add('  DATAABERTURA,               ');
      Add('  HORAABERTURA,               ');
      Add('  CAIXAABERTURA,              ');
      Add('  HISTORICO                   ');
      Add(') VALUES (                    ');
      Add('  :CAIXA,                     ');
      Add('  :DATAABERTURA,              ');
      Add('  :HORAABERTURA,              ');
      Add('  :CAIXAABERTURA,             ');
      Add('  :HISTORICO                  ');
      Add(')                             ');
      ParamByName('CAIXA'        ).asInteger := strtoint(edtCodigo.text);
      ParamByName('DATAABERTURA' ).AsDateTime  := (Date);
      ParamByName('HORAABERTURA' ).AsDateTime  := (Time);
      ParamByName('CAIXAABERTURA').asFloat   := FechamentoAnterior;
      ParamByName('HISTORICO'    ).asString  := edtHistorico.text;
      edtCaixaAbertura.Value := FechamentoAnterior;
      edtCa.text := FormatFloat('#,##0.00',edtCaixaAbertura.Value);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
//      UpdCodigo('CAIXA', strtoint(edtCodigo.text));
      Main.Caixa := strtoint(edtCodigo.text);
      result := true;
    end;
  end
  else if Operacao = 'A' then
  begin
    qr := TIBQuery.Create(nil);
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Add('SELECT VALOR AS DEBITO FROM MOVIMENTO WHERE TIPO=''DÉBITO'' AND CAIXA=:CAIXA  ');
      Params.ParamByName('CAIXA').AsInteger := Main.Caixa;
      Open;
      First;
      Debito := 0;
      while not EOF do
      begin
        Debito := Debito + FieldByName('DEBITO').AsFloat;
        Next;
      end;
      close;
      clear;
      Database := frmPrincipal.dba;
      Add('SELECT VALOR AS CREDITO FROM MOVIMENTO WHERE TIPO=''CRÉDITO'' AND CAIXA=:CAIXA  ');
      Params.ParamByName('CAIXA').AsInteger := Main.Caixa;
      Open;
      First;
      Credito := 0;
      while not EOF do
      begin
        Credito := Credito + FieldByName('CREDITO').AsFloat;
        Next;
      end;
      close;
    end;
    qr.free;
    with qrCadastro,qrCadastro.SQL do
    begin
      Clear;
      Add('UPDATE  CAIXA  SET                  ');
      Add('  DATAFECHAMENTO =:DATAFECHAMENTO,  ');
      Add('  HORAFECHAMENTO=:HORAFECHAMENTO,   ');
      Add('  CAIXAFECHAMENTO =:CAIXAFECHAMENTO,');
      Add('  HISTORICO  =:HISTORICO            ');
      Add('WHERE                               ');
      Add('  CAIXA     =:CAIXA                 ');
      ParamByName('CAIXA'          ).asInteger := strtoint(edtCodigo.text);
      ParamByName('DATAFECHAMENTO' ).AsDateTime  := (Date);
      ParamByName('HORAFECHAMENTO' ).AsDateTime  := (Time);
      ParamByName('CAIXAFECHAMENTO').asFloat   := (Credito - Debito) + edtCaixaAbertura.value;
      ParamByName('HISTORICO'      ).asString  := edtHistorico.text;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      result := true;
      edtCaixaFechamento.value := (Credito - Debito)+ edtCaixaAbertura.value;
    end;
  end;
  AtualizaGrid;
  AtualizaNavegacao;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgCaixa);
  CarregaGrid(dbgConsulta);
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.SQL.Text := 'SELECT * FROM CAIXA ORDER BY CAIXA';  
  qrNavegacao.Open;
  Flast;
  if (edtHoraAbertura.text = '') and (edtHoraFechamento.text = '') then
    btnInclui.Click;
  edtHistorico.SetFocus;
end;

procedure TfrmCaixa.btnIncluiClick(Sender: TObject);
begin
  LimpaCampos;
  edtCodigo.text := SequencialUser('G_CAIXA');
  Operacao := 'I';
  if salva then
  begin
    exclusao2('Abertura do Caixa concluida','Caixa');
    btnAltera.Enabled := true;
    btnInclui.Enabled := false;
    edtAbertura.date := date;
    edtHoraAbertura.text := copy(timetostr(Time),1,5);
  end
  else
    exclusao2('Não foi possível fazer a abertura do caixa', 'Caixa');

  AtualizaNavegacao;
end;

procedure TfrmCaixa.btnAlteraClick(Sender: TObject);
begin
  Operacao := 'A';
  edtHistorico.SetFocus;
  if salva then
  begin
    exclusao2('Fechamento do Caixa Concluido','Caixa');
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    edtFechamento.Date := date;
    edtHoraFechamento.text := copy(timetostr(Time),1,5);
  end
  else
    exclusao2('Não foi possível fechar o Caixa','Caixa');

  AtualizaNavegacao;
end;
procedure TfrmCaixa.Exclui;
var
  qrExec, qrExec2 : TIBQuery;
begin
  if ExisteRegistro then
  begin
    try
       qrExec := TIBQuery.Create(nil);
       qrExec.Database := frmPrincipal.dba;
       qrExec2 := TIBQuery.Create(nil);
       qrExec2.Database := frmPrincipal.dba;
       with qrExec,qrExec.SQl do
       begin
         close;
         Clear;
         Add('DELETE FROM MOVIMENTO WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         Clear;
         Add('DELETE FROM CAIXA WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         Clear;
         // ENTRADA
         qrExec2.Close;
         qrExec2.SQL.Clear;
         qrExec2.SQL.Add('SELECT ENTRADA     ');
         qrExec2.SQL.Add('FROM ENTRADA       ');
         qrExec2.SQL.Add('WHERE CAIXA=:CAIXA ');
         qrExec2.ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         qrExec2.Open;
         qrExec2.First;
         While not qrExec2.Eof do
         begin
           Clear;
           Add('DELETE FROM ITEMENTRADA WHERE ITEMENTRADA=:ENTRADA ');
           ParamByName('ENTRADA').AsInteger := qrExec2.FieldByName('ENTRADA').AsInteger;
           ExecSQL;
           frmPrincipal.ibtransacao.Commit;
           qrExec2.Next;
         end;
         Clear;
         Add('DELETE FROM ENTRADA WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         //SAIDA
         qrExec2.Close;
         qrExec2.SQL.Clear;
         qrExec2.SQL.Add('SELECT SAIDA       ');
         qrExec2.SQL.Add('FROM SAIDA         ');
         qrExec2.SQL.Add('WHERE CAIXA=:CAIXA ');
         qrExec2.ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         qrExec2.Open;
         qrExec2.First;
         While not qrExec2.Eof do
         begin
           Clear;
           Add('DELETE FROM ITEMSAIDA WHERE ITEMSAIDA=:SAIDA ');
           ParamByName('SAIDA').AsInteger := qrExec2.FieldByName('SAIDA').AsInteger;
           ExecSQL;
           frmPrincipal.ibtransacao.Commit;
           qrExec2.Next;
         end;
         Clear;
         Add('DELETE FROM SAIDA WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         //FIADO
         qrExec2.Close;
         qrExec2.SQL.Clear;
         qrExec2.SQL.Add('SELECT FIADO       ');
         qrExec2.SQL.Add('FROM FIADO         ');
         qrExec2.SQL.Add('WHERE CAIXA=:CAIXA ');
         qrExec2.ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         qrExec2.Open;
         qrExec2.First;
         While not qrExec2.Eof do
         begin
           Clear;
           Add('DELETE FROM FIADOPARCELA WHERE FIADO=:FIADO ');
           ParamByName('FIADO').AsInteger := qrExec2.FieldByName('FIADO').AsInteger;
           ExecSQL;
           frmPrincipal.ibtransacao.Commit;
           qrExec2.Next;
         end;
         Clear;
         Add('DELETE FROM FIADO WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         //RETIRADA
         Clear;
         Add('DELETE FROM RETIRADA WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         //DESPESAS
         Clear;
         Add('DELETE FROM DESPESAS WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;
         //LANCAMENTOS
         Clear;
         Add('DELETE FROM LANCAMENTO WHERE CAIXA=:CAIXA ');
         ParamByName('CAIXA').AsInteger := strparaint(edtCodigo.Text);
         ExecSQL;
         frmPrincipal.ibtransacao.Commit;         
         Main.Caixa := UltimoCaixa;
       end;
    except
      exclusao2('Não foi possível apagar o registro.','Aviso');
    end;
  end;
end;

function  TfrmCaixa.ExisteRegistro: boolean;
begin
  result := (edtCodigo.text <> '');
end;

procedure TfrmCaixa.LimpaCampos;
begin
  edtCodigo.text := '';
  edtHistorico.text := '';
  edtAbertura.text := '';
  edtFechamento.text := '';
  edtHoraabertura.text := '';
  edtHoraFechamento.Text :='';
  edtCaixaAbertura.Value := 0;
  edtCaixaFechamento.Value := 0;
  edtCA.Text := FormatFloat('#,###,###,##0.00',0);
  edtCredito.Text := FormatFloat('#,###,###,##0.00',0);
  edtDebito.Text := FormatFloat('#,###,###,##0.00',0);
  edtSaldo.Text := FormatFloat('#,###,###,##0.00',0);
end;

procedure TfrmCaixa.FPrior;
begin
  with qrNavegacao do
  begin
    Prior;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;
end;

{procedure TfrmCaixa.Navegacao;
begin
  if qrNavegacao.RecordCount = 0 then
  begin
    btnFirst.Enabled := false;
    btnPrior.Enabled := false;
    btnNext.Enabled := true;
    btnLast.Enabled := true;
  end
  else
  begin
    if qrNavegacao.RecordCount =1 then
    begin
      btnFirst.Enabled := false;
      btnPrior.Enabled := false;
      btnNext.Enabled := true;
      btnLast.Enabled := true;
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

procedure TfrmCaixa.Edicao;
begin
  if existeRegistro then
  begin
    if (edtHoraFechamento.text = '') and (edtHoraAbertura.text <> '') then
      btnAltera.Enabled := true
    else if (edtHoraFechamento.text <> '') then
      btnInclui.Enabled := true;

    btnExclui.Enabled := true;
    btnConsulta.Enabled := true;
  end;
end;

procedure TfrmCaixa.FFirst;
begin
  with qrNavegacao do
  begin
    First;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmCaixa.FNext;
begin
  with qrNavegacao do
  begin
    Next;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

Procedure TfrmCaixa.FLast;
begin
  with qrNavegacao do
  begin
    Last;
    SetRegistroNavegacao;
  end;
  Nav := qrNavegacao.RecNo;   
end;

procedure TfrmCaixa.btnFirstClick(Sender: TObject);
begin
  FFirst;
end;

procedure TfrmCaixa.btnPriorClick(Sender: TObject);
begin
 FPrior;
end;

procedure TfrmCaixa.btnNextClick(Sender: TObject);
begin
  FNext;
end;

procedure TfrmCaixa.btnLastClick(Sender: TObject);
begin
  FLast;
end;

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 if (Key = VK_RETURN) or (key = VK_F9) then
   SelectNext(ActiveControl, true, true)
 else if Shift = [ssCtrl] then
 begin
   if Key = VK_F4 then
     close
   else if Key = VK_NEXT then
     btnNext.Click
   else if Key = VK_PRIOR then
     btnPrior.Click
   else if Key = VK_END then
     btnLast.Click
   else if Key = VK_HOME then
     btnFirst.Click
   else if (Key = 65) or (key = 97) then
     btnAltera.Click
   else if (Key = 69) or (key = 101) then
     btnExclui.Click
   else if (Key = 73) or (key = 105) then
     btnInclui.Click
   else if (Key = 80) or (key = 112) then
     btnConsulta.Click
   else if (Key = 83) or (key = 115) then
     btnSalva.Click
   else if (Key = 67) or (key = 99) then
     btnCancela.Click;
 end;
end;

procedure TfrmCaixa.AtualizaNavegacao;
begin
  qrNavegacao.Close;
  qrNavegacao.Database := Principal.frmPrincipal.dba;
  qrNavegacao.Open;
  if Nav <= qrNavegacao.RecordCount then
    qrNavegacao.RecNo := Nav
  else
    qrNavegacao.RecNo := qrNavegacao.RecordCount;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgCaixa);
  SalvaGrid(dbgConsulta);
  SalvarCampodePesquisa(Self.Name, edtCampo.Text);
  loCaixa := nil;
  Action := caFree;
end;

procedure TfrmCaixa.SetRegistroNavegacao;
Var
  qr : TIBQuery;
  credito, debito, Ca : double;
begin
  with qrNavegacao do
  begin
    ca                       := FieldByName('CAIXAABERTURA'  ).AsFloat;
    edtCodigo.text           := FieldByName('CAIXA'          ).AsString;
    edtHistorico.text        := FieldByName('HISTORICO'      ).AsString;
    edtAbertura.date         := FieldByName('DATAABERTURA'   ).AsDateTime;
    edtFechamento.date       := FieldByName('DATAFECHAMENTO' ).AsDateTime;
    edtHoraAbertura.text     := HpV(FieldByName('HORAABERTURA').AsDateTime);
    edtHoraFechamento.text   := HpV(FieldByName('HORAFECHAMENTO').AsDateTime);
    edtCaixaAbertura.text    := FieldByName('CAIXAABERTURA'  ).AsString;
    edtCaixaFechamento.text  := FieldByName('CAIXAFECHAMENTO').AsString;
    qr := TIBQuery.Create(nil);
    with qr, qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Close;
      Clear;
      Add('SELECT VALOR AS DEBITO FROM MOVIMENTO WHERE TIPO=''DÉBITO'' AND CAIXA=:CAIXA  ');
      Params.ParamByName('CAIXA').AsInteger := StrToIntDef(edtCodigo.text,0);
      Open;
      First;
      Debito := 0;
      while not EOF do
      begin
        Debito := Debito + FieldByName('DEBITO').AsFloat;
        Next;
      end;
      close;
      clear;
      Database := frmPrincipal.dba;
      Add('SELECT VALOR AS CREDITO FROM MOVIMENTO WHERE TIPO=''CRÉDITO'' AND CAIXA=:CAIXA  ');
      Params.ParamByName('CAIXA').AsInteger := StrToIntDef(edtCodigo.text,0);
      Open;
      First;
      Credito := 0;
      while not EOF do
      begin
        Credito := Credito + FieldByName('CREDITO').AsFloat;
        Next;
      end;
      close;
    end;
    qr.free;
    edtCA.Text := FormatFloat('#,###,###,##0.00',ca);
    edtCredito.Text := FormatFloat('#,###,###,##0.00',credito);
    edtDebito.Text := FormatFloat('#,###,###,##0.00',Debito);
    edtSaldo.Text := FormatFloat('#,###,###,##0.00',((credito+ca)-debito));
    AtualizaGrid;
  end;
  edicao;
end;

procedure TfrmCaixa.btnExcluiClick(Sender: TObject);
begin
  if Exclusao('Apagando o Caixa apaga-se todos os registros relacionados, como: saídas, entradas, despesas, etc. Deseja continuar?','Exclusão do Caixa') then
  begin
    Exclui;
    btnInclui.Enabled := true;
    btnAltera.Enabled := false;
    limpacampos;
    atualizaNavegacao;
    AtualizaGrid;
    qrMovimento.Close;
  end;
end;

procedure TfrmCaixa.AtualizaGrid;
begin
  if edtCodigo.text = '' then
    Exit;
  with qrMovimento, qrMovimento.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT MOVIMENTO.*, FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA FROM MOVIMENTO, FORMAPAGAMENTO WHERE MOVIMENTO.CAIXA =:CAIXA AND MOVIMENTO.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO ');
    ParamByName('CAIXA').AsInteger := strToint(edtCodigo.Text);
    Open;
  end;
end;

procedure TfrmCaixa.btnConsultaClick(Sender: TObject);
begin
  btnConsulta.Enabled := False;
  btnInclui.Enabled := false;
  btnAltera.Enabled := false;
  btnExclui.Enabled :=false;
  btnFirst.Visible := false;
  btnPrior.Visible := false;
  btnNext.Visible := false;
  btnLast.Visible := false;
  with qrConsulta2,qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CAIXA ');
    Open;
  end;
  fpBody.Enabled := true;
  pConsulta.Left := 1;
  pConsulta.Visible := true;
  edtConsulta.SetFocus;
end;

procedure TfrmCaixa.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta2, qrConsulta2.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM CAIXA WHERE '+edtCampo.Text+' LIKE '+QuotedStr(edtConsulta.Text+'%') );
    Open;
  end;
end;

procedure TfrmCaixa.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    with dbgConsulta do
    begin
      SelectedIndex         := 0;
      edtCodigo.Text        := Fields[0].Text;
      edtAbertura.date         :=  Fields[1].AsDateTime;
      edtFechamento.date       :=  Fields[2].AsDateTime;
      edtHoraAbertura.text     :=  HpV(Fields[3].AsDateTime);
      edtHoraFechamento.text   :=  HpV(Fields[4].AsDateTime);
      edtCaixaAbertura.text    :=  Fields[5].Text;
      edtCaixaFechamento.text  :=  Fields[6].Text;
      edtHistorico.text        :=  Fields[7].Text;
      if edtCodigo.Text <> '' then
        AtualizaGrid
      else
        qrMovimento.Close;
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

procedure TfrmCaixa.dbgConsultaCellClick(Column: TColumn);
begin
  with dbgConsulta do
  begin
    edtCodigo.Text        := Fields[0].Text;
    edtAbertura.date         :=  Fields[1].AsDateTime;
    edtFechamento.date       :=  Fields[2].AsDateTime;
    edtHoraAbertura.text     :=  HpV(Fields[3].AsDateTime);
    edtHoraFechamento.text   :=  Hpv(Fields[4].AsDateTime);
    edtCaixaAbertura.text    :=  Fields[5].Text;
    edtCaixaFechamento.text  :=  Fields[6].Text;
    edtHistorico.text        :=  Fields[7].Text;
    if edtCodigo.Text <> '' then
      AtualizaGrid
    else
      qrMovimento.Close;
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

procedure TfrmCaixa.edtCodigoClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TfrmCaixa.qrMovimentoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;

procedure TfrmCaixa.qrNavegacaoAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('HORAABERTURA'  )).DisplayFormat := 'HH:MM';
  TDateTimeField(DataSet.FieldByName('HORAFECHAMENTO')).DisplayFormat := 'HH:MM';
end;

procedure TfrmCaixa.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    edtCampo.SetFocus
  else if key = VK_f10 then
    edtConsulta.SetFocus;
end;

procedure TfrmCaixa.dbgConsultaDrawColumnCell(Sender: TObject;
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
