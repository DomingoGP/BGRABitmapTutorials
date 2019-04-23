unit Tutorial09Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform, BGRAGradients,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    phong: TPhongShading;
    chocolate: TBGRABitmap;
    stone: TBGRABitmap;
    water: TBGRABitmap;
    snow: TBGRABitmap;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


const
  BOTTOM_MARGIN=40;

function CreateChocolateTexture(tx,ty: integer): TBGRABitmap;
var
  square,map: TBGRABitmap;
  phong: TPhongShading;
  margin: integer;
begin
  margin := tx div 20;
  square := CreateRectangleMap(tx-2*margin,ty-2*margin,tx div 8);
  map := TBGRABitmap.Create(tx,ty,BGRABlack);
  map.PutImage(margin,margin,square,dmDrawWithTransparency);
  BGRAReplace(map,map.FilterBlurRadial(tx div 40,rbFast));
  square.free;

  result := TBGRABitmap.Create(tx,ty);
  phong := TPhongShading.Create;
  phong.LightSourceDistanceFactor := 0;
  phong.LightDestFactor := 0;
  phong.LightSourceIntensity := 200;
  phong.AmbientFactor := 0.5;
  phong.LightPosition := Point(-50,-100);
  phong.LightPositionZ := 80;
  phong.Draw(result,map,20,0,0,BGRA(86,41,38));
  map.Free;
  phong.Free;
end;


  function CreateStoneTexture(tx,ty: integer): TBGRABitmap;
  var
    temp: TBGRABitmap;
    phong: TPhongShading;
  begin
    result := CreateCyclicPerlinNoiseMap(tx,ty,1,1,0.6);
    temp:= result.GetPart(rect(-2,-2,tx+2,ty+2)) as TBGRABitmap;

    phong := TPhongShading.Create;
    phong.LightSourceDistanceFactor := 0;
    phong.LightDestFactor := 0;
    phong.LightSourceIntensity := 100;
    phong.LightPositionZ := 100;
    phong.NegativeDiffusionFactor := 0.3;
    phong.AmbientFactor := 0.5;
    phong.Draw(result,temp,30,-2,-2,BGRA(170,170,170));

    phong.Free;
    temp.Free;
  end;

function CreateWaterTexture(tx,ty: integer): TBGRABitmap;
const blurSize = 5;
var
  temp: TBGRABitmap;
  phong: TPhongShading;
begin
  result := CreateCyclicPerlinNoiseMap(tx,ty,1,1,1.2);
  temp:= result.GetPart(rect(-blurSize,-blurSize,tx+blurSize,ty+blurSize)) as TBGRABitmap;
  BGRAReplace(temp,temp.FilterBlurRadial(blurSize,rbFast));

  phong := TPhongShading.Create;
  phong.LightSourceDistanceFactor := 0;
  phong.LightDestFactor := 0;
  phong.LightSourceIntensity := 150;
  phong.LightPositionZ := 80;
  phong.LightColor := BGRA(105,233,240);
  phong.NegativeDiffusionFactor := 0.3;
  phong.SpecularIndex := 20;
  phong.AmbientFactor := 0.4;

  phong.Draw(result,temp,20,-blurSize,-blurSize,BGRA(28,139,166));
  phong.Free;
  temp.Free;
end;

function CreateSnowPrintTexture(tx,ty: integer): TBGRABitmap;
var
  v: integer;
  p: PBGRAPixel;
  i: Integer;

  temp: TBGRABitmap;
  phong: TPhongShading;
begin
  //here a random map is generated
  result := CreateCyclicPerlinNoiseMap(tx,ty,1,1,1.2);

  //now we apply thresholds
  p := result.Data;
  for i := 0 to result.NbPixels-1 do
  begin
    v := p^.red;
    //if the value is above 80 or under 50, then we divide it by 10 to make it almost horizontal
    if v > 80 then v := (v-80) div 10+80;
    if v < 50 then v := 50-(50-v) div 10;
    p^.red := v;
    p^.green := v;
    p^.blue := v;
    inc(p);
  end;

  //to make phong shader aware of the cycle
  temp:= result.GetPart(rect(-2,-2,tx+2,ty+2)) as TBGRABitmap;
  //apply a radial blur
  BGRAReplace(temp,temp.FilterBlurRadial(2,rbFast));
  phong := TPhongShading.Create;
  phong.LightSourceDistanceFactor := 0;
  phong.LightDestFactor := 0;
  phong.LightSourceIntensity := 100;
  phong.LightPositionZ := 100;
  phong.NegativeDiffusionFactor := 0.3; //want shadows
  phong.Draw(result,temp,30,-2,-2,BGRAWhite);
  phong.Free;
  temp.Free;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Invalidate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  phong := TPhongShading.Create;
  phong.LightPositionZ := 150;
  phong.SpecularIndex := 20;
  phong.AmbientFactor := 0.4;
  phong.LightSourceIntensity := 250;
  phong.LightSourceDistanceTerm := 200;

  chocolate := CreateChocolateTexture(80,80);

  stone:= CreateStoneTexture(100,100);
  water:= CreateWaterTexture(100,100);
  snow:=  CreateSnowPrintTexture(100,100);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  phong.Free;
  chocolate.Free;
  stone.Free;
  water.Free;
  snow.Free;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  phong.LightPosition := point(X,Y);
  FormPaint(Sender);
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  image: TBGRABitmap;
begin
    image := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,ColorToBGRA(ColorToRGB(clBtnFace)));
    case ComboBox1.ItemIndex of
      0:image.FillRect(0,0,80*7,80*4,chocolate,dmSet);
      1:image.FillRect(0,0,80*7,80*4,stone,dmSet);
      2:image.FillRect(0,0,80*7,80*4,water,dmSet);
      3:image.FillRect(0,0,80*7,80*4,snow,dmSet);
    end;
    phong.DrawSphere(image,rect(20,20,120,120),50,BGRA(255,0,0));
    image.Draw(Canvas,0,0,True);
    image.free;
end;



end.
