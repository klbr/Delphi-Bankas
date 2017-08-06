unit FormCadatroMini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSpeedButtonUnit, ComCtrls, ExtCtrls, TFlatPanelUnit,
  IBCustomDataSet, IBQuery, DB;

type
  TfrmFormCadatroMini = class(TForm)
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
    btnConsulta: TFlatSpeedButton;
    dsConsulta2: TDataSource;
    qrNavegacao: TIBQuery;
    qrCadastro: TIBQuery;
    qrConsulta2: TIBQuery;
    procedure btnFechaClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var
  frmFormCadatroMini: TfrmFormCadatroMini;

implementation
uses principal, Main;
{$R *.dfm}

procedure TfrmFormCadatroMini.btnFechaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFormCadatroMini.btnIncluiClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnAlteraClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnExcluiClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnCancelaClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnSalvaClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnFirstClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnPriorClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnNextClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnLastClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.btnConsultaClick(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.FormShow(Sender: TObject);
begin
//
end;

procedure TfrmFormCadatroMini.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TfrmFormCadatroMini.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//
end;

procedure TfrmFormCadatroMini.FormCreate(Sender: TObject);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Database := frmPrincipal.dba;
//    if (Components[x] is TIBQuery) then
 //     TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
  end;
end;

end.
