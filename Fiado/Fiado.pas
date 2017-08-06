unit Fiado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, TFlatSpeedButtonUnit, Grids, DBGrids,
  ComCtrls, ExtCtrls, CurrEdit, DB, DBTables, Buttons, RXDBCtrl, Provider,
  DBClient, IBCustomDataSet, IBQuery;

type
  TfrmFiado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    dbgFiado: TRxDBGrid;
    dbgItem: TRxDBGrid;
    Panel3: TPanel;
    pParcelas: TPanel;
    edtDescCLiente: TLabel;
    FlatSpeedButton1: TFlatSpeedButton;
    edtCliente: TComboEdit;
    Label14: TLabel;
    Label1: TLabel;
    dbgParcelas: TRxDBGrid;
    Label3: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    edtPag: TDateEdit;
    edtValor: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtStatus: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtRestante: TCurrencyEdit;
    dsFiado: TDataSource;
    dsParcela: TDataSource;
    dsItem: TDataSource;
    Label2: TLabel;
    Panel5: TPanel;
    btnNovo: TSpeedButton;
    btnApaga: TSpeedButton;
    Label8: TLabel;
    edtAjuste: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    Label9: TLabel;
    btnFecha: TFlatSpeedButton;
    Label10: TLabel;
    edtTotalGeral: TCurrencyEdit;
    btnPagarTudo: TSpeedButton;
    edtapagar: TCurrencyEdit;
    Label11: TLabel;
    qrFiado: TIBQuery;
    qrParcela: TIBQuery;
    qrExecuta: TIBQuery;
    qrDiferenca: TIBQuery;
    qrItem: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteClick(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure rb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rb1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dsFiadoDataChange(Sender: TObject; Field: TField);
    procedure edtAjusteChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtPagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure btnApagaClick(Sender: TObject);
    procedure dbgParcelasCellClick(Column: TColumn);
    procedure btnFechaClick(Sender: TObject);
    procedure qrFiadoAfterOpen(DataSet: TDataSet);
    procedure qrParcelaAfterOpen(DataSet: TDataSet);
    procedure qrItemAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnPagarTudoClick(Sender: TObject);
  private
    procedure LimparTudo;
    procedure LerFiado;
    //**********************
    procedure CarregarFiado;
    procedure CarregaItem(Saida : integer);
    procedure Carregaparcelas(Fiado : Integer);
    procedure CalculaDiferenca(Valor : Double; Fiado : Integer);
    //*********************
    function  Valida:Boolean;
    function  UlTimoIdFiado(iFiado : Integer):Integer;
    //*********************
    procedure SalvaParcela;
    procedure MovimentoNegativoFiado(iID, iFiado : integer; iValor:Double);
    procedure ApagaFiadodoMovimento(sTipo : String; iFiado, iID :Integer);
    procedure ApagaFiado(iFiado, iID : Integer);
    //********************
    procedure BaixaFiado(iFiado : Integer);
  public
    { Public declarations }
  end;

//var
//  frmFiado: TfrmFiado;
var
  Existe : Boolean = False;
  Op     : String[1] = 'I';
  ID     : integer;

implementation
uses Principal, Main, Consulta;
{$R *.dfm}

procedure TfrmFiado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGrid(dbgFiado);
  SalvaGrid(dbgParcelas);
  SalvaGrid(dbgItem);
  loFiado := nil;
  Action := caFree;
end;

procedure TfrmFiado.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgFiado);
  CarregaGrid(dbgParcelas);
  CarregaGrid(dbgItem);
  edtCliente.SetFocus;
end;

procedure TfrmFiado.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointDef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmFiado.edtClienteClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TfrmFiado.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20+50, Left+68+18, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmFiado.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #9) then
  begin
    if edtDescCLiente.Caption <> '' then
      LerFiado
    else
    begin
      Exclusao2('Escolha um Cliente e Tecle <ENTER>','Aviso');
      edtCliente.SetFocus;
    end;
  end;
end;

