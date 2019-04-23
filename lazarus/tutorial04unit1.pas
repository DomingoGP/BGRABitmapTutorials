unit tutorial04unit1;

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
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform;

const
  BOTTOM_MARGIN=40;


  PathImages=''; // '../../';



procedure TForm1.Button1Click(Sender: TObject);
var x,y: integer;
    p: PBGRAPixel;
    image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

  for y := 0 to image.Height-1 do
  begin
    p := image.Scanline[y];
    for x := 0 to image.Width-1 do
    begin
      p^.red := x*256 div image.Width;
      p^.green := y*256 div image.Height;
      p^.blue := 0;
      p^.alpha := 255;
      inc(p);
    end;
  end;
  image.InvalidateBitmap; // changed by direct access

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var x,y: integer;
    p: PBGRAPixel;
    image: TBGRABitmap;
    hsla: THSLAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);
  hsla.lightness := 32768;
  hsla.alpha := 65535;
  for y := 0 to image.Height-1 do
  begin
    p := image.Scanline[y];
    hsla.saturation := y*65536 div image.Height;
    for x := 0 to image.Width-1 do
    begin
      hsla.hue := x*65536 div image.Width;
      p^:= HSLAToBGRA(hsla);
      inc(p);
    end;
  end;
  image.InvalidateBitmap; // changed by direct access

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var x,y: integer;
    p: PBGRAPixel;
    image: TBGRABitmap;
    hsla: THSLAPixel;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);
  hsla.lightness := 32768;
  hsla.alpha := 65535;
  for y := 0 to image.Height-1 do
  begin
    p := image.Scanline[y];
    hsla.saturation := y*65536 div image.Height;
    for x := 0 to image.Width-1 do
    begin
      hsla.hue := x*65536 div image.Width;
      p^:= GSBAToBGRA(hsla);
      inc(p);
    end;
  end;
  image.InvalidateBitmap; // changed by direct access

  image.Draw(Canvas,0,0,True);
  image.free;
end;

end.

