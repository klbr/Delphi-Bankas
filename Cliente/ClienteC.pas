unit ClienteC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Animate, GIFCtrl, ExtCtrls, TFlatPanelUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, ToolEdit, Mask, TFlatEditUnit;

type
  TfrmClienteC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    FlatGroupBox1: TFlatGroupBox;
    tipoc: TFlatRadioButton;
    FlatRadioButton2: TFlatRadioButton;
    edtDescCLiente: TLabel;
    edtCliente: TComboEdit;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    procedure cancelClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FlatRadioButton2Click(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmClienteC: TfrmClienteC;

implementation
uses Main,Principal, ClienteR, QuickRpt, Consulta;
{$R *.dfm}

procedure TfrmClienteC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmClienteC.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointdef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmClienteC.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
end;

procedure TfrmClienteC.okClick(Sender: TObject);
begin
  if not tipoc.Checked then
  begin
    if Trim(edtDescCliente.Caption) = '' then
    begin
      Exclusao2('Digite um Cliente.', 'Relatório de Clientes');
      edtCliente.SetFocus;
      Exit;
    end;
  end;
  ok.Enabled :=false;
  with TfrmClienteR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    Cliente := strtointDef(edtCliente.text, 0);
    Tipo := tipoc.Checked;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmClienteC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true);
  if (key = VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmClienteC.FlatRadioButton2Click(Sender: TObject);
begin
  if tipoc.Checked then
  begin
    edtCliente.Enabled :=false;
    edtData1.Enabled := false;
    edtData2.Enabled := false;
    edtData1.Clear;
    edtData2.Clear;
    edtCliente.Clear;
  end
  else
  begin
    edtCliente.Enabled :=True;
    edtData1.Enabled := true;
    edtData2.Enabled := True;
  end;
end;

procedure TfrmClienteC.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+70, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

end.
