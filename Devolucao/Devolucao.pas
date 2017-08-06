unit Devolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadatroMini, TFlatSpeedButtonUnit, ComCtrls,
  ExtCtrls, TFlatPanelUnit, StdCtrls, Mask, ToolEdit, Grids, DBGrids,
  RXDBCtrl, IBCustomDataSet, IBQuery, DB;

type
  TfrmDevolucao = class(TfrmFormCadatroMini)
    Label16: TLabel;
    edtDevolucao: TDateEdit;
    dbgDevolucao: TRxDBGrid;
    dsDevolucao: TDataSource;
    btnBuscar: TFlatSpeedButton;
    btnAnterior: TFlatSpeedButton;
    edtFornecedor: TComboEdit;
    edtDescFornecedor: TLabel;
    Label1: TLabel;
    edtGrupo: TComboEdit;
    edtDescGrupo: TLabel;
    Label2: TLabel;
    qrSaida: TIBQuery;
    qrTemp: TIBQuery;
    procedure btnIncluiClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure edtFornecedorButtonClick(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtFornecedorClick(Sender: TObject);
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoClick(Sender: TObject);
  private
    procedure AtualizaGrid;  { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses Main, Principal, DevolucaoR, DevolucaoR2, Buscar, Consulta;
{$R *.dfm}

procedure TfrmDevolucao.AtualizaGrid;
begin
  with qrNavegacao,qrNavegacao.SQL do
  begin
    Database := Principal.frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT * FROM DEVOLUCAO ORDER BY DESC_FORNECEDOR, DESC_PRODUTO');
    Open;
    ////
    TNumericField(FieldByName('MARGEM'        )).DisplayFormat := '#0.00 %';
    TNumericField(FieldByName('VALORUNITARIO' )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('TOTAL'         )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('VALORENCALHADO')).DisplayFormat := '#0.00';
    TNumericField(FieldByName('VALORVENDIDA'  )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('LUCRO'         )).DisplayFormat := '#0.00';
    TNumericField(FieldByName('VALORAPAGAR'   )).DisplayFormat := '#0.00';
  end;
  dbgDevolucao.Columns.Items[8].Width := 70;
end;

procedure TfrmDevolucao.btnIncluiClick(Sender: TObject);
var
  Vendida : Integer;
  ValorVendida, Margem : Double;
  DataEntrada : TDateTIme;
begin
  if edtDevolucao.Date = 0 then
  begin
    Exclusao2('Digite uma Data de Devolução válida','Aviso');
    edtDevolucao.SetFocus;
    Exit;
  end;
  if btnInclui.Tag = 0 then
  begin
    btnBuscar.Enabled := false;
    with qrNavegacao,qrNavegacao.SQL do
    begin
      Database := Principal.frmPrincipal.dba;
      Close;
      Clear;
      Add('SELECT                                            ');
      Add('  ITEMENTRADA.CODBARRA AS CODBARRA,               ');
      Add('  ITEM.DESCRICAO AS DESC_PRODUTO,                 ');
      Add('  ITEMENTRADA.DEVOLUCAO AS DEVOLUCAO,             ');
      Add('  ITEMENTRADA.SITUACAO AS DEVOLVIDO,              ');
      Add('  FORNECEDOR.FORNECEDOR AS COD_FORN,              ');
      Add('  FORNECEDOR.DESCRICAO AS DESC_FORNECEDOR,        ');
      Add('  ITEMENTRADA.EDICAO AS EDICAO,                   ');
      Add('  SUM(ITEMENTRADA.QUANTIDADE) AS QUANTIDADE,      ');
      Add('  ITEMENTRADA.VALORUNI AS VALORUNITARIO,          ');
      Add('  SUM(ITEMENTRADA.TOTAL) AS TOTAL,                ');
      Add('  LOCALIZACAO.DESCRICAO AS RUA                    ');
      Add('FROM                                              ');
      Add('  ITEMENTRADA,                                    ');
      Add('  ENTRADA,                                        ');
      Add('  ITEM,                                           ');
      Add('  FORNECEDOR,                                     ');
      Add('  LOCALIZACAO                                     ');
      Add('WHERE                                             ');
      Add('  ITEMENTRADA.ITEMENTRADA = ENTRADA.ENTRADA       ');
      Add('AND                                               ');
      Add('  ENTRADA.FORNECEDOR = FORNECEDOR.FORNECEDOR      ');
      Add('AND                                               ');
      Add('  LOCALIZACAO.LOCALIZACAO = ITEMENTRADA.RUA       ');
      Add('AND                                               ');
      Add('  ITEM.CODBARRA= ITEMENTRADA.CODBARRA             ');
      Add('AND                                               ');
      Add('  ITEMENTRADA.SITUACAO = ''NÃO''                  ');
      Add('AND                                               ');
      Add('  ITEMENTRADA.DEVOLUCAO =:DATADEVOLUCAO           ');
      if Strtointdef(edtFornecedor.Text,0) <> 0 then
      begin
        Add('AND                                             ');
        Add('  ENTRADA.FORNECEDOR =:FORNECEDOR               ');
        ParamByName('FORNECEDOR').AsInteger := Strtointdef(edtFornecedor.Text,0);
      end;
      if Strtointdef(edtGrupo.Text,0) <> 0 then
      begin
        Add('AND                                             ');
        Add('  ITEM.GRUPO =:GRUPO                            ');
        ParamByName('GRUPO').AsInteger := Strtointdef(edtGrupo.Text,0);
      end;
      ParamByName('DATADEVOLUCAO').AsDateTime := (edtDevolucao.Date);
      Add('GROUP BY                      ');
      Add('  ITEMENTRADA.CODBARRA,       ');
      Add('  ITEM.DESCRICAO,             ');
      Add('  ITEMENTRADA.DEVOLUCAO,      ');
      Add('  ITEMENTRADA.SITUACAO,       ');
      Add('  FORNECEDOR.FORNECEDOR,      ');
      Add('  FORNECEDOR.DESCRICAO,       ');
      Add('  ITEMENTRADA.EDICAO,         ');
      Add('  ITEMENTRADA.VALORUNI,       ');
      Add('  LOCALIZACAO.DESCRICAO       ');
      Add('ORDER BY                      ');
      Add('  ITEM.DESCRICAO, FORNECEDOR.DESCRICAO            ');
      Open;
      First;
    end;
    while not qrNavegacao.Eof do
    begin
      with qrSaida,qrSaida.SQL do
      begin
        Database := frmPrincipal.dba;
        Close;
        Clear;
        Add('SELECT                                ');
        Add('  ITEMSAIDA.QUANTIDADE AS VENDIDA,    ');
        Add('  ITEMSAIDA.TOTAL AS VALORVENDIDA     ');
        Add('FROM                                  ');
        Add('  ITEMSAIDA,                          ');
        Add('  SAIDA                               ');
        Add('WHERE                                 ');
        Add('  ITEMSAIDA.EDICAO=:EDICAO            ');
        Add('AND                                   ');
        Add('  ITEMSAIDA.CODBARRA=:CODBARRA        ');
        Add('AND                                   ');
        Add('  ITEMSAIDA.FORN=:FORNECEDOR          ');
        Add('AND                                   ');
        Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA     ');
        Add('AND                                   ');
        Add('  SAIDA.DATA >= :DATAENTRADA          ');
        ParamByName('DATAENTRADA').AsDateTime  := (PrimeiraentradaProduto(qrNavegacao.FieldByName('CODBARRA').AsString,qrNavegacao.FieldByName('EDICAO').AsInteger,qrNavegacao.FieldByName('DEVOLUCAO').AsDatetime));
        ParamByName('EDICAO'     ).AsInteger := qrNavegacao.FieldByName('EDICAO'  ).AsInteger;
        ParamByName('FORNECEDOR' ).AsInteger := qrNavegacao.FieldByName('COD_FORN').AsInteger;
        ParamByName('CODBARRA'   ).AsString  := qrNavegacao.FieldByName('CODBARRA').AsString;
        Open;
        First;
      end;

      Vendida := 0;
      valorvendida := 0;
      while not qrSaida.Eof do
      begin
        Vendida := Vendida +  qrSaida.FieldByName('VENDIDA').asInteger;
        ValorVendida := ValorVendida + qrSaida.FieldByName('VALORVENDIDA').asFloat;
        qrSaida.Next;
      end;
      with qrCadastro,qrCadastro.SQL do
      begin
        Close;
        Clear;
        Add('INSERT INTO DEVOLUCAO (    ');
        Add('  CODBARRA,                ');
        Add('  DESC_PRODUTO,            ');
        Add('  DEVOLUCAO,               ');
        Add('  DEVOLVIDO,               ');
        Add('  ENTRADA,                 ');
        Add('  DESC_FORNECEDOR,         ');
        Add('  RUA,                     ');
        Add('  EDICAO,                  ');
        Add('  QUANTIDADE,              ');
        Add('  MARGEM,                  ');
        Add('  QTDEENCALHADO,           ');
        Add('  VENDIDA,                 ');
        Add('  VALORUNITARIO,           ');
        Add('  TOTAL,                   ');
        Add('  VALORENCALHADO,          ');
        Add('  VALORVENDIDA,            ');
        Add('  LUCRO,                   ');
        Add('  VALORAPAGAR              ');
        Add('  ) VALUES (               ');
        Add('  :CODBARRA,               ');
        Add('  :DESC_PRODUTO,           ');
        Add('  :DEVOLUCAO,              ');
        Add('  :DEVOLVIDO,              ');
        Add('  :ENTRADA,                ');
        Add('  :DESC_FORNECEDOR,        ');
        Add('  :RUA,                    ');
        Add('  :EDICAO,                 ');
        Add('  :QUANTIDADE,             ');
        Add('  :MARGEM,                 ');
        Add('  :QTDEENCALHADO,          ');
        Add('  :VENDIDA,                ');
        Add('  :VALORUNITARIO,          ');
        Add('  :TOTAL,                  ');
        Add('  :VALORENCALHADO,         ');
        Add('  :VALORVENDIDA,           ');
        Add('  :LUCRO,                  ');
        Add('  :VALORAPAGAR  )          ');
        Margem := PrimeiraMargem(qrNavegacao.FieldByName('CODBARRA').AsString,qrNavegacao.FieldByName('EDICAO').AsInteger,qrNavegacao.FieldByName('DEVOLUCAO').AsDateTime);
        DataEntrada := PrimeiraentradaProduto(qrNavegacao.FieldByName('CODBARRA').AsString,qrNavegacao.FieldByName('EDICAO').AsInteger,qrNavegacao.FieldByName('DEVOLUCAO').AsDateTime);
        ParamByName('CODBARRA'       ).AsString  := qrNavegacao.FieldByName('CODBARRA').AsString;
        ParamByName('DESC_PRODUTO'   ).AsString  := qrNavegacao.FieldByName('DESC_PRODUTO').AsString;
        ParamByName('DEVOLUCAO'      ).AsDateTime := (qrNavegacao.FieldByName('DEVOLUCAO').AsDateTime);
        ParamByName('DEVOLVIDO'      ).AsString  := qrNavegacao.FieldByName('DEVOLVIDO').AsString;
        ParamByName('ENTRADA'        ).AsDateTime  := (DataEntrada);
        ParamByName('DESC_FORNECEDOR').AsString  := qrNavegacao.FieldByName('DESC_FORNECEDOR').AsString;
        ParamByName('RUA'            ).AsString  := qrNavegacao.FieldByName('RUA').AsString;
        ParamByName('EDICAO'         ).AsInteger := qrNavegacao.FieldByName('EDICAO').AsInteger;
        ParamByName('QUANTIDADE'     ).AsInteger := qrNavegacao.FieldByName('QUANTIDADE').AsInteger;
        ParamByName('MARGEM'         ).AsFloat   := Margem;//qrNavegacao.FieldByName('MARGEM').AsFloat;
        ParamByName('QTDEENCALHADO'  ).AsInteger := qrNavegacao.FieldByName('QUANTIDADE').AsInteger - Vendida;
        ParamByName('VENDIDA'        ).AsInteger := Vendida;
        ParamByName('VALORUNITARIO'  ).AsFloat   := qrNavegacao.FieldByName('VALORUNITARIO').AsFloat;
        ParamByName('TOTAL'          ).AsFloat   := qrNavegacao.FieldByName('TOTAL').AsFloat;
        ParamByName('VALORENCALHADO' ).AsFloat   := qrNavegacao.FieldByName('TOTAL').AsFloat - ValorVendida;
        ParamByName('VALORVENDIDA'   ).AsFloat   := ValorVendida;
        ParamByName('LUCRO'          ).AsFloat   := (ValorVendida * Margem)/100;
        ParamByName('VALORAPAGAR'    ).AsFloat   := ValorVendida - ((ValorVendida * Margem)/100);
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
        qrNavegacao.Next;
      end;
    end;
    btnAltera.Enabled := true;
    btnExclui.Enabled := true;
    AtualizaGrid;
    btnInclui.Tag := 1;
    btnInclui.Caption := '&Cancelar Devolução';
  end
  else if btnInclui.Tag = 1 then
  begin
    btnInclui.Tag := 0;
    with qrCadastro,qrCadastro.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM DEVOLUCAO     ');
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
    AtualizaGrid;
    btnInclui.Caption := '&Gerar Devolução';
    btnBuscar.Enabled := true;
    btnAltera.Enabled := False;
    btnExclui.Enabled := False;
  end;
end;

procedure TfrmDevolucao.btnExcluiClick(Sender: TObject);
var
  Id : Integer;
begin
  if Exclusao('Deseja realmente atualizar o estoque?','Aviso de Devolução') then
  begin
    btnExclui.Enabled := false;
    btnAltera.Enabled := false;
    with qrCadastro,qrCadastro.SQL do
    begin
      Close;
      Clear;
      qrNavegacao.First;
      ID := StrtoINtDef(SequencialUser('G_DEVOLUCAO'),0);
      while not qrNavegacao.Eof do
      begin
//        AtualizaEstoque((qrNavegacao.FieldByName('QTDEENCALHADO').AsInteger*-1), qrNavegacao.FieldByName('CODBARRA').AsString,qrNavegacao.FieldByName('EDICAO').AsInteger);
        qrTemp.Database := frmPrincipal.dba;
        qrTemp.SQL.Clear;
        qrTEmp.Close;
        qrTemp.SQL.Add('INSERT INTO DEV (          ');
        qrTemp.SQL.Add('  ID,                      ');
        qrTemp.SQL.Add('  CODBARRA,                ');
        qrTemp.SQL.Add('  DESC_PRODUTO,            ');
        qrTemp.SQL.Add('  DEVOLUCAO,               ');
        qrTemp.SQL.Add('  DEVOLVIDO,               ');
        qrTemp.SQL.Add('  ENTRADA,                 ');
        qrTemp.SQL.Add('  DESC_FORNECEDOR,         ');
        qrTemp.SQL.Add('  RUA,                     ');
        qrTemp.SQL.Add('  EDICAO,                  ');
        qrTemp.SQL.Add('  QUANTIDADE,              ');
        qrTemp.SQL.Add('  MARGEM,                  ');
        qrTemp.SQL.Add('  QTDEENCALHADO,           ');
        qrTemp.SQL.Add('  VENDIDA,                 ');
        qrTemp.SQL.Add('  VALORUNITARIO,           ');
        qrTemp.SQL.Add('  TOTAL,                   ');
        qrTemp.SQL.Add('  VALORENCALHADO,          ');
        qrTemp.SQL.Add('  VALORVENDIDA,            ');
        qrTemp.SQL.Add('  LUCRO,                   ');
        qrTemp.SQL.Add('  VALORAPAGAR              ');
        qrTemp.SQL.Add('  ) VALUES (               ');
        qrTemp.SQL.Add('  :ID,                     ');
        qrTemp.SQL.Add('  :CODBARRA,               ');
        qrTemp.SQL.Add('  :DESC_PRODUTO,           ');
        qrTemp.SQL.Add('  :DEVOLUCAO,              ');
        qrTemp.SQL.Add('  :DEVOLVIDO,              ');
        qrTemp.SQL.Add('  :ENTRADA,                ');
        qrTemp.SQL.Add('  :DESC_FORNECEDOR,        ');
        qrTemp.SQL.Add('  :RUA,                    ');
        qrTemp.SQL.Add('  :EDICAO,                 ');
        qrTemp.SQL.Add('  :QUANTIDADE,             ');
        qrTemp.SQL.Add('  :MARGEM,                 ');
        qrTemp.SQL.Add('  :QTDEENCALHADO,          ');
        qrTemp.SQL.Add('  :VENDIDA,                ');
        qrTemp.SQL.Add('  :VALORUNITARIO,          ');
        qrTemp.SQL.Add('  :TOTAL,                  ');
        qrTemp.SQL.Add('  :VALORENCALHADO,         ');
        qrTemp.SQL.Add('  :VALORVENDIDA,           ');
        qrTemp.SQL.Add('  :LUCRO,                  ');
        qrTemp.SQL.Add('  :VALORAPAGAR  )          ');
        qrTemp.ParamByName('ID'             ).AsInteger := ID;
        qrTemp.ParamByName('CODBARRA'       ).AsString  := qrNavegacao.FieldByName('CODBARRA').AsString;
        qrTemp.ParamByName('DESC_PRODUTO'   ).AsString  := qrNavegacao.FieldByName('DESC_PRODUTO').AsString;
        qrTemp.ParamByName('DEVOLUCAO'      ).AsDateTime  := (qrNavegacao.FieldByName('DEVOLUCAO').AsDateTime);
        qrTemp.ParamByName('DEVOLVIDO'      ).AsString  := qrNavegacao.FieldByName('DEVOLVIDO').AsString;
        qrTemp.ParamByName('ENTRADA'        ).AsDateTime  := (qrNavegacao.FieldByName('ENTRADA').AsDateTIme);
        qrTemp.ParamByName('DESC_FORNECEDOR').AsString  := qrNavegacao.FieldByName('DESC_FORNECEDOR').AsString;
        qrTemp.ParamByName('RUA'            ).AsString  := qrNavegacao.FieldByName('RUA').AsString;
        qrTemp.ParamByName('EDICAO'         ).AsInteger := qrNavegacao.FieldByName('EDICAO').AsInteger;
        qrTemp.ParamByName('QUANTIDADE'     ).AsInteger := qrNavegacao.FieldByName('QUANTIDADE').AsInteger;
        qrTemp.ParamByName('MARGEM'         ).AsFloat   := qrNavegacao.FieldByName('MARGEM').AsFloat;
        qrTemp.ParamByName('QTDEENCALHADO'  ).AsInteger := qrNavegacao.FieldByName('QTDEENCALHADO').AsInteger;
        qrTemp.ParamByName('VENDIDA'        ).AsInteger := qrNavegacao.FieldByName('VENDIDA').AsInteger;
        qrTemp.ParamByName('VALORUNITARIO'  ).AsFloat   := qrNavegacao.FieldByName('VALORUNITARIO').AsFloat;
        qrTemp.ParamByName('TOTAL'          ).AsFloat   := qrNavegacao.FieldByName('TOTAL').AsFloat;
        qrTemp.ParamByName('VALORENCALHADO' ).AsFloat   := qrNavegacao.FieldByName('VALORENCALHADO').AsFloat;
        qrTemp.ParamByName('VALORVENDIDA'   ).AsFloat   := qrNavegacao.FieldByName('VALORVENDIDA').AsFloat;
        qrTemp.ParamByName('LUCRO'          ).AsFloat   := qrNavegacao.FieldByName('LUCRO').AsFloat;
        qrTemp.ParamByName('VALORAPAGAR'    ).AsFloat   := qrNavegacao.FieldByName('VALORAPAGAR').AsFloat;
        qrTemp.ExecSQL;
        frmPrincipal.ibtransacao.Commit;
        Close;
        Clear;
        Add('UPDATE ITEMENTRADA SET ');
        Add('  DEVOLVIDO=:DEVOLVIDO ');
        Add('WHERE                  ');
        Add('  DEVOLUCAO=:DEVOLUCAO ');
        Add('AND                    ');
        Add('  CODBARRA=:CODBARRA   ');
        ParamByName('DEVOLVIDO').AsInteger := qrNavegacao.FieldByName('QTDEENCALHADO').AsInteger;
        ParamByName('DEVOLUCAO').AsDateTime := (qrNavegacao.FieldByName('DEVOLUCAO').AsDateTime);
        ParamByName('CODBARRA').AsString := qrNavegacao.FieldByName('CODBARRA').AsString;
        ExecSQL;
        frmPrincipal.ibtransacao.Commit;
        Application.ProcessMessages;
        sbStatus.Panels[0].Text := 'Atualizando estoque e criando Histórico de Devoluções';
        qrNavegacao.Next;
      end;
      sbStatus.Panels[0].Text := '';
      Close;
      Clear;
      Add('UPDATE ITEMENTRADA SET      ');
      Add('  SITUACAO=''SIM''          ');
      Add('WHERE                       ');
      Add('  SITUACAO=''NÃO''          ');
      Add('AND                         ');
      Add('  DEVOLUCAO=:DATADEVOLUCAO  ');
      Params.ParamByName('DATADEVOLUCAO').AsDateTime := (edtDevolucao.Date);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      Close;
      Clear;
      Add('UPDATE DEVOLUCAO SET        ');
      Add('  DEVOLVIDO=''SIM''         ');
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
    AtualizaGrid;
    exclusao2('Operação realizada com Sucesso.','Devolução Atualizada');
  end;
end;

procedure TfrmDevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SalvaGrid(dbgDevolucao);
  with qrNavegacao,qrNavegacao.SQL do
  begin
    Close;
    Clear;
    Add('DELETE FROM DEVOLUCAO');
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;    
  end;
  loDevolucao := nil;
  Action := caFree;
end;

procedure TfrmDevolucao.btnAlteraClick(Sender: TObject);
begin
  btnaltera.Enabled := false;
  with TfrmDevolucaoR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  btnaltera.Enabled := True;
end;

procedure TfrmDevolucao.btnBuscarClick(Sender: TObject);
begin
  with TfrmBusca.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmDevolucao.FormShow(Sender: TObject);
begin
  CarregaGrid(dbgDevolucao);
end;

procedure TfrmDevolucao.btnAnteriorClick(Sender: TObject);
begin
  if edtDevolucao.Date = 0 then
  begin
    Exclusao2('Digite uma data de devolução válida','Relatório de Devoluções');
    Exit;
  end;

  btnAnterior.Enabled := false;
  with TfrmDevolucaoR2.Create(Application) do
  begin
    Data1 := edtDevolucao.Date;
    PreviewModal;
    Free;
  end;
  btnAnterior.Enabled := True;
end;

procedure TfrmDevolucao.edtFornecedorButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+56+22, Left+10, 'FORN');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmDevolucao.edtFornecedorChange(Sender: TObject);
begin
  if Trim(edtFornecedor.Text) <> '' then
    edtDescFornecedor.Caption := LerDescricaoPorCampo('FORNECEDOR',strtointDef(edtFornecedor.text,0))
  else
    edtDescFornecedor.Caption := '';
end;

procedure TfrmDevolucao.edtFornecedorClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TfrmDevolucao.edtGrupoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+56+22,Left+336,'GRUP');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := s;
end;

procedure TfrmDevolucao.edtGrupoChange(Sender: TObject);
begin
  if Trim(edtGrupo.Text) <> '' then
    edtDescGrupo.Caption := LerDescricaoPorCampo('GRUPO',strtointDef(edtGrupo.text,0))
  else
    edtDescGrupo.Caption := '';
end;

procedure TfrmDevolucao.edtGrupoClick(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

end.
