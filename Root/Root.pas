unit Root;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, TFlatComboBoxUnit, TFlatEditUnit,
  TFlatButtonUnit, ExtCtrls, TFlatPanelUnit, Mask, TFlatMaskEditUnit,
  TFlatSpeedButtonUnit, DBTables, ADODB, Encryp, reggen4;

type
  TfrmRoot = class(TForm)
    p1: TFlatPanel;
    btnOk: TFlatButton;
    FlatButton2: TFlatButton;
    btnAlter: TFlatSpeedButton;
    edtSerial: TEdit;
    Label1: TLabel;
    lChave: TLabel;
    TE1: TRegCodeGenerator4;
    procedure btnAlterClick(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function  SerialHD(vDrive:String):String;
  protected
  public
    { Public declarations }
  end;

var
  frmRoot: TfrmRoot;

implementation

{$R *.dfm}

procedure TfrmRoot.btnAlterClick(Sender: TObject);
var
  S : String;
begin
  S := edtSerial.Text;
  S := TE1.GenerateCode('ro'+S+'ot',100);
  lChave.Caption := S;
end;

function TfrmRoot.SerialHD(vDrive: String): String;
var
  Serial : DWord;
  DirLen, Flags : DWord;
  DLabel : array[0..11] of char;
begin
  try
    GetVolumeInformation(Pchar(vDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    result := inttohex(Serial,8);
  except
    result := '';
  end;
end;

procedure TfrmRoot.FlatButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRoot.btnOkClick(Sender: TObject);
begin
  Close;
end;

end.
