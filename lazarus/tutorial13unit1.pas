unit Tutorial13unit1;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform,BGRAGradientScanner;


const
  BOTTOM_MARGIN=40;


procedure TForm1.Button1Click(Sender: TObject);
var image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(10,10);
  with image.Canvas do
  begin
    //clear with white
    brush.color := clWhite;
    //    FillRect(0,0,image.width,image.height);
    FillRect(Rect(0,0,image.Width,image.Height));
    //blue ellipse with black border
    brush.style := bsClear;
    pen.color := clBlack;
    Ellipse(0,0,9,9);
  end;
  //stretch the image so we can see the pixels
  BGRAReplace(image,image.Resample(image.Width*10,image.Height*10,rmSimpleStretch));
  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(10,10);
  with image.CanvasBGRA do
  begin
    //clear with white
    brush.color := clWhite;
    //    FillRect(0,0,image.width,image.height);
    FillRect(Rect(0,0,image.Width,image.Height));
    //blue ellipse with black border
    brush.style := bsClear;
    pen.color := clBlack;
    Ellipse(0,0,9,9);
  end;
  //stretch the image so we can see the pixels
  BGRAReplace(image,image.Resample(image.Width*10,image.Height*10,rmSimpleStretch));
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(9,9,BGRAWhite);
  image.FillEllipseAntialias(4,4, 4,4, BGRABlack);
  BGRAReplace(image,image.Resample(image.Width*10,image.Height*10,rmSimpleStretch));
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button4Click(Sender: TObject);
var image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(9,9,BGRAWhite);
  image.FillEllipseAntialias(4,4, 4.5,4.5, BGRABlack);
  BGRAReplace(image,image.Resample(image.Width*10,image.Height*10,rmSimpleStretch));
  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button5Click(Sender: TObject);
var image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(10,10);
  with image.Canvas do
  begin
    //clear with white
    brush.color := clWhite;
    //FillRect(0,0,image.width,image.height);
    FillRect(Rect(0,0,image.Width,image.Height));
    brush.color := clBlue;
    {$IFDEF FPC}
    pen.style := Graphics.psClear;
    {$ELSE}
    pen.style := Vcl.Graphics.psClear;
    {$ENDIF}
    Ellipse(0,0,9,9);
  end;
  //stretch the image so we can see the pixels
  BGRAReplace(image,image.Resample(image.Width*10,image.Height*10,rmSimpleStretch));
  image.Draw(Canvas,0,0,True);
  image.free;
end;


end.

