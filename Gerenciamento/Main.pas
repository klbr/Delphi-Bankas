unit Main;

interface
uses   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
       Dialogs, Menus, ImgList, ComCtrls, ExtCtrls, iniFiles, DB, Exclusao,
       Grids, DBGrids, RXDBCtrl, DBTables, StdCtrls, IBCustomDataSet, IBQuery;

var loExclusao : TfrmExclusao;
    ValordoMovimento  : Extended;

Const
  BancodeDados : String = 'Bankafb';

function Daruma_DUAL_ImprimirTexto( TextoLivre: String; TamanhoTexto: Integer ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_AcionaGaveta() : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_VerificaDocumento() : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Enter(Enter: String) : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Espera(Espera: String) : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_ModoEscrita(Modo_Escrita: String) : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Porta(Porta : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Tabulacao(Tabulacao : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Velocidade(Velocidade : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_DUAL_Termica(Flag : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_ImprimirArquivo(Str_Path : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_ImprimirCodigoBarras(Str_Path : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_StatusGaveta() : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_EnviarBMP(Path : String)  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_VerificarGuilhotina()  : Integer; StdCall; External 'Daruma32.dll'
function Daruma_DUAL_ConfigurarGuilhotina(Int_Flag : integer; Int_LinhasAcionamento : integer)  : Integer; StdCall; External 'Daruma32.dll'

//function  CD(Data : TDateTime):String;
//function  CD2(Data : TDateTime):String;
function  Branco(espaco : Integer):String;
function  JustificaNumeroDir(Formato: String; Valor : Double; Espaco : Integer):String;
procedure CarregaGrid(Tabela : TRxDBGrid);
procedure SalvaGrid(Tabela : TRxDBGrid);
procedure ApagaFiado(cod:String);
function  ExisteProdutoDevolvidoHoje(CodBarra : String; Edicao : Integer; Data : TDateTime):Boolean;
function  FormataCodBarra(barra:string):string;
function  LerQuantidade(barra, edicao : String):Integer;
function  TemSaldoCliente(const Cliente : Integer; const valor : Double ): Boolean;
function  LerDescontoFormaPagamento(forma : string):Double;
function  CaixaAtual(Tabela, Valor :String):integer;
function  Ultimoid(cod: integer; tabcam :String):integer;
function  PreencheZero(R :String):String;
function  PegarPrecoCompra(Barra : String):Double;
function  PegarMediaPrecoCompra(Barra : String):Double;
function  CaixaAberto:Boolean;
Function  DataValida(Dt : String):String;
procedure Exclusao2(msg, titulo : String);
function  Exclusao(msg, titulo : String):boolean;
function  LerRua(campo:String):string;
function  LerDescricaoPorCampo(campo : String; Valor : Integer):String;
function  GetDescricao(Retorno, Tabelas, Condicao : String):String;
procedure GeraMovimentacao(data : TDateTime; desc, tipo : String; valor: Double; pagamento, codigo : integer);
procedure ApagaMovimento(desc, tipo : String; pagamento, codigo : integer);
function  ExisteMovimentoAnterior(desc, tipo : String; pagamento, codigo : integer) : Boolean;
procedure GeraParcelaFiado(data, Vencimento : TDateTime; valor: Double; fiado ,cliente, Saida : integer);
procedure Creditar(Cliente : Integer);
Function  ExisteMovimento(Desc : String; cod : Integer):Boolean;
Function  ExisteFiado(fiado:integer):Boolean;
//Function  ExisteEstoque(barra:string; edicao:integer):Boolean;
Function  EstoqueAtual(barra : String; edicao : integer):Integer;
Function  EstoqueAtualSemEdicao(barra : String):Integer;
//procedure AtualizaEstoque(Qtde:Integer; barra : String; edicao : integer);
Function  ExisteProduto(barra:String):Boolean;
function  PossuiEdicao(barra : String):Boolean;
procedure CarregarCampodePesquisa(lcFormulario : String; var lcNome : TComboBox);
procedure SalvarCampodePesquisa(lcFormulario, lcNome : String);
function  LerValorUni(barra, op : String):Double;
function  LerCodBarra(barra : String):String;
function  LerCodBarraEntrada(barra : String):String;
function  DataModificacao(Arq : String):TDateTime;
function  SerialHD(vDrive:String):String;
function  Codifica(Senha : String; Tam : word):String;
function  Decodifica(Senha : String; Tam : word):String;
function  StrparaInt(char : string):Integer;
function  NomeExe:string;
procedure EscreveIniCaractere(titulo : string; subtitulo : string; dado : String);
procedure EscreveIniInteiro(titulo : string; subtitulo : string; dado : Integer);
function  LerIniCaractere(titulo : string; subtitulo : string):string;
function  LerIniInteiro(titulo : string; subtitulo : string):Integer;
function  DiretorioExe: string;
//function  DiretorioBanco: string;
//function  SQLiteDLL:String;
//function  Banco:String;
//function  SysDB:String;
function  SequencialUser(generator:String):String;
function  UltimoCaixa:Integer;
function  FechamentoAnterior:Double;
function  RemoveBarra(barra:String):String;
function  BparaS(OP : Boolean):String;
function  SparaB(OP : String):Boolean;
function  ReceberValorUni : Double;
function  ReceberGrupo : Integer;
function  PrimeiraentradaProduto(codbarra:String; edicao: Integer; Dev : Tdatetime) : TDatetime;
function  PrimeiraMargem(codbarra:String; edicao: Integer; Dev : Tdatetime) : Double;
function  HpV(S: TDateTime): String;
procedure ValidarRegistro;

var
  Usuario : String;
  Caixa   : Integer;
  ValorTrial : Integer;
  Int_Retorno : Integer;
    
implementation
uses Principal, Getpreco;

function  UltimoCaixa:Integer;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  try
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
//      Transaction :=
      Close;
      Clear;
      Add('SELECT MAX(CAIXA) AS MAX_CAMPO    ');
      Add('FROM CAIXA                        ');
      Open;
      result := qr.FieldByName('MAX_CAMPO').AsInteger;
    end;
  except
    on E : Exception do
    begin
      Result := 0;
      Exclusao2('Ocorreu um erro: '+E.Message,'Aviso do Sistema');
    end;
  end;
  qr.Close;
  QR.Free;
end;

function  SequencialUser(generator: string):String;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  try
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Close;
      Add('SELECT GEN_ID('+generator+', 1) FROM RDB$DATABASE ');
      Open;
      result := inttostr(Fields[0].AsInteger);
    end;
  except
    on E : Exception do
      Exclusao2('Ocorreu um erro: '+E.Message,'Aviso do Sistema');
  end;
  qr.Close;
  QR.Free;
end;

function DiretorioExe: string;
begin
  result := ExtractFilePath(Application.ExeName);
end;

function StrparaInt(char : string):Integer;
begin
 result := strtoint64Def(char,0);
end;

function NomeExe:string;
begin
  result := 'TecBanca';
end;

procedure EscreveIniCaractere(titulo : string; subtitulo : string; dado : String);
var
  ini : Tinifile;
begin
  ini := TiniFile.Create(NomeExe+'.ini');
  ini.WriteString(titulo, subtitulo, dado);
  ini.Free;
end;

procedure EscreveIniInteiro(titulo : string; subtitulo : string; dado : Integer);
var
  ini : Tinifile;
begin
  ini := TiniFile.Create(NomeExe+'.ini');
  ini.WriteInteger(titulo, subtitulo, dado);
  ini.Free;
end;

function LerIniCaractere(titulo : string; subtitulo : string):string;
var
  ini : TiniFile;
begin
  ini := Tinifile.Create(NomeExe+'.ini');
  result := ini.ReadString(titulo, subtitulo, '');
  ini.Free;
end;

function LerIniInteiro(titulo : string; subtitulo : string):Integer;
var
  ini : TiniFile;
begin
  ini := Tinifile.Create(NomeExe+'.ini');
  result := ini.ReadInteger(titulo, subtitulo, 0);
  ini.Free;
end;

function  Codifica(Senha : String; Tam : word):String;
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

function  Decodifica(Senha : String; Tam : word):String;
var
  C, Cl : Char;
  i : integer;
begin
  i := 1;
  c := #0;
  while (tam <> 0) do
  begin
     cl := senha[i];
     senha[i] := Chr(((ord(senha[i]) xor ord(c)) - 9) xor 4);
     c := cl;
     inc(i);
     dec(tam);
  end;
  result := senha;
end;

function  SerialHD(vDrive:String):String;
var
  Serial : DWord;
  DirLen, Flags : DWord;
  DLabel : array[0..11] of char;
begin
  try
    GetVolumeInformation(Pchar(vDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    result := inttohex(Serial,8);
  except
    result := '';
  end;
end;

function  DataModificacao(Arq : String):TDateTime;
var
  ffd : TWin32FindData;
  dft : DWord;
  lft : TfileTime;
  h  : THandle;
begin
  result := 0;
  if FileExists(Arq) then
  begin
    h := Windows.FindFirstFile(Pchar(Arq),ffd);
    if (INVALID_HANDLE_VALUE <> h) then
    begin
      Windows.FindClose(h);
      FileTimeToLocalFileTime(ffd.ftLastAccessTime,lft);
      FileTimeToDosDateTime(lft,LongRec(dft).Hi,LongRec(dft).Lo);
      result := FileDateToDateTime(dft);
    end;
  end;
end;

function  FechamentoAnterior:Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT CAIXAFECHAMENTO FROM CAIXA  ');
    Open;
    Last;
    try
      result := FieldByName('CAIXAFECHAMENTO').AsFloat;
    except
      Result := 0;
    end;
  end;
  qr.Close;
  qr.Free;
end;

procedure CarregarCampodePesquisa(lcFormulario : String; var lcNome : TComboBox);
begin
  lcNome.ItemIndex := lcNome.Items.IndexOf(LerIniCaractere('PESQUISA',lcFormulario));
end;

procedure SalvarCampodePesquisa(lcFormulario, lcNome : String);
begin
  EscreveIniCaractere('PESQUISA',lcFormulario,lcNome);
end;

function  LerValorUni(barra, op : String):Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    if op = 'S' then
    begin
      Add('SELECT DISTINCT ITEMENTRADA.VALORUNI AS VAL FROM ITEMENTRADA, ITEM WHERE ITEM.CODBARRA=ITEMENTRADA.CODBARRA AND ITEM.DESHABILITADO=:FALSE AND ITEM.CODBARRA=:CODBARRA');
    end
    else
    begin
      Add('SELECT DISTINCT PRECOVENDA FROM ITEM WHERE CODBARRA=:CODBARRA AND DESHABILITADO=:FALSE ');
    end;
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(barra);
    Params.ParamByName('FALSE').AsString := 'N';
    Open;
    Last;
    if not IsEmpty then
    begin
      if  op = 'S' then
        result := FieldByName('VAL').AsFloat
      else
        result := FieldByName('PRECOVENDA').AsFloat;
    end
    else
      result := 0;
  end;
  qr.Close;
  qr.Free;
end;

function  LerCodBarra(barra : String):String;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT DESCRICAO FROM ITEM WHERE CODBARRA=:CODBARRA AND DESHABILITADO=:FALSE ');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(Barra);
    Params.ParamByName('FALSE').AsString := 'N';
    Open;
    result := FieldByName('DESCRICAO').AsString;
  end;
  qr.Close;
  qr.Free;
end;

function  LerCodBarraEntrada(barra : String):String;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT ITEM.DESCRICAO AS DESCRICAO               ');
    Add(' FROM ITEMENTRADA, ITEM                          ');
    Add(' WHERE ITEMENTRADA.CODBARRA=:CODBARRA            ');
    Add(' AND ITEM.CODBARRA=ITEMENTRADA.CODBARRA          ');
    Add(' AND ITEMENTRADA.SITUACAO=''NÃO''                ');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(Barra);
    Open;
    result := FieldByName('DESCRICAO').AsString;
  end;
  qr.Close;
  qr.Free;
end;

function  LerDescricaoPorCampo(campo : String; Valor : Integer):String;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT DESCRICAO FROM '+campo+' WHERE '+campo+'=:CAMPO ');
    Params.ParamByName('CAMPO').AsInteger := valor;
    Open;
    result := FieldByName('DESCRICAO').AsString;
  end;
  qr.Close;
  qr.Free;
end;

function  GetDescricao(Retorno, Tabelas, Condicao : String):String;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT '+Retorno+' FROM '+Tabelas+' WHERE '+condicao);
    Open;
    result := FieldByName(Retorno).AsString;
  end;
  qr.Close;
  qr.Free;
end;

function  PossuiEdicao(barra : String):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT EDICAO FROM ITEM WHERE CODBARRA=:CODBARRA AND DESHABILITADO=:FALSE ');
    Params.ParamByName('CODBARRA').AsString := FormataCodBarra(barra);
    Params.ParamByName('FALSE').AsString := 'N';
    Open;
    if Not IsEmpty then
      result := SparaB(FieldByName('EDICAO').AsString)
    else
      result := false;
  end;
  qr.Close;
  qr.Free;
end;

procedure GeraMovimentacao(data : TDateTime; desc, tipo : String; valor:Double ; pagamento, codigo : integer);
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('INSERT INTO MOVIMENTO    (   ');
    Add('  CAIXA,                     ');
    Add('  TIPO,                      ');
    Add('  DESCRICAO,                 ');
    Add('  VALOR,                     ');
    Add('  FORMAPAGAMENTO,            ');
    Add('  DATA,                      ');
    Add('  CODIGO                     ');
    Add('  ) VALUES (                 ');
    Add('  :CAIXA,                    ');
    Add('  :TIPO,                     ');
    Add('  :DESCRICAO,                ');
    Add('  :VALOR,                    ');
    Add('  :FORMAPAGAMENTO,           ');
    Add('  :DATA,                     ');
    Add('  :CODIGO   )                ');
    ParamByName('CAIXA'         ).Asinteger:= Caixa;
    ParamByName('TIPO'          ).AsString := tipo;
    ParamByName('DESCRICAO'     ).AsString := desc;
    ParamByName('VALOR'         ).AsFloat  := valor;
    ParamByName('DATA'          ).AsDateTime := (data);
    ParamByName('FORMAPAGAMENTO').AsInteger:= Pagamento;
    ParamByName('CODIGO'        ).AsInteger:= codigo;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
  end;
  qr.Close;
  qr.Free;
end;

procedure GeraParcelaFiado(data,vencimento : TDateTime; valor: Double; fiado, cliente, Saida : integer);
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  qr.SQL.Clear;
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('INSERT INTO FIADO        (   ');
    Add('  FIADO,                     ');
    Add('  DATA,                      ');
    Add('  VENCIMENTO,                ');
    Add('  CLIENTE,                   ');
    Add('  VALOR,                     ');
    Add('  PAGO,                      ');
    Add('  SAIDA,                     ');
    Add('  CAIXA                      ');
    Add('  ) VALUES (                 ');
    Add('  :FIADO,                    ');
    Add('  :DATA,                     ');
    Add('  :VENCIMENTO,               ');
    Add('  :CLIENTE,                  ');
    Add('  :VALOR,                    ');
    Add('  :PAGO,                     ');
    Add('  :SAIDA,                    ');
    Add('  :CAIXA                     ');
    Add('  )                          ');
    ParamByName('FIADO'     ).Asinteger:= fiado;
    ParamByName('DATA'      ).AsDateTime := (data);
    ParamByName('VENCIMENTO').AsDateTime := (Vencimento);
    ParamByName('CLIENTE'   ).AsInteger:= Cliente;
    ParamByName('VALOR'     ).AsFloat  := valor;
    ParamByName('PAGO'      ).AsString := 'N';
    ParamByName('SAIDA'     ).AsInteger:= Saida;
    ParamByName('CAIXA'     ).AsInteger:= Caixa;
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    //UpdCodigo('FIADO',fiado);
  end;
{    else if op = 'A' then
    begin
      Close;
      Clear;
      Add('UPDATE FIADO        SET          ');
      Add('  VALOR=:VALOR,                  ');
      Add('  DATA=:DATA,                    ');
      Add('  VENCIMENTO=:VENCIMENTO,        ');
      Add('  CLIENTE=:CLIENTE,              ');
      Add('  PAGO=:PAGO                     ');
      Add('WHERE                            ');
      Add('  FIADO=:FIADO                   ');
      Params.ParamByName('FIADO'     ).Asinteger:= fiado;
      Params.ParamByName('DATA'      ).AsDateTime:= data;
      Params.ParamByName('VENCIMENTO').AsDateTime:= Vencimento;
      Params.ParamByName('CLIENTE'   ).AsInteger:= Cliente;
      Params.ParamByName('VALOR'     ).AsFloat  := valor;
      Params.ParamByName('PAGO'      ).AsString := 'N';
      ExecSQL;
    end;}
  qr.Close;
  qr.Free;
end;

Function  ExisteMovimento(Desc : String; cod : Integer):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  qr.Database := frmPrincipal.dba;
  with qr,qr.SQL do
  begin
    Close;
    Clear;
    Add('SELECT CODIGO FROM MOVIMENTO ');
    Add(' WHERE CODIGO=:CODIGO        ');
    Add(' AND                         ');
    Add(' DESCRICAO=:DESCRICAO        ');
    Params.ParamByName('CODIGO').AsInteger := cod;
    Params.ParamByName('DESCRICAO').AsString := Desc;
    Open;
    Result := not IsEmpty;
  end;
  qr.Close;
  qr.Free;
end;

function  Exclusao(msg, titulo : String):boolean;
begin
  loExclusao := TfrmExclusao.Create(application);
  with loExclusao do
  begin
    if titulo <> '' then
      Caption := titulo;
    if msg <> '' then
      Texto.caption := msg;

    showModal;
    result := not (ok.Enabled);
    free;
  end;
end;

function  PreencheZero(R :String):String;
var
  i : integer;
begin
  i := length(r);
  while i < 12 do
  begin
    R[i+1] := '0';
    inc(i);
  end;
  Result := R;
end;

function  PegarPrecoCompra(Barra : String):Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT PRECOCOMPRA FROM ITEM WHERE CODBARRA='''+Barra+''' ');
    Open;
    result := FieldByName('PRECOCOMPRA').AsFloat;
  end;
  qr.close;
  qr.Free;
end;

function  PegarMediaPrecoCompra(Barra : String):Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT SUM(PRECOCOMPRA)/SUM(QUANTIDADE) AS RET FROM ITEMENTRADA WHERE CODBARRA='''+Barra+''' ');
    Open;
    result := FieldByName('RET').AsFloat;
  end;
  qr.close;
  qr.Free;
end;

function  CaixaAberto:Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT  DATAFECHAMENTO FROM CAIXA WHERE CAIXA=:CAIXA');
    qr.ParamByName('CAIXA').AsInteger := UltimoCaixa;
    Open;
    result := qr.FieldByName('DATAFECHAMENTO').AsDateTime < 1000;
  end;
  qr.close;
  qr.Free;
end;

procedure Exclusao2(msg, titulo : String);
begin
  loExclusao := TfrmExclusao.Create(application);
  with loExclusao do
  begin
    if titulo <> '' then
      Caption := titulo;
    if msg <> '' then
      Texto.caption := msg;
    ok.Left := 80;
    ok.Caption := '&OK';
    cancel.Visible := false;
    showModal;
    free;
  end;
end;

function  CaixaAtual(Tabela, Valor : String):integer;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT CAIXA FROM '+Tabela+ ' WHERE '+Tabela+'='+valor);
    Open;
    Result := FieldByName('CAIXA').AsInteger;
  end;
//  qr.Free;
//  db.Free;
end;

function  UltimoId(cod:integer; tabcam : String):integer;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT ID FROM '+Tabcam+ ' WHERE '+Tabcam+'=:COD ');
    ParamByName('COD').AsInteger := cod;
    Open;
    Last;
    try
      Result := FieldByName('ID').AsInteger;
    except
      Result := 0;
    end;
  end;
//  qr.Free;
//  db.Free;
end;

function  LerDescontoFormaPagamento(forma : string):Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT DESCONTO FROM FORMAPAGAMENTO WHERE FORMAPAGAMENTO=:TIPO ');
    Params.ParamByName('TIPO').AsInteger := strtoint(forma);
    Open;
    try
      Result := FieldByName('DESCONTO').AsFloat;
    except
      Result := 0;
    end;
  end;
  qr.Close;
  qr.Free;
end;

function  LerQuantidade(barra, edicao : String):Integer;
var
  Qr : TIBQuery;
  entra, sai : integer;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT SUM(QUANTIDADE) AS ENTRA FROM ITEMENTRADA WHERE SITUACAO=''NÃO'' AND ');

    if (edicao <> '') and (edicao='0') then
      Add(' EDICAO='+edicao+' AND                                  ');

    Add(' CODBARRA='+barra                                        );
    Open;
    if not qr.IsEmpty then
      entra := FieldByName('ENTRA').AsInteger
    else
      entra := 0;

    Close;
    Clear;
    Add('SELECT SUM(QUANTIDADE) AS SAI FROM ITEMSAIDA WHERE ');

    if edicao <> '' then
      Add('   EDICAO='+edicao+' AND                            ');

    Add('   CODBARRA='+barra                                  );
    Open;
    if not qr.IsEmpty then
      Sai := FieldByName('SAI').AsInteger
    else
      sai := 0;

    close;
  end;
  result := entra - sai;

  qr.Close;
  qr.Free;
end;

Function TemSaldoCliente(const Cliente : Integer; const valor : Double ) : Boolean;
var
  Qr : TIBQuery;
begin
  Creditar(Cliente);
  Qr := TIBQuery.Create(nil);
  with Qr, Qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT LIMITE, USARFIADO, CREDITO FROM CLIENTE WHERE CLIENTE=:CLIENTE ');
    ParamByName('CLIENTE').AsInteger := Cliente;
    Open;
    if FieldByName('USARFIADO').AsString = 'S' then
    begin
      if FieldByName('LIMITE').AsFloat > (Valor + FieldByName('CREDITO').AsFloat) then
        Result := True
      else
        Result := False;
    end
    else
      Result := True;
  end;
end;

function  LerRua(campo:String):string;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT LOCALIZACAO FROM LOCALIZACAO WHERE DESCRICAO='''+campo+''' ');
    Open;
    result := FieldByName('LOCALIZACAO').AsString;
  end;
  qr.close;
  qr.Free;
end;

function  FormataCodBarra(barra:string):string;
begin
  try
    result := FormatFloat('0000000000000',StrtoFloat(barra));
  except
    result := '0000000000000';
  end;
end;

Function  ExisteFiado(fiado : integer):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT FIADO FROM FIADO       ');
    Add('WHERE                         ');
    Add('    FIADO=:FIADO              ');
    Params.ParamByName('FIADO').Asinteger:= fiado;
    Open;
    Result := not IsEmpty;
  end;
  qr.Close;
  qr.Free;
end;

{Function  ExisteEstoque(barra : String; edicao : integer):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT ESTOQUE FROM ESTOQUE   ');
    Add('WHERE                         ');
    Add('  CODBARRA=:CODBARRA          ');
    Add('AND                           ');
    Add('  EDICAO=:EDICAO              ');
    Params.ParamByName('EDICAO').Asinteger:= edicao;
    Params.ParamByName('CODBARRA').AsString:= barra;
    Open;
    Result := not IsEmpty;
  end;
  qr.Close;
  qr.Free;
end;}

Function  EstoqueAtual(barra : String; edicao : integer):Integer;
var
  Qr : TIBQuery;
  Sai , Ent , Dev : Integer;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT                                     ');
    Add('  SUM(QUANTIDADE) AS SAI                   ');
    Add('  FROM  ITEMSAIDA                          ');
    Add('WHERE                                      ');
    Add('  ITEMSAIDA.CODBARRA=:CODBARRA             ');
    Add('AND                                        ');
    Add('  ITEMSAIDA.EDICAO=:EDICAO                 ');
    Params.ParamByName('CODBARRA').AsString:= barra;
    Params.ParamByName('EDICAO').Asinteger:= edicao;
    Open;
    Sai :=  FieldByName('SAI').AsInteger;
    Close;
    Clear;
    Add('SELECT                                     ');
    Add('  SUM(ITEMENTRADA.QUANTIDADE) AS ENT,      ');
    Add('  SUM(ITEMENTRADA.DEVOLVIDO) AS DEV        ');
    Add('  FROM ITEMENTRADA                         ');
    Add('WHERE                                      ');
    Add('  ITEMENTRADA.CODBARRA=:CODBARRA           ');
    Add('AND                                        ');
    Add('  ITEMENTRADA.EDICAO=:EDICAO               ');
    Params.ParamByName('CODBARRA').AsString:= barra;
    Params.ParamByName('EDICAO').Asinteger:= edicao;
    Open;
    Ent := FieldByName('ENT').AsInteger;
    Dev := FieldByName('DEV').AsInteger;
    Open;
    Result := Ent - Dev - Sai;
  end;
  qr.Close;
  qr.Free;
end;

Function  EstoqueAtualSemEdicao(barra : String):Integer;
var
  Qr : TIBQuery;
  Sai, Ent , Dev : Integer;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT                                     ');
    Add('  SUM(QUANTIDADE) AS SAI                   ');
    Add('  FROM  ITEMSAIDA                          ');
    Add('WHERE                                      ');
    Add('  ITEMSAIDA.CODBARRA=:CODBARRA             ');
    Params.ParamByName('CODBARRA').AsString:= barra;
    Open;
    Sai :=  FieldByName('SAI').AsInteger;
    Close;
    Clear;
    Add('SELECT                                     ');
    Add('  SUM(ITEMENTRADA.QUANTIDADE) AS ENT,      ');
    Add('  SUM(ITEMENTRADA.DEVOLVIDO) AS DEV        ');
    Add('  FROM ITEMENTRADA                         ');
    Add('WHERE                                      ');
    Add('  ITEMENTRADA.CODBARRA=:CODBARRA           ');
    Params.ParamByName('CODBARRA').AsString:= barra;
    Open;
    Ent := FieldByName('ENT').AsInteger;
    Dev := FieldByName('DEV').AsInteger;
    Result := Ent - Dev - Sai ;
  end;
  qr.Close;
  qr.Free;
end;

{procedure  AtualizaEstoque(Qtde:Integer; barra : String; edicao : integer);
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    if not ExisteEstoque(barra, edicao) then
    begin
      Add('INSERT INTO ESTOQUE ( ');
      Add('  CODBARRA,           ');
      Add('  EDICAO,             ');
      Add('  ESTOQUE             ');
      Add('  ) VALUES (          ');
      Add('  :CODBARRA,          ');
      Add('  :EDICAO,            ');
      Add('  :ESTOQUE            ');
      Add('  )                   ');
      Params.ParamByName('CODBARRA').AsString := barra;
      Params.ParamByName('EDICAO'  ).AsInteger := edicao;
      Params.ParamByName('ESTOQUE' ).asinteger := qtde;
    end
    else
    begin
      Add('UPDATE ESTOQUE SET               ');
      Add('  ESTOQUE=ESTOQUE + :ESTOQUE     ');
      Add('  WHERE                          ');
      Add('  EDICAO=:EDICAO                 ');
      Add('  AND                            ');
      Add('  CODBARRA=:CODBARRA             ');
      Params.ParamByName('CODBARRA').AsString := barra;
      Params.ParamByName('EDICAO'  ).AsInteger := edicao;
      Params.ParamByName('ESTOQUE' ).asinteger := qtde;//+EstoqueAtual(barra,edicao));
    end;
    ExecSQL;
  end;
  qr.Close;
  qr.Free;
end;}

Function  ExisteProduto(barra : string):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Add('SELECT CODBARRA FROM ITEM     ');
    Add('WHERE                         ');
    Add('    CODBARRA=:CODBARRA        ');
    Params.ParamByName('CODBARRA').AsString:= barra;
    Open;
    Result := not IsEmpty;
  end;
  qr.Close;
  qr.Free;
end;

procedure ApagaFiado(cod:String);
var
  Qr : TIBQuery;
  fiado : String;
begin
  qr := TIBQuery.Create(nil);
  try
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Add('SELECT FIADO FROM FIADO WHERE  ');
      Add(' SAIDA = :SAIDA                ');
      ParamByName('SAIDA').AsInteger := StrToIntDef(cod,0);
      Open;
      fiado := FieldByName('FIADO').AsString;
      Close;
      Clear;
      Add('DELETE FROM FIADO WHERE      ');
      Add('SAIDA = :SAIDA               ');
      ParamByName('SAIDA').AsInteger := StrToIntDef(cod,0);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
      Clear;
      Add(' DELETE FROM FIADOPARCELA WHERE FIADO=:FIADO   ');
      ParamByName('FIADO').AsInteger := StrToIntDef(fiado,0);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end;
  except
    fiado := '';
  end;
  qr.Close;
  qr.free;
end;

procedure SalvaGrid(Tabela : TRxDBGrid);
var
  ini : TiniFile;
begin
  ini := TiniFile.Create('Grids.ini');
  Tabela.SaveLayout(ini);
  ini.Free;
end;

procedure CarregaGrid(Tabela : TRxDBGrid);
var
  ini : TiniFile;
begin
  ini := TiniFile.Create('Grids.ini');
  Tabela.RestoreLayout(ini);
  ini.Free;
end;

function  RemoveBarra(barra:String):String;
var
  y :String;
  x : integer;
begin
  y := '';
  for x :=1 to length(barra) do
    if not (barra[x] = '\') and  not (barra[x] = '/') then
      y := y + barra[x];

  Result := y;
end;

function  BparaS(OP : Boolean):String;
begin
  if OP then
    Result := 'S'
  else
    Result := 'N';
end;

function  SparaB(OP : String):Boolean;
begin
  Result := Trim(op) = 'S';
end;

procedure Creditar(Cliente : Integer);
var
  Qr, qr2   : TIBQuery;
  Deb, Cre : Double;
begin
  Qr := TIBQuery.Create(nil);
  Qr2 := TIBQuery.Create(nil);
  qr2.Database := frmPrincipal.dba;
  Cre := 0;
  Deb := 0;
  with Qr, Qr.SQL do
  begin
    Database := frmPrincipal.dba;
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
    frmPrincipal.ibtransacao.Commit;
  end;
  qr.Close;
  qr.Free;
end;

function  ReceberValorUni : Double;
begin
  with TfrmGetPreco.Create(Application) do
  begin
    edtGrupo.Visible := false;
    ShowModal;
    Result := Preco;
    Free;
  end;
end;

function  ReceberGrupo : Integer;
begin
  with TfrmGetPreco.Create(Application) do
  begin
    edtPreco.Visible := False;
    lblCaption.Caption := 'Escolha o gupo e tecle ENTER';
    ShowModal;
    Result := iGrupo;
    Free;
  end;
end;

function PrimeiraentradaProduto(codbarra:String; edicao: Integer; Dev : Tdatetime) : TDatetime;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  try
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Add('SELECT                                        ');
      Add('   ENTRADA.DATA                               ');
      Add('  FROM  ITEMENTRADA , ENTRADA               ');
      Add('WHERE                                         ');
      Add('  ITEMENTRADA.CODBARRA=:CODBARRA              ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.EDICAO=:EDICAO                ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.DEVOLUCAO=:DEV                ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.ITEMENTRADA=ENTRADA.ENTRADA ');
      Add('ORDER BY                                      ');
      Add('  DATA                                        ');
      ParamByName('CODBARRA').AsString:= codbarra;
      ParamByName('EDICAO').Asinteger:= edicao;
      ParamByName('DEV').AsDateTime:= (dev);
      Open;
      First;
      Result := FieldByname('DATA').AsDatetime;
    end;
  finally
    qr.Close;
    qr.Free;
  end;
end;

function PrimeiraMargem(codbarra:String; edicao: Integer; Dev : Tdatetime) : Double;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  try
    with qr,qr.SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Add('SELECT                                        ');
      Add('   ENTRADA.MARGEM                             ');
      Add('  FROM  ITEMENTRADA , ENTRADA               ');
      Add('WHERE                                         ');
      Add('  ITEMENTRADA.CODBARRA=:CODBARRA              ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.EDICAO=:EDICAO                ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.DEVOLUCAO=:DEV                ');
      Add('AND                                           ');
      Add('  ITEMENTRADA.ITEMENTRADA=ENTRADA.ENTRADA ');
      Add('ORDER BY                                      ');
      Add('  DATA                                        ');
      ParamByName('CODBARRA').AsString:= codbarra;
      ParamByName('EDICAO').Asinteger:= edicao;
      ParamByName('DEV').AsDateTime:= (dev);
      Open;
      First;
      Result := FieldByname('MARGEM').AsFloat;
    end;
  finally
    qr.Close;
    qr.Free;
  end;
end;

procedure ApagaMovimento(desc, tipo : String; pagamento, codigo : integer);
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  with qr,qr.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    if not (ExisteMovimentoAnterior(desc, tipo, pagamento, codigo)) then
    begin
      Add('DELETE FROM MOVIMENTO        ');
      Add('WHERE                        ');
      Add('  CAIXA = :CAIXA             ');
      Add('AND                          ');
      Add('  CODIGO=:CODIGO             ');
      Add('AND                          ');
      Add('  TIPO =:TIPO                ');
      Add('AND                          ');
      Add('  DESCRICAO=:DESCRICAO       ');
      Params.ParamByName('CAIXA'    ).Asinteger:= Caixa;
      Params.ParamByName('TIPO'     ).AsString := tipo;
      Params.ParamByName('DESCRICAO').AsString := desc;
      Params.ParamByName('CODIGO'   ).AsInteger:= codigo;
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;
    end
    else
    begin
      Add('INSERT INTO MOVIMENTO ( ');
      Add('  CAIXA,                ');
      Add('  CODIGO,               ');
      Add('  FORMAPAGAMENTO,       ');
      Add('  TIPO,                 ');
      Add('  DESCRICAO,            ');
      Add('  DATA,                 ');
      Add('  VALOR                 ');
      Add('  ) VALUES (            ');
      Add('  :CAIXA,               ');
      Add('  :CODIGO,              ');
      Add('  :FORMAPAG,            ');
      Add('  :TIPO,                ');
      Add('  :DESCRICAO,           ');
      Add('  :DATA,                ');
      Add('  :VALOR                ');
      Add('  )                     ');
      ParamByName('CAIXA'    ).Asinteger:= Caixa;

      if Tipo = 'CRÉDITO' then
        ParamByName('TIPO'     ).AsString := 'DÉBITO'
      else
        ParamByName('TIPO'     ).AsString := 'CRÉDITO';

      ParamByName('DESCRICAO').AsString   := 'CANCELAMENTO: '+ desc;
      ParamByName('FORMAPAG' ).AsInteger  := Pagamento;
      ParamByName('CODIGO'   ).AsInteger  := codigo;
      ParamByName('VALOR'    ).AsFloat    := ValordoMovimento;
      ParamByName('DATA'     ).AsDateTime   := (Date);
      ExecSQL;
      frmPrincipal.ibtransacao.Commit;      
    end;
  end;
  qr.Close;
  qr.Free;
end;

function ExisteMovimentoAnterior(desc, tipo : String; pagamento, codigo : integer): Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  ValordoMovimento := 0;
  try
    try
      with qr,qr.SQL do
      begin
        Database := frmPrincipal.dba;
        Clear;
        Add('SELECT CAIXA, VALOR FROM MOVIMENTO ');
        Add('WHERE                              ');
        Add('  CAIXA <> :CAIXA                  ');
        Add('AND                                ');
        Add('  CODIGO=:CODIGO                   ');
        Add('AND                                ');
        Add('  TIPO =:TIPO                      ');
        Add('AND                                ');
        Add('  DESCRICAO=:DESCRICAO             ');
        ParamByName('CAIXA'    ).Asinteger:= Caixa;
        ParamByName('TIPO'     ).AsString := tipo;
        ParamByName('DESCRICAO').AsString := desc;
        ParamByName('CODIGO'   ).AsInteger:= codigo;
        Open;
        if not IsEmpty then
          ValordoMovimento := FieldByName('VALOR').AsFloat;
        Result := not IsEmpty;
      end;
    except
      Result := False;
    end;
  finally
    qr.Close;
    qr.Free;
  end;
end;

function HpV(S: TDateTime): String;
var
  d : String;
begin
  d := FormatDateTime('HH:MM', S);
  if d = '00:00' then
    Result := ''
  else
    Result := d;
end;

function  ExisteProdutoDevolvidoHoje(CodBarra : String; Edicao : Integer; Data : TDateTime):Boolean;
var
  Qr : TIBQuery;
begin
  qr := TIBQuery.Create(nil);
  try
    try
      with qr,qr.SQL do
      begin
        Database := frmPrincipal.dba;
        Clear;
        Add('SELECT ITEMENTRADA.*                      ');
        Add('FROM                                      ');
        Add('  ITEMENTRADA,                            ');
        Add('  ENTRADA                                 ');
        Add('WHERE                                     ');
        Add('  ITEMENTRADA.ITEMENTRADA=ENTRADA.ENTRADA ');
        Add('AND                                       ');
        Add('  ITEMENTRADA.CODBARRA=:CODBARRA          ');
        Add('AND                                       ');
        Add('  ITEMENTRADA.EDICAO=:EDICAO              ');
        Add('AND                                       ');
        Add('  ENTRADA.DATA>=:DATA                     ');
        Add('AND                                       ');
        Add('  ITEMENTRADA.SITUACAO =''SIM''           ');
        ParamByName('EDICAO'  ).Asinteger  := Edicao;
        ParamByName('CODBARRA').AsString   := CodBarra;
        ParamByName('DATA'    ).AsDateTime := (Data);
        Open;
        Result := not IsEmpty;
      end;
    except
      Result := False;
    end;
  finally
    qr.Close;
    qr.Free;
  end;
end;

{function  CD(Data : TDateTime):String;
begin
  if data = 0 then
    Result := '0'
  else
    Result := FormatDateTime('YYYYMMDD',Data);
end;

function  CD2(Data : TDateTime):String;
begin
  if data = 0 then
    Result := '0'
  else
    Result := FormatDateTime('YYYYMMDDHHMMSS',Data);
end;}

function  Branco(espaco : Integer):String;
var
  i : integer;
  s : string;
begin
  s := '';
  if espaco <= 0 then
    result :=''
  else
  begin
    for i := 1 to espaco do
    begin
      s := s + ' ';
    end;
    result := s;
  end;
end;

function JustificaNumeroDir(Formato: String; Valor : Double; Espaco : Integer):String;
begin
  Result := Branco(Espaco-Length(FormatFloat(Formato, Valor)))+FormaTFloat(Formato,Valor);
end;

procedure ValidarRegistro;
var
  loTables, loRegistros : TIBQuery;
begin
  loTables := TIBQuery.Create(Application);
  loRegistros := TIBQuery.Create(Application);
  with loTables, SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT RDB$RELATION_NAME   ');
    Add('FROM RDB$RELATIONS         ');
    Add('WHERE RDB$SYSTEM_FLAG = 0  ');
    Add('AND RDB$VIEW_BLR IS NULL   ');
    Add('ORDER BY RDB$RELATION_NAME ');
    Open;
  end;
  while not loTables.Eof do
  begin
    with loRegistros,SQL do
    begin
      Database := frmPrincipal.dba;
      Clear;
      Close;
      Add('SELECT COUNT(*) FROM '+loTables.Fields[0].AsString);
      Open;
      if Strtointdef(loRegistros.Fields[0].AsString,0) >= ValorTrial then
      begin
        Exclusao2('Período Trial Expirado! Para registrar entre em contato "kleber_bernardo@hotmail.com"','Término do Período Tria');
        Application.Terminate;
      end;
    end;
    loTables.Next;
  end;
end;

Function  DataValida(Dt : String):String;
begin
  Result := FormatDateTime('MM/DD/YYYY',StrtodateTimeDef(Dt,0));
end;

end.
