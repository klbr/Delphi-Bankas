unit Opcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, TFlatEditUnit, TFlatRadioButtonUnit,
  TFlatCheckBoxUnit, ExtCtrls, TFlatPanelUnit, TFlatSpeedButtonUnit,
  TFlatGroupBoxUnit;

type
  TfrmOpcoes = class(TForm)
    pcOpcoes: TPageControl;
    tsEmpresa: TTabSheet;
    tsBanco: TTabSheet;
    Label1: TLabel;
    edtEmpresa: TFlatEdit;
    Label2: TLabel;
    edtcnpj: TFlatEdit;
    Label3: TLabel;
    edtFantasia: TFlatEdit;
    Label4: TLabel;
    edtfone1: TFlatEdit;
    edtfone2: TFlatEdit;
    edtfone3: TFlatEdit;
    Label5: TLabel;
    edtEndereco: TFlatEdit;
    FlatGroupBox1: TFlatGroupBox;
    pExcluir: TFlatPanel;
    rbinicio: TFlatRadioButton;
    rbsair: TFlatRadioButton;
    cbExclui: TFlatCheckBox;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatGroupBox2: TFlatGroupBox;
    rbatualiza: TFlatCheckBox;
    FlatSpeedButton2: TFlatSpeedButton;
    tsVenda: TTabSheet;
    FlatGroupBox3: TFlatGroupBox;
    pVenda: TFlatPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtFunc: TFlatEdit;
    edtForma: TFlatEdit;
    edtCli: TFlatEdit;
    cbVenda: TFlatCheckBox;
    edtCaption: TFlatEdit;
    Label9: TLabel;
    FlatPanel1: TFlatPanel;
    ok: TFlatSpeedButton;
    Cancel: TFlatSpeedButton;
    tsSaida: TTabSheet;
    cbMultiplo: TFlatCheckBox;
    cbImpTermica: TFlatCheckBox;
    cbGaveta: TFlatCheckBox;
    Label10: TLabel;
    edtPortaTermica: TFlatEdit;
    cbImprime: TFlatCheckBox;
    procedure CancelClick(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure edtEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcoes: TfrmOpcoes;

implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmOpcoes.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOpcoes.okClick(Sender: TObject);
begin
  //Empresa
  EscreveIniCaractere('EMPRESA','TITULO',edtFantasia.Text);
  EscreveIniCaractere('EMPRESA','TELEFONE',edtFone1.Text);
  EscreveIniCaractere('EMPRESA','TELEFONE2',edtFone2.Text);
  EscreveIniCaractere('EMPRESA','TELEFONE3',edtFone3.Text);
  EscreveIniCaractere('EMPRESA','ENDERECO',edtEndereco.Text);
  EscreveIniCaractere('EMPRESA','CNPJ',edtCNPJ.Text);
  EscreveIniCaractere('EMPRESA','RAZAO',edtEmpresa.Text);
  //banco
  if cbExclui.Checked then
    EscreveIniInteiro('BANCO','EXCLUI',1)
  else
    EscreveIniInteiro('BANCO','EXCLUI',0);
  if rbInicio.Checked then
    EscreveIniInteiro('BANCO','INICIO',1)
  else
    EscreveIniInteiro('BANCO','INICIO',0);
  if rbSair.Checked then
    EscreveIniInteiro('BANCO','SAIR',1)
  else
    EscreveIniInteiro('BANCO','SAIR',0);
  if rbAtualiza.Checked then
    EscreveIniInteiro('BANCO','ATUALIZA',1)
  else
    EscreveIniInteiro('BANCO','ATUALIZA',0);
  //Geral
  if cbVenda.Checked then
    EscreveIniInteiro('CONFIGURACAO','ATIVA',1)
  else
    EscreveIniInteiro('CONFIGURACAO','ATIVA',0);
  EscreveIniCaractere('CONFIGURACAO','FUNCIONARIO',edtFunc.Text);
  EscreveIniCaractere('CONFIGURACAO','CLIENTE',edtCli.Text);
  EscreveIniCaractere('CONFIGURACAO','FORMAPAGAMENTO',edtForma.Text);
  EscreveIniCaractere('PROGRAMA','CAPTION',edtCaption.Text);

  if cbMultiplo.Checked then
    EscreveIniInteiro('VENDAS','MULTIPLO',1)
  else
    EscreveIniInteiro('VENDAS','MULTIPLO',0);

  if cbImprime.Checked then
    EscreveIniInteiro('VENDAS','IMPRIME',1)
  else
    EscreveIniInteiro('VENDAS','IMPRIME',0);

  if cbImpTermica.Checked then
    EscreveIniInteiro('VENDAS','IMPTERMICA',1)
  else
    EscreveIniInteiro('VENDAS','IMPTERMICA',0);

  if cbGaveta.Checked then
    EscreveIniInteiro('VENDAS','GAVETA',1)
  else
    EscreveIniInteiro('VENDAS','GAVETA',0);
  EscreveIniCaractere('VENDAS','PORTATERMICA',edtPortaTermica.Text);
  Close;
end;

procedure TfrmOpcoes.FormShow(Sender: TObject);
begin
  //Empresa
  edtEmpresa.Text := LerIniCaractere('EMPRESA','RAZAO');
  edtFantasia.Text := LerIniCaractere('EMPRESA','TITULO');
  edtEndereco.Text := LerIniCaractere('EMPRESA','ENDERECO');
  edtFone1.Text := LerIniCaractere('EMPRESA','TELEFONE');
  edtFone2.Text := LerIniCaractere('EMPRESA','TELEFONE2');
  edtFone3.Text := LerIniCaractere('EMPRESA','TELEFONE3');
  edtCNPJ.Text := LerIniCaractere('EMPRESA','CNPJ');
  //Banco
  cbExclui.Checked := LerIniInteiro('BANCO','EXCLUI') = 1;
  rbInicio.Checked := LerIniInteiro('BANCO','INICIO') = 1;
  rbSair.Checked := LerIniInteiro('BANCO','SAIR') = 1;
  rbAtualiza.Checked := LerIniInteiro('BANCO','ATUALIZA') = 1;
  //Geral
  cbVenda.Checked := LerIniInteiro('CONFIGURACAO','ATIVA') = 1;
  edtFunc.Text := LerIniCaractere('CONFIGURACAO','FUNCIONARIO');
  edtCli.Text := LerIniCaractere('CONFIGURACAO','CLIENTE');
  edtForma.Text := LerIniCaractere('CONFIGURACAO','FORMAPAGAMENTO');
  edtCaption.Text := LerIniCaractere('PROGRAMA','CAPTION');

  cbMultiplo.Checked:= LerIniInteiro('VENDAS','MULTIPLO') = 1;
  cbImprime.Checked:= LerIniInteiro('VENDAS','IMPRIME') = 1;
  cbImpTermica.Checked:= LerIniInteiro('VENDAS','IMPTERMICA') = 1;
  cbGaveta.Checked:= LerIniInteiro('VENDAS','GAVETA') = 1;
  edtPortaTermica.Text := LerIniCaractere('VENDAS','PORTATERMICA');
end;

procedure TfrmOpcoes.FlatSpeedButton2Click(Sender: TObject);
begin
  with frmPrincipal do
  begin
    Query.Database := frmPrincipal.dba;
    query.Close;
    query.Open;
    cds.Close;
    cds.Open;
  end;
end;

procedure TfrmOpcoes.edtEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl, true, true)
  else if key = VK_ESCAPE then
    Cancel.Click;
end;

end.
