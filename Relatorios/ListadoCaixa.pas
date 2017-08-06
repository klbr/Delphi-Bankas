unit ListadoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, TFlatPanelUnit;

type
  TfrmListadoCaixa = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtData2: TDateEdit;
    edtData1: TDateEdit;
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCaixaKeyPress(Sender: TObject; var Key: Char);
  private
  function Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmListadoCaixa: TfrmListadoCaixa;

implementation
uses Main, ListadoCaixaR;
{$R *.dfm}

procedure TfrmListadoCaixa.okClick(Sender: TObject);
begin
  if not Valida then
    exit;
  ok.Enabled := false;
  with TfrmListaDoCaixaR.Create(Application) do
  begin
    Data1 := edtData1.Date;
    Data2 := edtData2.Date;
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

procedure TfrmListadoCaixa.cancelClick(Sender: TObject);
begin
  Close;
end;

function TfrmListadoCaixa.Valida: Boolean;
begin
  result := false;
  if (edtData1.date <= edtData2.date) and (edtData1.date=0) and (edtData2.date=0) then
  begin
    Exclusao2('Preencha as datas corretamente','Aviso');
    edtData1.setfocus;
    exit;
  end;
  result := true;
end;

procedure TfrmListadoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true)
  else if (key = VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmListadoCaixa.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

procedure TfrmListadoCaixa.edtCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
   ok.Click;
end;

end.