procedure TfrmFiado.LerFiado;
begin
  LimparTudo;
  with qrFiado, qrFiado.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                              ');
    Add('  FIADO,                            ');
    Add('  DATA,                             ');
    Add('  VALOR,                            ');
    Add('  VENCIMENTO,                       ');
    Add('  SAIDA,                            ');
    Add('  PAGO,                             ');
    Add('  FIADO.CLIENTE,                    ');
    Add('  CLIENTE.DESCRICAO AS DESC_CLIENTE ');
    Add('FROM                                ');
    Add('  FIADO,                            ');
    Add('  CLIENTE                           ');
    Add('WHERE                               ');
    Add('  FIADO.CLIENTE=:CLIENTE            ');
    Add('AND                                 ');
    Add('  FIADO.CLIENTE=CLIENTE.CLIENTE     ');
    if rb1.Checked then
    begin
      Add('AND                                 ');
      Add('  FIADO.PAGO <> ''S''               ');
    end;
    if rb2.Checked then
    begin
      Add('AND                                 ');
      Add('  FIADO.PAGO = ''S''                ');
    end;
    ParamByName('CLIENTE').AsInteger := StrTointDef(edtCliente.Text, 0);
    Open;
    TNumericField(FieldByName('VALOR')).DisplayFormat := '#0.00';
    Existe := not IsEmpty;
    btnPagarTudo.Enabled := (rb1.Checked) and not (IsEmpty);
    First;
    edtTotalGeral.Value := 0;
    edtapagar.Value := 0;
    while not Eof do
    begin
      edtTotalGeral.Value := edtTotalGeral.value + FieldByName('VALOR').AsFloat;
      edtapagar.Value := edtapagar.Value + edtRestante.Value;
      Next;
    end;
    First;
    If Existe then
      CarregarFiado
    else
      pParcelas.Enabled := False;
  end;
end;

procedure TfrmFiado.FlatSpeedButton1Click(Sender: TObject);
begin
  if frmPrincipal.Cliente1.Enabled then
    frmPrincipal.Cliente1Click(Sender);
end;

procedure TfrmFiado.rb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TRadioButton(Sender).Checked := True;
  if edtDescCLiente.Caption <> '' then
    LerFiado
  else
  begin
    Exclusao2('Escolha um Cliente e Tecle <ENTER>','Aviso');
    edtCliente.SetFocus;
  end;
end;

procedure TfrmFiado.rb1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TRadioButton(Sender).Checked := True;
  if edtDescCLiente.Caption <> '' then
    LerFiado
  else
  begin
    Exclusao2('Escolha um Cliente e Tecle <ENTER>','Aviso');
    edtCliente.SetFocus;
  end;
end;

procedure TfrmFiado.dsFiadoDataChange(Sender: TObject; Field: TField);
begin
  if Existe then
    CarregarFiado;
end;

procedure TfrmFiado.CarregarFiado;
begin
  with dsFiado.DataSet do
  begin
    if FieldByName('PAGO').AsString = 'S' then
    begin
      edtStatus.Text := 'Fiado Quitado.';
      pParcelas.Enabled := False;
    end
    else
    begin
      edtStatus.Text := 'Fiado em Aberto.';
      pParcelas.Enabled := True;
    end;
    CarregaItem(FieldByName('SAIDA').AsInteger);
    CarregaParcelas(FieldByName('FIADO').AsInteger);
    CalculaDiferenca(FieldByName('VALOR').AsFloat, FieldByName('FIADO').AsInteger);
    if pParcelas.Enabled then
      btnNovo.Click;
  end;
end;

