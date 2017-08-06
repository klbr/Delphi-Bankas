unit ResumoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls, TFlatPanelUnit, Buttons;

type
  TfrmResumoVendas = class(TForm)
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    Label14: TLabel;
    edtCliente: TComboEdit;
    edtDescCLiente: TLabel;
    Label3: TLabel;
    edtFuncionario: TComboEdit;
    edtDescFuncionario: TLabel;
    Label9: TLabel;
    edtFormapagamento: TComboEdit;
    edtDescFormaPagamento: TLabel;
    procedure okClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteChange(Sender: TObject);
    procedure edtFuncionarioChange(Sender: TObject);
    procedure edtFormapagamentoChange(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtFuncionarioButtonClick(Sender: TObject);
    procedure edtFormapagamentoButtonClick(Sender: TObject);
  private
  function Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmResumoVendas: TfrmResumoVendas;

implementation

uses ResumoVendasR, QuickRpt, Main, Consulta;
{$R *.dfm}

procedure TfrmResumoVendas.okClick(Sender: TObject);
begin
  ok.Enabled := false;
  if valida then
  begin
    with TfrmResumoVendaR.Create(Application) do
    begin
      Data1 := edtData1.Date;
      Data2 := edtData2.Date;
      Cliente := edtCliente.Text;
      Func  := edtFuncionario.Text;
      Forma := edtFormapagamento.Text;
      PreviewModal;
      Free;
    end;
  end;
  ok.Enabled := true;
end;

function TfrmResumoVendas.Valida: Boolean;
begin
  result := false;
  if (edtDescCLiente.Caption = '') and (Trim(edtCliente.Text) <> '') then
  begin
    exclusao2('Preencha um Cliente válido','Aviso');
    edtCliente.SetFocus;
    exit;
  end;
  if (edtDescFuncionario.Caption = '') and (Trim(edtFuncionario.Text) <> '') then
  begin
    exclusao2('Preencha um Funcionario válido','Aviso');
    edtFuncionario.SetFocus;
    exit;
  end;
  if (edtDescFormaPagamento.Caption = '') and (Trim(edtFormaPagamento.Text) <> '') then
  begin
    exclusao2('Preencha uma Forma de Pagamento válida','Aviso');
    edtFormapagamento.SetFocus;
    exit;
  end;
  if edtData1.Date >  edtData2.Date then
  begin
    exclusao2('Preencha um intervalo de datas válidos','Aviso');
    edtData1.SetFocus;
    exit;
  end;
  result := true;
end;

procedure TfrmResumoVendas.cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmResumoVendas.FormShow(Sender: TObject);
begin
  edtData1.SetFocus;
end;

procedure TfrmResumoVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true)
  else if (key = VK_F4) and (shift = [ssctrl]) then
    close;
end;

procedure TfrmResumoVendas.edtData2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
   ok.Click;
end;

procedure TfrmResumoVendas.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointDef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmResumoVendas.edtFuncionarioChange(Sender: TObject);
begin
  if Trim(edtFuncionario.Text) <> '' then
    edtDescFuncionario.Caption := LerDescricaoPorCampo('FUNCIONARIO',strtointDef(edtFuncionario.text,0))
  else
    edtDescFuncionario.Caption := '';
end;

procedure TfrmResumoVendas.edtFormapagamentoChange(Sender: TObject);
begin
  if (Trim(edtFormaPagamento.Text) <> '') and (edtFormaPagamento.text <> '0') then
    edtDescFormaPagamento.Caption := LerDescricaoPorCampo('FORMAPAGAMENTO',strtointDef(edtFormaPagamento.text,0))
  else
    edtDescFormaPagamento.Caption := '';
end;

procedure TfrmResumoVendas.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+10, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmResumoVendas.edtFuncionarioButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+15, 'FUNC');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmResumoVendas.edtFormapagamentoButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+15, 'FORM');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

end.
