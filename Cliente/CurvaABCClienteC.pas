unit CurvaABCClienteC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Animate, GIFCtrl, ExtCtrls, TFlatPanelUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, ToolEdit, Mask, TFlatEditUnit,
  DB, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmCruvaABCClienteC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtDescCLiente: TLabel;
    edtCliente: TComboEdit;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    qrExec: TIBQuery;
    qrRel: TIBQuery;
    qrFat: TIBQuery;
    procedure cancelClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteButtonClick(Sender: TObject);
  private
    procedure IniciarRelatorio;
    function  Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmCruvaABCClienteC: TfrmCruvaABCClienteC;

implementation
uses Main, Principal, CurvaABCClienteR, QuickRpt, Consulta;
{$R *.dfm}

procedure TfrmCruvaABCClienteC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCruvaABCClienteC.edtClienteChange(Sender: TObject);
begin
  if Trim(edtCliente.Text) <> '' then
    edtDescCliente.Caption := LerDescricaoPorCampo('CLIENTE',strtointdef(edtCliente.text,0))
  else
    edtDescCliente.Caption := '';
end;

procedure TfrmCruvaABCClienteC.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
end;

procedure TfrmCruvaABCClienteC.okClick(Sender: TObject);
begin
  if not Valida then
    exit;
  ok.Enabled :=false;
  IniciarRelatorio;
  with TfrmCurvaABCClienteR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

function TfrmCruvaABCClienteC.Valida: Boolean;
begin
  result := false;
  if edtData1.Date >  edtData2.Date then
  begin
    exclusao2('Preencha um intervalo de datas válidos','Aviso');
    edtData1.SetFocus;
    exit;
  end;
  result :=true;
end;

procedure TfrmCruvaABCClienteC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true);
  if (key = VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmCruvaABCClienteC.edtClienteButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+70, 'CLIE');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmCruvaABCClienteC.IniciarRelatorio;
begin
  with qrRel, qrRel.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('DELETE FROM FAT_CLIENTE ');
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    Clear;
    Add('SELECT                                ');
    Add('  CLIENTE.CLIENTE,                    ');
    Add('  CLIENTE.DESCRICAO,                  ');
    Add('  SUM(ITEMSAIDA.QUANTIDADE) AS QTDE,  ');
    Add('  SUM(ITEMSAIDA.TOTAL) AS TOTAL       ');
    Add('FROM                                  ');
    Add('  CLIENTE,                            ');
    Add('  SAIDA,                              ');
    Add('  ITEMSAIDA                           ');
    Add('WHERE                                 ');
    Add('  CLIENTE.CLIENTE=SAIDA.CLIENTE       ');
    Add('AND                                   ');
    Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA     ');
    if Trim(edtDescCliente.Caption) <> ''  then
    begin
      Add('AND                                   ');
      Add('  CLIENTE.CLIENTE=:CLIENTE            ');
      ParamByName('CLIENTE').AsInteger := StrToIntDef(edtCliente.text, 0);
    end;
    if (edtData1.date > 0) and (edtData2.date > 0) then
    begin
      Add('AND                                   ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2');
      ParamByName('DATA1').AsDateTime := (edtData1.date);
      ParamByName('DATA2').AsDateTime := (edtData2.date);
    end;
    Add('GROUP BY                              ');
    Add('  CLIENTE.CLIENTE, CLIENTE.DESCRICAO  ');
    Add('ORDER BY                              ');
    Add('  CLIENTE.CLIENTE                     ');
    Open;
    First;
  end;
  with qrFat, qrFat.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT                            ');
    Add('  SUM(ITEMSAIDA.TOTAL) AS FAT     ');
    Add('FROM                              ');
    Add('  ITEMSAIDA,                      ');
    Add('  SAIDA                           ');
    Add('WHERE                             ');
    Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA ');
    if (edtData1.date > 0) and (edtData2.date > 0) then
    begin
      Add('AND                                    ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2 ');
      ParamByName('DATA1').AsDateTime := (edtData1.Date);
      ParamByName('DATA2').AsDateTime := (edtData2.Date);
    end;
    Open;
  end;
  While Not qrRel.EOF do
  begin
    with qrExec, qrExec.SQL do
    begin
      Clear;
      Database := frmPrincipal.dba;
      Add('INSERT INTO FAT_CLIENTE ( ');
      Add('  CLIENTE,                ');
      Add('  DESC_CLIENTE,           ');
      Add('  FAT_CLIENTE,            ');
      Add('  FATURAMENTO,            ');
      Add('  QTDE                    ');
      Add(') VALUES (                ');
      Add('  :CLIENTE,               ');
      Add('  :DESC_CLIENTE,          ');
      Add('  :FAT_CLIENTE,           ');
      Add('  :FATURAMENTO,           ');
      Add('  :QTDE                   ');
      Add(')                         ');
      ParamByName('CLIENTE'     ).AsInteger := qrRel.FieldByName('CLIENTE'  ).AsInteger;
      ParamByName('DESC_CLIENTE').AsString  := qrRel.FieldByName('DESCRICAO').AsString;
      ParamByName('FAT_CLIENTE' ).AsFloat   := qrRel.FieldByName('TOTAL'    ).AsFloat;
      ParamByName('FATURAMENTO' ).AsFloat   := qrFat.FieldByName('FAT'      ).AsFloat;
      ParamByName('QTDE'        ).AsInteger := qrRel.FieldByName('QTDE'     ).AsInteger;
      ExecSQL;
    end;
    qrRel.Next;
  end;
  frmPrincipal.ibtransacao.Commit;
end;

end.
