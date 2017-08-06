program preco;

uses
  Forms,
  MudarPreco in 'MudarPreco.pas' {frmMudarPreco};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMudarPreco, frmMudarPreco);
  Application.Run;
end.
