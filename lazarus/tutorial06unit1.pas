unit tutorial06unit1;

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
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes, BGRAGradients,math;

const
  BOTTOM_MARGIN=40;
  PathImages='';//'..\..\';

procedure TForm1.Button1Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));

  image.RectangleAntialias(80,80,300,200,c,50);

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));

  image.JoinStyle := pjsRound;
  image.RectangleAntialias(80,80,300,200,c,50);

  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));

  image.FillRoundRectAntialias(80,80,300,200, 20,20, c, [rrTopRightSquare,rrBottomLeftSquare]);
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button4Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));
    image.JoinStyle := pjsBevel;
    image.PenStyle := psDot;
    image.DrawPolyLineAntialias([PointF(40,200), PointF(120,100), PointF(170,140), PointF(250,60)],c,10);
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button5Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));
    image.JoinStyle := pjsBevel;
    image.LineCap := pecSquare;
    image.PenStyle := psSolid;
    image.DrawPolyLineAntialias([PointF(40,200), PointF(120,100), PointF(170,140), PointF(250,60)],c,10);
  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button6Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));
    image.JoinStyle := pjsBevel;
    //image.LineCap := pecSquare;
    image.PenStyle := psSolid;
    image.DrawPolyLineAntialias([PointF(40,200), PointF(120,100), PointF(170,140), PointF(250,60)],c,10,false);
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button7Click(Sender: TObject);
var image: TBGRABitmap;
    c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
 c := BGRA(0,0,0,128);

    image.DrawLineAntialias(40,150, 120,50, c, 10);
    image.DrawLineAntialias(120,50, 170,90, c, 10);
    image.DrawLineAntialias(170,90, 250,10, c, 10);

    image.DrawLineAntialias(40,250, 120,150, c, 10, False);
    image.DrawLineAntialias(120,150, 170,190, c, 10, False);
    image.DrawLineAntialias(170,190, 250,110, c, 10, True); image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  image: TBGRABitmap;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  c := ColorToBGRA(ColorToRGB(clWindowText));

 // image.JoinStyle := pjsMiter;  //va bien
 // image.PenStyle := psSolid;

  image.RectangleAntialias(80,80,300,200,c,10);
  image.JoinStyle := pjsBevel;


  //image.PenStyle := psDot;

  image.DrawPolyLineAntialias([PointF(40,200), PointF(120,100), PointF(170,140), PointF(250,60)],c,10);
  image.DrawPolyLineAntialias([PointF(100,200), PointF(200,60)],c,10);

  image.PenStyle := psDot;

   c:=BGRA(200,0,0);
   image.DrawPolyLineAntialias([PointF(40,200), PointF(120,100), PointF(170,140), PointF(250,60)],c,8);
   image.DrawPolyLineAntialias([PointF(100,200), PointF(200,60)],c,8);

  image.PenStyle := psSolid;
  image.DrawLineAntialias(20,280,260,280,c,10,true);


  image.PenStyle := psDot;
  image.DrawLineAntialias(20,300,260,300,c,10,true);

  image.PenStyle := psDash;
  image.DrawLineAntialias(20,320,260,320,c,10,true);

  image.PenStyle := psDashDot;
  image.DrawLineAntialias(20,340,260,340,c,10,true);

  image.PenStyle := psDashDotDot;
  image.DrawLineAntialias(20,340,260,340,c,10,true);


  image.Draw(Canvas,0,0,True);
  image.free;

end;
procedure TForm1.Button9Click(Sender: TObject);
var
  image,textura: TBGRABitmap;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  image.DrawPolygonAntialias([PointF(50,50),PointF(100,100),PointF(75,150),PointF(50,100)],BGRA(200,0,0),3,BGRA(0,200,0));


    image.DrawPolygonAntialias([PointF(50,150),PointF(100,200),PointF(75,250),PointF(50,200)],BGRA(200,0,0),3,BGRA(0,200,0));


  textura:=TBGRABitmap.Create(  PathImages+'textura.png');

  image.DrawPolygonAntialias([PointF(50,350),PointF(200,475),PointF(75,450),PointF(50,400)],textura,3);
  image.DrawPolygonAntialias([PointF(250,150),PointF(350,200),PointF(275,250),PointF(250,200)],BGRA(200,0,0),3,BGRA(0,200,0));

  image.fillPolyAntialias([PointF(300,150),PointF(450,200),PointF(475,450),PointF(300,400)],textura,true);

  image.Draw(Canvas,0,0,True);
  textura.Draw(Canvas,300,50,true);

  image.free;
  textura.free;


end;


end.

