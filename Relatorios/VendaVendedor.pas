unit VendaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, TFlatEditUnit, ToolEdit, StdCtrls, Mask, Buttons, ExtCtrls,
  TFlatPanelUnit;

type
  TfrmVendaVendedor = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtDescGrupo: TLabel;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtData2: TDateEdit;
    edtData1: TDateEdit;
    edtGrupo: TComboEdit;
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCampoChange(Sender: TObject);
//    procedure edtCampoKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure dbgConsultaCellClick(Column: TColumn);
//    procedure dbgConsultaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
  private
//    procedure AbreConsulta;
//    procedure ConsultaRapida;
//    procedure ConsultaRapidaOK;
  public
    { Public declarations }
  end;

var
  frmVendaVendedor: TfrmVendaVendedor;

implementation
uses Main, Principal,VendaVendedorR, Consulta;
{$R *.dfm}

procedure TfrmVendaVendedor.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+24+20+6, Left+9, 'FUNC');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmVendaVendedor.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
    edtDescGrupo.Caption := LerDescricaoPorCampo('FUNCIONARIO',strtointDef(edtGrupo.text,0))
  else
    edtDescGrupo.Caption := '';
end;

procedure TfrmVendaVendedor.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = VK_F4) then
    close
  else if key = 13 then
    SelectNext(ActiveControl, true, true);
end;

procedure TfrmVendaVendedor.edtCampoChange(Sender: TObject);
begin
//  ConsultaRapida;
end;

{procedure TfrmVendaVendedor.edtCampoKeyDown(Sender: TObject; var Key: Word;
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
      dbgConsulta.SelectedIndex := 0;
      edtGrupo.Text := dbgConsulta.Fields[0].Text;
      edtDescGrupo.Caption := dbgConsulta.Fields[1].Text;
    end;
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
end;}

//procedure TfrmVendaVendedor.dbgConsultaCellClick(Column: TColumn);
//begin
 // ConsultaRapidaOK;
//end;

//procedure TfrmVendaVendedor.dbgConsultaDblClick(Sender: TObject);
//begin
//  ConsultaRapidaOK;
//end;

procedure TfrmVendaVendedor.FormShow(Sender: TObject);
begin
  edtGrupo.SetFocus;
end;

procedure TfrmVendaVendedor.cancelClick(Sender: TObject);
begin
  close;
end;

{procedure TfrmVendaVendedor.AbreConsulta;
begin
  with qrConsulta, qrConsulta.SQL do
  begin
    Close;
    Open;
  end;
  pConsultaRapida.Visible := true;
  edtCampo.SetFocus;
end;
 }
{procedure TfrmVendaVendedor.ConsultaRapida;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Clear;
    Add('SELECT FUNCIONARIO AS CODIGO, DESCRICAO FROM FUNCIONARIO WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+'    ');
    Open;
  end;
end;}

{procedure TfrmVendaVendedor.ConsultaRapidaOK;
begin
  try
    with dbgConsulta do
      begin
      edtGrupo.Text := Fields[0].AsString;
      edtDescGrupo.Caption := Fields[1].AsString;
    end;
  finally
    pConsultaRapida.Visible := false;
    qrConsulta.Close;
    edtCampo.Text := '';
  end;
end;
 }
procedure TfrmVendaVendedor.okClick(Sender: TObject);
begin
  ok.enabled := False;
  with TfrmVendaVendedorR.Create(Application) do
  begin
    Data1 := edtData1.date;
    Data2 := edtData2.date;
    Funcionario := StrtoIntdef(edtGrupo.text,0);
    Ordem := '   FUNCIONARIO.DESCRICAO  ';
    PreviewModal;
    Free;
  end;
  ok.Enabled := True;
end;

end.
