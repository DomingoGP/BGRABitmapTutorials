unit Tutorial08Unit1;

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
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
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
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform, BGRAGradients,math;

const
  BOTTOM_MARGIN=40;


procedure TForm1.Button1Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
  c: TBGRAPixel;
  x,y,rx,ry: single;

begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,ColorToBGRA(ColorToRGB(clBtnFace)));
    c := ColorToBGRA(ColorToRGB(clWindowText));

    //ellipse coordinates
    x := 150;
    y := 100;
    rx := 100;
    ry := 50;

    //loads a "diagcross" brush with white pattern and orange background
    tex := image.CreateBrushTexture(bsDiagCross,BGRAWhite,BGRA(255,192,0)) as TBGRABitmap;

    image.FillEllipseAntialias(x,y,rx-0.5,ry-0.5,tex);
    image.EllipseAntialias(x,y,rx,ry,c,1); //draw outline

    tex.Free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
  c: TBGRAPixel;
  x,y,rx,ry: single;

begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,ColorToBGRA(ColorToRGB(clBtnFace)));
    c := ColorToBGRA(ColorToRGB(clWindowText));

    //ellipse coordinates
    x := 150;
    y := 100;
    rx := 100;
    ry := 50;

    //loads a "diagcross" brush with white pattern and orange background
    tex := image.CreateBrushTexture(bsDiagCross,BGRAWhite,BGRA(255,192,0)) as TBGRABitmap;

    image.FillEllipseAntialias(x,y,rx-0.5,ry-0.5,tex);
    image.EllipseAntialias(x,y,rx,ry,c,1); //draw outline

    image.RoundRectAntialias(x-rx-10,y-ry-10,x+rx+10,y+ry+10,20,20,c,11);
    image.RoundRectAntialias(x-rx-10,y-ry-10,x+rx+10,y+ry+10,20,20,tex,9);


    tex.Free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  image,tex: TBGRABitmap;

begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

    tex := CreateCyclicPerlinNoiseMap(100,100);
    image.FillRect(0,0,image.Width,image.Height, tex, dmSet);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;


function Interp256(value1,value2,position: integer): integer;overload; inline;
begin
     result := (value1*(256-position) + value2*position) shr 8;
end;

function Interp256(color1,color2: TBGRAPixel; position: integer): TBGRAPixel;overload; inline;
begin
     result.red := Interp256(color1.red,color2.red, position);
     result.green := Interp256(color1.green,color2.green, position);
     result.blue := Interp256(color1.blue,color2.blue, position);
     result.alpha := Interp256(color1.alpha,color2.alpha, position);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
   p: PBGRAPixel;
   i:Integer;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

    tex := CreateCyclicPerlinNoiseMap(100,100);

    p := tex.Data;
    for i := 0 to tex.NbPixels-1 do
    begin
      p^ := Interp256( BGRA(0,128,0), BGRA(192,255,0), p^.red );
      inc(p);
    end;


    image.FillRect(0,0,image.Width,image.Height, tex, dmSet);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;


procedure TForm1.Button5Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
   p: PBGRAPixel;
   i:Integer;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

    tex := CreateCyclicPerlinNoiseMap(100,100);

    p := tex.Data;
    for i := 0 to tex.NbPixels-1 do
    begin
      if p^.red > 196 then
        p^ := BGRA(192,160,96) else //island
        p^ := BGRA(0,128,196); //sea
      inc(p);
    end;


    image.FillRect(0,0,image.Width,image.Height, tex, dmSet);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
   p: PBGRAPixel;
   i:Integer;
    v: Integer;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

    tex := CreateCyclicPerlinNoiseMap(100,100);

    p := tex.Data;
    for i := 0 to tex.NbPixels-1 do
    begin
      v := p^.red;
      if v < 64 then p^:= BGRA(31,33,46) else
      if v < 128 then p^:= BGRA(89,71,57) else
      if v < 192 then p^:= BGRA(80,106,67) else
        p^:= BGRA(161,157,121);
      inc(p);
    end;


    image.FillRect(0,0,image.Width,image.Height, tex, dmSet);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;


