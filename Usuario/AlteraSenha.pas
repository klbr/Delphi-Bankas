unit AlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, TFlatButtonUnit, StdCtrls,
  TFlatEditUnit, DB, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmAlteraSenha = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtSenha: TFlatEdit;
    edtSenha1: TFlatEdit;
    edtSenha2: TFlatEdit;
    btnOk: TFlatButton;
    btnFEcha: TFlatButton;
    qrSenha: TIBQuery;
    procedure btnOkClick(Sender: TObject);
    procedure btnFEchaClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenha2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    nCodigo : Integer;
    function Valida:boolean;
  public

  published
    property Codigo : Integer read nCodigo write nCodigo;
  end;

var
  frmAlteraSenha: TfrmAlteraSenha;

implementation
uses Main,Principal;
{$R *.dfm}

procedure TfrmAlteraSenha.btnOkClick(Sender: TObject);
begin
  if valida then
  begin
    try
      with qrSenha,qrSenha.SQL do
      begin
        Close;
        Clear;
        Add('UPDATE USUARIO SET             ');
        Add('SENHA=:SENHA                   ');
        Add('WHERE USUARIO=:USUARIO         ');
        Params.ParamByName('USUARIO').AsInteger := nCodigo;
        Params.ParamByName('SENHA').AsString := Codifica(edtSenha1.text,length(edtSenha1.Text));
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
      end;
    except
      Exclusao2('Sua senha não pôde ser alterada.','Aviso');
    end;
    close;
  end;
end;

function TfrmAlteraSenha.Valida:boolean;
begin
  result := true;
  if Usuario <> 'root' then
  begin
    try
      with qrSenha,qrSenha.SQL do
      begin
        Database := frmPrincipal.dba;
        Clear;
        Add('SELECT USUARIO FROM USUARIO  ');
        Add('WHERE USUARIO=:USUARIO       ');
        Add('AND                          ');
        Add('SENHA=:SENHA                 ');
        Params.ParamByName('USUARIO').AsInteger := nCodigo;
        Params.ParamByName('SENHA').AsString := Codifica(edtSenha.text,length(edtsenha.Text));
        Open;
        if IsEmpty then
        begin
          Exclusao2('Sua Senha não é válida.','Aviso');
          edtSenha.SetFocus;
          result := false;
          close;
        end;
      end;
    except
      Exclusao2('Ocorreu um erro de Consulta no Banco.','Aviso');
      close;
      result := false;
    end;
    if not (edtSenha1.text = edtSenha2.Text) then
    begin
      Exclusao2('Digite Senha idênticas.','Aviso');
      edtSenha1.SetFocus;
      close;
      result := false;
    end;
  end;
end;
procedure TfrmAlteraSenha.btnFEchaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAlteraSenha.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    SelectNext(ActiveControl, true, true)
  else if key = Vk_escape then
    btnFecha.Click;
end;

procedure TfrmAlteraSenha.edtSenha2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnOK.Click;
end;

procedure TfrmAlteraSenha.FormCreate(Sender: TObject);
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
//      TDataBase(Components[x]).DatabaseName := BancoDeDados;
  end;
end;

end.
