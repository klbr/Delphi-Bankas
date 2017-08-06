unit AbreGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, DB, TFlatEditUnit, TFlatPanelUnit,
  ExtCtrls;

type
  TfrmAbreGrupo = class(TForm)
    Panel1: TPanel;
    pBottom: TFlatPanel;
    ok: TBitBtn;
    edtDescGrupo: TLabel;
    Label2: TLabel;
    FlatPanel1: TFlatPanel;
    procedure edtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure okClick(Sender: TObject);
  private
    function Valida : Boolean;
  public
    { Public declarations }
  end;

var
  frmAbreGrupo: TfrmAbreGrupo;
  iGrupo : Integer;
implementation
uses Main, Principal, Consulta;

{$R *.dfm}
function TfrmAbreGrupo.Valida: Boolean;
begin
  Result := false;
  if Trim(edtDescGrupo.Caption) = '' then
  begin
    Exclusao2('Você precisa Informar um Grupo','Aviso');
    edtGrupo.setFocus;
    exit;
  end;
  Result := true;
end;

procedure TfrmAbreGrupo.edtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    ok.Click;
end;

procedure TfrmAbreGrupo.FormShow(Sender: TObject);
begin
  edtGrupo.SetFocus;
end;

procedure TfrmAbreGrupo.okClick(Sender: TObject);
begin
  if not valida then
    Exit;

  iGrupo := strtoint(edtGrupo.text);
  Close;
end;

end.
