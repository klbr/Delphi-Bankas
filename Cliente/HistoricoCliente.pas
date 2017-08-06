unit HistoricoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, Mask, ToolEdit, StdCtrls, ExtCtrls, TFlatPanelUnit,
  Grids, DBGrids, RXDBCtrl, DB, TFlatGroupBoxUnit, TFlatSpeedButtonUnit,
  TFlatProgressBarUnit, TFlatEditUnit, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmHistoricoCliente = class(TForm)
    p1: TFlatPanel;
    FlatPanel1: TFlatPanel;
    edtData1: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtData2: TDateEdit;
    btnConsulta: TFlatButton;
    FlatGroupBox1: TFlatGroupBox;
    FlatGroupBox2: TFlatGroupBox;
    dsSaidas: TDataSource;
    dsItemSaida: TDataSource;
    dbgSaidas: TRxDBGrid;
    dbgItemSaida: TRxDBGrid;
    btnFecha: TFlatSpeedButton;
    Label14: TLabel;
    edtCliente: TComboEdit;
    edtDescCLiente: TLabel;
    lblTotalT: TLabel;
    lblQtdeT: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    qrSaidas: TIBQuery;
    qrItemSaida: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure btnFechaClick(Sender: TObject);
    procedure dbgSaidasDblClick(Sender: TObject);
    procedure qrItemSaidaAfterOpen(DataSet: TDataSet);
    procedure qrSaidasAfterOpen(DataSet: TDataSet);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsSaidasDataChange(Sender: TObject; Field: TField);
    procedure dbgItemSaidaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgSaidasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Function Valida:Boolean;
    procedure CarregaItens;
  public
    { Public declarations }
  end;

  var
    Permite : Boolean;

implementation
uses Principal, Main, Saida, Consulta;
{$R *.dfm}

procedure TfrmHistoricoCliente.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgItemSaida);
  CarregaGrid(dbgSaidas);
  edtCliente.SetFocus;
end;

procedure TfrmHistoricoCliente.btnConsultaClick(Sender: TObject);
begin
  if not Valida then
    Exit;

  btnConsulta.Enabled := false;
  Permite := False;
  qrItemSaida.Close;
  with qrSaidas,qrSaidas.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                                                ');
    Add('  SAIDA.*, FUNCIONARIO.DESCRICAO AS DESC_FUNCIONARIO, ');
    Add('  FORMAPAGAMENTO.DESCRICAO AS DESC_FORMA              ');
    Add('FROM SAIDA, FUNCIONARIO, FORMAPAGAMENTO               ');
    Add('WHERE                                                 ');
    Add('  SAIDA.CLIENTE=:CLIENTE                              ');
    Add('AND                                                   ');
    Add('  SAIDA.FUNCIONARIO=FUNCIONARIO.FUNCIONARIO           ');
    Add('AND                                                   ');
    Add('  SAIDA.FORMAPAGAMENTO=FORMAPAGAMENTO.FORMAPAGAMENTO  ');
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      Add('AND                                              ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2           ');
    end;
    ParamByName('CLIENTE').AsInteger := StrToIntdef(edtCliente.text, 0);
    if (edtData1.Date <> 0) and (edtData2.Date <> 0) then
    begin
      ParamByName('DATA1').AsDateTime := (edtData1.Date);
      ParamByName('DATA2').AsDateTime := (edtData2.Date);
    end;
    Open;
    First;
  end;
  edtCliente.SetFocus;
  Permite := True;
  if not qrSaidas.IsEmpty then
    CarregaItens;
  btnConsulta.Enabled := true;
end;

procedure TfrmHistoricoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(dbgItemSaida);
  SalvaGrid(dbgSaidas);
  loHistoricoCliente := nil;
  Action := caFree;
end;

function TfrmHistoricoCliente.Valida: Boolean;
begin
  Result := false;
  if Trim(edtDescCLiente.Caption) = '' then
  begin
     Exclusao2('Digite um Cliente','Aviso');
     edtCliente.setFocus;
     exit;
  end;
  Result := True;
end;

procedure TfrmHistoricoCliente.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConsulta.Click;
end;

procedure TfrmHistoricoCliente.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoCliente.dbgSaidasDblClick(Sender: TObject);
begin
  if dbgSaidas.Fields[0].AsString <> '' then
  begin
    if loSaida = nil then
      loSaida := TfrmSaida.Create(Application);
    loSaida.Show;
    loSaida.AbreSaida(dbgSaidas.Fields[0].AsInteger);
  end;
end;

procedure TfrmHistoricoCliente.qrItemSaidaAfterOpen(DataSet: TDataSet);
begin
  TNumericField( DataSet.FieldByName('VALORUNI')).DisplayFormat := '#,##0.00';
  TNumericField( DataSet.FieldByName('TOTAL'   )).DisplayFormat := '#,##0.00';
end;

procedure TfrmHistoricoCliente.qrSaidasAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField(DataSet.FieldByName('DATA'    )).DisplayFormat := 'DD/MM/YYYY';
  TDateTimeField(DataSet.FieldByName('HORA'    )).DisplayFormat := 'HH:MM';
  TNumericField( DataSet.FieldByName('DESCONTO')).DisplayFormat := '#,##0.00 %';
  TNumericField( DataSet.FieldByName('QUITACAO')).DisplayFormat := '#,##0.00';
end;

procedure TfrmHistoricoCliente.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointDef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmHistoricoCliente.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+10, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmHistoricoCliente.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
    close;
end;

procedure TfrmHistoricoCliente.CarregaItens;
var
  Qtde : Integer;
  Val  : Double;
begin
  Qtde := 0;
  Val := 0;
  with qrItemSaida, qrItemSaida.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                              ');
    Add(' ITEMSAIDA.*,                       ');
    Add(' ITEM.DESCRICAO AS DESC_ITEM        ');
    Add('FROM                                ');
    Add(' ITEMSAIDA,                         ');
    Add(' ITEM                               ');
    Add('WHERE                               ');
    Add(' ITEMSAIDA.ITEMSAIDA=:SAIDA         ');
    Add('AND                                 ');
    Add(' ITEMSAIDA.CODBARRA=ITEM.CODBARRA   ');
    ParamByName('SAIDA').AsInteger := qrSaidas.FieldByName('SAIDA').AsInteger;
    Open;
    First;
    While Not Eof do
    begin
      Qtde := Qtde + FieldByName('QUANTIDADE').AsInteger;
      Val := Val + FieldByName('TOTAL').AsFloat;
      Next;
    end;
    First;
  end;
  lblQtdeT.Caption  := FormatFloat('#0' , Qtde);
  lblTotalT.Caption := FormatFloat('#,##0.00',Val);
end;

procedure TfrmHistoricoCliente.dsSaidasDataChange(Sender: TObject;
  Field: TField);
begin
  if Permite then
    CarregaItens;
end;

procedure TfrmHistoricoCliente.dbgItemSaidaDblClick(Sender: TObject);
begin
  if dbgItemSaida.Fields[0].AsString <> '' then
  begin
    if loSaida = nil then
      loSaida := TfrmSaida.Create(Application);
    loSaida.Show;
    loSaida.AbreSaida(dbgItemSaida.Fields[0].AsInteger);
  end;
end;

procedure TfrmHistoricoCliente.FormCreate(Sender: TObject);
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

procedure TfrmHistoricoCliente.dbgSaidasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column <> nil then
    if Column.Field <> nil then
      if Column.Field.DataType in [ftDate, ftDateTime] then
        if Column.Field.AsDateTime = 0 then
          TDBGrid(Sender).Canvas.TextRect(Rect, 0, 0, '');
end;

end.
