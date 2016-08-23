unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edit1: TEdit;
    btn1: TButton;
    procedure edit1DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stroka_rezerv :string;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.edit1DblClick(Sender: TObject);
var
  stroka :string;
begin
  stroka_rezerv := edit1.Text;
  stroka := ZamenaURL( stroka_rezerv );
  edit1.Text := stroka;
  edit1.SelectAll;
  edit1.CopyToClipboard;
  
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  edit1.Text := stroka_rezerv;
end;

end.
