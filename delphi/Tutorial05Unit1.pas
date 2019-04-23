unit Tutorial05Unit1;

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
    cbMode: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawScene(ASteps:Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform;

const
  BOTTOM_MARGIN=40;
  {$IFDEF MSWINDOWS}
  PathImages='..\..\';
  {$ELSE}
  PathImages='../../';
  {$ENDIF}

procedure TForm1.Button1Click(Sender: TObject);
var temp,tex,mask: TBGRABitmap;
begin
  temp:= TBGRABitmap.Create(640,480,ColorToBGRA(ColorToRGB(clBtnFace)));

  //loading and scaling texture
  tex := TBGRABitmap.Create(PathImages+'image.png');
  BGRAReplace(tex,tex.Resample(128,80));

  //show image in the upper-left corner
  temp.PutImage(10,10,tex,dmDrawWithTransparency);

  //create a mask with ellipse and rectangle
  mask := TBGRABitmap.Create(128,80,BGRABlack);
  mask.FillEllipseAntialias(40,40,30,30,BGRAWhite);
  mask.FillRectAntialias(60,40,100,70,BGRAWhite);

  //show mask in the upper-right corner
  temp.PutImage(150,10,mask,dmDrawWithTransparency);

  //apply the mask to the image
  tex.ApplyMask(mask);

  //show the result image in the lower-left corner
  temp.PutImage(10,100,tex,dmDrawWithTransparency);

  mask.Free;
  tex.Free;

  //show everything on the screen
  temp.Draw(Canvas,0,0,True);
  temp.Free;
end;


procedure TForm1.Button2Click(Sender: TObject);
var image,tex: TBGRABitmap;
begin
  image := TBGRABitmap.Create(640,480,ColorToBGRA(ColorToRGB(clBtnFace)));

  //load and scale texture
  tex := TBGRABitmap.Create(PathImages+'image.png');
  BGRAReplace(tex,tex.Resample(128,80));

  //show image
  image.PutImage(10,10,tex,dmDrawWithTransparency);

  //erase parts
  tex.EraseEllipseAntialias(40,40,30,30,255);
  tex.EraseEllipseAntialias(80,40,30,30,128);

  //show result
  image.PutImage(10,100,tex,dmDrawWithTransparency);

  tex.Free;

  //show everything on the screen
  image.Draw(Canvas,0,0,True);
  image.Free;
end;

procedure TForm1.DrawScene(ASteps:Integer);
var image: TBGRABitmap;
    size: single;
     mode: TDrawMode;

  procedure DrawMoon;
  var layer: TBGRABitmap;
  begin
    layer := TBGRABitmap.Create(image.Width,image.Height);
    layer.FillEllipseAntialias(layer.Width/2,layer.Height/2,size*0.4,size*0.4,BGRA(224,224,224,128));
    layer.EraseEllipseAntialias(layer.Width/2+size*0.15,layer.Height/2,size*0.3,size*0.3,255);
    image.PutImage(0,0,layer,dmDrawWithTransparency);
    layer.Free;
  end;

  procedure DrawSun;
  var layer,mask: TBGRABitmap;
  begin
    layer := TBGRABitmap.Create(image.Width,image.Height);
    layer.GradientFill(0,0,layer.Width,layer.Height,
                       BGRA(255,255,0),BGRA(255,0,0),
                       gtRadial,PointF(layer.Width/2,layer.Height/2-size*0.15),PointF(layer.Width/2+size*0.45,layer.Height/2-size*0.15),
                       dmSet);
    mask := TBGRABitmap.Create(layer.Width,layer.Height,BGRABlack);
    mask.FillEllipseAntialias(layer.Width/2+size*0.15,layer.Height/2,size*0.25,size*0.25,BGRAWhite);
    layer.ApplyMask(mask);
    mask.Free;
    image.PutImage(0,0,layer,dmDrawWithTransparency);
    layer.Free;
  end;

  procedure ApplyLight;
  var layer: TBGRABitmap;
  begin
    layer := TBGRABitmap.Create(image.Width,image.Height);
    layer.GradientFill(0,0,layer.Width,layer.Height,
                       BGRA(255,255,255),BGRA(64,64,64),
                       gtRadial,PointF(layer.Width*5/6,layer.Height/2),PointF(layer.Width*1/3,layer.Height/4),
                       dmSet);
    image.BlendImage(0,0,layer,boMultiply);
    layer.Free;
  end;


begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN);

  //Compute available space in both directions
  if image.Height < image.Width then
    size := image.Height
  else
    size := image.Width;

  image.GradientFill(0,0,image.Width,image.Height,
                     BGRA(128,192,255),BGRA(0,0,255),
                     gtLinear,PointF(0,0),PointF(0,image.Height),
                     dmSet);

  DrawMoon;
  if aSteps>1 then
    DrawSun;
  if aSteps>2 then
    ApplyLight;

if ASteps=4 then
begin
  case cbMode.ItemIndex of
    0: mode:=dmFastBlend;
    1: mode:=dmDrawWithTransparency;
    2: mode:=dmSet;
    3: mode:=dmXor;
  end;
  image.FillRect(260,60,420,210,BGRA(0,255,0,127),mode);
end;

  image.Draw(Canvas,0,0,True);
  image.free;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  DrawScene(1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DrawScene(2);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  DrawScene(3);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   DrawScene(4);
end;

end.
