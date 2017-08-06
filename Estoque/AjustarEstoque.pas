unit AjustarEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Animate, GIFCtrl, Buttons, ExtCtrls,
  TFlatPanelUnit, TFlatEditUnit, Grids, DBGrids, RXDBCtrl, DB, DBTables,
  CurrEdit, IBCustomDataSet, IBQuery;

type
  TfrmAjustarEstoque = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtGrupo: TComboEdit;
    edtDescGrupo: TLabel;
    btnZerar: TSpeedButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtCodigo: TEdit;
    pItem: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    FlatPanel3: TFlatPanel;
    edtDesc: TFlatEdit;
    FlatPanel4: TFlatPanel;
    dbgItem: TRxDBGrid;
    edtCodBarra: TFlatEdit;
    edtDescricao: TEdit;
    dsItem: TDataSource;
    edtEdicao: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEstoque: TCurrencyEdit;
    btnAtualizar: TSpeedButton;
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure btnZerarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescChange(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemCellClick(Column: TColumn);
    procedure dbgItemDblClick(Sender: TObject);
    procedure edtEdicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure dbgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure FechaConsultaitem;
    procedure ConsultaItem;
    function  Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmAjustarEstoque: TfrmAjustarEstoque;

implementation
uses Main, Principal, Consulta;
{$R *.dfm}

procedure TfrmAjustarEstoque.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAjustarEstoque.FormShow(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TfrmAjustarEstoque.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
  begin
    edtDescGrupo.Caption := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0));
    btnZerar.Enabled := edtDescGrupo.Caption <> '';
  end
  else
  begin
    edtDescGrupo.Caption := '';
    btnZerar.Enabled := False;
  end;
end;

procedure TfrmAjustarEstoque.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = VK_F4) then
    close;
end;

procedure TfrmAjustarEstoque.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+53, Left+9, 'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmAjustarEstoque.btnZerarClick(Sender: TObject);
var
  qrQ1, qrQ2 : TIBQuery;
begin
  qrQ1 := TIBQuery.Create(nil);
  with qrQ1, qrQ1.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('SELECT CODBARRA FROM ITEM WHERE GRUPO=:GRUPO');
    ParamByName('GRUPO').AsInteger := StrToIntDef(edtGrupo.Text,0);
    Open;
    First;
  end;
  qrQ2 := TIBQuery.Create(nil);
  qrQ2.Database := frmPrincipal.dba;
  while not qrQ1.Eof do
  begin
    with qrQ2, qrQ2.SQL do
    begin
      Clear;
      Close;
      Add('UPDATE ESTOQUE SET ESTOQUE = 0 WHERE CODBARRA=:CODBARRA ');
      ParamByName('CODBARRA').AsString := qrQ1.FieldByName('CODBARRA').AsString;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
    qrQ1.Next;
  end;
  qrQ1.Close;
  qrQ2.Close;
  qrQ1.Destroy;
  qrQ2.Destroy;
  Exclusao2('Estoque das Mercadorias desse Grupo Atualizado!','Ajuste de Estoque');  
end;

procedure TfrmAjustarEstoque.edtCodigoExit(Sender: TObject);
begin
  if trim(edtCodigo.text) <> '' then
    edtDescricao.text := LerCodBarra(FormataCodBarra(edtCodigo.text));
end;

procedure TfrmAjustarEstoque.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    ConsultaItem
  else if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
      close;
end;

procedure TfrmAjustarEstoque.edtDescChange(Sender: TObject);
begin
  with frmPrincipal.cds do
  begin
    IndexFieldNames := 'DESCRICAO';
    FindNearest([edtDesc.Text]);
  end;
end;

procedure TfrmAjustarEstoque.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then
    FechaConsultaItem
  else if key = VK_Return then
  begin
    with DbgItem do
    begin
//      SelectedIndex := 0;
      edtCodigo.text := Fields[0].Text;
    end;
    FechaConsultaItem;
  end
  else if Key = VK_DOWN then
  begin
    dbgItem.SetFocus;
  end;
end;

procedure TfrmAjustarEstoque.dbgItemCellClick(Column: TColumn);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmAjustarEstoque.dbgItemDblClick(Sender: TObject);
begin
  edtCodigo.text := dbgItem.Fields[0].Text;
  FechaConsultaItem;
end;

procedure TfrmAjustarEstoque.ConsultaItem;
begin
  edtCodigo.Clear;
  edtDesc.Clear;
  pItem.Visible := true;
  edtDesc.SetFocus;
end;

procedure TfrmAjustarEstoque.FechaConsultaitem;
begin
  with frmPrincipal.cds do
  begin
    First;
  end;
  edtCodigo.setFocus;
  pItem.Visible := false;
end;

procedure TfrmAjustarEstoque.edtEdicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
    close;
end;

procedure TfrmAjustarEstoque.edtEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
    SelectNext(ActiveControl, true, true)
  else if (Shift = [ssCtrl]) and ( key = VK_F4) then
    close;
end;

procedure TfrmAjustarEstoque.btnAtualizarClick(Sender: TObject);
var
  qrQ : TIBQuery;
begin
  if not Valida then
    Exit;

  if not Exclusao('Deseja Atualizar esse Estoque?','Banka´s') then
    Exit;


  qrQ := TIBQuery.Create(nil);
  with qrQ , qrQ.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('UPDATE ESTOQUE SET ESTOQUE=:ESTOQUE WHERE CODBARRA=:CODBARRA ');
    if edtEdicao.AsInteger <> 0 then
    begin
      Add(' AND EDICAO=:EDICAO ');
      ParamByName('EDICAO'  ).AsInteger := edtEdicao.AsInteger;
    end;
    ParamByName('ESTOQUE' ).AsInteger := edtEstoque.AsInteger;
    ParamByName('CODBARRA').AsString  := FormataCodBarra(edtCodigo.Text);
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;    
  end;
  qrQ.Close;
  qrQ.Destroy;
  Exclusao2('Estoque da Mercadoria Atualizado!','Ajuste de Estoque');
end;

function TfrmAjustarEstoque.Valida: Boolean;
begin
  Result := False;
  if edtDescricao.Text = '' then
  begin
    Exclusao2('É Necessário digitar corretamente o Código da Mercadoria!','Aviso');
    edtCodigo.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmAjustarEstoque.dbgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and not (dsItem.DataSet.IsEmpty) then
  begin
    edtCodigo.text := dbgItem.Fields[0].Text;
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

end.
