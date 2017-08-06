unit FornecedorC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TFlatPanelUnit,
  Mask, ToolEdit;

type
  TfrmFornecedorC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtData2: TDateEdit;
    edtData1: TDateEdit;
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
  private
//  function Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmFornecedorC: TfrmFornecedorC;

implementation
uses FornecedorR, QuickRpt, Main;
{$R *.dfm}

procedure TfrmFornecedorC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFornecedorC.okClick(Sender: TObject);
begin
//  if not Valida then
//    exit;

  ok.Enabled := false;
  with TfrmFornecedorR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

//function TfrmFornecedorC.Valida: Boolean;
//begin
//  result := false;
//  if (edtData1.date <= edtData2.date) and (edtData1.date=0) and (edtData2.date=0) then
//  begin
//    Exclusao2('Preencha as datas corretamente','Aviso');
//    edtData1.setfocus;
//    exit;
//  end;
//  result := true;
//end;

procedure TfrmFornecedorC.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

procedure TfrmFornecedorC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true);
  if (key = VK_F4) and (shift = [ssctrl]) then
    close;    
end;

procedure TfrmFornecedorC.edtData2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    ok.Click;
end;

end.
