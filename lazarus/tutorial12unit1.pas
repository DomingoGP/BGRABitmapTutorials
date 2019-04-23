unit tutorial12unit1;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform,BGRAGradientScanner,bgratext,bgratextfx;


const
  BOTTOM_MARGIN=40;


procedure TForm1.Button1Click(Sender: TObject);
var
  image: TBGRABitmap;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, ColorToBGRA(ColorToRGB(clBtnFace)) );
  c := ColorToBGRA(ColorToRGB(clBtnText)); //retrieve default text color

  image.FontHeight := 30;
  image.FontAntialias := true;
  image.FontStyle := [fsBold];
  image.TextOut(5,5,'Hello world',c);
  image.SetPixel(5,5,c);

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  image: TBGRABitmap;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, ColorToBGRA(ColorToRGB(clBtnFace)) );
  c := ColorToBGRA(ColorToRGB(clBtnText)); //retrieve default text color

  image.FontHeight := 30;
  image.FontAntialias := true;
  image.FontStyle := [fsBold];
  image.TextOut(ClientWidth-5,5,'Hello world',c,taRightJustify);
  image.SetPixel(ClientWidth-5,5,c);

  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  image: TBGRABitmap;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, ColorToBGRA(ColorToRGB(clBtnFace)) );
  c := ColorToBGRA(ColorToRGB(clBtnText)); //retrieve default text color

  image.FontHeight := 30;
  image.FontAntialias := true;
  image.FontStyle := [fsBold];
  image.TextOutAngle(30,5,-450,'Hello world',c, taLeftJustify);
  image.SetPixel(30,5,c);
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  image: TBGRABitmap;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, ColorToBGRA(ColorToRGB(clBtnFace)) );
  c := ColorToBGRA(ColorToRGB(clBtnText)); //retrieve default text color

  image.FontHeight := 30;
  image.FontAntialias := true;
  image.FontStyle := [fsBold];
  image.TextRect(rect(5,5,ClientWidth-5,ClientHeight-BOTTOM_MARGIN-5),'This is a text that should be word wrapped',taCenter,tlCenter,c);
  image.Rectangle(rect(5,5,ClientWidth-5,ClientHeight-BOTTOM_MARGIN-5),c,dmSet);  image.SetPixel(30,5,c);
  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  image,txt: TBGRACustomBitmap;
  grad: TBGRAGradientScanner;
  c: TBGRAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN, ColorToBGRA(ColorToRGB(clBtnFace)) );
  c := ColorToBGRA(ColorToRGB(clBtnText));

  txt := TextShadow(ClientWidth,ClientHeight,'Hello world',30,c,BGRABlack,5,5,5);
  image.PutImage(0,0,txt,dmDrawWithTransparency);
  txt.Free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button6Click(Sender: TObject);
var
  image: TBGRABitmap;
  grad: TBGRAGradientScanner;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, ColorToBGRA(ColorToRGB(clBtnFace)) );

  grad := TBGRAGradientScanner.Create(BGRA(255,255,0),BGRA(255,0,0),gtLinear,PointF(0,0),PointF(0,35),True,True);
  image.FontHeight := 30;
  image.FontAntialias := true;
  image.FontStyle := [fsBold];
  image.TextOut(6,6,'Hello world',BGRABlack);  //draw a black border
  image.TextOut(5,5,'Hello world',grad);       //draw gradient text
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;


end.

