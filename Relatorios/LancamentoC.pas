unit LancamentoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmLancamentoC = class(TForm)
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
  frmLancamentoC: TfrmLancamentoC;

implementation
uses LancamentoR;
{$R *.dfm}

procedure TfrmLancamentoC.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  with TfrmLancamentoR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmLancamentoC.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true)
  else if (key = VK_F4) and (shift = [ssctrl]) then
    close;
end;

procedure TfrmLancamentoC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLancamentoC.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

procedure TfrmLancamentoC.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
   ok.Click;
end;

end.