procedure TfrmFiado.CarregaItem(Saida : Integer);
begin
  with qrItem, qrItem.SQL do
  begin
    Close;
    Clear;
    Add('SELECT                            ');
    Add('  ITEMSAIDA.*,                    ');
    Add('  ITEM.DESCRICAO AS DESC_ITEM     ');
    Add('FROM                              ');
    Add('  ITEMSAIDA,                      ');
    Add('  ITEM                            ');
    Add('WHERE                             ');
    Add('  ITEMSAIDA=:SAIDA                ');
    Add('AND                               ');
    Add('  ITEMSAIDA.CODBARRA=ITEM.CODBARRA');
    ParamByName('SAIDA').AsInteger := Saida;
    Open;
    TNumericField(FieldByName('VALORUNI')).DisplayFormat := '#0.00';
    TNumericField(FieldByName('TOTAL'   )).DisplayFormat := '#0.00';
  end;
end;

procedure TfrmFiado.Carregaparcelas(Fiado: Integer);
begin
  with qrParcela, qrParcela.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT             ');
    Add('  *                ');
    Add('FROM               ');
    Add('  FIADOPARCELA     ');
    Add('WHERE              ');
    Add('  FIADO=:FIADO     ');
    ParamByName('FIADO').AsInteger := Fiado;
    Open;
    TNumericField(FieldByName('VALOR' )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('TOTAL' )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('AJUSTE')).DisplayFormat := '#0.00';
  end;
end;

procedure TfrmFiado.LimparTudo;
begin
  qrParcela.Close;
  qrItem.Close;
  edtStatus.Clear;
  edtRestante.Clear;
  edtPag.Clear;
  edtValor.Clear;
end;

procedure TfrmFiado.CalculaDiferenca(Valor : Double; Fiado : Integer);
begin
  with qrDiferenca, qrDiferenca.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT               ');
    Add('  SUM(VALOR) AS SOMA ');
    Add('FROM                 ');
    Add('  FIADOPARCELA       ');
    Add('WHERE                ');
    Add('  FIADO=:FIADO       ');
    ParamByName('FIADO').AsInteger := Fiado;
    Open;
    if not IsEmpty then
      edtRestante.Value := Valor - FieldByName('SOMA').AsFloat
    else
      edtRestante.Value := Valor;
  end;
end;

procedure TfrmFiado.edtAjusteChange(Sender: TObject);
begin
  edtTotal.Value := edtAjuste.Value + edtValor.Value;
end;

procedure TfrmFiado.btnNovoClick(Sender: TObject);
begin
  Op := 'I';
  edtPag.Date := Date;
  edtPag.SetFocus;
  Id := (UlTimoIdFiado(qrFiado.FieldByName('FIADO').AsInteger) + 1);
end;

procedure TfrmFiado.edtPagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl,True,True);
end;

procedure TfrmFiado.edtTotalKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #9) then
  begin
    if Valida then
    begin
      if Op = 'I' then
      begin
        SalvaParcela; //Salva e Gera o movimento
        btnNovo.Click;
      end
      else if Op = 'A' then
      begin
        btnApaga.Click; //Apaga ou Desfaz o Movimento
        SalvaParcela;
        btnNovo.Click;
      end;
      CalculaDiferenca(qrFiado.FieldByName('VALOR').AsFloat, qrFiado.FieldByName('FIADO').AsInteger);
      Carregaparcelas(qrFiado.FieldByName('FIADO').AsInteger);
      if edtRestante.Value <= 0 then
      begin
        if Exclusao('Fiado totalmente pago. Deseja baixa o Fiado?','Aviso do Fiado') then
        begin
          BaixaFiado(qrFiado.FieldByname('FIADO').AsInteger);
          LerFiado;
        end;
      end;
      Creditar(qrFiado.FieldByName('CLIENTE').AsInteger);
    end;
  end;
end;

