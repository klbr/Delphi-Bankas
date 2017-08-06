unit FormConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ExtCtrls, TFlatPanelUnit, DB,
  ASGSQLite, StdCtrls, RxLookup, TFlatButtonUnit, TFlatSpeedButtonUnit;

type
  TfrmFormConsulta = class(TForm)
    dbBanco: TASQLiteDB;
    qrConsulta: TASQLiteQuery;
    qrBanco: TASQLiteQuery;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    dbgTabela: TRxDBGrid;
    cbColuna: TRxDBLookupCombo;
    dsConsulta: TDataSource;
    dsBanco: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edtTexto: TEdit;
    FlatButton2: TFlatButton;
    FlatSpeedButton1: TFlatSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtTextoChange(Sender: TObject);
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTabelaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    cTabela : Integer;
    cPesquisa : String;
//    Resultado : String;
  protected
    function  Verifica:boolean;
    procedure Inicia;
//    procedure Filtra;
  public

  published
    property Tabela : Integer read cTabela write cTabela;
    property Pesquisa : String read cPesquisa write cPesquisa;
  end;

var
  frmFormConsulta: TfrmFormConsulta;

implementation
Uses Main;
{$R *.dfm}

procedure TfrmFormConsulta.FormShow(Sender: TObject);
begin
  if not (ConectaBanco(dbBanco)) then
  begin
    Exclusao2('Banco não encontrada','Aviso');
    close;
  end;

end;

procedure TfrmFormConsulta.Inicia;
begin
  with qrBanco,qrbanco.SQL do
  begin
    close;
    Clear;
    Add('SELECT * FROM '+cPesquisa+'  ');
    Open;
  end;
  with qrConsulta,qrConsulta.SQL do
  begin
    close;
    Clear;
    Add('SELECT * FROM CONFIGURACAO WHERE CODIGO ='+inttostr(cTabela)+'  ');
    Open;
    First;
    cbColuna.LookUpField := 'COLUNA';
    cbColuna.DataField := 'COLUNA';
  end;
end;

procedure TfrmFormConsulta.edtTextoChange(Sender: TObject);
begin
  if edtTexto.text = '' then
    inicia;
end;

procedure TfrmFormConsulta.edtTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key = VK_RETURN then
//    filtra;
  if key = VK_ESCAPE then
    close;
end;

{procedure TfrmFormConsulta.Filtra;
begin
  with qrBanco,qrBanco.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM 'cTabela+ '       ');
    Add('WHERE '+cbColuna.LookUpDisplay+' ');
    Add('LIKE '+ edtTexto.text+'%         ');
    Open;
  end;
end;}

procedure TfrmFormConsulta.dbgTabelaDblClick(Sender: TObject);
begin
  if verifica then
  begin
//    Chave := strtoint(dbgTabela.SelectedRows.Items[0]);
    close;
  end
  else
    Exclusao2('Não existe nenhum registro nessa tabela','Aviso');
end;

procedure TfrmFormConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    close;
end;

function TfrmFormConsulta.Verifica: boolean;
begin
  result := not (qrBanco.IsEmpty);
end;

procedure TfrmFormConsulta.dbgTabelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    if verifica then
    begin
//      Chave := strtoint(dbgTabela.SelectedRows.Items[0]);
      close;
    end
    else
      Exclusao2('Não existe nenhum registro nessa tabela','Aviso');
  end;
end;

end.
