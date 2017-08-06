unit Balanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmBalanco = class(TForm)
    pc: TPageControl;
    Panel1: TPanel;
    tbFechar: TTabSheet;
    tbOpcoes: TTabSheet;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    edtDescBalanco: TEdit;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanco: TfrmBalanco;

implementation

{$R *.dfm}

end.
