unit tutorial07unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform, BGRAGradients,math;

const
  BOTTOM_MARGIN=40;

procedure TForm1.Button1Click(Sender: TObject);
var
  image: TBGRABitmap;
  pts: arrayOfTPointF;
  storedSpline: arrayOfTPointF;
  c: TBGRAPixel;

begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
    c := ColorToBGRA(ColorToRGB(clWindowText));

    //rectangular polyline
    setlength(pts,4);
    pts[0] := PointF(50,50);
    pts[1] := PointF(150,50);
    pts[2] := PointF(150,150);
    pts[3] := PointF(50,150);
    image.DrawPolylineAntialias(pts,BGRA(255,0,0,150),1);

    //compute spline points and draw as a polyline
    storedSpline := image.ComputeOpenedSpline(pts,ssVertexToSide);
    image.DrawPolylineAntialias(storedSpline,c,1);

     image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  image: TBGRABitmap;
  pts: arrayOfTPointF;
  storedSpline: arrayOfTPointF;
  c: TBGRAPixel;
  i: Integer;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
    c := ColorToBGRA(ColorToRGB(clWindowText));

    //rectangular polyline
    setlength(pts,4);
    pts[0] := PointF(50,50);
    pts[1] := PointF(150,50);
    pts[2] := PointF(150,150);
    pts[3] := PointF(50,150);
    image.DrawPolylineAntialias(pts,BGRA(255,0,0,150),1);

    //compute spline points and draw as a polyline
    storedSpline := image.ComputeOpenedSpline(pts,ssVertexToSide);
    image.DrawPolylineAntialias(storedSpline,c,1);

    for i := 0 to 3 do
      pts[i].x := pts[i].x + 200;
    image.DrawPolylineAntialias(pts,BGRA(255,0,0,150),1);

    storedSpline := image.ComputeClosedSpline(pts,ssVertexToSide);
    image.DrawPolygonAntialias(storedSpline,c,1);


    image.Draw(Canvas,0,0,True);
    image.free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  image: TBGRABitmap;
  pts: arrayOfTPointF;
  storedSpline: arrayOfTPointF;
  c: TBGRAPixel;
  i: Integer;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
    c := ColorToBGRA(ColorToRGB(clWindowText));

    //rectangular polyline
    setlength(pts,4);
    pts[0] := PointF(50,50);
    pts[1] := PointF(150,50);
    pts[2] := PointF(150,150);
    pts[3] := PointF(50,150);
    image.DrawPolylineAntialias(pts,BGRA(255,0,0,150),1);

    //compute spline points and draw as a polyline
    storedSpline := image.ComputeOpenedSpline(pts,ssVertexToSide);
    image.DrawPolylineAntialias(storedSpline,c,1);

    for i := 0 to 3 do
      pts[i].x := pts[i].x + 200;
    image.DrawPolylineAntialias(pts,BGRA(255,0,0,150),1);

    storedSpline := image.ComputeClosedSpline(pts,ssVertexToSide);
    image.DrawPolygonAntialias(storedSpline,c,1);

    storedSpline := image.ComputeBezierSpline([BezierCurve(PointF(50,50),PointF(150,50),PointF(150,100)),
                                               BezierCurve(PointF(150,100),PointF(150,150),PointF(50,150))]);
    image.DrawPolylineAntialias(storedSpline,c,2);


    image.Draw(Canvas,0,0,True);
    image.free;
end;

end.

