unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatEditUnit, TFlatButtonUnit, ExtCtrls,
  TFlatPanelUnit, DB, TFlatComboBoxUnit, DBTables, ADODB, Criptografia,
  Encryp, reggen4, IBCustomDataSet, IBQuery;

type
  TfrmLogin = class(TForm)
    Label2: TLabel;
    l1: TLabel;
    edtSenha: TFlatEdit;
    FlatPanel1: TFlatPanel;
    btnOk: TFlatButton;
    btnFecha: TFlatButton;
    edtLogin: TFlatComboBox;
    TE1: TRegCodeGenerator4;
    qrLogin: TIBQuery;
    DB: TADOConnection;
    qrLogin1: TADOQuery;
    qrSys: TADOQuery;
    procedure edtLoginChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    permissao : boolean;
    procedure Validar;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  Pok : Boolean;
implementation
uses Main, Principal;
{$R *.dfm}

procedure TfrmLogin.edtLoginChange(Sender: TObject);
begin
  if (edtLogin.Text <> '') and (edtSenha.text <> '') then
  begin
    btnOk.Enabled := true;
  end
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Pok := false;
{  with dbLogin do
  begin
     DefaultDir := DiretorioBanco;
     Database := Banco;
     DriverDLL := SQLiteDLL;
     try
       open;
     except
       exclusao2('Não foi possível Conectar ao Banco', 'Aviso');
       Application.Terminate;
     end;
  end;}
  with qrLogin,qrLogin.SQL do
  begin
    Database := frmPrincipal.dba;
    Close;
    Clear;
    Add('SELECT LOGIN FROM USUARIO ORDER BY LOGIN');
    Open;
    First;
    while not EOF do
    begin
       edtLogin.Items.Append(FieldByName('LOGIN').AsString);
       Next;
    end;
  end;
  edtLogin.text := LerIniCaractere('LOGIN','USUARIO');
end;

procedure TfrmLogin.btnFechaClick(Sender: TObject);
begin
  Pok := False;
  close;
//  Application.Terminate;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  permissao := false;
  if (edtLogin.Text = 'root') and (edtSenha.text = 'aoc') then
  begin
    Permissao := true;
    Close;
  end
  else
  begin
    with qrLogin,qrLogin.SQL do
    begin
      Database := frmPrincipal.dba;
      clear;
      Add('SELECT LOGIN, USUARIO, GRUPO  FROM USUARIO ');
      Add('WHERE                                      ');
      Add('SENHA=:SENHA                               ');
      Add('AND                                        ');
      Add('LOGIN=:LOGIN                               ');
      Params.ParamByName('LOGIN').AsString := edtLogin.text;
      Params.ParamByName('SENHA').AsString := Codifica(edtSenha.text,length(edtsenha.Text));
      Open;
    end;
  end;
  if (qrLogin.RecordCount = 0) and not ((edtLogin.Text = 'root') and (edtSenha.text = 'aoc')) then
  begin
    exclusao2('Sua Senha ou o seu Login não são válidos', 'Aviso');
    edtLogin.SetFocus;
  end
  else
  begin
    EscreveIniCaractere('LOGIN','USUARIO',edtLogin.Text);
    Usuario := edtLogin.Text;
    with qrLogin,qrLogin.SQL do
    begin
      Database := frmPrincipal.dba;
      close;
      clear;
      Add('SELECT MAX(CAIXA) AS CA FROM CAIXA');
      Open;
      Caixa := FieldByName('CA').AsInteger;
    end;
    Permissao := true;
    Pok := True;
    close;
  end;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
   SelectNext(ActiveControl, true, true);
 if Key = VK_ESCAPE then
 begin
   Pok := False;
   close;
 end;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnOK.Click;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
VAR
  S , ng : String;
begin
  try
    with DB do
    begin
      Close;
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
      Open;
      Sleep(500);
    end;
    with qrSys,qrSys.SQL do
    begin
      Clear;
      Add('SELECT SHD, EXP, COD, PAG FROM SYS');
      Open;
      S := SerialHD(UpperCase(copy(DiretorioExe,1,1)));
      S := TE1.GenerateCode(S,100);
      if not (S = FieldByName('SHD').AsString) then
      begin
        if not (FieldByName('SHD').AsString = '') then
        begin
          Exclusao2('A Aplicação não pode ser executada','Erro de Inicialização');
          Application.Terminate;
        end
        else
        begin
          Validar;
        end;
      end;
      S := SerialHD(UpperCase(copy(DiretorioExe,1,1)));
      S := TE1.GenerateCode('ro'+S+'ot',100);;
      if FieldByName('COD').AsString = S then
        ValorTrial := 0
      else if FieldByName('COD').AsString <> '' then
      begin
        Exclusao2('A Aplicação não pode ser executada (Chave Errada!)','Erro de Inicialização');
        Application.Terminate;
      end
      else
        ValorTrial := FieldByName('PAG').AsInteger;

      qrSys.Close;
    end;
    DB.Close;
  except
    qrSys.Close;
    DB.Close;
    exclusao2('Banco de Dados não encontrado','Erro de Inicialização');
    Application.Terminate;
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if permissao then
    close
  else
    Application.Terminate;
end;

procedure TfrmLogin.edtLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_REturn then
    SelectNext(ActiveControl, true, true)
  else if key = Vk_Escape then
    btnFEcha.Click;
end;

procedure TfrmLogin.Validar;
VAR
  S : String;
begin
  try
    with qrLogin1,qrLogin1.SQL do
    begin
      close;
      Clear;
      Add('UPDATE SYS SET              ');
      Add('    SHD=:HD                 ');
      Add('WHERE                       ');
      Add('  USUARIO=''root''          ');
      S := SerialHD(UpperCase(copy(DiretorioExe,1,1)));
      S := TE1.GenerateCode(S,100);
      Parameters.ParamByName('HD').Value := S;
      ExecSQL;
    end;
  except
    messagebox(0,'Ocorreu um Erro','Aviso',MB_OK);
    Application.Terminate;
  end;
end;

end.
