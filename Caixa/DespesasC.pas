unit DespesasC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TFlatPanelUnit, ToolEdit,
  TFlatEditUnit, Grids, DBGrids, RXDBCtrl, Mask, DB;

type
  TfrmDespesasC = class(TForm)
    rbTipo: TRadioGroup;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label1: TLabel;
    edtData1: TDateEdit;
    Label2: TLabel;
    edtData2: TDateEdit;
    edtCredor: TComboEdit;
    Label14: TLabel;
    edtDescCredor: TLabel;
    procedure edtCredorButtonClick(Sender: TObject);
    procedure edtCredorChange(Sender: TObject);
//    procedure edtCampoChange(Sender: TObject);
//    procedure edtCampoKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure dbgConsultaDblClick(Sender: TObject);
//    procedure dbgConsultaCellClick(Column: TColumn);
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
  private
//    procedure ConsultaRapida;
//   procedure ConsultaRapidaOK;
//    procedure AbreConsulta;
  public
    { Public declarations }
  end;

var
  frmDespesasC: TfrmDespesasC;

implementation
Uses main, DespesasR, DespesasR2, QuickRpt,Principal, Consulta;
{$R *.dfm}

procedure TfrmDespesasC.edtCredorButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+16+20, Left+62, 'CRED');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmDespesasC.edtCredorChange(Sender: TObject);
begin
  if Trim(edtCredor.Text) = '' then
    edtDescCredor.Caption := ''
  else
    edtDescCredor.caption := LerDescricaoPorCampo('CREDOR', strtointDef(edtCredor.text,0));
end;

{procedure TfrmDespesasC.edtCampoChange(Sender: TObject);
begin
  ConsultaRapida;
end;

{procedure TfrmDespesasC.edtCampoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if Key = VK_ESCAPE then
  begin
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
  if Key = VK_RETURN then
  begin
    if not qrConsulta.IsEmpty then
    begin
      dbgConsulta.SelectedIndex := 0;
      edtCredor.Text := dbgConsulta.Fields[0].Text;
      edtDescCredor.Caption := dbgConsulta.Fields[1].Text;
    end;
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
end;

procedure TfrmDespesasC.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
  if Key = VK_RETURN then
  begin
    if not qrConsulta.IsEmpty then
    begin
      edtCredor.Text := dbgConsulta.Fields[0].Text;
      edtDescCredor.Caption := dbgConsulta.Fields[1].Text;
    end;
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
end;

procedure TfrmDespesasC.dbgConsultaDblClick(Sender: TObject);
begin
  ConsultaRapidaOK;
end;

procedure TfrmDespesasC.dbgConsultaCellClick(Column: TColumn);
begin
  ConsultaRapidaOK;
end;

procedure TfrmDespesasC.ConsultaRapida;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Clear;
    Add('SELECT CREDOR AS CODIGO, DESCRICAO FROM CREDOR WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+'    ');
    Open;
  end;
end;

procedure TfrmDespesasC.ConsultaRapidaOK;
begin
  try
    with dbgConsulta do
      begin
      edtCredor.Text := Fields[0].AsString;
      edtDescCredor.Caption := Fields[1].AsString;
      edtCredor.SetFocus;
    end;
  finally
    pConsultaRapida.Visible := false;
  end;
end;

procedure TfrmDespesasC.AbreConsulta;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Open;
  end;
  pConsultaRapida.Visible := true;
  edtCampo.SetFocus;
end;
}
procedure TfrmDespesasC.cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDespesasC.okClick(Sender: TObject);
begin
  ok.Enabled := False;
  if rbTipo.ItemIndex = 0 then
  begin
    with TfrmDespesasR.Create(Application) do
    begin
      Credor := edtCredor.text;
      Data1 := edtData1.Date;
      Data2 := edtData2.Date;
      PreviewModal;
      Free;
    end;
  end
  else
  begin
    with TfrmDespesasR2.Create(Application) do
    begin
      Credor := edtCredor.text;
      Data1 := edtData1.Date;
      Data2 := edtData2.Date;
      PreviewModal;
      Free;
    end;
  end;
  ok.Enabled := true;
end;

end.
