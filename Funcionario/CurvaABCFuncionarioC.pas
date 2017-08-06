unit CurvaABCFuncionarioC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Animate, GIFCtrl, ExtCtrls, TFlatPanelUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, ToolEdit, Mask, TFlatEditUnit,
  DB, DBTables, IBCustomDataSet, IBQuery;

type
  TfrmCurvaABCFuncionarioC = class(TForm)
    pBottom: TFlatPanel;
    cancel: TBitBtn;
    ok: TBitBtn;
    edtDescFuncionario: TLabel;
    edtFuncionario: TComboEdit;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtData1: TDateEdit;
    edtData2: TDateEdit;
    qrExec: TIBQuery;
    qrRel: TIBQuery;
    qrFat: TIBQuery;
    procedure cancelClick(Sender: TObject);
    procedure edtFuncionarioChange(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncionarioButtonClick(Sender: TObject);
  private
    procedure IniciarRelatorio;
    function  Valida:Boolean;
  public
    { Public declarations }
  end;

var
  frmCurvaABCFuncionarioC: TfrmCurvaABCFuncionarioC;

implementation
uses Main, Principal, CurvaABCFuncionarioR, QuickRpt, Consulta;
{$R *.dfm}

procedure TfrmCurvaABCFuncionarioC.cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCurvaABCFuncionarioC.edtFuncionarioChange(Sender: TObject);
begin
  if Trim(edtFuncionario.Text) <> '' then
    edtDescFuncionario.Caption := LerDescricaoPorCampo('FUNCIONARIO',strtointDef(edtFuncionario.text,0))
  else
    edtDescFuncionario.Caption := '';
end;

procedure TfrmCurvaABCFuncionarioC.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
   close;
end;

procedure TfrmCurvaABCFuncionarioC.okClick(Sender: TObject);
begin
  if not Valida then
    exit;
  ok.Enabled :=false;
  IniciarRelatorio;
  with TfrmCurvaABCFuncionarioR.Create(Application) do
  begin
    PreviewModal;
    Free;
  end;
  ok.Enabled := true;
end;

function TfrmCurvaABCFuncionarioC.Valida: Boolean;
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

procedure TfrmCurvaABCFuncionarioC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(ActiveControl,true,true);
  if (key = VK_F4) and (shift = [ssCtrl]) then
    close;
end;

procedure TfrmCurvaABCFuncionarioC.edtFuncionarioButtonClick(Sender: TObject);
var
  S : String;
begin
  s := Executa(Top+20, Left+70, 'FUNC');
  if Trim(s) <> '' then
    TComboEdit(Sender).Text := S;
end;

procedure TfrmCurvaABCFuncionarioC.IniciarRelatorio;
begin
  with qrRel, qrRel.SQL do
  begin
    Database := frmPrincipal.dba;
    Clear;
    Close;
    Add('DELETE FROM FAT_FUNCIONARIO ');
    ExecSQL;
    frmPrincipal.ibtransacao.Commit;
    Clear;
    Add('SELECT                                      ');
    Add('  FUNCIONARIO.FUNCIONARIO,                  ');
    Add('  FUNCIONARIO.DESCRICAO,                    ');
    Add('  SUM(ITEMSAIDA.QUANTIDADE) AS QTDE,        ');
    Add('  SUM(ITEMSAIDA.TOTAL) AS TOTAL             ');
    Add('FROM                                        ');
    Add('  FUNCIONARIO,                              ');
    Add('  SAIDA,                                    ');
    Add('  ITEMSAIDA                                 ');
    Add('WHERE                                       ');
    Add('  FUNCIONARIO.FUNCIONARIO=SAIDA.FUNCIONARIO ');
    Add('AND                                         ');
    Add('  SAIDA.SAIDA=ITEMSAIDA.ITEMSAIDA           ');
    if Trim(edtDescFuncionario.Caption) <> ''  then
    begin
      Add('AND                                     ');
      Add('  FUNCIONARIO.FUNCIONARIO=:FUNCIONARIO  ');
      ParamByName('FUNCIONARIO').AsInteger := StrToIntDef(edtFuncionario.text, 0);
    end;
    if (edtData1.date > 0) and (edtData2.date > 0) then
    begin
      Add('AND                                   ');
      Add('  SAIDA.DATA BETWEEN :DATA1 AND :DATA2');
      ParamByName('DATA1').AsDateTime := (edtData1.date);
      ParamByName('DATA2').AsDateTime := (edtData2.date);
    end;
    Add('GROUP BY                                          ');
    Add('  FUNCIONARIO.FUNCIONARIO, FUNCIONARIO.DESCRICAO  ');
    Add('ORDER BY                                          ');
    Add('  FUNCIONARIO.FUNCIONARIO                         ');
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
      Add('INSERT INTO FAT_FUNCIONARIO ( ');
      Add('  FUNCIONARIO,                ');
      Add('  DESC_FUNCIONARIO,           ');
      Add('  FAT_FUNCIONARIO,            ');
      Add('  FATURAMENTO,                ');
      Add('  QTDE                        ');
      Add(') VALUES (                    ');
      Add('  :FUNCIONARIO,               ');
      Add('  :DESC_FUNCIONARIO,          ');
      Add('  :FAT_FUNCIONARIO,           ');
      Add('  :FATURAMENTO,               ');
      Add('  :QTDE                       ');
      Add(')                             ');
      ParamByName('FUNCIONARIO'     ).AsInteger := qrRel.FieldByName('FUNCIONARIO').AsInteger;
      ParamByName('DESC_FUNCIONARIO').AsString  := qrRel.FieldByName('DESCRICAO'  ).AsString;
      ParamByName('FAT_FUNCIONARIO' ).AsFloat   := qrRel.FieldByName('TOTAL'      ).AsFloat;
      ParamByName('FATURAMENTO'     ).AsFloat   := qrFat.FieldByName('FAT'        ).AsFloat;
      ParamByName('QTDE'            ).AsInteger := qrRel.FieldByName('QTDE'       ).AsInteger;
      ExecSQL;
    end;
    qrRel.Next;
  end;
  frmPrincipal.ibtransacao.Commit;
end;

end.
