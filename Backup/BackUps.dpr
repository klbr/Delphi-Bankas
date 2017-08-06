program BackUps;

uses
  Forms,
  Backup in 'Backup.pas' {frmBackup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.Run;
end.
