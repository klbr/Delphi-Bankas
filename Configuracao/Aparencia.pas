unit Aparencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfrmAparencia = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    t: TTimer;
    procedure FormShow(Sender: TObject);
    procedure fbSkinClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAparencia: TfrmAparencia;

implementation
uses Main;
{$R *.dfm}

procedure TfrmAparencia.FormShow(Sender: TObject);
begin
  fbSkin.Directory := DiretorioExe + 'Skins\';
  fbSkin.Update;
end;

procedure TfrmAparencia.fbSkinClick(Sender: TObject);
begin
//  Skin.SkinFile := fbSkin.FileName;
//  skin.
end;

procedure TfrmAparencia.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmAparencia.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
