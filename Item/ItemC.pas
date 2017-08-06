unit ItemC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Animate, GIFCtrl, ExtCtrls, TFlatPanelUnit,
  Mask, ToolEdit, TFlatRadioButtonUnit, TFlatGroupBoxUnit;

type
  TfrmItemC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label1: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    gb: TFlatGroupBox;
    rbA: TFlatRadioButton;
    rbD: TFlatRadioButton;
    rbT: TFlatRadioButton;
    procedure cancelClick(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
//    function Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmItemC: TfrmItemC;

implementation
uses ItemR, QuickRpt, Main;
{$R *.dfm}

procedure TfrmItemC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmItemC.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if (Key = VK_F4) and (shift = [ssCtrl]) then
   close;
end;

procedure TfrmItemC.okClick(Sender: TObject);
begin
//  if not Valida then
//    exit;
  ok.Enabled := false;
  with TfrmItemR.Create(Application) do
  begin
    if rbA.checked then
      Tipo := 0
    else if rbd.checked then
      Tipo := 1
    else
      Tipo := 2;
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

//function TfrmItemC.Valida: Boolean;
//begin
//  result := false;
//  if (edtData1.Date <= 0) or (edtData1.date > edtData2.Date) or (edtData2.Date <= 0) then
//  begin
//    exclusao2('Digite um intervalo de datas válido','Aviso');
//    edtData1.SetFocus;
//    exit;
//  end;
//  result := true;
//end;

procedure TfrmItemC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_REturn then
    SelectNext(ActiveControl,true,true)
  else if (key =VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmItemC.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 then
    ok.Click;
end;

procedure TfrmItemC.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

end.
