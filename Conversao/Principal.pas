unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ASGSQLite, DB, DBTables, Mask, ToolEdit, ExtCtrls,
  DBClient, Provider;

type
  TfrmPrincipal = class(TForm)
    qr1: TQuery;
    Db2: TASQLiteDB;
    qr2: TASQLiteQuery;
    Button1: TButton;
    qr3: TASQLiteQuery;
    data: TDateEdit;
    r1: TRadioButton;
    r2: TRadioButton;
    r3: TRadioButton;
    r4: TRadioButton;
    l1: TLabel;
    Label1: TLabel;
    l2: TLabel;
    Panel1: TPanel;
    c1: TComboBox;
    e1: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    qrCon: TQuery;
    DataSetProvider1: TDataSetProvider;
    cdsCon: TClientDataSet;
    qrQuery: TQuery;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lsa: TLabel;
    lsd: TLabel;
    lea: TLabel;
    led: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    function Codifica(Senha : String; Tam : word):String;
    Function BpS(b:Boolean):String;
    Function SpH(h:String):TDateTime;
    Function SpD(d:String):TDateTime;
    Procedure Limpar;
    Procedure Acesso;
    Procedure Caixa;
    Procedure Cliente;
    Procedure Codigos;
    Procedure Credor;
    Procedure Despesas;
    Procedure Entrada;
    Procedure Estoque;
    Procedure Fiado;
    Procedure FiadoParcela;
    Procedure FormaPagamento;
    Procedure Fornecedor;
    Procedure Funcionario;
    Procedure Grupo;
    Procedure GrupoUsuario;
    Procedure Item;
    Procedure ItemEntrada;
    Procedure ItemSaida;
    Procedure Lancamento;
    Procedure Localizacao;
    Procedure Movimento;
    Procedure Retirada;
    Procedure Saida;
    Procedure Usuario;
    Procedure PegarLogin;
    procedure CalculaFiados;
    procedure AjustarItemEntrada;
    procedure AjustarItemSaida;
  public
    procedure CalcularCreditoDoCliente(Cliente:integer);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.BpS(b: Boolean): String;
begin
  if b then
    Result := 'S'
  else
    Result := 'N';
end;

function TfrmPrincipal.SpD(d: String): TDateTime;
var
  S : String;
begin
  if r2.Checked then
    S := copy(d,9,2)+'/'+copy(d,6,2)+'/'+copy(d,1,4)
  else if r1.Checked then
  begin
    if StrToIntDef(copy(d,7,2), 0) < 10 then
      S := copy(d,1,2)+'/'+copy(d,4,2)+'/20'+copy(d,7,2)
    else
      S := copy(d,1,2)+'/'+copy(d,4,2)+'/19'+copy(d,7,2);
  end
  else if r3.Checked then
  begin
    if StrToIntDef(copy(d,1,2), 0) < 10 then
      S := copy(d,7,2)+'/'+copy(d,4,2)+'/20'+copy(d,1,2)
    else
      S := copy(d,7,2)+'/'+copy(d,4,2)+'/19'+copy(d,1,2)
  end
  else if r4.Checked then
  begin
    if StrToIntDef(copy(d,7,4), 0) < 10 then
      S := copy(d,4,2)+'/'+copy(d,1,2)+'/20'+copy(d,7,4)
    else
      S := copy(d,4,2)+'/'+copy(d,1,2)+'/19'+copy(d,7,4);
  end;
  Result := StrToDateDef(S ,Data.Date);
end;

function TfrmPrincipal.SpH(h: String): TDateTime;
begin
  Result := StrtoTimeDef(h,data.Date);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  db2.DefaultDir := Copy(Application.ExeName,1,Length(Application.ExeName)-14);
  db2.DriverDLL := 'sqlite.dll';
  Db2.Database := 'DB.sdb';
  db2.Open;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  l1.Caption := 'Lipando...';
  Limpar;
  l1.Caption := 'Tabela: Acesso';
  Acesso;
  l1.Caption := 'Tabela: Caixa';
  Caixa;
  l1.Caption := 'Tabela: Clientes';
  Cliente;
  l1.Caption := 'Tabela: Codigos';
  Codigos;
  l1.Caption := 'Tabela: Credores';
  Credor;
  l1.Caption := 'Tabela: Despesas';
  Despesas;
  l1.Caption := 'Tabela: Entrada';
  Entrada;
  l1.Caption := 'Tabela: Estoque';
  Estoque;
  l1.Caption := 'Tabela: Fiado';
  Fiado;
  l1.Caption := 'Tabela: Pacelas do Fiado';
  FiadoParcela;
  l1.Caption := 'Tabela: Formas de Pagamento';
  FormaPagamento;
  l1.Caption := 'Tabela: Fornecedores';
  Fornecedor;
  l1.Caption := 'Tabela: Funcionarios';
  Funcionario;
  l1.Caption := 'Tabela: Grupo';
  Grupo;
  l1.Caption := 'Tabela: Grupo de Usuário';
  GrupoUsuario;
  l1.Caption := 'Tabela: Mercadorias';
  Item;
  l1.Caption := 'Tabela: Itens da Entrada';
  ItemEntrada;
  l1.Caption := 'Tabela: Itens da Saída';
  ItemSaida;
  l1.Caption := 'Tabela: Lançamentos';
  Lancamento;
  l1.Caption := 'Tabela: Ruas';
  Localizacao;
  l1.Caption := 'Tabela: Movimento do Caixa';
  Movimento;
  l1.Caption := 'Tabela: Retiradas';
  Retirada;
  l1.Caption := 'Tabela: Saídas';
  Saida;
  l1.Caption := 'Tabela: Usuários';
  Usuario;
  l1.Caption := 'Calculando Saldo do Fiado';
  CalculaFiados;
  ShowMessage('Conversão Finalizada com Sucesso!');
  PegarLogin;
end;

