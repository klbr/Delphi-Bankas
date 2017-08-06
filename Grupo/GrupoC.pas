unit GrupoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Animate, GIFCtrl, StdCtrls, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmGrupoC = class(TForm)
    Label3: TLabel;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoC: TfrmGrupoC;

implementation
uses GrupoR, QuickRpt;
{$R *.dfm}

procedure TfrmGrupoC.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmGrupoR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmGrupoC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGrupoC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    ok.Click
  else if (key = VK_F4) and (shift = [ssCtrl] ) then
    close;
end;

end.
