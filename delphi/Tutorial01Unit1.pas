unit Tutorial01Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,BGRABitmap, BGRABitmapTypes;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
var bmp: TBGRABitmap;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight,BGRABlack);
  bmp.FillRect(20,20,100,40,BGRA(255,192,0),dmSet);
  bmp.Draw(Canvas,0,0,True);
  bmp.Free;
end;

end.