function TfrmFiado.Valida: Boolean;
begin
  Result := False;
  if edtPag.Date <= 0  then
  begin
    Exclusao2('Data inválida! Digite uma data válida.','Aviso do Fiado');
    edtPag.SetFocus;
    Exit;
  end;
  if edtPag.Date < qrFiado.FieldByName('DATA').AsDateTime then
  begin
    Exclusao2('A data de pagamento não pode ser anterior do que a data de compra do Fiado!','Aviso do Fiado');
    edtPag.SetFocus;
    Exit;
  end;
  if edtValor.Value <= 0 then
  begin
    Exclusao2('Digite um valor válido para o pagamento!','Aviso do Fiado');
    edtValor.SetFocus;
    Exit;
  end;
  if (edtRestante.value - edtValor.Value) < 0 then
  begin
    Exclusao2('Valor da parcela não pode ser maior que o restante! Utilize o ajuste para modificar o total','Aviso do Fiado');
    edtValor.SetFocus;
    Exit;
  end;
  Result := True;
end;

function TfrmFiado.UlTimoIdFiado(iFiado: Integer): Integer;
begin
  with qrExecuta,qrExecuta.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT         ');
    Add('  MAX(ID) AS X ');
    Add('FROM           ');
    Add('  FIADOPARCELA ');
    Add('WHERE          ');
    Add('  FIADO=:FIADO ');
    ParamByName('FIADO').AsInteger := iFiado;
    Open;
    if not IsEmpty then
      Result := FieldByname('X').AsInteger + 1
    else
      Result := 1;
    Close;
    Clear;
  end;
end;

procedure TfrmFiado.btnApagaClick(Sender: TObject);
begin
  with qrExecuta, qrExecuta.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT         ');
    Add('  *            ');
    Add('FROM           ');
    Add('  FIADOPARCELA ');
    Add('WHERE          ');
    Add('  ID=:ID       ');
    Add('AND            ');
    Add('  FIADO=:FIADO ');
    Add('AND            ');
    Add('  CAIXA<>:CAIXA');
    ParamByName('ID'   ).AsInteger := ID;
    ParamByName('FIADO').AsInteger := qrFiado.FieldByName('FIADO').AsInteger;
    ParamByName('CAIXA').AsInteger := Main.Caixa;
    Open;
    if not IsEmpty then
      MovimentoNegativoFiado(ID, qrFiado.FieldByName('FIADO').AsInteger, FieldByName('TOTAL').AsFloat)
    else
    begin
      ApagaFiadodoMovimento('CRÉDITO', qrFiado.FieldByName('FIADO').AsInteger, ID);
      ApagaFiado(qrFiado.FieldByName('FIADO').AsInteger, ID);
    end;
  end;
  Carregaparcelas(qrFiado.FieldByName('FIADO').AsInteger);
end;

procedure TfrmFiado.SalvaParcela;
begin
  with qrExecuta, qrExecuta.SQL do
  begin
    Close;
    Clear;
    Add('INSERT INTO       ');
    Add('  FIADOPARCELA (  ');
    Add('  FIADO,          ');
    Add('  ID,             ');
    Add('  PAGAMENTO,      ');
    Add('  VALOR,          ');
    Add('  AJUSTE,         ');
    Add('  TOTAL,          ');
    Add('  CAIXA           ');
    Add(') VALUES (        ');
    Add('  :FIADO,         ');
    Add('  :ID,            ');
    Add('  :PAGAMENTO,     ');
    Add('  :VALOR,         ');
    Add('  :AJUSTE,        ');
    Add('  :TOTAL,         ');
    Add('  :CAIXA          ');
    Add(')                 ');
    ParamByName('FIADO'    ).AsInteger := qrFiado.FieldByName('FIADO').AsInteger;
    ParamByName('ID'       ).AsInteger := ID;
    ParamByName('PAGAMENTO').AsDateTime  := (edtPag.Date);
    ParamByName('VALOR'    ).AsFloat   := edtValor.Value;
    ParamByName('AJUSTE'   ).AsFloat   := edtAjuste.Value;
    ParamByName('TOTAL'    ).AsFloat   := edtTotal.Value;
    ParamByName('CAIXA'    ).AsInteger := Main.Caixa;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    Clear;
    Close;
    Add('INSERT INTO       ');
    Add('  MOVIMENTO    (  ');
    Add('  CAIXA,          ');
    Add('  CODIGO,         ');
    Add('  FORMAPAGAMENTO, ');
    Add('  TIPO,           ');
    Add('  DESCRICAO,      ');
    Add('  DATA,           ');
    Add('  VALOR           ');
    Add(') VALUES (        ');
    Add('  :CAIXA,         ');
    Add('  :CODIGO,        ');
    Add('  :FORMAPAGAMENTO,');
    Add('  :TIPO,          ');
    Add('  :DESCRICAO,     ');
    Add('  :DATA,          ');
    Add('  :VALOR          ');
    Add(')                 ');
    ParamByName('CAIXA'         ).AsInteger := Main.Caixa;
    ParamByName('CODIGO'        ).AsInteger := qrFiado.FieldByName('FIADO').AsInteger;
    ParamByName('FORMAPAGAMENTO').AsInteger := 3;
    ParamByName('TIPO'          ).AsString  := 'CRÉDITO';
    ParamByName('DESCRICAO'     ).AsString  := 'Parcela Fiado nº: '+IntToStr(ID);
    ParamByName('DATA'          ).AsDateTime  := (edtPag.Date);
    ParamByName('VALOR'         ).AsFloat   := edtTotal.Value;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    Clear;
    Close;
  end;
