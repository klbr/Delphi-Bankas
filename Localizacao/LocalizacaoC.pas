unit LocalizacaoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmLocalizacaoC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label3: TLabel;
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizacaoC: TfrmLocalizacaoC;

implementation
uses LocalizacaoR;
{$R *.dfm}

procedure TfrmLocalizacaoC.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmLocalizacaoR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmLocalizacaoC.cancelClick(Sender: TObject);
begin
  close;
end;

end.
