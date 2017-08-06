unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, TFlatSpeedButtonUnit, TFlatPanelUnit, XPMenu,
  Usuario, Login, Item, Cliente, Fornecedor, Funcionario, Grupo,
  FormaPagamento, Caixa, Lancamento, Retirada, Devolucao, Despesas, Entrada, Credor,
  Localizacao, Saida, Historico, Main, ResumoVendas, ClienteC, ItemC, GrupoC,
  LocalizacaoC, ListadoCaixa, EstoquePorGrupo, FornecedorC, ProdVend, FiadoC,
  RXShell, RxCalc, DespesasC, Splash, Opcoes, Provider, DBClient, Fiado,
  HistoricoCliente, HistoricoFuncionario, Criptografia, Encryp, reggen4,
  IBDatabase, IBCustomDataSet, IBQuery, ADODB, DB;

var
  loCliente : TfrmCliente; loItem : TfrmItem;  loFormaPagamento : TfrmFormaPagamento;
  loUsuario : TfrmUsuario; loGrupo : TfrmGrupo; loFornecedor : TfrmFornecedor;
  loFuncionario : TfrmFuncionario; loCaixa : TfrmCaixa; loRetirada : TfrmRetirada;
  loLancamento : TfrmLancamento; loDespesas : TfrmDespesas; loEntrada : TfrmEntrada;
  loCredor : TfrmCredor; loLocalizacao : TfrmLocalizacao; loSaida : TfrmSaida;
  loDevolucao : TfrmDevolucao; loHistorico : TfrmHistorico; loProdVend : TfrmProdVend;
  loSplash : TfrmSplash; loFiado : TfrmFiado; loHistoricoCliente : TfrmHistoricoCliente;
  loHistoricoFuncionario : TfrmHistoricoFuncionario;


type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Acesso1: TMenuItem;
    Sair1: TMenuItem;
    Movimenta1: TMenuItem;
    sbStatus: TStatusBar;
    FlatPanel1: TFlatPanel;
    Acesso2: TMenuItem;
    Login1: TMenuItem;
    Usoario1: TMenuItem;
    Grupo1: TMenuItem;
    Relatrios1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedores1: TMenuItem;
    Mercadorias1: TMenuItem;
    Funcionrios1: TMenuItem;
    Grupo2: TMenuItem;
    Abertura1: TMenuItem;
    Lanamentos1: TMenuItem;
    Retiradas1: TMenuItem;
    N1: TMenuItem;
    Vendas1: TMenuItem;
    Entrada1: TMenuItem;
    Despesas1: TMenuItem;
    N2: TMenuItem;
    Consultas1: TMenuItem;
    Histricos1: TMenuItem;
    Compra1: TMenuItem;
    FormadePagamento1: TMenuItem;
    N3: TMenuItem;
    Devoluo1: TMenuItem;
    Credor1: TMenuItem;
    Localizao1: TMenuItem;
    Cadastro1: TMenuItem;
    Cliente2: TMenuItem;
    Mercadorias2: TMenuItem;
    Fornecedores2: TMenuItem;
    Grupos1: TMenuItem;
    Localizao2: TMenuItem;
    Caixa1: TMenuItem;
    ListadoCaixa1: TMenuItem;
    Estoque1: TMenuItem;
    Fechar1: TMenuItem;
    p1: TFlatPanel;
    btnSaida: TFlatSpeedButton;
    btnEntrada: TFlatSpeedButton;
    btnItem: TFlatSpeedButton;
    btnCliente: TFlatSpeedButton;
    btnDevolucao: TFlatSpeedButton;
    btnDespesas: TFlatSpeedButton;
    XPMenu1: TXPMenu;
    N4: TMenuItem;
    Fiado1: TMenuItem;
    ControledeFiado1: TMenuItem;
    RelatriodeFiados1: TMenuItem;
    ProdutosVendidos1: TMenuItem;
    Configuraes1: TMenuItem;
    Opes1: TMenuItem;
    Tray: TRxTrayIcon;
    Popup: TPopupMenu;
    MostrarTecBanca1: TMenuItem;
    Ocultar1: TMenuItem;
    N5: TMenuItem;
    Fechar2: TMenuItem;
    Calculadora: TRxCalculator;
    Utilitrios1: TMenuItem;
    Calculadora1: TMenuItem;
    Despesas2: TMenuItem;
    Vendas2: TMenuItem;
    ResumodeVendas1: TMenuItem;
    VendaspVendedor1: TMenuItem;
    LucropProdutosVendidos1: TMenuItem;
    Vendasno1: TMenuItem;
    VendaspGrupo1: TMenuItem;
    N6: TMenuItem;
    Retiradas2: TMenuItem;
    Lanamentos2: TMenuItem;
    cds: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Cliente3: TMenuItem;
    Vendedor1: TMenuItem;
    Faturamento1: TMenuItem;
    Cliente4: TMenuItem;
    Produto1: TMenuItem;
    Funcionrio1: TMenuItem;
    ImpressodeCoddeBarras1: TMenuItem;
    tmValida: TTimer;
    DigitarChavedoProduto1: TMenuItem;
    TE1: TRegCodeGenerator4;
    dba: TIBDatabase;
    ibtransacao: TIBTransaction;
    query: TIBQuery;
    qr: TIBQuery;
    db: TADOConnection;
    qrSys: TADOQuery;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Usoario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Mercadorias1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Grupo2Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure Abertura1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure Retiradas1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Credor1Click(Sender: TObject);
    procedure Localizao1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Devoluo1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure ResumodeVendas1Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Mercadorias2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Localizao2Click(Sender: TObject);
    procedure ListadoCaixa1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ControledeFiado1Click(Sender: TObject);
    procedure ProdutosVendidos1Click(Sender: TObject);
    procedure RelatriodeFiados1Click(Sender: TObject);
    procedure MostrarTecBanca1Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure Fechar2Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Despesas2Click(Sender: TObject);
    procedure AjustaClick(Sender: TObject);
    procedure Opes1Click(Sender: TObject);
    procedure LucropProdutosVendidos1Click(Sender: TObject);
    procedure VendaspVendedor1Click(Sender: TObject);
    procedure Retiradas2Click(Sender: TObject);
    procedure Lanamentos2Click(Sender: TObject);
    procedure Vendasno1Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Cliente4Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure ConfigurarEstoque1Click(Sender: TObject);
    procedure Balano1Click(Sender: TObject);
    procedure ImpressodeCoddeBarras1Click(Sender: TObject);
    procedure tmValidaTimer(Sender: TObject);
    procedure DigitarChavedoProduto1Click(Sender: TObject);
  private
    procedure Login;
  public

  end;

