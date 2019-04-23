unit Tutorial02Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  BGRABitmap, BGRABitmapTypes,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    image: TBGRABitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  BOTTOM_MARGIN=40;
  {$IFDEF MSWINDOWS}
  PathImages='..\..\';
  {$ELSE}
  PathImages='../../';
  {$ENDIF}



procedure TForm1.FormCreate(Sender: TObject);
begin
  image := TBGRABitmap.Create(PathImages + 'image.png');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Refresh;  //erases windows
  image.Draw(Canvas,0,0,True);
end;


procedure TForm1.Button2Click(Sender: TObject);
var ImagePos: TPoint;
begin
  Refresh;  //erases windows
  ImagePos := Point( (ClientWidth - Image.Width) div 2,
                     (ClientHeight - Image.Height) div 2 );

  // test for negative position
  if ImagePos.X < 0 then ImagePos.X := 0;
  if ImagePos.Y < 0 then ImagePos.Y := 0;

  image.Draw(Canvas,ImagePos.X,ImagePos.Y,True);
end;

procedure TForm1.Button3Click(Sender: TObject);
var stretched: TBGRABitmap;
begin
  Refresh;  //erases windows
  stretched := image.Resample(ClientWidth, ClientHeight) as TBGRABitmap;
  stretched.Draw(Canvas,0,0,True);
  stretched.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var stretched: TBGRABitmap;
begin
  Refresh;  //erases windows
  stretched := image.Resample(ClientWidth, ClientHeight, rmSimpleStretch) as TBGRABitmap;
  stretched.Draw(Canvas,0,0,True);
  stretched.Free;
end;


procedure TForm1.Button5Click(Sender: TObject);
var stretched: TBGRABitmap;
begin
  Refresh;  //erases windows
  image.ResampleFilter := rfMitchell;
  stretched := image.Resample(ClientWidth, ClientHeight) as TBGRABitmap;
  stretched.Draw(Canvas,0,0,True);
  stretched.Free;
end;

end.
