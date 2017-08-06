unit GetPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TfrmGetPreco = class(TForm)
    edtPreco: TCurrencyEdit;
    lblCaption: TLabel;
    edtGrupo: TComboEdit;
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure edtGrupoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetPreco: TfrmGetPreco;
  Preco      : Double  = 0;
  iGrupo     : Integer = 0;
  Existe     : Boolean;

implementation
uses Main, Consulta;
{$R *.dfm}

procedure TfrmGetPreco.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
 begin
   Preco := edtPreco.Value;
   Close;
 end;
end;

procedure TfrmGetPreco.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
   Existe  := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0)) <> '';
end;

procedure TfrmGetPreco.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20+33+25, Left+12, 'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmGetPreco.edtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Existe then
    begin
      iGrupo := StrToIntDef(edtGrupo.text , 0);
      Close;
    end
    else
    begin
      ShowMessage('Escolha um grupo Correto.');
      edtGrupo.SetFocus;
    end;
  end;
end;

end.
