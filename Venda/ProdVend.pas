unit ProdVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, StdCtrls, Grids, DBGrids, RXDBCtrl,
  TFlatButtonUnit, Mask, ToolEdit, DB, TFlatSpeedButtonUnit,
  TFlatProgressBarUnit, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmProdVend = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    FlatPanel3: TFlatPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    btnConsulta: TFlatButton;
    dbgSaida: TRxDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    lblTotal: TLabel;
    lblQtde: TLabel;
    dsSaida: TDataSource;
    btnFecha: TFlatSpeedButton;
    pbSai: TFlatProgressBar;
    qrSaida: TIBQuery;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFechaClick(Sender: TObject);
    procedure qrSaidaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    Function Valida:Boolean;
  public
    { Public declarations }
  end;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmProdVend.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_Return then
    SelectNext(ActiveControl, true, true)
  else if (shift = [ssCtrl]) and (key = vk_F4) then
    Close;
end;

procedure TfrmProdVend.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConsulta.Click;
end;

procedure TfrmProdVend.btnConsultaClick(Sender: TObject);
var
  qtde : integer;
  total : Double;
begin
  btnConsulta.Enabled :=false;
  qtde := 0;
  total := 0;
  PbSai.Position := 1;
  if not Valida then
  begin
    btnConsulta.Enabled :=true;
    Exit;
  end;
  dbgSaida.DataSource := nil;
  Application.ProcessMessages;
  with qrSaida,qrSaida.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT  SUM(ITEMSAIDA.QUANTIDADE) AS QUANTIDADE, ');
    Add('  ITEMSAIDA.CODBARRA AS CODBARRA,           ');
    Add('  ITEMSAIDA.EDICAO AS EDICAO,               ');
    Add('  ITEM.DESCRICAO AS DESCRICAO,              ');
    Add('  SUM(ITEMSAIDA.TOTAL) AS TOTAL             ');
    Add('FROM                                        ');
    Add('  ITEMSAIDA, SAIDA, ITEM                    ');
    Add('WHERE                                       ');
    Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2      ');
    Add('AND                                         ');
    Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA           ');
    Add('AND                                         ');
    Add('  ITEMSAIDA.CODBARRA=ITEM.CODBARRA          ');
    Add('GROUP BY                                    ');
    Add('  ITEMSAIDA.CODBARRA,                       ');
    Add('  ITEMSAIDA.EDICAO,                         ');
    Add('  ITEM.DESCRICAO                            ');
    Add('ORDER BY ITEM.DESCRICAO                     ');
    ParamByName('DATA1').AsDateTime := (edtData1.date);
    ParamByName('DATA2').AsDateTime := (edtData2.date);
    Open;
    pbSai.Max := RecordCount+1;
    First;
    While not Eof do
    begin
      qtde := qtde + FieldByName('QUANTIDADE').AsInteger;
      total := total + FieldByName('TOTAL').AsFloat;
      Next;
      pbSai.Position := pbSai.Position+1;
    end;
  end;
  dbgSaida.DataSource := dsSaida;
  lblQtde.Caption := FormatFloat('#,##0',qtde);
  lblTotal.Caption := FormatFloat('R$ #,###,##0.00',total);
  btnConsulta.Enabled := true;
end;

procedure TfrmProdVend.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgSaida);
  edtData1.SetFocus;
end;

procedure TfrmProdVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(dbgSaida);
  loProdVend := nil;
  Action := caFree;
end;

function TfrmProdVend.Valida: Boolean;
begin
  result := false;
  if ((edtData1.date <= 0)  or (edtData2.date <= 0)) or (edtdata1.date > edtData2.date) then
  begin
    Exclusao2('Digite Datas Válidas','Aviso');
    Exit;
  end;
  Result := true;
end;

procedure TfrmProdVend.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProdVend.qrSaidaAfterOpen(DataSet: TDataSet);
begin
  TNumericField( DataSet.FieldByName('TOTAL'   )).DisplayFormat := '#,##0.00';
end;

procedure TfrmProdVend.FormCreate(Sender: TObject);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TibQuery(Components[x]).Database := frmPrincipal.dba;
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
//    else if (Components[x] is TDataBase) then
  //    TDataBase(Components[x]).Database := frmPrincipal.dba;
  end;
end;

end.