function CreateCustomTexture(tx,ty: integer): TBGRABitmap;
  var
    colorOscillation: integer;
    p: PBGRAPixel;
    i: Integer;
  begin
    result := CreateCyclicPerlinNoiseMap(tx,ty,1,1,1);
    p := result.Data;
    for i := 0 to result.NbPixels-1 do
    begin
      colorOscillation := round(((sin(p^.red*Pi/32)+1)/2)*256);
      p^ := Interp256(BGRA(181,157,105),BGRA(228,227,180),colorOscillation);
      inc(p);
    end;
  end;

function CreateCustomTexture2(tx,ty: integer): TBGRABitmap;
  var
    colorOscillation: integer;
    p: PBGRAPixel;
    i: Integer;
  begin
    result := CreateCyclicPerlinNoiseMap(tx,ty,1,1,1);
    p := result.Data;
    for i := 0 to result.NbPixels-1 do
    begin
      colorOscillation := round(power((sin(p^.red*Pi/80)+1)/2,0.2)*256);
      p^ := Interp256(BGRA(181,157,105),BGRA(228,227,180),colorOscillation);
      inc(p);
    end;
  end;



procedure TForm1.Button7Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));

    tex := CreateCustomTexture(100,100);
    image.FillRoundRectAntialias(20,20,300,200,20,20,tex);
    image.RoundRectAntialias(20,20,300,200,20,20,BGRABlack,1);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));

    tex := CreateCustomTexture2(100,100);
    image.FillRoundRectAntialias(20,20,300,200,20,20,tex);
    image.RoundRectAntialias(20,20,300,200,20,20,BGRABlack,1);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

function CreateWoodTexture(tx,ty: integer): TBGRABitmap;
  var
    colorOscillation, globalColorVariation: integer;
    p: PBGRAPixel;
    i: Integer;
  begin
    result := CreateCyclicPerlinNoiseMap(tx,ty);
    p := result.Data;
    for i := 0 to result.NbPixels-1 do
    begin
      colorOscillation := round(sqrt((sin(p^.red*Pi/16)+1)/2)*256);
      globalColorVariation := p^.red;
      p^:= Interp256( Interp256(BGRA(247,188,120),BGRA(255,218,170),colorOscillation),
                      Interp256(BGRA(157,97,60),BGRA(202,145,112),colorOscillation), globalColorVariation);
      inc(p);
    end;
  end;

 function CreateVerticalWoodTexture(tx,ty: integer): TBGRABitmap;
  var
    globalPos: single;
    colorOscillation, globalColorVariation: integer;
    p: PBGRAPixel;
    i: Integer;
    x: integer;
  begin
    result := CreateCyclicPerlinNoiseMap(tx,ty);
    p := result.Data;
    x := 0;
    for i := 0 to result.NbPixels-1 do
    begin
      globalPos := p^.red*Pi/32+x*2*Pi/tx*8;
      colorOscillation := round(sqrt((sin(globalPos)+1)/2)*256);
      globalColorVariation := round(sin(globalPos/8)*128+128);
      p^:= Interp256( Interp256(BGRA(247,188,120),BGRA(255,218,170),colorOscillation),
                      Interp256(BGRA(157,97,60),BGRA(202,145,112),colorOscillation), globalColorVariation);
      inc(p);
      inc(x);
      if x = tx then x := 0;
    end;
  end;


procedure TForm1.Button9Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));

    tex := CreateWoodTexture(100,100);
    image.FillRoundRectAntialias(20,20,300,200,20,20,tex);
    image.RoundRectAntialias(20,20,300,200,20,20,BGRABlack,1);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  image,tex: TBGRABitmap;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));

    tex := CreateVerticalWoodTexture(100,100);
    image.FillRoundRectAntialias(20,20,300,200,20,20,tex);
    image.RoundRectAntialias(20,20,300,200,20,20,BGRABlack,1);
    tex.free;

    image.Draw(Canvas,0,0,True);
    image.free;
end;


end.
