unit Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ASGSQLite, StdCtrls;

type
  Tfrmdata = class(TForm)
    edtTabela: TEdit;
    edtCampo: TEdit;
    btnOK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    qr: TASQLiteQuery;
    qr2: TASQLiteQuery;
    Button1: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function Achar : Boolean;
  public
    { Public declarations }
  end;

var
  frmdata: Tfrmdata;
  DataAntiga , DataNova : String;

implementation
uses Principal;
{$R *.dfm}

function Tfrmdata.Achar: Boolean;
begin
  Result := False;
  while not qr.Eof do
  begin
    DataAntiga := qr.FieldByName(edtCampo.text).AsString;
    if Length(dataAntiga) = 8 then
    begin
      Result := True;
      Exit;
    end
    else
      QR.Next;
  end;
end;

procedure Tfrmdata.btnOKClick(Sender: TObject);
begin
  while Achar do
  begin
    DataNova := '20'+Copy(DataAntiga,7,2)+'/'+Copy(DataAntiga,4,2)+'/'+Copy(DataAntiga,1,2);
    with qr2, qr2.SQL do
    begin
      Close;
      Clear;
      Add('UPDATE '+edtTabela.Text+' SET '+edtCampo.Text+' =:NOVADATA WHERE '+edtCampo.Text+'=:VELHADATA  ');
      Params.ParamByName('NOVADATA').AsString := DataNova;
      Params.ParamByName('VELHADATA').AsString := DataAntiga;
      ExecSQL;
    end;
    qr.Close;
    qr.Open;
  end;
end;

procedure Tfrmdata.Button1Click(Sender: TObject);
begin
  with qr, qr.SQL do
  begin
    Close;
    Clear;
    Add('SELECT '+edtCampo.text+' FROM '+edtTabela.Text+'  ');
    Open;
    First;
  end;
end;

end.
