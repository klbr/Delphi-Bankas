unit Consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, RXDBCtrl,
  IBCustomDataSet, IBQuery;

type
  TfrmConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtConsulta: TEdit;
    dsConsulta: TDataSource;
    grdConsulta: TRxDBGrid;
    qrConsulta: TIBQuery;
    procedure edtConsultaChange(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdConsultaCellClick(Column: TColumn);
    procedure grdConsultaDblClick(Sender: TObject);
    procedure grdConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrConsultaNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure IniciarConsulta(Tab : String);
  public
    { Public declarations }
  end;

  function Executa(const iTop, iLeft : Integer;const Tabela : String):String;

var
  frmConsulta: TfrmConsulta;
  Codigo     : String = '';
  Tabi       : String;

implementation
uses Main, Principal;
{$R *.dfm}
function Executa(const iTop, iLeft : Integer;const Tabela : String):String;
begin
   frmConsulta := TfrmConsulta.Create(Application);
   frmConsulta.Top := iTop;
   frmConsulta.Left := iLeft;
   frmConsulta.IniciarConsulta(Tabela);
   frmConsulta.ShowModal;
   Result := Codigo;
   frmConsulta.Free;
end;

{ TfrmConsulta }

{ TfrmConsulta }

procedure TfrmConsulta.IniciarConsulta(Tab: String);
begin
  with qrConsulta, qrConsulta.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    if Tab = 'FUNC' then
    begin
      Add('SELECT                   ');
      Add('  FUNCIONARIO AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  FUNCIONARIO            ');
      Open;
    end
    else if Tab = 'CLIE' then
    begin
      Add('SELECT                   ');
      Add('  CLIENTE     AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  CLIENTE                ');
      Open;
    end
    else if Tab = 'RUA' then
    begin
      Add('SELECT                   ');
      Add('  LOCALIZACAO AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  LOCALIZACAO            ');
      Open;
    end
    else if Tab = 'FORM' then
    begin
      Add('SELECT                      ');
      Add('  FORMAPAGAMENTO AS CODIGO, ');
      Add('  DESCRICAO                 ');
      Add('FROM                        ');
      Add('  FORMAPAGAMENTO            ');
      Open;
    end
    else if Tab = 'CRED' then
    begin
      Add('SELECT                   ');
      Add('  CREDOR      AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  CREDOR                 ');
      Open;
    end
    else if Tab = 'FORN' then
    begin
      Add('SELECT                   ');
      Add('  FORNECEDOR  AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  FORNECEDOR             ');
      Open;
    end
    else if Tab = 'GRUP' then
    begin
      Add('SELECT                   ');
      Add('  GRUPO       AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  GRUPO                  ');
      Open;
    end;
  end;
  Tabi := Tab;
end;

procedure TfrmConsulta.edtConsultaChange(Sender: TObject);
begin
  with qrConsulta, qrConsulta.SQL do
  begin
    Clear;
    Close;
    if Tabi = 'FUNC' then
    begin
      Add('SELECT                   ');
      Add('  FUNCIONARIO AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  FUNCIONARIO            ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'CLIE' then
    begin
      Add('SELECT                   ');
      Add('  CLIENTE     AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  CLIENTE                ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'RUA' then
    begin
      Add('SELECT                   ');
      Add('  LOCALIZACAO AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  LOCALIZACAO            ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'FORM' then
    begin
      Add('SELECT                      ');
      Add('  FORMAPAGAMENTO AS CODIGO, ');
      Add('  DESCRICAO                 ');
      Add('FROM                        ');
      Add('  FORMAPAGAMENTO            ');
      Add('WHERE                       ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'CRED' then
    begin
      Add('SELECT                   ');
      Add('  CREDOR      AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  CREDOR                 ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'FORN' then
    begin
      Add('SELECT                   ');
      Add('  FORNECEDOR  AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  FORNECEDOR             ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end
    else if Tabi = 'GRUP' then
    begin
      Add('SELECT                   ');
      Add('  GRUPO       AS CODIGO, ');
      Add('  DESCRICAO              ');
      Add('FROM                     ');
      Add('  GRUPO                  ');
      Add('WHERE                    ');
      Add('  DESCRICAO LIKE '+QuotedStr(edtConsulta.text+'%')+' ');
      Open;
    end;
  end;
end;

procedure TfrmConsulta.edtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
  begin
    Codigo := qrConsulta.FieldByName('CODIGO').AsString;
    Close;
  end;
end;

procedure TfrmConsulta.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    Codigo := '';
    Close;
  end
  else if Key = VK_DOWN then
  begin
    grdConsulta.SetFocus;
  end;
end;

procedure TfrmConsulta.grdConsultaCellClick(Column: TColumn);
begin
  Codigo := qrConsulta.FieldByName('CODIGO').AsString;
  Close;
end;

procedure TfrmConsulta.grdConsultaDblClick(Sender: TObject);
begin
  Codigo := qrConsulta.FieldByName('CODIGO').AsString;
  Close;
end;

procedure TfrmConsulta.grdConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    Codigo := '';
    Close;
  end
  else if not (qrConsulta.IsEmpty) and (Key = VK_RETURN) then
  begin
    Codigo := qrConsulta.FieldByName('CODIGO').AsString;
    Close;
  end
  else if Key = VK_UP then
  begin
    if qrConsulta.Bof then
      edtConsulta.SetFocus;
  end;
end;

procedure TfrmConsulta.qrConsultaNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TfrmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(grdConsulta);
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  CarregaGrid(grdConsulta);
end;

procedure TfrmConsulta.FormCreate(Sender: TObject);
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
  //    TDataBase(Components[x]).Database := frmPrincipal.dba;
  end;
end;

end.
