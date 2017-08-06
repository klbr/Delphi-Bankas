unit FormCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, DB, ASGSQLite, TFlatSpeedButtonUnit,
  ComCtrls, TFlatHintUnit;

type
  TfrmCadastro = class(TForm)
    fpBody: TFlatPanel;
    sbStatus: TStatusBar;
    fpBotoes: TFlatPanel;
    btnInclui: TFlatSpeedButton;
    btnAltera: TFlatSpeedButton;
    btnCancela: TFlatSpeedButton;
    btnExclui: TFlatSpeedButton;
    btnSalva: TFlatSpeedButton;
    btnFirst: TFlatSpeedButton;
    btnPrior: TFlatSpeedButton;
    btnNext: TFlatSpeedButton;
    btnLast: TFlatSpeedButton;
    btnFecha: TFlatSpeedButton;
    qrCadastro: TASQLiteQuery;
    dbCadastro: TASQLiteDB;
    fhHint: TFlatHint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation
uses Main, Registro, RotinaInclusao, RotinaAlteracao, RotinaExclusao, FuncoesRegistro;
{$R *.dfm}

end.