end;

procedure TfrmFiado.MovimentoNegativoFiado(iID, iFiado: integer; iValor: Double);
var
  QrX : TIBQuery;
begin
  qrX := TIBQuery.Create(nil);
  try
    with qrX, qrX.SQL do
    begin
      Database := frmPrincipal.dba;
      Close;
      Clear;
      Add('INSERT INTO       ');
      Add('  MOVIMENTO    (  ');
      Add('  CAIXA,          ');
      Add('  CODIGO,         ');
      Add('  FORMAPAGAMENTO, ');
      Add('  TIPO,           ');
      Add('  DESCRICAO,      ');
      Add('  DATA,           ');
      Add('  VALOR           ');
      Add(') VALUES (        ');
      Add('  :CAIXA,         ');
      Add('  :CODIGO,        ');
      Add('  :FORMAPAGAMENTO,');
      Add('  :TIPO,          ');
      Add('  :DESCRICAO,     ');
      Add('  :DATA,          ');
      Add('  :VALOR          ');
      Add(')                 ');
      ParamByName('CAIXA'         ).AsInteger := Main.Caixa;
      ParamByName('CODIGO'        ).AsInteger := iFiado;
      ParamByName('FORMAPAGAMENTO').AsInteger := 3;
      ParamByName('TIPO'          ).AsString  := 'DÉBITO';
      ParamByName('DESCRICAO'     ).AsString  := 'Estorno de Parcela Fiado nº: '+IntToStr(iID);
      ParamByName('DATA'          ).AsDateTime  := (Date);
      ParamByName('VALOR'         ).AsFloat   := iValor;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
  finally
    qrx.Close;
    qrx.Free;
  end;
end;

procedure TfrmFiado.ApagaFiadodoMovimento(sTipo: String; iFiado, iID: Integer);
var
  Qry : TIBQuery;
begin
  qry := TIBQuery.Create(nil);
  try
    with qry, qry.SQL do
    begin
      Database := frmPrincipal.dba;
      Close;
      Clear;
      Add('DELETE FROM       ');
      Add('  MOVIMENTO       ');
      Add('WHERE             ');
      Add('  TIPO  =:TIPO    ');
      Add('AND               ');
      Add('  CODIGO=:CODIGO  ');
      Add('AND               ');
      Add('  DESCRICAO=:DESC ');
      Add('AND               ');
      Add('  CAIXA=:CAIXA    ');
      ParamByName('CAIXA' ).AsInteger := Main.Caixa;
      ParamByName('CODIGO').AsInteger := iFiado;
      ParamByName('TIPO'  ).AsString  := sTipo;
      ParamByName('DESC'  ).AsString  := 'Parcela Fiado nº: '+IntToStr(iID);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
  finally
    qry.Close;
    qry.Free;
  end;
end;

