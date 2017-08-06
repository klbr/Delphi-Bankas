unit Prazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TFlatSpeedButtonUnit, ExtCtrls, TFlatPanelUnit, Grids,
  DBGrids, RXDBCtrl, StdCtrls, DB, ASGSQLite, TFlatGroupBoxUnit, CurrEdit,
  Mask, ToolEdit;

type
  TfrmComprasPrazo = class(TForm)
    pHead: TFlatPanel;
    btnAtualiza: TFlatSpeedButton;
    FlatSpeedButton1: TFlatSpeedButton;
    Status: TStatusBar;
    pBody: TFlatPanel;
    pgrid: TFlatPanel;
    dbgPrazo: TRxDBGrid;
    qrParcela: TASQLiteQuery;
    dbParcela: TASQLiteDB;
    dsParcela: TDataSource;
    qrSubParcela: TASQLiteQuery;
    dsSubParcela: TDataSource;
    qrOperacao: TASQLiteQuery;
    Label1: TLabel;
    edtParcela: TEdit;
    edtCliente: TEdit;
    edtPago: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtReferencia: TEdit;
    Label4: TLabel;
    btnLast: TFlatSpeedButton;
    btnNext: TFlatSpeedButton;
    btnPrior: TFlatSpeedButton;
    btnFirst: TFlatSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    gbSubP: TFlatGroupBox;
    FlatPanel1: TFlatPanel;
    dbgSubParcela: TRxDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtHistorico: TEdit;
    edtPagamento: TDateEdit;
    edtValorS: TCurrencyEdit;
    btnSalva: TFlatSpeedButton;
    edtEmissao: TDateEdit;
    edtVencimento: TDateEdit;
    edtValor: TCurrencyEdit;
    FlatSpeedButton2: TFlatSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure dsParcelaDataChange(Sender: TObject; Field: TField);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsSubParcelaDataChange(Sender: TObject; Field: TField);
  private
    procedure Navegacao;
  public
    { Public declarations }
  end;

var
  Valor : Double;
  
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmComprasPrazo.FormShow(Sender: TObject);
begin
  if ConectaBanco(dbParcela) then
  begin
    qrParcela.Open;
    Navegacao;
  end;
end;

procedure TfrmComprasPrazo.Navegacao;
begin
  if qrParcela.RecordCount = 0 then
  begin
    btnFirst.Enabled := false;
    btnPrior.Enabled := false;
    btnNext.Enabled := false;
    btnLast.Enabled := false;
  end
  else
  begin
    if qrParcela.RecordCount =1 then
    begin
      btnFirst.Enabled := false;
      btnPrior.Enabled := false;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrParcela.RecNo = qrParcela.RecordCount then
    begin
      btnFirst.Enabled := True;
      btnPrior.Enabled := True;
      btnNext.Enabled := false;
      btnLast.Enabled := false;
    end
    else if qrParcela.RecNo = 1 then
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
end;

procedure TfrmComprasPrazo.btnAtualizaClick(Sender: TObject);
begin
  qrParcela.close;
  qrParcela.open;
  Navegacao;
end;

procedure TfrmComprasPrazo.btnFirstClick(Sender: TObject);
begin
  qrParcela.First;
end;

procedure TfrmComprasPrazo.btnPriorClick(Sender: TObject);
begin
  qrParcela.Prior;
end;

procedure TfrmComprasPrazo.btnNextClick(Sender: TObject);
begin
  qrParcela.Next;
end;

procedure TfrmComprasPrazo.btnLastClick(Sender: TObject);
begin
  qrParcela.Last;
end;

procedure TfrmComprasPrazo.dsParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  Navegacao;
  edtParcela.Text := qrParcela.FieldByName('PARCELAPRAZO').AsString;
  edtPago.Text := qrParcela.FieldByName('PAGO').AsString;
  edtReferencia.Text := qrParcela.FieldByName('CODIGO').AsString;
  edtCliente.Text := qrParcela.FieldByName('DESC_CLIENTE').AsString;
  edtEmissao.Text := qrParcela.FieldByName('DATA').AsString;
  edtVencimento.Text := qrParcela.FieldByName('VENCIMENTO').AsString;
  edtValor.Text := qrParcela.FieldByName('VALOR').AsString;
  edtParcela.SetFocus;
  Valor := qrParcela.FieldByName('VALOR').AsFloat;
  with qrSubParcela, qrSubParcela.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM SUBPARCELAPRZO WHERE SUBPARCELAPRAZO=:ID  ');
    Params.ParamByName('ID').AsInteger := qrParcela.FieldByName('PARCELAPRAZO').Asinteger;
    Open;
  end;
end;

procedure TfrmComprasPrazo.FlatSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmComprasPrazo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  loComprasPrazo :=nil;
  Action := caFree;
end;

procedure TfrmComprasPrazo.dsSubParcelaDataChange(Sender: TObject;
  Field: TField);
begin
  with qrSubParcela,qrSubparcela.SQL do
  begin
    edtValorS.Text := FieldByName('VALOR').AsString;
    edtPagamento.Text := FieldByName('PAGAMENTO').AsString;
    edtHistorico.Text := FieldByName('HISTORICO').AsString;
  end;
end;

end.
