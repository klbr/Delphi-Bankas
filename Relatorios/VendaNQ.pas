unit VendaNQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmVendaNQ = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtData2: TDateEdit;
    Label2: TLabel;
    edtData1: TDateEdit;
    Label1: TLabel;
    rgTipo: TRadioGroup;
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaNQ: TfrmVendaNQ;

implementation
uses VendaNQR;
{$R *.dfm}

procedure TfrmVendaNQ.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmVendaNQR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    Tipo  := rgTipo.ItemIndex;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmVendaNQ.cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVendaNQ.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true)
  else if (key = VK_F4) and (shift = [ssctrl]) then
    close;
end;

procedure TfrmVendaNQ.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
   ok.Click;
end;

procedure TfrmVendaNQ.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

end.
