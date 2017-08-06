unit EstoquePorGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Animate, GIFCtrl, Buttons, ExtCtrls,
  TFlatPanelUnit, TFlatEditUnit, Grids, DBGrids, RXDBCtrl, DB;

type
  TfrmEstoquePorGrupo = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtGrupo: TComboEdit;
    Label2: TLabel;
    edtDescGrupo: TLabel;
    rgOrdem: TRadioGroup;
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoButtonClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmEstoquePorGrupo: TfrmEstoquePorGrupo;

implementation
uses Main, EstoquePorGrupoR, Principal, Consulta;
{$R *.dfm}

procedure TfrmEstoquePorGrupo.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEstoquePorGrupo.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmEstoquePorGrupoR.Create(Application) do
  begin
    Grupo := StrtoIntDef(edtGrupo.text,0);
    Ordem := rgOrdem.ItemIndex;
    PreviewModal;
    Free;
  end;
  ok.Enabled:= true;
end;

procedure TfrmEstoquePorGrupo.FormShow(Sender: TObject);
begin
  edtGrupo.SetFocus;
end;

procedure TfrmEstoquePorGrupo.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
    edtDescGrupo.Caption := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0))
  else
    edtDescGrupo.Caption := '';
end;

procedure TfrmEstoquePorGrupo.edtGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    ok.Click;
end;

procedure TfrmEstoquePorGrupo.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = VK_F4) then
    close;
end;

procedure TfrmEstoquePorGrupo.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+53, Left+9, 'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

end.
