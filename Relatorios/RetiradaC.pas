unit RetiradaC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmRetiradaC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label2: TLabel;
    edtData2: TDateEdit;
    edtData1: TDateEdit;
    Label1: TLabel;
    procedure okClick(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRetiradaC: TfrmRetiradaC;

implementation
uses RetiradaR;
{$R *.dfm}

procedure TfrmRetiradaC.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmRetiradaR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmRetiradaC.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true)
  else if (key = VK_F4) and (shift = [ssctrl]) then
    close;
end;

procedure TfrmRetiradaC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRetiradaC.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

procedure TfrmRetiradaC.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
   ok.Click;
end;

end.
