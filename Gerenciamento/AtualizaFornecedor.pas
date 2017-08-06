unit AtualizaFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmAtualizaFornecedor = class(TForm)
    Button1: TButton;
    lblRec: TLabel;
    lblTotal: TLabel;
    pb: TProgressBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaFornecedor: TfrmAtualizaFornecedor;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmAtualizaFornecedor.Button1Click(Sender: TObject);
var
  qrForn, qrExec : TIBQuery;
  Edi, Forn : Integer;
begin
  qrForn := TIBQuery.Create(nil);
  qrExec := TIBQuery.Create(nil);
  qrExec.Database := frmPrincipal.dba;
  qrForn.Database := frmPrincipal.dba;
  lblTotal.Caption := InttoStr(frmPrincipal.cds.RecordCount);
  pb.Max := frmPrincipal.cds.RecordCount;
  try
    frmPrincipal.cds.First;
    while not frmPrincipal.cds.Eof do
    begin
      with qrForn, qrForn.SQL do
      begin
        Database := frmPrincipal.dba;
        Clear;
        Close;
        Add('SELECT                                    ');
        Add('  ENTRADA.FORNECEDOR AS COD_FORN,         ');
        Add('  ITEMENTRADA.EDICAO AS EDI_ITEM          ');
        Add('FROM                                      ');
        Add('  ENTRADA,                                ');
        Add('  ITEMENTRADA                             ');
        Add('WHERE                                     ');
        Add('  ENTRADA.ENTRADA=ITEMENTRADA.ITEMENTRADA ');
        Add('AND                                       ');
        Add('  ITEMENTRADA.CODBARRA=:BARRA             ');
        ParamByName('BARRA').AsString   := frmPrincipal.cds.FieldByName('CODBARRA').AsString;
        Open;
        while not Eof do
        begin
          Forn := FieldByName('COD_FORN').AsInteger;
          Edi  := FieldByName('EDI_ITEM').AsInteger;
          qrExec.Close;
          qrExec.SQL.Clear;
          qrExec.SQL.Add('UPDATE ITEMSAIDA SET  ');
          qrExec.SQL.Add('  FORN=:FORN          ');
          qrExec.SQL.Add('WHERE                 ');
          qrExec.SQL.Add('  EDICAO=:EDICAO      ');
          qrExec.SQL.Add('AND                   ');
          qrExec.SQL.Add('  CODBARRA=:CODBARRA  ');
          qrExec.ParamByName('FORN'    ).AsInteger := Forn;
          qrExec.ParamByName('EDICAO'  ).AsInteger := Edi;
          qrExec.ParamByName('CODBARRA').AsString  := frmPrincipal.cds.FieldByName('CODBARRA').AsString;
          qrExec.ExecSQL;
          frmPrincipal.ibtransacao.Commit;          
          Next;
        end;
        Close;
        Clear;
      end;
      frmPrincipal.cds.Next;
      lblRec.Caption := InttoStr(frmPrincipal.cds.RecNo+1);
      pb.Position := frmPrincipal.cds.RecNo;
      Application.ProcessMessages;
    end;
  finally
    qrExec.Destroy;
    qrForn.Destroy;
    Exclusao2('Atualização efetuada com sucesso','Atualização dos Fornecedores');
  end;
end;

end.