procedure TfrmFiado.ApagaFiado(iFiado, iID: Integer);
var
  Qrz : TIBQuery;
begin
  qrz := TIBQuery.Create(nil);
  try
    with qrz, qrz.SQL do
    begin
      Database := frmPrincipal.dba;
      Close;
      Clear;
      Add('DELETE FROM       ');
      Add('  FIADOPARCELA    ');
      Add('WHERE             ');
      Add('  FIADO  =:FIADO  ');
      Add('AND               ');
      Add('  ID=:ID          ');
      ParamByName('FIADO').AsInteger := iFiado;
      ParamByName('ID'   ).AsInteger := iID;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
  finally
    qrz.Close;
    qrz.Free;
  end;
end;

procedure TfrmFiado.BaixaFiado(iFiado : Integer);
var
  QrW : TIBQuery;
begin
  qrW := TIBQuery.Create(nil);
  try
    with qrW, qrW.SQL do
    begin
      Database := frmPrincipal.dba;
      Close;
      Clear;
      Add('UPDATE FIADO SET  ');
      Add('  PAGO = ''S''    ');
      Add('WHERE             ');
      Add('  FIADO  =:FIADO  ');
      ParamByName('FIADO').AsInteger := iFiado;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;      
    end;
  finally
    qrW.Close;
    qrW.Free;
  end;
end;

procedure TfrmFiado.dbgParcelasCellClick(Column: TColumn);
begin
  if not (qrParcela.IsEmpty) then
  begin
    op := 'A';
    id             := qrParcela.FieldByname('ID'       ).AsInteger;
    edtPag.Date    := qrParcela.FieldByname('PAGAMENTO').AsDateTime;
    edtValor.Value := qrParcela.FieldByname('VALOR'    ).AsFloat;
    edtAjuste.Value:= qrParcela.FieldByname('AJUSTE'   ).AsFloat;
  end;
end;

procedure TfrmFiado.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiado.qrFiadoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;

procedure TfrmFiado.qrParcelaAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('AJUSTE')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('TOTAL')).DisplayFormat := '#,##0.00';
end;

procedure TfrmFiado.qrItemAfterOpen(DataSet: TDataSet);
begin
  TNumericField(DataSet.FieldByName('VALORUNI')).DisplayFormat := '#,##0.00';
  TNumericField(DataSet.FieldByName('TOTAL')).DisplayFormat := '#,##0.00';
end;

procedure TfrmFiado.FormCreate(Sender: TObject);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Database := frmPrincipal.dba;
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
//    else if (Components[x] is TDataBase) then
  //    TDataBase(Components[x]).Database := frmPrincipal.dba;
  end;
end;

procedure TfrmFiado.btnPagarTudoClick(Sender: TObject);
begin
  try
    with qrFiado do
    begin
      First;
      while not Eof do
      begin
        ID := UlTimoIdFiado(qrFiado.FieldByName('FIADO').AsInteger);
        edtPag.Date := Now;
        edtValor.Value := 1;
        edtValor.Value := 0;
        CalculaDiferenca(qrFiado.FieldByName('VALOR').AsFloat, qrFiado.FieldByName('FIADO').AsInteger);
        edtValor.Value := edtRestante.Value;
        SalvaParcela; //Salva e Gera o movimento
//        Carregaparcelas(qrFiado.FieldByName('FIADO').AsInteger);
        CalculaDiferenca(qrFiado.FieldByName('VALOR').AsFloat, qrFiado.FieldByName('FIADO').AsInteger);
        if edtRestante.Value <= 0 then
          BaixaFiado(qrFiado.FieldByname('FIADO').AsInteger);
        Next;
      end;
    end;
    LerFiado;
    Creditar(qrFiado.FieldByName('CLIENTE').AsInteger);
    Exclusao2('Todos os Fiados Baixados com sucesso!','Controle de Fiados');
  except
    Exclusao2('Ocorreu um erro durante o processo. Tente Baixar os Fiados Manualmente.','Controle de Fiados');
  end;
end;

end.
