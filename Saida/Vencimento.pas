unit Vencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatPanelUnit, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons;

type
  TfrmVencimento = class(TForm)
    Panel1: TPanel;
    FlatPanel1: TFlatPanel;
    edtData: TDateEdit;
    ok: TBitBtn;
    Label1: TLabel;
    FlatPanel2: TFlatPanel;
    procedure FormShow(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure edtDataKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVencimento: TfrmVencimento;

implementation
uses Main;
{$R *.dfm}

procedure TfrmVencimento.FormShow(Sender: TObject);
begin
  edtData.Date := Date;
  edtData.SetFocus;
end;

procedure TfrmVencimento.okClick(Sender: TObject);
begin
  if edtData.Date <= 0 then
  begin
    Exclusao2('Digite uma data válida','Aviso');
    edtData.SetFocus;
    exit;
  end;
  Close;
end;

procedure TfrmVencimento.edtDataKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   ok.Click;
end;

end.
