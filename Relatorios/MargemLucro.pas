unit MargemLucro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, TFlatPanelUnit,
  TFlatEditUnit; 

type
  TfrmMargemLucro = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtData2: TDateEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtData1: TDateEdit;
    Label3: TLabel;
    edtGrupo: TComboEdit;
    edtDescGrupo: TLabel;
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCampoChange(Sender: TObject);
    procedure edtCampoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure dbgConsultaCellClick(Column: TColumn);
//    procedure dbgConsultaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
//    procedure pConsultaRapidaExit(Sender: TObject);
  private
//    procedure AbreConsulta;
//    procedure ConsultaRapida;
//    procedure ConsultaRapidaOK;
  public
    { Public declarations }
  end;

var
  frmMargemLucro: TfrmMargemLucro;

implementation
uses Main, Principal, MargemLucroR, Consulta;
{$R *.dfm}

procedure TfrmMargemLucro.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+45, Left+10, 'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmMargemLucro.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
    edtDescGrupo.Caption := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0))
  else
    edtDescGrupo.Caption := '';
end;

procedure TfrmMargemLucro.edtGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = VK_F4) then
    close
  else if key = 13 then
    SelectNext(ActiveControl, true, true);
end;

procedure TfrmMargemLucro.edtCampoChange(Sender: TObject);
begin
//  ConsultaRapida;
end;

procedure TfrmMargemLucro.edtCampoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
//    pConsultaRapida.Visible := false;
//    edtCampo.Text := '';
//    qrConsulta.Close;
  end;
  if Key = VK_RETURN then
  begin
//    if not qrConsulta.IsEmpty then
    begin
//      dbgConsulta.SelectedIndex := 0;
//      edtGrupo.Text := dbgConsulta.Fields[0].Text;
//      edtDescGrupo.Caption := dbgConsulta.Fields[1].Text;
    end;
//    pConsultaRapida.Visible := false;
//    edtCampo.Text := '';
//    qrConsulta.Close;
  end;
end;

//procedure TfrmMargemLucro.dbgConsultaCellClick(Column: TColumn);
//begin
//  ConsultaRapidaOK;
//end;

//procedure TfrmMargemLucro.dbgConsultaDblClick(Sender: TObject);
//begin
//  ConsultaRapidaOK;
//end;

//procedure TfrmMargemLucro.AbreConsulta;
//begin
//  with qrConsulta, qrConsulta.SQL do
//  begin
//    Close;
//    Open;
//  end;
 // pConsultaRapida.Visible := true;
//  edtCampo.SetFocus;
//end;

{procedure TfrmMargemLucro.ConsultaRapida;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Clear;
    Add('SELECT GRUPO AS CODIGO, DESCRICAO FROM GRUPO WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+'    ');
    Open;
  end;
end;

procedure TfrmMargemLucro.ConsultaRapidaOK;
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
procedure TfrmMargemLucro.FormShow(Sender: TObject);
begin
  edtGrupo.SetFocus;
end;

procedure TfrmMargemLucro.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMargemLucro.okClick(Sender: TObject);
begin
  ok.enabled := False;
  with TfrmMargemLucroR.Create(Application) do
  begin
    Data1 := edtData1.date;
    Data2 := edtData2.date;
    Grupo := StrtoIntdef(edtGrupo.text,0);
    Ordem := '   GRUPO.DESCRICAO  ';
    PreviewModal;
    Free;
  end;
  ok.Enabled := True;
end;

//procedure TfrmMargemLucro.pConsultaRapidaExit(Sender: TObject);
//begin
//  pConsultaRapida.Visible := false;
 // qrConsulta.Close;
 // edtCampo.Text := '';
//end;

end.
