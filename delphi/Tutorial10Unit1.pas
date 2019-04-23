unit Tutorial10Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button0: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform;

const
  BOTTOM_MARGIN=40;
  PathImages='..\..\';

procedure TForm1.Button0Click(Sender: TObject);
var
    tex: TBGRABitmap;
begin
  tex:= TBGRABitmap.Create(PathImages+'image.png'); //load a bitmap
  tex.Draw(Canvas,0,0,True); //draw on the screen
  tex.Free;
end;


procedure TForm1.Button1Click(Sender: TObject);
var image: TBGRABitmap;
    tex: TBGRABitmap;
begin
  //black background
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, BGRABlack );

  tex:= TBGRABitmap.Create(PathImages+'image.png'); //load a bitmap
  image.FillPolyAntialias( [PointF(110,10), PointF(250,10), PointF(350,160), PointF(10,160)], tex);
  tex.Free;
  image.Draw(Canvas,0,0,True); //draw on the screen
  image.free;
end;


//Affine transformation
procedure TForm1.Button2Click(Sender: TObject);
var image: TBGRABitmap;
    tex: TBGRABitmap;
    affine: TBGRAAffineBitmapTransform;

begin
  //black background
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, BGRABlack );

  tex:= TBGRABitmap.Create(PathImages+'image.png'); //load a bitmap

  //create a rotation of 45°
  affine := TBGRAAffineBitmapTransform.Create(tex,True);
  affine.RotateDeg(45);

  //use this transformation as parameter instead of tex
  image.FillPolyAntialias( [PointF(110,10), PointF(250,10), PointF(350,160), PointF(10,160)], affine);

  affine.Free;
  tex.Free;

  image.Draw(Canvas,0,0,True); //draw on the screen
  image.free;
end;

//Linear mapping stretched the image linearly along the borders
procedure TForm1.Button3Click(Sender: TObject);
var image: TBGRABitmap;
    tex: TBGRABitmap;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, BGRABlack );

  tex:= TBGRABitmap.Create(PathImages+'image.png');
  image.FillPolyLinearMapping( [PointF(110,10), PointF(250,10), PointF(350,160), PointF(10,160)], tex,
             [PointF(0,0), PointF(tex.width-1,0), PointF(tex.Width-1,tex.Height-1), PointF(0,tex.Height-1)], true);
  tex.Free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;


//The perspective mapping allow to change the depth of each point.
procedure TForm1.Button4Click(Sender: TObject);
var image: TBGRABitmap;
    tex: TBGRABitmap;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, BGRABlack );

  tex:= TBGRABitmap.Create(PathImages+'image.png');
  image.FillPolyPerspectiveMapping( [PointF(110,10), PointF(250,10), PointF(350,160), PointF(10,160)],
                                    [75,             75,             50,              50],
       tex, [PointF(0,0), PointF(tex.width-1,0), PointF(tex.Width-1,tex.Height-1), PointF(0,tex.Height-1)], true);
  tex.Free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

end.
