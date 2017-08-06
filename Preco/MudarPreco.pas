unit MudarPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Mask, ToolEdit;

type
  TfrmMudarPreco = class(TForm)
    Button1: TButton;
    edtData: TDateEdit;
    Label1: TLabel;
    qrTab: TQuery;
    qrExec: TQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMudarPreco: TfrmMudarPreco;

implementation

{$R *.dfm}

procedure TfrmMudarPreco.Button1Click(Sender: TObject);
var
  Resposta : Integer;
begin
  with qrTab , qrTab.SQL do
  begin
    Clear;
    Close;
    Add('SELECT * FROM ITEM ');
    if edtData.Date > 0 then
    begin
      Add('WHERE CADASTRO >= :DATA ');
      ParamByName('DATA').AsDateTime := edtData.Date;
    end;
    Add('ORDER BY ITEM  ');
    Open;
  end;
  Resposta := MessageBox(handle,Pchar('Deseja atualizar esse item: "'+qrTab.FieldByName('DESCRICAO').AsString +'" ? (Opção "Cancelar" significa "Sim Para Todos")'),'Aviso do Sistema',MB_YESNOCANCEL+MB_ICONQUESTION);
  while not qrTab.Eof do
  begin
    if Resposta <> ID_CANCEL then
      Resposta := MessageBox(handle,Pchar('Deseja atualizar esse item: "'+qrTab.FieldByName('DESCRICAO').AsString +'" ? (Opção "Cancelar" significa "Sim Para Todos")'),'Aviso do Sistema',MB_YESNOCANCEL+MB_ICONQUESTION);
    if (Resposta = ID_YES) or (Resposta = ID_Cancel) then
    begin
      with qrExec, qrExec.SQL do
      begin
        Clear;
        Close;
        Add('UPDATE ITEM SET PRECOCOMPRA = :PRECO WHERE ITEM = :ITEM ');
        ParamByName('ITEM').AsInteger := qrTab.FieldByName('ITEM').AsInteger;
        if (qrTab.FieldByName('PRECOVENDA').AsFloat - qrTab.FieldByName('PRECOCOMPRA').AsFloat) > 0 then
          ParamByName('PRECO').AsFloat  := qrTab.FieldByName('PRECOVENDA').AsFloat - qrTab.FieldByName('PRECOCOMPRA').AsFloat
        else
          ParamByName('PRECO').AsFloat  := qrTab.FieldByName('PRECOCOMPRA').AsFloat;
      end;
    end;
    qrTab.Next;
  end;
  ShowMessage('Operação Completa!');
end;

end.
