unit Exclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSpeedButtonUnit, StdCtrls, TFlatButtonUnit, Buttons;

type
  TfrmExclusao = class(TForm)
    Texto: TLabel;
    ok: TBitBtn;
    cancel: TBitBtn;
    procedure cancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

var
  frmExclusao: TfrmExclusao;

implementation

{$R *.dfm}

procedure TfrmExclusao.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmExclusao.okClick(Sender: TObject);
begin
  ok.Enabled := false;;
  close;
end;

procedure TfrmExclusao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    ok.Click;
end;

end.
