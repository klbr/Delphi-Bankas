unit codbarraC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, Provider, DB, DBClient, Grids, DBGrids, RXDBCtrl,
  TFlatEditUnit, TFlatPanelUnit, ExtCtrls, TFlatSpeedButtonUnit, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery;

type
  TfrmCodbarraC = class(TForm)
    grid: TRxDBGrid;
    dsItem: TDataSource;
    cdsGrid: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    edtCodProduto: TEdit;
    Label2: TLabel;
    FlatSpeedButton4: TFlatSpeedButton;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel1: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel2: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    dsGrid: TDataSource;
    edtDescricao: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    qrGrid: TIBQuery;
    procedure FlatSpeedButton4Click(Sender: TObject);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pItemExit(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemDblClick(Sender: TObject);
    procedure dbgItemCellClick(Column: TColumn);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure edtCodProdutoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ConsultaItem;
    procedure FechaConsultaItem;
  public
    { Public declarations }
  end;

var
  frmCodbarraC: TfrmCodbarraC;

implementation
uses Main, Principal, codbarra;
{$R *.dfm}

procedure TfrmCodbarraC.FlatSpeedButton4Click(Sender: TObject);
begin
  ConsultaItem;
end;

procedure TfrmCodbarraC.edtCodProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F1 then
   ConsultaItem
end;

procedure TfrmCodbarraC.pItemExit(Sender: TObject);
begin
  FechaConsultaItem;
end;

procedure TfrmCodbarraC.edtDescChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmCodbarraC.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
      edtCodProduto.text := Fields[0].Text;
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;
end;

procedure TfrmCodbarraC.dbgItemDblClick(Sender: TObject);
begin
  edtCodProduto.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmCodbarraC.dbgItemCellClick(Column: TColumn);
begin
  edtCodProduto.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmCodbarraC.dbgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and not (dsItem.DataSet.IsEmpty) then
  begin
    edtCodProduto.text := dbgItem.Fields[0].Text;
    FechaConsultaItem;
  end
  else if key = VK_ESCAPE then
  begin
    FechaConsultaItem;
  end
  else if key = VK_UP then
  begin
    if dsItem.DataSet.Bof then
      edtDesc.SetFocus;
  end;
end;

procedure TfrmCodbarraC.ConsultaItem;
begin
  edtCodBarra.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmCodbarraC.FechaConsultaItem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodProduto.setFocus;
  pItem.Visible := false;
end;

procedure TfrmCodbarraC.SpeedButton2Click(Sender: TObject);
begin
  cdsGrid.Delete;
end;

procedure TfrmCodbarraC.SpeedButton1Click(Sender: TObject);
begin
  with cdsGrid do
  begin
    Append;
    FieldByName('CODBARRA' ).AsString := edtCodProduto.Text;
    FieldByName('DESCRICAO').AsString := edtDescricao.Text;
    FieldByName('QUANTIDADE').AsInteger := StrtointDEf(inputbox('Digite a Quantidade de Etiquetas','','1'),1);
    post;
  end;
end;

procedure TfrmCodbarraC.FormShow(Sender: TObject);
begin
  with qrGrid, qrGrid.sql do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('SELECT CODBARRA, DESCRICAO , GRUPO AS QUANTIDADE FROM ITEM WHERE ITEM IS NULL ');
    Open;
  end;
  cdsGrid.Close;
  cdsGrid.Open;
  CarregaGrid(Grid);  
end;

procedure TfrmCodbarraC.okClick(Sender: TObject);
var
  x : Integer;
begin
  with qrGrid, qrGrid.SQL do
  begin
    Close;
    Clear;
    Add('DELETE FROM CODBARRA');
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    cdsGrid.First;
    while not cdsGrid.Eof do
    begin
      for x := 1 to cdsGrid.FieldByName('QUANTIDADE').AsINteger do
      begin
        Clear;
        Add('INSERT INTO CODBARRA (CODBARRA, DESCRICAO) VALUES (:BARRA, :DESCRICAO ) ');
        ParamByName('BARRA').AsString := cdsGrid.FieldByName('CODBARRA').AsString;
        ParamByName('DESCRICAO').AsString := cdsGrid.FieldByName('DESCRICAO').AsString;
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;        
      end;
      cdsGrid.Next;
      Application.ProcessMessages;
    end;
  end;
  ok.Enabled :=false;
  with TfrmCodBarra.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmCodbarraC.cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCodbarraC.edtCodProdutoChange(Sender: TObject);
begin
  edtDescricao.Text := LerCodBarra(edtCodProduto.Text);
end;

procedure TfrmCodbarraC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(Grid);
end;

end.
