unit Backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, TFlatProgressBarUnit, ExtCtrls, TFlatPanelUnit,
  ZipForge, StdCtrls, IniFiles;

type
  TfrmBackup = class(TForm)
    Zip: TZipForge;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    pb: TFlatProgressBar;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    Label1: TLabel;
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure ZipFileProgress(Sender: TObject; FileName: String;
      Progress: Double; Operation: TZFProcessOperation;
      ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
  private
    { Private declarations }
  public
    function RemoveBarra(barra:String):String;
    Function LerIni(Tit, Sub : String):String;
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.FlatButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.FlatButton1Click(Sender: TObject);
begin
  pb.Position := 0;
  if not (DirectoryExists(Pchar(LerInI('BANCO','DIRETORIO')+'\Backups'))) then
    CreateDir(Pchar(LerIni('BANCO','DIRETORIO')+'\Backups'));

  with Zip do
  begin
    FileName := LerInI('BANCO','DIRETORIO')+'\Backups\DB'+RemoveBarra(DatetoStr(Date))+'.zip';
    OpenArchive;
    BaseDir := LerInI('BANCO','DIRETORIO');
    AddFiles('*.sql');
    CloseArchive;
  end;
  MessageBox(handle,'BackUp efetuado com sucesso.','Backups',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmBackup.ZipFileProgress(Sender: TObject; FileName: String;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
  Application.ProcessMessages;
  pb.Position := StrToInt(FormatFloat('#0',(Progress*100)));
  Application.ProcessMessages;
end;

function TfrmBackup.LerIni(Tit, Sub: String): String;
var
  ini : TIniFile;
begin
  ini := TIniFile.Create('TecBanca.ini');
  Result := ini.ReadString(Tit,Sub,'');
end;

function TfrmBackup.RemoveBarra(barra: String): String;
var
  y :String;
  x : integer;
begin
  y := '';
  for x :=1 to length(barra) do
    if not (barra[x] = '\') and  not (barra[x] = '/') then
      y := y + barra[x];

  Result := y;
end;

end.