var
  frmPrincipal: TfrmPrincipal;
  Tentativas : Integer = 0;

implementation
uses MargemLucro, VendaVendedor, RetiradaC, LancamentoC, VendaNQ,
     CurvaABCClienteC, CurvaABCFuncionarioC, CurvaABCItemC, AjustarEstoque,
     AtualizaFornecedor, codbarraC;
{$R *.dfm}

{procedure CreateODBCDriver(Const cDSNName, cExclusive, cDescription, cDataBase, cDefaultPath, cConfigSql ,cDriver: string);
type
  TSQLConfigDataSource = function( hwndParent: HWND; fRequest: WORD; lpszDriver: LPCSTR; lpszAttributes: LPCSTR ): BOOL; stdcall;
const
  ODBC_ADD_DSN = 1; // Adiciona uma fonte de dados (data source)
  ODBC_CONFIG_DSN = 2; // Configura a fonte de dados (data source)
  ODBC_REMOVE_DSN = 3; // Remove a fonte de dados (data source)
  ODBC_ADD_SYS_DSN = 4; // Adiciona um DSN no sistema
  ODBC_CONFIG_SYS_DSN = 5; // Configura o DSN do sistema
  ODBC_REMOVE_SYS_DSN = 6; // Remove o DSN do sistema
var
  pFn: TSQLConfigDataSource;
  hLib: LongWord;
  strDriver: string;
  strHome: string;
  strAttr: string;
  strFile: string;
  fResult: BOOL;
  ModName: array[0..MAX_PATH] of Char;
  srInfo : TSearchRec;
begin
  Windows.GetModuleFileName( HInstance, ModName, SizeOf(ModName) );
  strHome := ModName;
  while ( strHome[length(strHome)] <> '\' ) do
    Delete( strHome, length(strHome), 1 );

  strFile := strHome + cDatabase; // Teste com access (Axes = Access)
  hLib := LoadLibrary( pChar(cDefaultPath) ); // carregando para o diretório padrão
  if( hLib <> NULL ) then
  begin
    @pFn := GetProcAddress( hLib, pChar(cConfigSql) );
    if( @pFn <> nil ) then
    begin
      strDriver := cDriver;
      strAttr := Format( 'DSN=%s'+#0+
      'DBQ=%s'+#0+
      'Exclusive=%s'+#0+
      'Description=%s'+#0+#0,
      [cDSNName,strFile,cExclusive,cDescription] );
      fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
      if( fResult = false ) then
        ShowMessage( 'Falha ao tentar criar o DSN (Data source).' );
      if( FindFirst( strFile, 0, srInfo ) <> 0 ) then
      begin
        strDriver := cDriver;
        strAttr := Format( 'DSN=%s'+#0+
        'DBQ=%s'+#0+
        'Exclusive=%s'+#0+
        'Description= %s'+#0+#0+
        'CREATE_DB="%s"'#0+#0,
        [cDSNName,strFile,cExclusive,cDescription,strFile]);
        {fResult := }
{        pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
//        if( fResult = false ) then
//          ShowMessage( 'Falha ao tentar criar o banco de dados' );
      end;
        FindClose( srInfo );
    end;
      FreeLibrary( hLib );
//      if fResult then
//        ShowMessage( 'Banco de dados criado.' );
  end
  else
  begin
    ShowMessage( 'o sistema não pode carregar a biblioteca ODBCCP32.DLL' );
  end;
end;
 }
procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Exclusao('Deseja sair do Programa?', 'Banka''s') then
    canclose := true
  else
    canclose := false;
end;

procedure TfrmPrincipal.Usoario1Click(Sender: TObject);
begin
  if loUsuario = nil then
    loUsuario := TfrmUsuario.Create(application);

  loUsuario.show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ok : Boolean;
  x  : Integer;
  ng : String;
begin
  with dba do
  begin
    DatabaseName := DiretorioExe+'DB\banka.gdb';
    Open;
    ibtransacao.Active := True;
  end;
  try
    with db do
    begin
      db.Close;
      ng := 'P';
      ng := ng + 'r';
      ng := ng + 'o';
      ng := ng + 'v';
      ng := ng + 'i';
      ng := ng + 'd';
      ng := ng + 'e';
      ng := ng + 'r';
      ng := ng + '=';
      ng := ng + 'M';
      ng := ng + 'S';
      ng := ng + 'D';
      ng := ng + 'A';
      ng := ng + 'S';
      ng := ng + 'Q';
      ng := ng + 'L';
      ng := ng + '.';
      ng := ng + '1';
      ng := ng + ';';
      ng := ng + 'P';
      ng := ng + 'a';
      ng := ng + 's';
      ng := ng + 's';
      ng := ng + 'w';
      ng := ng + 'o';
      ng := ng + 'r';
      ng := ng + 'd';
      ng := ng + '=';
      ng := ng + 'd';
      ng := ng + 'a';
      ng := ng + 'e';
      ng := ng + 'w';
      ng := ng + 'o';
      ng := ng + 'o';
      ng := ng + '1';
      ng := ng + '2';
      ng := ng + '3';
      ng := ng + 'p';
      ng := ng + 'o';
      ng := ng + 'r';
      ng := ng + 'r';
      ng := ng + 'a';
      ng := ng + ';';
      ng := ng + 'P';
      ng := ng + 'e';
      ng := ng + 'r';
      ng := ng + 's';
      ng := ng + 'i';
      ng := ng + 's';
      ng := ng + 't';
      ng := ng + ' ';
      ng := ng + 'S';
      ng := ng + 'e';
      ng := ng + 'c';
      ng := ng + 'u';
      ng := ng + 'r';
      ng := ng + 'i';
      ng := ng + 't';
      ng := ng + 'y';
      ng := ng + ' ';
      ng := ng + 'I';
      ng := ng + 'n';
      ng := ng + 'f';
      ng := ng + 'o';
      ng := ng + '=';
      ng := ng + 'T';
      ng := ng + 'r';
      ng := ng + 'u';
      ng := ng + 'e';
      ng := ng + ';';
      ng := ng + 'D';
      ng := ng + 'a';
      ng := ng + 't';
      ng := ng + 'a';
      ng := ng + ' ';
      ng := ng + 'S';
      ng := ng + 'o';
      ng := ng + 'u';
      ng := ng + 'r';
      ng := ng + 'c';
      ng := ng + 'e';
      ng := ng + '=';
      ng := ng + 's';
      ng := ng + 'y';
      ng := ng + 's';
      ng := ng + ';';
      ng := ng + 'M';
      ng := ng + 'o';
      ng := ng + 'd';
      ng := ng + 'e';
      ng := ng + '=';
      ng := ng + 'R';
      ng := ng + 'e';
      ng := ng + 'a';
      ng := ng + 'd';
      ng := ng + 'W';
      ng := ng + 'r';
      ng := ng + 'i';
      ng := ng + 't';
      ng := ng + 'e';
      db.ConnectionString := ng;
      db.Open;
    end;
  except
    Application.Terminate;
  end;
  for x := 0 to Self.ComponentCount - 1 do
  begin
    if (Components[x] is TIBQuery) and (Components[x].Tag <> 100) then
      TIBQuery(Components[x]).Database := dba;
    if (Components[x] is TIBQuery) and (Components[x].Tag <> 100) then
      TIBQuery(Components[x]).Transaction := ibtransacao;
//    else if (Components[x] is TDataBase) and  (Components[x].Tag <> 100) then
//      TDataBase(Components[x]).DatabaseName := BancoDeDados;
  end;
  with TfrmLogin.Create(Application) do
  begin
    showmodal;
    ok := Pok;
    free;
  end;
  if ok then
  begin
    loSplash := TfrmSplash.Create(Application);
    loSplash.Show;
    Main.Caixa := UltimoCaixa;
    Application.ProcessMessages;
    loSplash.prog.Position := 4;
//    dba.Open;
    Login;
    Application.ProcessMessages;
    tmValida.Enabled := ValorTrial > 0;
    DigitarChavedoProduto1.Visible := tmValida.Enabled;
  end
  else
    Application.Terminate;

  if LerIniInteiro('VENDAS','IMPTERMICA') = 1 then
  begin
    Int_Retorno:= Daruma_Registry_DUAL_Porta(LerIniCaractere('VENDAS','PORTATERMICA'));
    if not (Int_Retorno = 1) Then
      Application.MessageBox( 'Erro ao carregar impressora Térmica, verifique a impressora e suas configurações!', 'Erro!', mb_ok + 16);
    Int_Retorno:= Daruma_Registry_DUAL_Termica('1');
    if not (Int_Retorno = 1) Then
      Application.MessageBox( 'Erro ao carregar impressora Térmica, verifique a impressora e suas configurações!', 'Erro!', mb_ok + 16);
  end;
end;

procedure TfrmPrincipal.Login1Click(Sender: TObject);
begin
  if Exclusao('Deseja efetuar login?','Aviso de Login') then
  begin
    with TfrmLogin.Create(Application) do
    begin
      showmodal;
      free;
    end;
    Main.Caixa := UltimoCaixa;
    sbStatus.Panels.Items[0].Text := main.Usuario;
    sbStatus.Panels.Items[2].Text := FormatDateTime('dd/mm/yyyy',now);
    sbStatus.Panels.Items[1].Text := LerIniCaractere('EMPRESA','TITULO')+' ->' +LerIniCaractere('EMPRESA','TELEFONE'); ;
    Login;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    if loSplash <> nil then
      loSplash.prog.Position := 75;
    Caption := TrimRight(LerIniCaractere('PROGRAMA','CAPTION')) + ' 1.5b';
    Application.ProcessMessages;
    if loSplash <> nil then
      loSplash.lblInfo.Caption := 'Carregando Banco de Dados...';
    Application.ProcessMessages;
    if loSplash <> nil then
      loSplash.prog.Position := 82;
    Application.ProcessMessages;

    Query.Database := dba;
    Query.Open;
    cds.Open;
    if loSplash <> nil then
      loSplash.prog.Position := 88;
    if loSplash <> nil then
      loSplash.lblInfo.Caption := 'Limpando registros desnecessários...';
    Application.ProcessMessages;
    if loSplash <> nil then
      loSplash.prog.Position := 94;
    if loSplash <> nil then
      loSplash.lblInfo.Caption := 'Finalizando carregamento.';
    Application.ProcessMessages;
    sbStatus.Panels.Items[0].Text := main.Usuario;
    if loSplash <> nil then
      loSplash.prog.Position := 98;
    Application.ProcessMessages;
    sbStatus.Panels.Items[2].Text := FormatDateTime('dd/mm/yyyy',now);
    sbStatus.Panels.Items[1].Text := LerIniCaractere('EMPRESA','TITULO')+' ->' +LerIniCaractere('EMPRESA','TELEFONE'); ;
    if loSplash <> nil then
      loSplash.prog.Position := 100;
  finally
    Application.ProcessMessages;
    if loSplash <> nil then
      loSplash.Close;
  end;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  if loCliente = nil then
    loCliente := TfrmCliente.Create(application);

  loCliente.show;
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  if loFornecedor = nil then
    loFornecedor := TfrmFornecedor.Create(application);

  loFornecedor.show;
end;

procedure TfrmPrincipal.Mercadorias1Click(Sender: TObject);
begin
  if loItem = nil then
    loItem := TfrmItem.Create(application);

  loItem.show;
end;

procedure TfrmPrincipal.Funcionrios1Click(Sender: TObject);
begin
  if loFuncionario = nil then
    loFuncionario := TfrmFuncionario.Create(application);

  loFuncionario.show;
end;

procedure TfrmPrincipal.Grupo2Click(Sender: TObject);
begin
  if loGrupo = nil then
    loGrupo := TfrmGrupo.Create(application);

  loGrupo.show;
end;

procedure TfrmPrincipal.FormadePagamento1Click(Sender: TObject);
begin
  if loFormaPagamento = nil then
    loFormaPagamento := TfrmFormaPagamento.Create(Application);
  loFormaPagamento.Show;
end;

procedure TfrmPrincipal.Abertura1Click(Sender: TObject);
begin
  if loCaixa = nil then
    loCaixa := TfrmCaixa.Create(Application);
  loCaixa.Show;
end;

procedure TfrmPrincipal.Lanamentos1Click(Sender: TObject);
begin
  if not (CaixaAberto) then
  begin
    Exclusao2('O caixa deve estar aberto para essa operação!','Caixa Fechado');
    Exit;
  end;
  if loLancamento = nil then
    loLancamento := TfrmLancamento.Create(Application);

  loLancamento.Show;
end;

procedure TfrmPrincipal.Retiradas1Click(Sender: TObject);
begin
  if not (CaixaAberto) then
  begin
    Exclusao2('O caixa deve estar aberto para essa operação!','Caixa Fechado');
    Exit;
  end;
  if loRetirada = nil then
    loRetirada := TfrmRetirada.Create(Application);

  loRetirada.Show;
end;

procedure TfrmPrincipal.Despesas1Click(Sender: TObject);
begin
  if not (CaixaAberto) then
  begin
    Exclusao2('O caixa deve estar aberto para essa operação!','Caixa Fechado');
    Exit;
  end;
  if loDespesas = nil then
    loDespesas := TfrmDespesas.Create(Application);

  loDespesas.Show;
end;

procedure TfrmPrincipal.Entrada1Click(Sender: TObject);
begin
  if loEntrada = nil then
    loEntrada := TfrmEntrada.Create(Application);

  loEntrada.Show;
end;

procedure TfrmPrincipal.Credor1Click(Sender: TObject);
begin
  if loCredor = nil then
    loCredor := TfrmCredor.Create(Application);

  loCredor.Show;
end;

procedure TfrmPrincipal.Localizao1Click(Sender: TObject);
begin
  if loLocalizacao = nil then
    loLocalizacao := TfrmLocalizacao.Create(Application);

  loLocalizacao.Show;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
  if not (CaixaAberto) then
  begin
    Exclusao2('O caixa deve estar aberto para essa operação!','Caixa Fechado');
    Exit;
  end;
  if loSaida = nil then
    loSaida := TfrmSaida.Create(Application);

  loSaida.Show;
end;

procedure TfrmPrincipal.Devoluo1Click(Sender: TObject);
begin
  if loDevolucao = nil then
    loDevolucao := TfrmDevolucao.Create(Application);

  loDevolucao.Show;
end;

procedure TfrmPrincipal.Compra1Click(Sender: TObject);
begin
  if loHistorico = nil then
    loHistorico := TfrmHistorico.Create(Application);

  loHistorico.Show;
end;

procedure TfrmPrincipal.ResumodeVendas1Click(Sender: TObject);
begin
  with TfrmResumoVendas.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
  with TfrmClienteC.Create(Application) do
  begin
    showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.Mercadorias2Click(Sender: TObject);
begin
  with TfrmItemC.Create(Application) do
  begin
    showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Fornecedores2Click(Sender: TObject);
begin
  with TfrmFornecedorC.Create(Application) do
  begin
    showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.Grupos1Click(Sender: TObject);
begin
  with TfrmGrupoC.Create(Application) do
  begin
    showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.Localizao2Click(Sender: TObject);
begin
  with TfrmLocalizacaoC.Create(Application) do
  begin
     showmodal;
     free;
  end;
end;

procedure TfrmPrincipal.ListadoCaixa1Click(Sender: TObject);
begin
  with TfrmListadoCaixa.Create(Application) do
  begin
    Showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.Estoque1Click(Sender: TObject);
begin
  with TfrmEstoquePorGrupo.Create(Application) do
  begin
    Showmodal;
    free;
  end;
end;

{procedure TfrmPrincipal.Aparncia1Click(Sender: TObject);
begin
  with TfrmAparencia.Create(Application) do
  begin
    ShowModal;
    if ModalResult = mrOk then
    begin
//      frmPrincipal.Skin.SkinFile := SkinsFile;
    end
    else
    begin
//      frmPrincipal.Skin.Active := false;
      EscreveIniCaractere('SKIN','FILENAME','');
    end;
    Free;
  end;
//  Skin.Active := true;
//  EscreveIniCaractere('SKIN','FILENAME',skin.SkinFile);
end;}

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (LerIniInteiro('BANCO','EXCLUI') = 1) and (LerIniInteiro('BANCO','SAIR') = 1) then
  begin
    Caption := Caption + ' «Finalizando Aplicativo. Por Favor Aguarde...»';
//    LimpaBanco;
  end;
end;

procedure TfrmPrincipal.ControledeFiado1Click(Sender: TObject);
begin
  if not (CaixaAberto) then
  begin
    Exclusao2('O caixa deve estar aberto para essa operação!','Caixa Fechado');
    Exit;
  end;
  if loFiado = nil then
    loFiado := TfrmFiado.Create(application);

  loFiado.show;
end;

procedure TfrmPrincipal.ProdutosVendidos1Click(Sender: TObject);
begin
  if loProdVend = nil then
    loProdVend := TfrmProdVend.Create(Application);

  loProdVend.Show;
end;

procedure TfrmPrincipal.RelatriodeFiados1Click(Sender: TObject);
begin
  With TfrmFiadoC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Login;
var
  Grupo : String;
  User : Integer;
begin
  if loSplash <> nil then
    loSplash.lblInfo.Caption := 'Carregando informações do Usuário...';
  if Main.Usuario = 'root' then
  begin
//     Ajusta.Visible := True;
//     Balano1.Visible := True;
     Exit;
  end;
  try
    begin
      if loSplash <> nil then
        loSplash.prog.Position := 10;
//      Ajusta.Visible := False;
      btnCliente.Enabled :=         true;
      btnItem.Enabled :=            true;
      Cliente1.Visible :=           true;
      Credor1.Visible :=            true;
      Grupo2.Visible :=             true;
      FormadePagamento1.Visible :=  true;
      Fornecedores1.Visible :=      true;
      Funcionrios1.Visible :=       true;
      Mercadorias1.Visible :=       true;
      Localizao1.Visible :=         true;
      Abertura1.Visible :=          true;
      Lanamentos1.Visible :=        true;
      Retiradas1.Visible :=         true;
      Vendas1.Visible :=            true;
      Entrada1.Visible :=           true;
      Despesas1.Visible :=          true;
      Application.ProcessMessages;
      Devoluo1.Visible :=           true;
      Fiado1.Visible :=             true;
      btnSaida.Enabled :=           true;
      btnEntrada.Enabled :=         true;
      btnDespesas.Enabled :=        true;
      btnDevolucao.Enabled :=       true;
      btnItem.Enabled :=            true;
      btnCliente.Enabled :=         true;
      Cadastros1.Visible := true;
      Movimenta1.Visible := true;
      Relatrios1.Visible := true;
      Acesso2.Visible := true;
      if loSplash <> nil then
        loSplash.prog.Position := 12;
      Application.ProcessMessages;
      with qr,qr.SQL do
      begin
        Database := Principal.frmPrincipal.dba;
        Clear;
        Add('SELECT USUARIO, GRUPO FROM USUARIO WHERE LOGIN=''' +Main.Usuario+'''  ');
        Open;
        if loSplash <> nil then
          loSplash.prog.Position := 16;
        Grupo := FieldByName('GRUPO').AsString;
        User := FieldByName('USUARIO').AsInteger;
        Close;
        Clear;
        if loSplash <> nil then
          loSplash.prog.Position := 19;
        Application.ProcessMessages;
        if  UpperCase(Copy(Grupo,1,3)) <> 'ADM' then
        begin
          Add('SELECT * FROM ACESSO WHERE USUARIO=:USUARIO ');
          Params.ParamByName('USUARIO').AsInteger := User;
          Open;
          if loSplash <> nil then
            loSplash.prog.Position := 25;
          Cadastros1.Visible := SparaB(FieldByName('CADASTRO').AsString);
          if not Cadastros1.Visible then
          begin
            btnCliente.Enabled := false;
            btnItem.Enabled := false;
            Cliente1.Visible := false;
            Credor1.Visible := false;
            Grupo2.Visible := false;
            FormadePagamento1.Visible := false;
            Fornecedores1.Visible := false;
            Funcionrios1.Visible := false;
            Mercadorias1.Visible := false;
            Application.ProcessMessages;
            Localizao1.Visible := false;
            if loSplash <> nil then
              loSplash.prog.Position := 29;
          end
          else
          begin
            Cliente1.Visible :=           SparaB(FieldByName('CLIENTE'       ).AsString);
            Credor1.Visible :=            SparaB(FieldByName('CREDOR'        ).AsString);
            Grupo2.Visible :=             SparaB(FieldByName('GRUPO'         ).AsString);
            FormadePagamento1.Visible :=  SparaB(FieldByName('FORMAPAGAMENTO').AsString);
            Fornecedores1.Visible :=      SparaB(FieldByName('FORNECEDORES'  ).AsString);
            Funcionrios1.Visible :=       SparaB(FieldByName('FUNCIONARIOS'  ).AsString);
            Mercadorias1.Visible :=       SparaB(FieldByName('MERCADORIAS'   ).AsString);
            Application.ProcessMessages;
            Localizao1.Visible :=         SparaB(FieldByName('RUA'           ).AsString);
            if not Cliente1.Visible then
              btnCliente.Enabled := false;
            if not Mercadorias1.Visible then
              btnItem.Enabled := false;
          end;
          if loSplash <> nil then
            loSplash.prog.Position := 34;
          Application.ProcessMessages;
          Movimenta1.Visible := SparaB(FieldByName('MOVIMENTACAO').AsString);
          if not Movimenta1.Visible then
          begin
            Abertura1.Visible := false;
            Lanamentos1.Visible := false;
            Retiradas1.Visible := false;
            Vendas1.Visible := false;
            Entrada1.Visible := false;
            Despesas1.Visible := false;
            Devoluo1.Visible := false;
            Fiado1.Visible := false;
            btnSaida.Enabled := false;
            btnEntrada.Enabled := false;
            btnDespesas.Enabled := false;
            Application.ProcessMessages;
            btnDevolucao.Enabled := false;
            btnItem.Enabled := false;
            btnCliente.Enabled := false;
          end
          else
          begin
            Abertura1.Visible :=     SparaB(FieldByName('CAIXA'      ).AsString);
            Lanamentos1.Visible :=   SparaB(FieldByName('LANCAMENTOS').AsString);
            Retiradas1.Visible :=    SparaB(FieldByName('RETIRADAS'  ).AsString);
            Vendas1.Visible :=       SparaB(FieldByName('SAIDAS'     ).AsString);
            Entrada1.Visible :=      SparaB(FieldByName('ENTRADAS'   ).AsString);
            Despesas1.Visible :=     SparaB(FieldByName('DESPESAS'   ).AsString);
            Application.ProcessMessages;
            Devoluo1.Visible :=      SparaB(FieldByName('DEVOLUCAO'  ).AsString);
            Fiado1.Visible :=        SparaB(FieldByName('FIADO'      ).AsString);
            if not Vendas1.Visible then
              btnSaida.Enabled := false;
            if not Entrada1.Visible then
              btnEntrada.Enabled := false;
            if not Devoluo1.Visible then
              btnDevolucao.Enabled := false;
            if not Despesas1.Visible then
              btnDespesas.Enabled := false;
          end;
          if loSplash <> nil then
            loSplash.prog.Position := 40;
          Application.ProcessMessages;
          Relatrios1.Visible := SparaB(FieldByName('RELATORIO').AsString);
          Acesso2.Visible := false;
        end
        else
        begin
          if loSplash <> nil then
            loSplash.prog.Position := 50;
          btnCliente.Enabled :=         true;
          btnItem.Enabled :=            true;
          Cliente1.Visible :=           true;
          Application.ProcessMessages;
          Credor1.Visible :=            true;
          Grupo2.Visible :=             true;
          FormadePagamento1.Visible :=  true;
          Fornecedores1.Visible :=      true;
          Funcionrios1.Visible :=       true;
          Mercadorias1.Visible :=       true;
          Localizao1.Visible :=         true;
          Abertura1.Visible :=          true;
          Lanamentos1.Visible :=        true;
          Retiradas1.Visible :=         true;
          Vendas1.Visible :=            true;
          Entrada1.Visible :=           true;
          Despesas1.Visible :=          true;
          Devoluo1.Visible :=           true;
          Fiado1.Visible :=             true;
          btnSaida.Enabled :=           true;
          btnEntrada.Enabled :=         true;
          btnDespesas.Enabled :=        true;
          btnDevolucao.Enabled :=       true;
          btnItem.Enabled :=            true;
          btnCliente.Enabled :=         true;
          Cadastros1.Visible := true;
          Movimenta1.Visible := true;
          Application.ProcessMessages;
          Relatrios1.Visible := true;
          Acesso2.Visible := true;
          if loSplash <> nil then
            loSplash.prog.Position := 60;
          Application.ProcessMessages;
        end;
      end;
    end;
//  FormadePagamento1.Visible := False;
  except
    Exclusao2('Erro na inicialização. A aplicação será finalizada','Erro no Sistema');
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.MostrarTecBanca1Click(Sender: TObject);
begin
  Show;
end;

procedure TfrmPrincipal.Ocultar1Click(Sender: TObject);
begin
  Hide;
end;

procedure TfrmPrincipal.Fechar2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Calculadora1Click(Sender: TObject);
begin
  Calculadora.Execute;
end;

procedure TfrmPrincipal.Despesas2Click(Sender: TObject);
begin
  with TfrmDespesasC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.AjustaClick(Sender: TObject);
begin
//  with TfrmData.Create(Application) do
//  begin
//    ShowModal;
//    Free;
//  end;
end;

procedure TfrmPrincipal.Opes1Click(Sender: TObject);
begin
  with TfrmOpcoes.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.LucropProdutosVendidos1Click(Sender: TObject);
begin
  with TfrmMargemLucro.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.VendaspVendedor1Click(Sender: TObject);
begin
  with TfrmVendaVendedor.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Retiradas2Click(Sender: TObject);
begin
  with TfrmRetiradaC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Lanamentos2Click(Sender: TObject);
begin
  with TfrmLancamentoC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Vendasno1Click(Sender: TObject);
begin
  with TfrmVendaNQ.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Cliente3Click(Sender: TObject);
begin
  if loHistoricoCliente = nil then
    loHistoricoCliente := TfrmHistoricoCliente.Create(application);

  loHistoricoCliente.show;
end;

procedure TfrmPrincipal.Vendedor1Click(Sender: TObject);
begin
  if loHistoricoFuncionario = nil then
    loHistoricoFuncionario := TfrmHistoricoFuncionario.Create(application);

  loHistoricoFuncionario.show;
end;

procedure TfrmPrincipal.Cliente4Click(Sender: TObject);
begin
  with TfrmCruvaABCClienteC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Funcionrio1Click(Sender: TObject);
begin
  with TfrmCurvaABCFuncionarioC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  with TfrmCurvaABCItemC.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.ConfigurarEstoque1Click(Sender: TObject);
begin
  with TfrmAjustarEstoque.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.Balano1Click(Sender: TObject);
begin
  with TfrmAtualizaFornecedor.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.ImpressodeCoddeBarras1Click(Sender: TObject);
begin
  with TfrmCodbarraC.Create(Application) do
  begin
    showmodal;
    free;
  end;
end;

procedure TfrmPrincipal.tmValidaTimer(Sender: TObject);
begin
  Enabled := False;
  try
    ValidarRegistro;
  finally
    Enabled := True;
  end;
end;

procedure TfrmPrincipal.DigitarChavedoProduto1Click(Sender: TObject);
var
  S, Ativacao : String;
begin
  Ativacao := InputBox('Digite a Chave de Ativação','Obs: Somente caracteres em maiúsculo','');
  S := SerialHD(UpperCase(copy(DiretorioExe,1,1)));
  S := TE1.GenerateCode('ro'+S+'ot',100);
  if (Ativacao <> S) or (S='') then
  begin
    Exclusao2('Chave de Ativação inválido!!','Erro na Validação');
    if Tentativas < 4 then
    begin
      inc(Tentativas);
      Exit;
    end;
  end
  else
  begin
    tmValida.Enabled := False;
    Exclusao2('Chave de Ativação Válida!!','Validação Completada');
  end;
  with DB do
  begin
    Close;
    Open;
    Sleep(500);
  end;
  with qrSys,qrSys.SQL do
  begin
    Clear;
    Add('UPDATE SYS SET COD=:COD ');
    Parameters.ParamByName('COD').Value := Ativacao;
    ExecSQL;
  end;
  if Tentativas >= 4 then
  begin
    Exclusao2('Programa desativado!!','Erro na Validação');
    Application.Terminate;
  end;
end;

end.



































































































