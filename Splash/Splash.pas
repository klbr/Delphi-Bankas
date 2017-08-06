unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, TFlatProgressBarUnit, StdCtrls,
  RXCtrls, Animate, GIFCtrl;

type
  TfrmSplash = class(TForm)
    prog: TFlatProgressBar;
    p: TFlatPanel;
    lblInfo: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    imTitulo: TRxGIFAnimator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses Principal, Main;
{$R *.dfm}

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  loSplash := nil;
  Action := caFree;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
//  if FileExists(DiretorioExe+'Fundo.bmp') then
//  begin
//    ima.Picture.LoadFromFile(DiretorioExe+'Fundo.bmp');
//    ima.Repaint;
//    Application.ProcessMessages;
//  end;
end;

end.