procedure TfrmPrincipal.Acesso;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ACESSO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ACESSO ( ');
      Add('  USUARIO,           ');
      Add('  CADASTRO,          ');
      Add('  CLIENTE,           ');
      Add('  CREDOR,            ');
      Add('  GRUPO,             ');
      Add('  FORMAPAGAMENTO,    ');
      Add('  FORNECEDORES,      ');
      Add('  FUNCIONARIOS,      ');
      Add('  MERCADORIAS,       ');
      Add('  RUA,               ');
      Add('  MOVIMENTACAO,      ');
      Add('  CAIXA,             ');
      Add('  LANCAMENTOS,       ');
      Add('  RETIRADAS,         ');
      Add('  SAIDAS,            ');
      Add('  ENTRADAS,          ');
      Add('  DESPESAS,          ');
      Add('  DEVOLUCAO,         ');
      Add('  FIADO,             ');
      Add('  RELATORIO          ');
      Add('  ) VALUES (         ');
      Add('  :USUARIO,          ');
      Add('  :CADASTRO,         ');
      Add('  :CLIENTE,          ');
      Add('  :CREDOR,           ');
      Add('  :GRUPO,            ');
      Add('  :FORMAPAGAMENTO,   ');
      Add('  :FORNECEDORES,     ');
      Add('  :FUNCIONARIOS,     ');
      Add('  :MERCADORIAS,      ');
      Add('  :RUA,              ');
      Add('  :MOVIMENTACAO,     ');
      Add('  :CAIXA,            ');
      Add('  :LANCAMENTOS,      ');
      Add('  :RETIRADAS,        ');
      Add('  :SAIDAS,           ');
      Add('  :ENTRADAS,         ');
      Add('  :DESPESAS,         ');
      Add('  :DEVOLUCAO,        ');
      Add('  :FIADO,            ');
      Add('  :RELATORIO         ');
      Add('  )                  ');
      ParamByName('USUARIO'       ).AsInteger := qr2.FieldByName('USUARIO'       ).AsInteger;
      ParamByName('CADASTRO'      ).AsString  := BpS(qr2.FieldByName('CADASTRO'      ).AsBoolean);
      ParamByName('CLIENTE'       ).AsString  := BpS(qr2.FieldByName('CLIENTE'       ).AsBoolean);
      ParamByName('CREDOR'        ).AsString  := BpS(qr2.FieldByName('CREDOR'        ).AsBoolean);
      ParamByName('GRUPO'         ).AsString  := BpS(qr2.FieldByName('GRUPO'         ).AsBoolean);
      ParamByName('FORMAPAGAMENTO').AsString  := BpS(qr2.FieldByName('FORMAPAGAMENTO').AsBoolean);
      ParamByName('FORNECEDORES'  ).AsString  := BpS(qr2.FieldByName('FORNECEDORES'  ).AsBoolean);
      ParamByName('FUNCIONARIOS'  ).AsString  := BpS(qr2.FieldByName('FUNCIONARIOS'  ).AsBoolean);
      ParamByName('MERCADORIAS'   ).AsString  := BpS(qr2.FieldByName('MERCADORIAS'   ).AsBoolean);
      ParamByName('RUA'           ).AsString  := BpS(qr2.FieldByName('RUA'           ).AsBoolean);
      ParamByName('MOVIMENTACAO'  ).AsString  := BpS(qr2.FieldByName('MOVIMENTACAO'  ).AsBoolean);
      ParamByName('CAIXA'         ).AsString  := BpS(qr2.FieldByName('CAIXA'         ).AsBoolean);
      ParamByName('LANCAMENTOS'   ).AsString  := BpS(qr2.FieldByName('LANCAMENTOS'   ).AsBoolean);
      ParamByName('RETIRADAS'     ).AsString  := BpS(qr2.FieldByName('RETIRADAS'     ).AsBoolean);
      ParamByName('SAIDAS'        ).AsString  := BpS(qr2.FieldByName('SAIDAS'        ).AsBoolean);
      ParamByName('ENTRADAS'      ).AsString  := BpS(qr2.FieldByName('ENTRADAS'      ).AsBoolean);
      ParamByName('DESPESAS'      ).AsString  := BpS(qr2.FieldByName('DESPESAS'      ).AsBoolean);
      ParamByName('DEVOLUCAO'     ).AsString  := BpS(qr2.FieldByName('DEVOLUCAO'     ).AsBoolean);
      ParamByName('FIADO'         ).AsString  := BpS(qr2.FieldByName('FIADO'         ).AsBoolean);
      ParamByName('RELATORIO'     ).AsString  := BpS(qr2.FieldByName('RELATORIO'     ).AsBoolean);
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption, 0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Caixa;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CAIXA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO CAIXA  ( ');
      Add('  CAIXA,             ');
      Add('  DATAABERTURA,      ');
      Add('  HORAABERTURA,      ');
      Add('  DATAFECHAMENTO,    ');
      Add('  HORAFECHAMENTO,    ');
      Add('  CAIXAABERTURA,     ');
      Add('  CAIXAFECHAMENTO,   ');
      Add('  HISTORICO          ');
      Add('  ) VALUES (         ');
      Add('  :CAIXA,            ');
      Add('  :DATAABERTURA,     ');
      Add('  :HORAABERTURA,     ');
      Add('  :DATAFECHAMENTO,   ');
      Add('  :HORAFECHAMENTO,   ');
      Add('  :CAIXAABERTURA,    ');
      Add('  :CAIXAFECHAMENTO,  ');
      Add('  :HISTORICO         ');
      Add('  )                  ');
      ParamByName('CAIXA'          ).AsInteger := qr2.FieldByName('CAIXA'          ).AsInteger;
      ParamByName('DATAABERTURA'   ).AsDateTime:= SpD(qr2.FieldByName('DATAABERTURA'   ).AsString);
      ParamByName('HORAABERTURA'   ).AsDateTime:= SpH(qr2.FieldByName('HORAABERTURA'   ).AsString);
      ParamByName('DATAFECHAMENTO' ).AsDateTime:= SpD(qr2.FieldByName('DATAFECHAMENTO' ).AsString);
      ParamByName('HORAFECHAMENTO' ).AsDateTime:= SpH(qr2.FieldByName('HORAFECHAMENTO' ).AsString);
      ParamByName('CAIXAABERTURA'  ).AsFloat   := qr2.FieldByName('CAIXAABERTURA'  ).AsFloat;
      ParamByName('CAIXAFECHAMENTO').asFloat   := qr2.FieldByName('CAIXAFECHAMENTO').AsFloat;
      ParamByName('HISTORICO'      ).AsString  := qr2.FieldByName('HISTORICO'      ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Codigos;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CODIGOS');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO CODIGOS (');
      Add('  CLIENTE,           ');
      Add('  FORMAPAGAMENTO,    ');
      Add('  FORNECEDOR,        ');
      Add('  FUNCIONARIO,       ');
      Add('  GRUPO,             ');
      Add('  ITEM,              ');
      Add('  SAIDA,             ');
      Add('  ENTRADA,           ');
      Add('  CAIXA,             ');
      Add('  LANCAMENTO,        ');
      Add('  RETIRADAS,         ');
      Add('  USUARIO,           ');
      Add('  GRUPOUSUARIO,      ');
      Add('  DESPESAS,          ');
      Add('  CREDOR,            ');
      Add('  LOCALIZACAO,       ');
      Add('  FIADO              ');
      Add('  ) VALUES (         ');
      Add('  :CLIENTE,          ');
      Add('  :FORMAPAGAMENTO,   ');
      Add('  :FORNECEDOR,       ');
      Add('  :FUNCIONARIO,      ');
      Add('  :GRUPO,            ');
      Add('  :ITEM,             ');
      Add('  :SAIDA,            ');
      Add('  :ENTRADA,          ');
      Add('  :CAIXA,            ');
      Add('  :LANCAMENTO,       ');
      Add('  :RETIRADAS,        ');
      Add('  :USUARIO,          ');
      Add('  :GRUPOUSUARIO,     ');
      Add('  :DESPESAS,         ');
      Add('  :CREDOR,           ');
      Add('  :LOCALIZACAO,      ');
      Add('  :FIADO             ');
      Add('  )                  ');
      ParamByName('CLIENTE'       ).AsInteger := qr2.FieldByName('CLIENTE'       ).AsInteger;
      ParamByName('FORMAPAGAMENTO').AsInteger := qr2.FieldByName('FORMAPAGAMENTO').AsInteger;
      ParamByName('FORNECEDOR'    ).AsInteger := qr2.FieldByName('FORNECEDOR'    ).AsInteger;
      ParamByName('FUNCIONARIO'   ).AsInteger := qr2.FieldByName('FUNCIONARIO'   ).AsInteger;
      ParamByName('GRUPO'         ).AsInteger := qr2.FieldByName('GRUPO'         ).AsInteger;
      ParamByName('ITEM'          ).AsInteger := qr2.FieldByName('ITEM'          ).AsInteger;
      ParamByName('SAIDA'         ).AsInteger := qr2.FieldByName('SAIDA'         ).AsInteger;
      ParamByName('ENTRADA'       ).AsInteger := qr2.FieldByName('ENTRADA'       ).AsInteger;
      ParamByName('CAIXA'         ).AsInteger := qr2.FieldByName('CAIXA'         ).AsInteger;
      ParamByName('LANCAMENTO'    ).AsInteger := qr2.FieldByName('LANCAMENTO'    ).AsInteger;
      ParamByName('RETIRADAS'     ).AsInteger := qr2.FieldByName('RETIRADAS'     ).AsInteger;
      ParamByName('USUARIO'       ).AsInteger := qr2.FieldByName('USUARIO'       ).AsInteger;
      ParamByName('GRUPOUSUARIO'  ).AsInteger := qr2.FieldByName('GRUPOUSUARIO'  ).AsInteger;
      ParamByName('DESPESAS'      ).AsInteger := qr2.FieldByName('DESPESAS'      ).AsInteger;
      ParamByName('CREDOR'        ).AsInteger := qr2.FieldByName('CREDOR'        ).AsInteger;
      ParamByName('LOCALIZACAO'   ).AsInteger := qr2.FieldByName('LOCALIZACAO'   ).AsInteger;
      ParamByName('FIADO'         ).AsInteger := qr2.FieldByName('FIADO'         ).AsInteger;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Credor;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CREDOR');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO CREDOR ( ');
      Add('  CREDOR,            ');
      Add('  DESCRICAO          ');
      Add('  ) VALUES (         ');
      Add('  :CREDOR,           ');
      Add('  :DESCRICAO         ');
      Add('  )                  ');
      ParamByName('CREDOR'   ).AsInteger := qr2.FieldByName('CREDOR'   ).AsInteger;
      ParamByName('DESCRICAO').AsString  := qr2.FieldByName('DESCRICAO').AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Despesas;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM DESPESAS');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO DESPESAS(');
      Add('  DESPESAS,          ');
      Add('  CAIXA,             ');
      Add('  CADASTRO,          ');
      Add('  HORA,              ');
      Add('  VALOR,             ');
      Add('  HISTORICO,         ');
      Add('  CREDOR             ');
      Add('  ) VALUES (         ');
      Add('  :DESPESAS,         ');
      Add('  :CAIXA,            ');
      Add('  :CADASTRO,         ');
      Add('  :HORA,             ');
      Add('  :VALOR,            ');
      Add('  :HISTORICO,        ');
      Add('  :CREDOR            ');
      Add('  )                  ');
      ParamByName('DESPESAS' ).AsInteger := qr2.FieldByName('DESPESAS' ).AsInteger;
      ParamByName('CAIXA'    ).AsInteger := qr2.FieldByName('CAIXA'    ).AsInteger;
      ParamByName('CADASTRO' ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO' ).AsString);
      ParamByName('HORA'     ).AsDateTime:= SpH(qr2.FieldByName('HORA'     ).AsString);
      ParamByName('VALOR'    ).AsFloat   := qr2.FieldByName('VALOR'    ).AsFloat;
      ParamByName('HISTORICO').AsString  := qr2.FieldByName('HISTORICO').AsString;
      ParamByName('CREDOR'   ).asInteger := qr2.FieldByName('CREDOR'   ).AsInteger;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Entrada;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ENTRADA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ENTRADA (');
      Add('  ENTRADA,           ');
      Add('  CAIXA,             ');
      Add('  DATA,              ');
      Add('  HORA,              ');
      Add('  FORNECEDOR,        ');
      Add('  FORMAPAGAMENTO,    ');
      Add('  MARGEM,            ');
      Add('  DESCONTO,          ');
      Add('  QUITACAO,          ');
      Add('  ENVIARDESPESAS     ');
      Add('  ) VALUES (         ');
      Add('  :ENTRADA,          ');
      Add('  :CAIXA,            ');
      Add('  :DATA,             ');
      Add('  :HORA,             ');
      Add('  :FORNECEDOR,       ');
      Add('  :FORMAPAGAMENTO,   ');
      Add('  :MARGEM,           ');
      Add('  :DESCONTO,         ');
      Add('  :QUITACAO,         ');
      Add('  :ENVIARDESPESAS    ');
      Add('  )                  ');
      ParamByName('ENTRADA'       ).AsInteger  := qr2.FieldByName('ENTRADA'       ).AsInteger;
      ParamByName('CAIXA'         ).AsInteger  := qr2.FieldByName('CAIXA'         ).AsInteger;
      ParamByName('DATA'          ).AsDateTime := SpD(qr2.FieldByName('DATA'          ).AsString);
      ParamByName('HORA'          ).AsDateTime := SpH(qr2.FieldByName('HORA'          ).AsString);
      ParamByName('FORNECEDOR'    ).AsInteger  := qr2.FieldByName('FORNECEDOR'    ).AsInteger;
      ParamByName('FORMAPAGAMENTO').AsInteger  := 1;
      ParamByName('MARGEM'        ).asFloat    := qr2.FieldByName('MARGEM'        ).AsFloat;
      ParamByName('DESCONTO'      ).AsFloat    := qr2.FieldByName('DESCONTO'      ).AsFloat;
      ParamByName('QUITACAO'      ).AsFloat    := qr2.FieldByName('QUITACAO'      ).AsFloat;
      ParamByName('ENVIARDESPESAS').AsString   := BpS(qr2.FieldByName('ENVIARDESPESAS').AsBoolean);
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Estoque;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ESTOQUE');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ESTOQUE( ');
      Add('  CODBARRA,          ');
      Add('  EDICAO,            ');
      Add('  ESTOQUE            ');
      Add('  ) VALUES (         ');
      Add('  :CODBARRA,         ');
      Add('  :EDICAO,           ');
      Add('  :ESTOQUE           ');
      Add('  )                  ');
      ParamByName('CODBARRA').AsString := qr2.FieldByName('CODBARRA').AsString;
      ParamByName('EDICAO'  ).AsInteger:= qr2.FieldByName('EDICAO'  ).AsInteger;
      ParamByName('ESTOQUE' ).AsInteger:= qr2.FieldByName('ESTOQUE' ).AsInteger;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Fiado;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FIADO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO FIADO   (');
      Add('  FIADO,             ');
//      Add('  DESCRICAO,         ');
      Add('  DATA,              ');
      Add('  VENCIMENTO,        ');
      Add('  CLIENTE,           ');
      Add('  VALOR,             ');
      Add('  PAGO,              ');
      Add('  SAIDA              ');
      Add('  ) VALUES (         ');
      Add('  :FIADO,            ');
//      Add('  :DESCRICAO,        ');
      Add('  :DATA,             ');
      Add('  :VENCIMENTO,       ');
      Add('  :CLIENTE,          ');
      Add('  :VALOR,            ');
      Add('  :PAGO,             ');
      Add('  :SAIDA             ');
      Add('  )                  ');
      ParamByName('FIADO'     ).AsInteger  := qr2.FieldByName('FIADO'     ).AsInteger;
//      ParamByName('DESCRICAO' ).AsString   := qr2.FieldByName('DESCRICAO' ).AsString;
      ParamByName('DATA'      ).AsDateTime := SpD(qr2.FieldByName('DATA'      ).AsString);
      ParamByName('VENCIMENTO').AsDateTime := SpD(qr2.FieldByName('VENCIMENTO').AsString);
      ParamByName('CLIENTE'   ).AsInteger  := qr2.FieldByName('CLIENTE'   ).AsInteger;
      ParamByName('VALOR'     ).AsFloat    := qr2.FieldByName('VALOR'     ).AsFloat;
      ParamByName('PAGO'      ).AsString   := qr2.FieldByName('PAGO'      ).AsString;
      ParamByName('SAIDA'     ).AsInteger  := StrToIntDef(Copy(qr2.FieldByName('DESCRICAO').AsString, Pos(':',qr2.FieldByName('DESCRICAO').AsString) + 2,6),0);
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Cliente;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CLIENTE');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      qr3.Close;
      qr3.SQL.Clear;
      qr3.SQL.Add('SELECT * FROM FIADOCLIENTE');
      qr3.SQL.Add('WHERE CLIENTE=:CLIENTE    ');
      qr3.Params.ParamByName('CLIENTE').AsInteger := qr2.FieldByName('CLIENTE').AsInteger;
      qr3.Open;
      Clear;
      Add('INSERT INTO CLIENTE( ');
      Add('  CLIENTE,           ');
      Add('  CADASTRO,          ');
      Add('  DESCRICAO,         ');
      Add('  ENDERECO,          ');
      Add('  BAIRRO,            ');
      Add('  CIDADE,            ');
      Add('  CEP,               ');
      Add('  NASCIMENTO,        ');
      Add('  ESTADOCIVIL,       ');
      Add('  OCUPACAO,          ');
      Add('  DDDRESIDENCIAL,    ');
      Add('  DDDCOMERCIAL,      ');
      Add('  DDDCELULAR,        ');
      Add('  RESIDENCIAL,       ');
      Add('  COMERCIAL,         ');
      Add('  CELULAR,           ');
      Add('  EMAIL,             ');
      Add('  URL,               ');
      Add('  OBS,               ');
      Add('  LIMITE,            ');
      Add('  CREDITO,           ');
      Add('  USARFIADO          ');
      Add('  ) VALUES (         ');
      Add('  :CLIENTE,          ');
      Add('  :CADASTRO,         ');
      Add('  :DESCRICAO,        ');
      Add('  :ENDERECO,         ');
      Add('  :BAIRRO,           ');
      Add('  :CIDADE,           ');
      Add('  :CEP,              ');
      Add('  :NASCIMENTO,       ');
      Add('  :ESTADOCIVIL,      ');
      Add('  :OCUPACAO,         ');
      Add('  :DDDRESIDENCIAL,   ');
      Add('  :DDDCOMERCIAL,     ');
      Add('  :DDDCELULAR,       ');
      Add('  :RESIDENCIAL,      ');
      Add('  :COMERCIAL,        ');
      Add('  :CELULAR,          ');
      Add('  :EMAIL,            ');
      Add('  :URL,              ');
      Add('  :OBS,              ');
      Add('  :LIMITE,           ');
      Add('  :CREDITO,          ');
      Add('  :USARFIADO         ');
      Add('  )                  ');
      ParamByName('CLIENTE'       ).AsInteger := qr2.FieldByName('CLIENTE'       ).AsInteger;
      ParamByName('CADASTRO'      ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO'      ).AsString);
      ParamByName('DESCRICAO'     ).AsString  := qr2.FieldByName('DESCRICAO'     ).AsString;
      ParamByName('ENDERECO'      ).AsString  := qr2.FieldByName('ENDERECO'      ).AsString;
      ParamByName('BAIRRO'        ).AsString  := qr2.FieldByName('BAIRRO'        ).AsString;
      ParamByName('CIDADE'        ).AsString  := qr2.FieldByName('CIDADE'        ).AsString;
      ParamByName('CEP'           ).AsString  := qr2.FieldByName('CEP'           ).AsString;
      ParamByName('NASCIMENTO'    ).AsDateTime:= SpD(qr2.FieldByName('NASCIMENTO'    ).AsString);
      ParamByName('ESTADOCIVIL'   ).AsString  := qr2.FieldByName('ESTADOCIVIL'   ).AsString;
      ParamByName('OCUPACAO'      ).AsString  := qr2.FieldByName('OCUPACAO'      ).AsString;
      ParamByName('DDDRESIDENCIAL').AsString  := qr2.FieldByName('DDDRESIDENCIAL').AsString;
      ParamByName('DDDCOMERCIAL'  ).AsString  := qr2.FieldByName('DDDCOMERCIAL'  ).AsString;
      ParamByName('DDDCELULAR'    ).AsString  := qr2.FieldByName('DDDCELULAR'    ).AsString;
      ParamByName('RESIDENCIAL'   ).AsString  := qr2.FieldByName('RESIDENCIAL'   ).AsString;
      ParamByName('COMERCIAL'     ).AsString  := qr2.FieldByName('COMERCIAL'     ).AsString;
      ParamByName('CELULAR'       ).AsString  := qr2.FieldByName('CELULAR'       ).AsString;
      ParamByName('EMAIL'         ).AsString  := qr2.FieldByName('EMAIL'         ).AsString;
      ParamByName('URL'           ).AsString  := qr2.FieldByName('URL'           ).AsString;
      ParamByName('OBS'           ).AsString  := qr2.FieldByName('OBS'           ).AsString;
      ParamByName('LIMITE'        ).AsFloat   := StrToFloatDef(qr3.FieldByName('LIMITE').AsString,0);
      ParamByName('USARFIADO'     ).AsString  := BpS(qr3.FieldByName('USARFIADO' ).AsBoolean);
      ParamByName('CREDITO'       ).AsFloat   := 0;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.FiadoParcela;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FIADOPARCELA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO FIADOPARCELA(');
      Add('  FIADO,                 ');
      Add('  CAIXA,                 ');
      Add('  ID,                    ');
      Add('  PAGAMENTO,             ');
      Add('  VALOR,                 ');
      Add('  TOTAL                  ');
      Add('  ) VALUES (             ');
      Add('  :FIADO,                ');
      Add('  :CAIXA,                ');
      Add('  :ID,                   ');
      Add('  :PAGAMENTO,            ');
      Add('  :VALOR,                ');
      Add('  :TOTAL                 ');
      Add('  )                      ');
      ParamByName('FIADO'    ).AsInteger := qr2.FieldByName('FIADO'    ).AsInteger;
      ParamByName('CAIXA'    ).AsInteger := qr2.FieldByName('CAIXA'    ).AsInteger;
      ParamByName('ID'       ).AsInteger := qr2.FieldByName('ID'       ).AsInteger;
      ParamByName('PAGAMENTO').AsDateTime:= SpD(qr2.FieldByName('PAGAMENTO').AsString);
      ParamByName('VALOR'    ).AsFloat   := qr2.FieldByName('VALOR'    ).AsFloat;
      ParamByName('TOTAL'    ).AsFloat   := qr2.FieldByName('VALOR'    ).AsFloat;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.FormaPagamento;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FORMAPAGAMENTO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO FORMAPAGAMENTO( ');
      Add('  FORMAPAGAMENTO,           ');
      Add('  DESCRICAO,                ');
      Add('  DESCONTO                  ');
      Add('  ) VALUES (                ');
      Add('  :FORMAPAGAMENTO,          ');
      Add('  :DESCRICAO,               ');
      Add('  :DESCONTO                 ');
      Add('  )                         ');
      ParamByName('FORMAPAGAMENTO').AsInteger := qr2.FieldByName('FORMAPAGAMENTO').AsInteger;
      ParamByName('DESCRICAO'     ).AsString  := qr2.FieldByName('DESCRICAO'     ).AsString;
      ParamByName('DESCONTO'      ).AsFloat   := qr2.FieldByName('DESCONTO'      ).AsFloat;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Fornecedor;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FORNECEDOR');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO FORNECEDOR(');
      Add('  FORNECEDOR,          ');
      Add('  CADASTRO,            ');
      Add('  DESCRICAO,           ');
      Add('  RAZAOSOCIAL,         ');
      Add('  ENDERECO,            ');
      Add('  BAIRRO,              ');
      Add('  CIDADE,              ');
      Add('  CEP,                 ');
      Add('  DDDCOMERCIAL,        ');
      Add('  DDDCOMERCIAL2,       ');
      Add('  DDDCOMERCIAL3,       ');
      Add('  COMERCIAL,           ');
      Add('  COMERCIAL2,          ');
      Add('  COMERCIAL3,          ');
      Add('  EMAIL,               ');
      Add('  URL,                 ');
      Add('  OBS                  ');
      Add('  ) VALUES (           ');
      Add('  :FORNECEDOR,         ');
      Add('  :CADASTRO,           ');
      Add('  :DESCRICAO,          ');
      Add('  :RAZAOSOCIAL,        ');
      Add('  :ENDERECO,           ');
      Add('  :BAIRRO,             ');
      Add('  :CIDADE,             ');
      Add('  :CEP,                ');
      Add('  :DDDCOMERCIAL,       ');
      Add('  :DDDCOMERCIAL2,      ');
      Add('  :DDDCOMERCIAL3,      ');
      Add('  :COMERCIAL,          ');
      Add('  :COMERCIAL2,         ');
      Add('  :COMERCIAL3,         ');
      Add('  :EMAIL,              ');
      Add('  :URL,                ');
      Add('  :OBS                 ');
      Add('  )                    ');
      ParamByName('FORNECEDOR'   ).AsInteger := qr2.FieldByName('FORNECEDOR'       ).AsInteger;
      ParamByName('CADASTRO'     ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO'      ).AsString);
      ParamByName('DESCRICAO'    ).AsString  := qr2.FieldByName('DESCRICAO'    ).AsString;
      ParamByName('RAZAOSOCIAL'  ).AsString  := qr2.FieldByName('RAZAOSOCIAL'  ).AsString;
      ParamByName('ENDERECO'     ).AsString  := qr2.FieldByName('ENDERECO'     ).AsString;
      ParamByName('BAIRRO'       ).AsString  := qr2.FieldByName('BAIRRO'       ).AsString;
      ParamByName('CIDADE'       ).AsString  := qr2.FieldByName('CIDADE'       ).AsString;
      ParamByName('CEP'          ).AsString  := qr2.FieldByName('CEP'          ).AsString;
      ParamByName('DDDCOMERCIAL' ).AsString  := qr2.FieldByName('DDDCOMERCIAL' ).AsString;
      ParamByName('DDDCOMERCIAL2').AsString  := qr2.FieldByName('DDDCOMERCIAL2').AsString;
      ParamByName('DDDCOMERCIAL3').AsString  := qr2.FieldByName('DDDCOMERCIAL3').AsString;
      ParamByName('COMERCIAL'    ).AsString  := qr2.FieldByName('COMERCIAL'    ).AsString;
      ParamByName('COMERCIAL2'   ).AsString  := qr2.FieldByName('COMERCIAL2'   ).AsString;
      ParamByName('COMERCIAL3'   ).AsString  := qr2.FieldByName('COMERCIAL3'   ).AsString;
      ParamByName('EMAIL'        ).AsString  := qr2.FieldByName('EMAIL'        ).AsString;
      ParamByName('URL'          ).AsString  := qr2.FieldByName('URL'          ).AsString;
      ParamByName('OBS'          ).AsString  := qr2.FieldByName('OBS'          ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Funcionario;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FUNCIONARIO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO FUNCIONARIO(');
      Add('  FUNCIONARIO,          ');
      Add('  CADASTRO,          ');
      Add('  DESCRICAO,         ');
      Add('  ENDERECO,          ');
      Add('  BAIRRO,            ');
      Add('  CIDADE,            ');
      Add('  CEP,               ');
      Add('  NASCIMENTO,        ');
      Add('  ESTADOCIVIL,       ');
      Add('  OCUPACAO,          ');
      Add('  DDDRESIDENCIAL,    ');
      Add('  DDDCOMERCIAL,      ');
      Add('  DDDCELULAR,        ');
      Add('  RESIDENCIAL,       ');
      Add('  COMERCIAL,         ');
      Add('  CELULAR,           ');
      Add('  EMAIL,             ');
      Add('  URL,               ');
      Add('  OBS,               ');
      Add('  COMISSAO           ');
      Add('  ) VALUES (         ');
      Add('  :FUNCIONARIO,      ');
      Add('  :CADASTRO,         ');
      Add('  :DESCRICAO,        ');
      Add('  :ENDERECO,         ');
      Add('  :BAIRRO,           ');
      Add('  :CIDADE,           ');
      Add('  :CEP,              ');
      Add('  :NASCIMENTO,       ');
      Add('  :ESTADOCIVIL,      ');
      Add('  :OCUPACAO,         ');
      Add('  :DDDRESIDENCIAL,   ');
      Add('  :DDDCOMERCIAL,     ');
      Add('  :DDDCELULAR,       ');
      Add('  :RESIDENCIAL,      ');
      Add('  :COMERCIAL,        ');
      Add('  :CELULAR,          ');
      Add('  :EMAIL,            ');
      Add('  :URL,              ');
      Add('  :OBS,              ');
      Add('  :COMISSAO          ');
      Add('  )                  ');
      ParamByName('FUNCIONARIO'   ).AsInteger := qr2.FieldByName('FUNCIONARIO'   ).AsInteger;
      ParamByName('CADASTRO'      ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO'      ).AsString);
      ParamByName('DESCRICAO'     ).AsString  := qr2.FieldByName('DESCRICAO'     ).AsString;
      ParamByName('ENDERECO'      ).AsString  := qr2.FieldByName('ENDERECO'      ).AsString;
      ParamByName('BAIRRO'        ).AsString  := qr2.FieldByName('BAIRRO'        ).AsString;
      ParamByName('CIDADE'        ).AsString  := qr2.FieldByName('CIDADE'        ).AsString;
      ParamByName('CEP'           ).AsString  := qr2.FieldByName('CEP'           ).AsString;
      ParamByName('NASCIMENTO'    ).AsDateTime:= SpD(qr2.FieldByName('NASCIMENTO'    ).AsString);
      ParamByName('ESTADOCIVIL'   ).AsString  := qr2.FieldByName('ESTADOCIVIL'   ).AsString;
      ParamByName('OCUPACAO'      ).AsString  := qr2.FieldByName('OCUPACAO'      ).AsString;
      ParamByName('DDDRESIDENCIAL').AsString  := qr2.FieldByName('DDDRESIDENCIAL').AsString;
      ParamByName('DDDCOMERCIAL'  ).AsString  := qr2.FieldByName('DDDCOMERCIAL'  ).AsString;
      ParamByName('DDDCELULAR'    ).AsString  := qr2.FieldByName('DDDCELULAR'    ).AsString;
      ParamByName('RESIDENCIAL'   ).AsString  := qr2.FieldByName('RESIDENCIAL'   ).AsString;
      ParamByName('COMERCIAL'     ).AsString  := qr2.FieldByName('COMERCIAL'     ).AsString;
      ParamByName('CELULAR'       ).AsString  := qr2.FieldByName('CELULAR'       ).AsString;
      ParamByName('EMAIL'         ).AsString  := qr2.FieldByName('EMAIL'         ).AsString;
      ParamByName('URL'           ).AsString  := qr2.FieldByName('URL'           ).AsString;
      ParamByName('OBS'           ).AsString  := qr2.FieldByName('OBS'           ).AsString;
      ParamByName('COMISSAO'      ).AsFloat   := qr2.FieldByName('COMISSAO'      ).AsFloat;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Grupo;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM GRUPO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO GRUPO  ( ');
      Add('  GRUPO,             ');
      Add('  DESCRICAO          ');
      Add('  ) VALUES (         ');
      Add('  :GRUPO,            ');
      Add('  :DESCRICAO         ');
      Add('  )                  ');
      ParamByName('GRUPO'    ).AsInteger := qr2.FieldByName('GRUPO'    ).AsInteger;
      ParamByName('DESCRICAO').AsString  := qr2.FieldByName('DESCRICAO').AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.GrupoUsuario;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM GRUPOUSUARIO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO GRUPOUSUARIO( ');
      Add('  GRUPOUSUARIO,           ');
      Add('  CADASTRO,               ');
      Add('  DESCRICAO               ');
      Add('  ) VALUES (              ');
      Add('  :GRUPOUSUARIO,          ');
      Add('  :CADASTRO,              ');
      Add('  :DESCRICAO              ');
      Add('  )                       ');
      ParamByName('GRUPOUSUARIO').AsInteger := qr2.FieldByName('GRUPOUSUARIO').AsInteger;
      ParamByName('CADASTRO'    ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO'    ).AsString);
      ParamByName('DESCRICAO'   ).AsString  := qr2.FieldByName('DESCRICAO'   ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Item;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ITEM');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ITEM    (');
      Add('  ITEM,              ');
      Add('  CADASTRO,          ');
      Add('  DESCRICAO,         ');
      Add('  GRUPO,             ');
      Add('  CODBARRA,          ');
      Add('  EDICAO,            ');
      Add('  PRECOVENDA,        ');
      Add('  PRECOCOMPRA,       ');
      Add('  DESHABILITADO,     ');
      Add('  USARCODBARRA       ');
      Add('  ) VALUES (         ');
      Add('  :ITEM,             ');
      Add('  :CADASTRO,         ');
      Add('  :DESCRICAO,        ');
      Add('  :GRUPO,            ');
      Add('  :CODBARRA,         ');
      Add('  :EDICAO,           ');
      Add('  :PRECOVENDA,       ');
      Add('  :PRECOCOMPRA,      ');
      Add('  :DESHABILITADO,    ');
      Add('  :USARCODBARRA      ');
      Add('  )                  ');
      ParamByName('ITEM'         ).AsInteger := qr2.FieldByName('ITEM'         ).AsInteger;
      ParamByName('CADASTRO'     ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO'     ).AsString);
      ParamByName('DESCRICAO'    ).AsString  := qr2.FieldByName('DESCRICAO'    ).AsString;
      ParamByName('GRUPO'        ).AsInteger := qr2.FieldByName('GRUPO'        ).AsInteger;
      ParamByName('CODBARRA'     ).AsString  := qr2.FieldByName('CODBARRA'     ).AsString;
      ParamByName('EDICAO'       ).AsString  := BpS(qr2.FieldByName('EDICAO'       ).AsBoolean);
      ParamByName('PRECOVENDA'   ).asFloat   := qr2.FieldByName('PRECOVENDA'   ).AsFloat;
      ParamByName('PRECOCOMPRA'  ).AsFloat   := qr2.FieldByName('PRECOCOMPRA'  ).AsFloat;
      ParamByName('DESHABILITADO').AsString  := BpS(qr2.FieldByName('DESHABILITADO').AsBoolean);
      ParamByName('USARCODBARRA' ).AsString  := BpS(qr2.FieldByName('USARCODBARRA' ).AsBoolean);
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.ItemEntrada;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ITEMENTRADA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ITEMENTRADA(');
      Add('  ITEMENTRADA,          ');
      Add('  CODBARRA,             ');
      Add('  RUA,                  ');
      Add('  EDICAO,               ');
      Add('  QUANTIDADE,           ');
      Add('  VALORUNI,             ');
      Add('  TOTAL,                ');
      Add('  DEVOLUCAO,            ');
      Add('  SITUACAO,             ');
      Add('  ID                    ');
      Add('  ) VALUES (            ');
      Add('  :ITEMENTRADA,         ');
      Add('  :CODBARRA,            ');
      Add('  :RUA,                 ');
      Add('  :EDICAO,              ');
      Add('  :QUANTIDADE,          ');
      Add('  :VALORUNI,            ');
      Add('  :TOTAL,               ');
      if SpD(qr2.FieldByName('DEVOLUCAO'  ).AsString) <> StrToDate('30/12/1899') then
        Add('  :DEVOLUCAO,           ')
      else
        Add('  NULL,                 ');
      Add('  :SITUACAO,            ');
      Add('  :ID                   ');
      Add('  )                     ');
      ParamByName('ITEMENTRADA').AsInteger := qr2.FieldByName('ITEMENTRADA').AsInteger;
      ParamByName('CODBARRA'   ).AsString  := qr2.FieldByName('CODBARRA'   ).AsString;
      ParamByName('RUA'        ).AsInteger := qr2.FieldByName('RUA'        ).AsInteger;
      ParamByName('EDICAO'     ).AsInteger := qr2.FieldByName('EDICAO'     ).AsInteger;
      ParamByName('QUANTIDADE' ).AsInteger := qr2.FieldByName('QUANTIDADE' ).AsInteger;
      ParamByName('VALORUNI'   ).AsFloat   := qr2.FieldByName('VALORUNI'   ).AsFloat;
      ParamByName('TOTAL'      ).asFloat   := qr2.FieldByName('TOTAL'      ).AsFloat;
      if SpD(qr2.FieldByName('DEVOLUCAO'  ).AsString) <> StrToDate('30/12/1899') then
        ParamByName('DEVOLUCAO'  ).AsDateTime:= SpD(qr2.FieldByName('DEVOLUCAO'  ).AsString);
      ParamByName('SITUACAO'   ).AsString  := qr2.FieldByName('SITUACAO'   ).AsString;
      ParamByName('ID'         ).AsInteger := qr2.FieldByName('ID'         ).AsInteger;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.ItemSaida;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM ITEMSAIDA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO ITEMSAIDA(');
      Add('  ITEMSAIDA,          ');
      Add('  CODBARRA,           ');
      Add('  EDICAO,             ');
      Add('  QUANTIDADE,         ');
      Add('  VALORUNI,           ');
      Add('  TOTAL,              ');
      Add('  ID                  ');
      Add('  ) VALUES (          ');
      Add('  :ITEMSAIDA,         ');
      Add('  :CODBARRA,          ');
      Add('  :EDICAO,            ');
      Add('  :QUANTIDADE,        ');
      Add('  :VALORUNI,          ');
      Add('  :TOTAL,             ');
      Add('  :ID                 ');
      Add('  )                   ');
      ParamByName('ITEMSAIDA' ).AsInteger := qr2.FieldByName('ITEMSAIDA' ).AsInteger;
      ParamByName('CODBARRA'  ).AsString  := qr2.FieldByName('CODBARRA'  ).AsString;
      ParamByName('EDICAO'    ).AsInteger := qr2.FieldByName('EDICAO'    ).AsInteger;
      ParamByName('QUANTIDADE').AsInteger := qr2.FieldByName('QUANTIDADE').AsInteger;
      ParamByName('VALORUNI'  ).AsFloat   := qr2.FieldByName('VALORUNI'  ).AsFloat;
      ParamByName('TOTAL'     ).asFloat   := qr2.FieldByName('TOTAL'     ).AsFloat;
      ParamByName('ID'        ).AsInteger := qr2.FieldByName('ID'        ).AsInteger;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Lancamento;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM LANCAMENTO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO LANCAMENTO(');
      Add('  LANCAMENTO,          ');
      Add('  CAIXA,               ');
      Add('  CADASTRO,            ');
      Add('  HORA,                ');
      Add('  VALOR,               ');
      Add('  HISTORICO            ');
      Add('  ) VALUES (           ');
      Add('  :LANCAMENTO,         ');
      Add('  :CAIXA,              ');
      Add('  :CADASTRO,           ');
      Add('  :HORA,               ');
      Add('  :VALOR,              ');
      Add('  :HISTORICO           ');
      Add('  )                    ');
      ParamByName('LANCAMENTO').AsInteger := qr2.FieldByName('LANCAMENTO').AsInteger;
      ParamByName('CAIXA'     ).AsInteger := qr2.FieldByName('CAIXA'     ).AsInteger;
      ParamByName('CADASTRO'  ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO' ).AsString);
      ParamByName('HORA'      ).AsDateTime:= SpH(qr2.FieldByName('HORA'     ).AsString);
      ParamByName('VALOR'     ).AsFloat   := qr2.FieldByName('VALOR'     ).AsFloat;
      ParamByName('HISTORICO' ).AsString  := qr2.FieldByName('HISTORICO' ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Localizacao;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM LOCALIZACAO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO LOCALIZACAO(');
      Add('  LOCALIZACAO,          ');
      Add('  DESCRICAO             ');
      Add('  ) VALUES (            ');
      Add('  :LOCALIZACAO,         ');
      Add('  :DESCRICAO            ');
      Add('  )                     ');
      ParamByName('LOCALIZACAO').AsInteger := qr2.FieldByName('LOCALIZACAO').AsInteger;
      ParamByName('DESCRICAO'  ).AsString  := qr2.FieldByName('DESCRICAO'  ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Movimento;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM MOVIMENTO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO MOVIMENTO(');
      Add('  CAIXA,              ');
      Add('  CODIGO,             ');
      Add('  FORMAPAGAMENTO,     ');
      Add('  TIPO,               ');
      Add('  DESCRICAO,          ');
      Add('  DATA,               ');
      Add('  VALOR               ');
      Add('  ) VALUES (          ');
      Add('  :CAIXA,             ');
      Add('  :CODIGO,            ');
      Add('  :FORMAPAGAMENTO,    ');
      Add('  :TIPO,              ');
      Add('  :DESCRICAO,         ');
      Add('  :DATA,              ');
      Add('  :VALOR              ');
      Add('  )                   ');
      ParamByName('CAIXA'         ).AsInteger := qr2.FieldByName('CAIXA'         ).AsInteger;
      ParamByName('CODIGO'        ).AsInteger := qr2.FieldByName('CODIGO'        ).Asinteger;
      ParamByName('FORMAPAGAMENTO').AsInteger := qr2.FieldByName('FORMAPAGAMENTO').AsInteger;
      ParamByName('TIPO'          ).AsString  := qr2.FieldByName('TIPO'          ).AsString;
      ParamByName('DESCRICAO'     ).AsString  := qr2.FieldByName('DESCRICAO'     ).AsString;
      ParamByName('DATA'          ).AsDateTime:= SpD(qr2.FieldByName('DATA'          ).AsString);
      ParamByName('VALOR'         ).asFloat   := qr2.FieldByName('VALOR'         ).AsFloat;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Retirada;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM RETIRADA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO RETIRADA  (');
      Add('  RETIRADA,            ');
      Add('  CAIXA,               ');
      Add('  CADASTRO,            ');
      Add('  HORA,                ');
      Add('  VALOR,               ');
      Add('  HISTORICO            ');
      Add('  ) VALUES (           ');
      Add('  :RETIRADA,           ');
      Add('  :CAIXA,              ');
      Add('  :CADASTRO,           ');
      Add('  :HORA,               ');
      Add('  :VALOR,              ');
      Add('  :HISTORICO           ');
      Add('  )                    ');
      ParamByName('RETIRADA'  ).AsInteger := qr2.FieldByName('RETIRADA'  ).AsInteger;
      ParamByName('CAIXA'     ).AsInteger := qr2.FieldByName('CAIXA'     ).AsInteger;
      ParamByName('CADASTRO'  ).AsDateTime:= SpD(qr2.FieldByName('CADASTRO' ).AsString);
      ParamByName('HORA'      ).AsDateTime:= SpH(qr2.FieldByName('HORA'     ).AsString);
      ParamByName('VALOR'     ).AsFloat   := qr2.FieldByName('VALOR'     ).AsFloat;
      ParamByName('HISTORICO' ).AsString  := qr2.FieldByName('HISTORICO' ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Saida;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM SAIDA');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO SAIDA   (');
      Add('  SAIDA,             ');
      Add('  CAIXA,             ');
      Add('  DATA,              ');
      Add('  HORA,              ');
      Add('  FUNCIONARIO,       ');
      Add('  FORMAPAGAMENTO,    ');
      Add('  CLIENTE,           ');
      Add('  DESCONTO,          ');
      Add('  QUITACAO,          ');
      Add('  BAIXADO            ');
      Add('  ) VALUES (         ');
      Add('  :SAIDA,            ');
      Add('  :CAIXA,            ');
      Add('  :DATA,             ');
      Add('  :HORA,             ');
      Add('  :FUNCIONARIO,      ');
      Add('  :FORMAPAGAMENTO,   ');
      Add('  :CLIENTE,          ');
      Add('  :DESCONTO,         ');
      Add('  :QUITACAO,         ');
      Add('  :BAIXADO           ');
      Add('  )                  ');
      ParamByName('SAIDA'         ).AsInteger  := qr2.FieldByName('SAIDA'         ).AsInteger;
      ParamByName('CAIXA'         ).AsInteger  := qr2.FieldByName('CAIXA'         ).AsInteger;
      ParamByName('DATA'          ).AsDateTime := SpD(qr2.FieldByName('DATA'          ).AsString);
      ParamByName('HORA'          ).AsDateTime := SpH(qr2.FieldByName('HORA'          ).AsString);
      ParamByName('FUNCIONARIO'    ).AsInteger  := qr2.FieldByName('FUNCIONARIO'    ).AsInteger;
      ParamByName('FORMAPAGAMENTO').AsInteger  := StrToIntDef(qr2.FieldByName('FORMAPAGAMENTO').AsString,0);
      ParamByName('CLIENTE'       ).asInteger  := qr2.FieldByName('CLIENTE'        ).AsInteger;
      ParamByName('DESCONTO'      ).AsFloat    := qr2.FieldByName('DESCONTO'      ).AsFloat;
      ParamByName('QUITACAO'      ).AsFloat    := qr2.FieldByName('QUITACAO'      ).AsFloat;
      ParamByName('BAIXADO'       ).AsString   := BpS(qr2.FieldByName('BAIXADO'   ).AsBoolean);
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Usuario;
begin
  with qr2,qr2.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM USUARIO');
    Open;
    First;
  end;
  with qr1,qr1.SQL do
  begin
    while not qr2.Eof do
    begin
      Clear;
      Add('INSERT INTO USUARIO  (');
      Add('  USUARIO,            ');
      Add('  DESCRICAO,          ');
      Add('  LOGIN,              ');
      Add('  SENHA,              ');
      Add('  GRUPO               ');
      Add('  ) VALUES (          ');
      Add('  :USUARIO,           ');
      Add('  :DESCRICAO,         ');
      Add('  :LOGIN,             ');
      Add('  :SENHA,             ');
      Add('  :GRUPO              ');
      Add('  )                   ');
      ParamByName('USUARIO'  ).AsInteger := qr2.FieldByName('USUARIO'  ).AsInteger;
      ParamByName('DESCRICAO').AsString  := qr2.FieldByName('DESCRICAO').AsString;
      ParamByName('LOGIN'    ).AsString  := qr2.FieldByName('LOGIN'    ).AsString;
      ParamByName('SENHA'    ).AsString  := qr2.FieldByName('SENHA'    ).AsString;
      ParamByName('GRUPO'    ).AsString  := qr2.FieldByName('GRUPO'    ).AsString;
      ExecSQL;
      qr2.Next;
      l2.Caption := IntToStr(StrToIntDef(l2.Caption,0) + 1 );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmPrincipal.Limpar;
begin
  with qr1, qr1.SQL do
  begin
    Clear;
    Add('DELETE FROM ACESSO');
    ExecSQL;
    Clear;
    Add('DELETE FROM CAIXA');
    ExecSQL;
    Clear;
    Add('DELETE FROM CLIENTE');
    ExecSQL;
    Clear;
    Add('DELETE FROM CODIGOS');
    ExecSQL;
    Clear;
    Add('DELETE FROM CREDOR');
    ExecSQL;
    Clear;
    Add('DELETE FROM DESPESAS');
    ExecSQL;
    Clear;
    Add('DELETE FROM DEVOLUCAO');
    ExecSQL;
    Clear;
    Add('DELETE FROM ENTRADA');
    ExecSQL;
    Clear;
    Add('DELETE FROM ESTOQUE');
    ExecSQL;
    Clear;
    Add('DELETE FROM FIADO');
    ExecSQL;
    Clear;
    Add('DELETE FROM FIADOPARCELA');
    ExecSQL;
    Clear;
    Add('DELETE FROM FORMAPAGAMENTO');
    ExecSQL;
    Clear;
    Add('DELETE FROM FORNECEDOR');
    ExecSQL;
    Clear;
    Add('DELETE FROM FUNCIONARIO');
    ExecSQL;
    Clear;
    Add('DELETE FROM GRUPO');
    ExecSQL;
    Clear;
    Add('DELETE FROM GRUPOUSUARIO');
    ExecSQL;
    Clear;
    Add('DELETE FROM ITEM');
    ExecSQL;
    Clear;
    Add('DELETE FROM ITEMENTRADA');
    ExecSQL;
    Clear;
    Add('DELETE FROM ITEMSAIDA');
    ExecSQL;
    Clear;
    Add('DELETE FROM LANCAMENTO');
    ExecSQL;
    Clear;
    Add('DELETE FROM LOCALIZACAO');
    ExecSQL;
    Clear;
    Add('DELETE FROM MOVIMENTO');
    ExecSQL;
    Clear;
    Add('DELETE FROM RETIRADA');
    ExecSQL;
    Clear;
    Add('DELETE FROM SAIDA');
    ExecSQL;
    Clear;
    Add('DELETE FROM USUARIO');
    ExecSQL;
  end;
end;

procedure TfrmPrincipal.PegarLogin;
begin
  with qr1, qr1.SQL do
  begin
    Close;
    Clear;
    Add('SELECT LOGIN FROM USUARIO');
    Open;
    First;
    While not EOF do
    begin
      c1.Items.Add(FieldByName('LOGIN').AsString);
      Next;
    end;
    Close;
    Clear;
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  with qr1, qr1.SQL do
  begin
    Close;
    Clear;
    Add('UPDATE USUARIO SET SENHA=:SENHA WHERE LOGIN=:LOGIN');
    ParamByName('SENHA').AsString := Codifica(e1.Text,length(e1.Text));
    ParamByName('LOGIN').AsString := c1.Text;
    ExecSQL;
  end;
end;

function TfrmPrincipal.Codifica(Senha: String; Tam: word): String;
var
  C : Char;
  i : integer;
begin
  i := 1;
  c := #0;
  while (tam <> 0) do
  begin
     senha[i] := Chr(((ord(senha[i]) xor 4) + 9) xor ord(c));
     c := senha[i];
     inc(i);
     dec(tam);
  end;
  result := senha;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  PegarLogin;
end;

procedure TfrmPrincipal.CalcularCreditoDoCliente(Cliente : Integer);
var
  Qr, qr2   : TQuery;
  Deb, Cre : Double;
begin
  Qr := TQuery.Create(nil);
  Qr2 := TQuery.Create(nil);
  qr2.DatabaseName := 'banka';
  Cre := 0;
  Deb := 0;
  with Qr, Qr.SQL do
  begin
    DatabaseName := 'banka';
    Close;
    Clear;
    Add('SELECT VALOR AS DEB, FIADO FROM FIADO WHERE CLIENTE=:CLIENTE AND PAGO = ''N'' ');
    ParamByName('CLIENTE').AsInteger := Cliente;
    Open;
    while not EOF do
    begin
      Deb := Deb + FieldByName('DEB').AsFloat;
      qr2.Close;
      qr2.SQL.Clear;
      qr2.SQL.Add('SELECT SUM(TOTAL) AS CRE FROM FIADOPARCELA WHERE FIADO=:FIADO ');
      qr2.ParamByName('FIADO').AsInteger := QR.FieldByName('FIADO').AsInteger;
      QR2.Open;
      cre := Cre + qr2.FieldByName('CRE').AsFloat;
      Next;
    end;
    Close;
    Clear;
    Add('UPDATE CLIENTE SET  ');
    Add('  CREDITO=:CREDITO  ');
    Add('WHERE               ');
    Add('  CLIENTE=:CLIENTE  ');
    ParamByName('CLIENTE').AsInteger := Cliente;
    ParamByName('CREDITO').AsFloat   := Deb - Cre;
    ExecSQL;
  end;
  qr.Close;
  qr.Free;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  AjustarItemEntrada;
  AjustarItemSaida;
  ShowMessage('Operação finalizada com sucesso!');
end;

procedure TfrmPrincipal.AjustarItemSaida;
var
  Id : integer;
begin
  cdsCon.Close;
  with qrCon , qrCon.SQL do
  begin
    Close;
    Clear;
    Add('SELECT COUNT(ITEMSAIDA) AS CONT FROM ITEMSAIDA');
    Open;
    lsa.Caption := FieldByname('CONT').AsString;
    Close;
    Clear;
    Add('SELECT SAIDA FROM SAIDA ORDER BY SAIDA');
    Open;
  end;
  cdsCon.Open;
  cdsCon.First;
  While not cdsCon.Eof do
  begin
    with qrQuery, qrQuery.SQL do
    begin
      Close;
      Clear;
      Add('SELECT                                  ');
      Add('  ITEMSAIDA,                            ');
      Add('  CODBARRA,                             ');
      Add('  EDICAO,                               ');
      Add('  VALORUNI,                             ');
      Add('  SUM(QUANTIDADE) AS QTDE,              ');
      Add('  SUM(TOTAL) AS TOT                     ');
      Add('FROM                                    ');
      Add('  ITEMSAIDA                             ');
      Add('WHERE                                   ');
      Add('  ITEMSAIDA=:ITEMSAIDA                  ');
      Add('GROUP BY                                ');
      Add('  ITEMSAIDA, CODBARRA, EDICAO, VALORUNI ');
      ParamByName('ITEMSAIDA').AsInteger := cdsCon.FieldByName('SAIDA').AsInteger;
      Open;
      First;
    end;
    with qr1, qr1.SQL do
    begin
      Clear;
      Close;
      Add('DELETE FROM ITEMSAIDA WHERE ITEMSAIDA=:ITEMSAIDA ');
      ParamByName('ITEMSAIDA').AsInteger := cdsCon.FieldByName('SAIDA').AsInteger;
      ExecSQL;
      Id := 1;
      while not qrQuery.Eof do
      begin
        Clear;
        Add('INSERT INTO ITEMSAIDA ( ');
        Add('  ITEMSAIDA,            ');
        Add('  CODBARRA,             ');
        Add('  EDICAO,               ');
        Add('  QUANTIDADE,           ');
        Add('  VALORUNI,             ');
        Add('  TOTAL,                ');
        Add('  ID                    ');
        Add(') VALUES (              ');
        Add('  :ITEMSAIDA,           ');
        Add('  :CODBARRA,            ');
        Add('  :EDICAO,              ');
        Add('  :QUANTIDADE,          ');
        Add('  :VALORUNI,            ');
        Add('  :TOTAL,               ');
        Add('  :ID                   ');
        Add(')                       ');
        ParamByName('ITEMSAIDA' ).AsInteger :=  cdsCon.FieldByName('SAIDA'     ).AsInteger;
        ParamByName('CODBARRA'  ).AsString  := qrQuery.FieldByName('CODBARRA'  ).AsString;
        ParamByName('EDICAO'    ).AsInteger := qrQuery.FieldByName('EDICAO'    ).Asinteger;
        ParamByName('QUANTIDADE').AsInteger := qrQuery.FieldByName('QTDE'      ).AsInteger;
        ParamByName('VALORUNI'  ).AsFloat   := qrQuery.FieldByName('VALORUNI'  ).AsFloat;
        ParamByName('TOTAL'     ).AsFloat   := qrQuery.FieldByName('TOT'       ).AsFloat;
        ParamByName('ID'        ).AsInteger := Id;
        ExecSQL;
        Application.ProcessMessages;
        lsd.Caption := IntToStr(StrToIntDef(lsd.Caption, 0) + 1);
        inc(id);
        qrQuery.Next;
      end;
    end;
    cdsCon.Next;
  end;
end;

procedure TfrmPrincipal.AjustarItemEntrada;
var
  Id : integer;
begin
  cdsCon.Close;
  with qrCon , qrCon.SQL do
  begin
    Close;
    Clear;
    Add('SELECT COUNT(ITEMENTRADA) AS CONT FROM ITEMENTRADA');
    Open;
    lea.Caption := FieldByname('CONT').AsString;
    Close;
    Clear;
    Add('SELECT ENTRADA FROM ENTRADA ORDER BY ENTRADA');
    Open;
  end;
  cdsCon.Open;
  cdsCon.First;
  While not cdsCon.Eof do
  begin
    with qrQuery, qrQuery.SQL do
    begin
      Close;
      Clear;
      Add('SELECT                                    ');
      Add('  ITEMENTRADA,                            ');
      Add('  CODBARRA,                               ');
      Add('  RUA,                                    ');
      Add('  EDICAO,                                 ');
      Add('  VALORUNI,                               ');
      Add('  DEVOLUCAO,                              ');
      Add('  SITUACAO,                               ');
      Add('  SUM(QUANTIDADE) AS QTDE,                ');
      Add('  SUM(TOTAL) AS TOT                       ');
      Add('FROM                                      ');
      Add('  ITEMENTRADA                             ');
      Add('WHERE                                     ');
      Add('  ITEMENTRADA=:ITEMENTRADA                ');
      Add('GROUP BY                                  ');
      Add('  ITEMENTRADA, CODBARRA, EDICAO, VALORUNI,');
      Add('  RUA, DEVOLUCAO, SITUACAO                ');
      ParamByName('ITEMENTRADA').AsInteger := cdsCon.FieldByName('ENTRADA').AsInteger;
      Open;
      First;
    end;
    with qr1, qr1.SQL do
    begin
      Clear;
      Close;
      Add('DELETE FROM ITEMENTRADA WHERE ITEMENTRADA=:ITEMENTRADA ');
      ParamByName('ITEMENTRADA').AsInteger := cdsCon.FieldByName('ENTRADA').AsInteger;
      ExecSQL;
      Id := 1;
      while not qrQuery.Eof do
      begin
        Clear;
        Add('INSERT INTO ITEMENTRADA(');
        Add('  ITEMENTRADA,          ');
        Add('  RUA,                  ');
        Add('  DEVOLUCAO,            ');
        Add('  SITUACAO,             ');
        Add('  CODBARRA,             ');
        Add('  EDICAO,               ');
        Add('  QUANTIDADE,           ');
        Add('  VALORUNI,             ');
        Add('  TOTAL,                ');
        Add('  ID                    ');
        Add(') VALUES (              ');
        Add('  :ITEMENTRADA,         ');
        Add('  :RUA,                 ');
        Add('  :DEVOLUCAO,           ');
        Add('  :SITUACAO,            ');
        Add('  :CODBARRA,            ');
        Add('  :EDICAO,              ');
        Add('  :QUANTIDADE,          ');
        Add('  :VALORUNI,            ');
        Add('  :TOTAL,               ');
        Add('  :ID                   ');
        Add(')                       ');
        ParamByName('ITEMENTRADA').AsInteger :=  cdsCon.FieldByName('ENTRADA'   ).AsInteger;
        ParamByName('RUA'        ).Asinteger := qrQuery.FieldByName('RUA'       ).AsInteger;
        ParamByName('DEVOLUCAO'  ).AsDateTime:= qrQuery.FieldByName('DEVOLUCAO' ).AsDateTime;
        ParamByName('SITUACAO'   ).AsString  := qrQuery.FieldByName('SITUACAO'  ).AsString;
        ParamByName('CODBARRA'   ).AsString  := qrQuery.FieldByName('CODBARRA'  ).AsString;
        ParamByName('EDICAO'     ).AsInteger := qrQuery.FieldByName('EDICAO'    ).Asinteger;
        ParamByName('QUANTIDADE' ).AsInteger := qrQuery.FieldByName('QTDE'      ).AsInteger;
        ParamByName('VALORUNI'   ).AsFloat   := qrQuery.FieldByName('VALORUNI'  ).AsFloat;
        ParamByName('TOTAL'      ).AsFloat   := qrQuery.FieldByName('TOT'       ).AsFloat;
        ParamByName('ID'         ).AsInteger := Id;
        ExecSQL;
        Application.ProcessMessages;
        led.Caption := IntToStr(StrToIntDef(led.Caption, 0) + 1);
        inc(id);
        qrQuery.Next;
      end;
    end;
    cdsCon.Next;
  end;
  with qr1, qr1.SQL do
  begin
    Clear;
    Close;
    Add('UPDATE ITEMENTRADA SET DEVOLUCAO=NULL WHERE DEVOLUCAO=0 ');
    ExecSQL;
  end;
end;

procedure TfrmPrincipal.CalculaFiados;
var
  qrCli : TQuery;
begin
  qrCli := TQuery.Create(nil);
  with qrCli, qrCli.SQL do
  begin
    DatabaseName := 'banka';
    Clear;
    Close;
    Add('SELECT CLIENTE FROM CLIENTE ORDER BY CLIENTE ');
    Open;
    First;
    While Not EOF do
    begin
      CalcularCreditoDoCliente(Fields[0].AsInteger);
      Next;
    end;
  end;
  qrCli.Close;
  qrCli.Free;
end;

end.
