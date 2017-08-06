unit FiadoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, TFlatEditUnit, ToolEdit, StdCtrls, Mask, Buttons, ExtCtrls,
  TFlatPanelUnit, TFlatRadioButtonUnit, TFlatGroupBoxUnit;

type
  TfrmFiadoC = class(TForm)
    edtDescCLiente: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtCliente: TComboEdit;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    rbpago: TFlatRadioButton;
    FlatRadioButton2: TFlatRadioButton;
    rbP: TRadioGroup;
    procedure cancelClick(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCampoChange(Sender: TObject);
//    procedure edtCampoKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure dbgConsultaCellClick(Column: TColumn);
    procedure okClick(Sender: TObject);
//    procedure pConsultaRapidaExit(Sender: TObject);
  private
//    procedure AbreConsulta;
//    procedure ConsultaRapida;
    function  Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmFiadoC: TfrmFiadoC;

implementation
uses Main, FiadoR,Principal, Consulta;
{$R *.dfm}

{ TForm1 }

{procedure TfrmFiadoC.AbreConsulta;
begin
  with qrConsulta, qrConsulta.SQL do
  begin
    Close;
    Clear;
    Add('SELECT CLIENTE AS CODIGO, DESCRICAO FROM CLIENTE ');
    Open;
  end;
  pConsultaRapida.Visible := true;
  edtCampo.SetFocus;
end;

procedure TfrmFiadoC.ConsultaRapida;
begin
  with qrConsulta,qrConsulta.SQL do
  begin
    Close;
    Clear;
    Add('SELECT CLIENTE AS CODIGO, DESCRICAO FROM CLIENTE WHERE DESCRICAO LIKE '+QuotedStr(edtCampo.text+'%')+' ');
    Open;
  end;
end;
 }
function TfrmFiadoC.Valida: Boolean;
begin
  result := false;
  if Trim(edtCliente.Text) = '' then
  begin
    exclusao2('Digite o Cliente','Aviso');
    edtCliente.SetFocus;
    exit;
  end;
  result :=true;
end;

procedure TfrmFiadoC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFiadoC.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+30, Left+70, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmFiadoC.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointDef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmFiadoC.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
end;

procedure TfrmFiadoC.edtCampoChange(Sender: TObject);
begin
//  ConsultaRapida;
end;

{procedure TfrmFiadoC.edtCampoKeyDown(Sender: TObject; var Key: Word;
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
      edtCliente.Text := dbgConsulta.Fields[0].Text;
      edtDescCliente.Caption := dbgConsulta.Fields[1].Text;
      edtCliente.SetFocus;
    end;
    pConsultaRapida.Visible := false;
    edtCampo.Text := '';
    qrConsulta.Close;
  end;
end;
 }
{procedure TfrmFiadoC.dbgConsultaCellClick(Column: TColumn);
begin
  if not qrConsulta.IsEmpty then
  begin
    with dbgConsulta do
    begin
      edtCliente.Text := Fields[0].AsString;
      edtDescCliente.Caption := Fields[1].AsString;
      edtCliente.SetFocus;
    end;
  end;
  pConsultaRapida.Visible := false;
  qrConsulta.Close;
  edtCampo.Text := '';
end;
 }
procedure TfrmFiadoC.okClick(Sender: TObject);
begin
  if not Valida then
    exit;

  ok.Enabled :=false;
  with TfrmFiadoR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    Cliente := strtointdef(edtCliente.text,0);
    Tipo := rbPago.Checked;
    Parcela := rbp.ItemIndex;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

{procedure TfrmFiadoC.pConsultaRapidaExit(Sender: TObject);
begin
  pConsultaRapida.Visible := false;
  qrConsulta.Close;
  edtCampo.Text := '';
end;
 }
end.
