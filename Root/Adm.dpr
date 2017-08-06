program Adm;

uses
  Forms,
  Root in 'Root.pas' {frmRoot};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRoot, frmRoot);
  Application.Run;
end.
