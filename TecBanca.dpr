program TecBanca;

uses
  Forms,
  FormCadatroMini in 'Repositorio\FormCadatroMini.pas' {frmFormCadatroMini},
  FormRelatorio in 'Repositorio\FormRelatorio.pas' {frmRelatorio: TQuickRep},
  Exclusao in 'Repositorio\Exclusao.pas' {frmExclusao},
  Caixa in 'Caixa\Caixa.pas' {frmCaixa},
  Despesas in 'Caixa\Despesas.pas' {frmDespesas},
  Lancamento in 'Caixa\Lancamento.pas' {frmLancamento},
  Retirada in 'Caixa\Retirada.pas' {frmRetirada},
  Cliente in 'Cliente\Cliente.pas' {frmCliente},
  ClienteC in 'Cliente\ClienteC.pas' {frmClienteC},
  ClienteR in 'Cliente\ClienteR.pas' {frmClienteR: TQuickRep},
  Credor in 'Credor\Credor.pas' {frmCredor},
  DevolucaoR in 'Devolucao\DevolucaoR.pas' {frmDevolucaoR: TQuickRep},
  Devolucao in 'Devolucao\Devolucao.pas' {frmDevolucao},
  Entrada in 'Entrada\Entrada.pas' {frmEntrada},
  FormaPagamento in 'Forma de Pagamento\FormaPagamento.pas' {frmFormaPagamento},
  Fornecedor in 'Fornecedor\Fornecedor.pas' {frmFornecedor},
  FornecedorC in 'Fornecedor\FornecedorC.pas' {frmFornecedorC},
  Funcionario in 'Funcionario\Funcionario.pas' {frmFuncionario},
  Main in 'Gerenciamento\Main.pas',
  Grupo in 'Grupo\Grupo.pas' {frmGrupo},
  Item in 'Item\Item.pas' {frmItem},
  ItemC in 'Item\ItemC.pas' {frmItemC},
  ItemR in 'Item\ItemR.pas' {frmItemR: TQuickRep},
  Localizacao in 'Localizacao\Localizacao.pas' {frmLocalizacao},
  ResumoVendasR in 'Relatorios\ResumoVendasR.pas' {frmResumoVendaR: TQuickRep},
  ResumoVendas in 'Relatorios\ResumoVendas.pas' {frmResumoVendas},
  Saida in 'Saida\Saida.pas' {frmSaida},
  AlteraSenha in 'Usuario\AlteraSenha.pas' {frmAlteraSenha},
  Login in 'Usuario\Login.pas' {frmLogin},
  Usuario in 'Usuario\Usuario.pas' {frmUsuario},
  Principal in 'Principal.pas' {frmPrincipal},
  Historico in 'Venda\Historico.pas' {frmHistorico},
  FornecedorR in 'Fornecedor\FornecedorR.pas' {frmFornecedorR: TQuickRep},
  GrupoC in 'Grupo\GrupoC.pas' {frmGrupoC},
  GrupoR in 'Grupo\GrupoR.pas' {frmGrupoR: TQuickRep},
  LocalizacaoC in 'Localizacao\LocalizacaoC.pas' {frmLocalizacaoC},
  LocalizacaoR in 'Localizacao\LocalizacaoR.pas' {frmLocalizacaoR: TQuickRep},
  ListadoCaixa in 'Relatorios\ListadoCaixa.pas' {frmListadoCaixa},
  ListadoCaixaR in 'Relatorios\ListadoCaixaR.pas' {frmListadoCaixaR: TQuickRep},
  EstoquePorGrupo in 'Relatorios\EstoquePorGrupo.pas' {frmEstoquePorGrupo},
  EstoquePorGrupoR in 'Relatorios\EstoquePorGrupoR.pas' {frmEstoquePorGrupoR: TQuickRep},
  ProdVend in 'Venda\ProdVend.pas' {frmProdVend},
  Buscar in 'Devolucao\Buscar.pas' {frmBusca},
  FiadoC in 'Controle\FiadoC.pas' {frmFiadoC},
  FiadoR in 'Controle\FiadoR.pas' {frmFiadoR: TQuickRep},
  Vencimento in 'Saida\Vencimento.pas' {frmVencimento},
  SaidaR in 'Saida\SaidaR.pas' {frmSaidaR: TQuickRep},
  DespesasR2 in 'Caixa\DespesasR2.pas' {frmDespesasR2: TQuickRep},
  DespesasC in 'Caixa\DespesasC.pas' {frmDespesasC},
  DespesasR in 'Caixa\DespesasR.pas' {frmDespesasR: TQuickRep},
  Splash in 'Splash\Splash.pas' {frmSplash},
  Opcoes in 'Configuracao\Opcoes.pas' {frmOpcoes},
  MargemLucroR in 'Relatorios\MargemLucroR.pas' {frmMargemLucroR: TQuickRep},
  MargemLucro in 'Relatorios\MargemLucro.pas' {frmMargemLucro},
  VendaVendedorR in 'Relatorios\VendaVendedorR.pas' {frmVendaVendedorR: TQuickRep},
  VendaVendedor in 'Relatorios\VendaVendedor.pas' {frmVendaVendedor},
  RetiradaR in 'Relatorios\RetiradaR.pas' {frmRetiradaR: TQuickRep},
  RetiradaC in 'Relatorios\RetiradaC.pas' {frmRetiradaC},
  LancamentoC in 'Relatorios\LancamentoC.pas' {frmLancamentoC},
  LancamentoR in 'Relatorios\LancamentoR.pas' {frmLancamentoR: TQuickRep},
  VendaNQR in 'Relatorios\VendaNQR.pas' {frmVendaNQR: TQuickRep},
  VendaNQ in 'Relatorios\VendaNQ.pas' {frmVendaNQ},
  Consulta in 'Repositorio\Consulta.pas' {frmConsulta},
  GetPreco in 'Repositorio\GetPreco.pas' {frmGetPreco},
  Fiado in 'Fiado\Fiado.pas' {frmFiado},
  HistoricoCliente in 'Cliente\HistoricoCliente.pas' {frmHistoricoCliente},
  HistoricoFuncionario in 'Funcionario\HistoricoFuncionario.pas' {frmHistoricoFuncionario},
  CurvaABCClienteC in 'Cliente\CurvaABCClienteC.pas' {frmCruvaABCClienteC},
  CurvaABCClienteR in 'Cliente\CurvaABCClienteR.pas' {frmCurvaABCClienteR: TQuickRep},
  CurvaABCFuncionarioC in 'Funcionario\CurvaABCFuncionarioC.pas' {frmCurvaABCFuncionarioC},
  CurvaABCFuncionarioR in 'Funcionario\CurvaABCFuncionarioR.pas' {frmCurvaABCFuncionarioR: TQuickRep},
  CurvaABCItemC in 'Item\CurvaABCItemC.pas' {frmCurvaABCItemC},
  CurvaABCItemR in 'Item\CurvaABCItemR.pas' {frmCurvaABCItemR: TQuickRep},
  EntradaR in 'Entrada\EntradaR.pas' {frmEntradaR: TQuickRep},
  AjustarEstoque in 'Estoque\AjustarEstoque.pas' {frmAjustarEstoque},
  AtualizaFornecedor in 'Gerenciamento\AtualizaFornecedor.pas' {frmAtualizaFornecedor},
  DevolucaoR2 in 'Devolucao\DevolucaoR2.pas' {frmDevolucaoR2: TQuickRep},
  HistoricoR in 'Venda\HistoricoR.pas' {frmHistoricoR: TQuickRep},
  codbarra in 'cobarra\codbarra.pas' {frmCodbarra: TQuickRep},
  codbarraC in 'cobarra\codbarraC.pas' {frmCodbarraC};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '.:Banka`s:.';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
