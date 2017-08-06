unit FormRelatorio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, IBCustomDataSet, IBQuery,
  DB;

type
  TfrmRelatorio = class(TQuickRep)
    bndCabecalho: TQRBand;
    bndTitulo: TQRBand;
    bndRodape: TQRBand;
    Data: TQRSysData;
    Pagina: TQRSysData;
    edtEmpresa: TQRLabel;
    edtEndereco: TQRLabel;
    edtCNPJ: TQRLabel;
    edtTelefones: TQRLabel;
    lblEmpresa: TQRLabel;
    lblEndereco: TQRLabel;
    lblCNPJ: TQRLabel;
    lblTel1: TQRLabel;
    lblTel2: TQRLabel;
    lblTel3: TQRLabel;
    qrRelatorio: TIBQuery;
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure WinControlFormCreate(Sender: TObject);
  private

  public

  end;

var
  frmRelatorio: TfrmRelatorio;

implementation
uses Principal, Main;
{$R *.DFM}

procedure TfrmRelatorio.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblEmpresa.Caption := LerIniCaractere('EMPRESA','RAZAO');
  lblEndereco.Caption := LerIniCaractere('EMPRESA','ENDERECO');
  lblCNPJ.Caption := LerIniCaractere('EMPRESA','CNPJ');
  lblTel1.Caption := LerIniCaractere('EMPRESA','TELEFONE');
  lblTel2.Caption := LerIniCaractere('EMPRESA','TELEFONE2');
  lblTel3.Caption := LerIniCaractere('EMPRESA','TELEFONE3');
end;

procedure TfrmRelatorio.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Database := frmPrincipal.dba;
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
//    else if (Components[x] is TDataBase) then
  //    TDataBase(Components[x]).DatabaseName := BancoDeDados;
  end;
end;

procedure TfrmRelatorio.WinControlFormCreate(Sender: TObject);
var
   x : Integer;
begin
  for x := 0 to Self.ComponentCount - 1do
  begin
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Database := frmPrincipal.dba;
    if (Components[x] is TIBQuery) then
      TIBQuery(Components[x]).Transaction := frmPrincipal.ibtransacao;
//    else if (Components[x] is TDataBase) then
  //    TDataBase(Components[x]).DatabaseName := BancoDeDados;
  end;
end;

end.
