unit Tutorial11Unit1;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
BGRABitmap,BGRAGraphics, BGRABitmapTypes,BGRAGradientScanner, BGRATransform;

const
  BOTTOM_MARGIN=40;
  { TBGRAMultiplyScanner }

type
  TBGRAMultiplyScanner = class(TBGRACustomScanner)
    function ScanAt(X, Y: Single): TBGRAPixel; override;
  end;

  TBGRAMultiplyScanner2 = class(TBGRACustomScanner)
    function ScanAt(X, Y: Single): TBGRAPixel; override;
  end;


{$R *.dfm}


{ TBGRAMultiplyScanner }

function TBGRAMultiplyScanner.ScanAt(X, Y: Single): TBGRAPixel;
  function cycle512(value: integer): integer; inline;
  begin
    result := value and 511;
    if result >= 256 then result := 511-result;
  end;

var
  mul: integer;
begin
  mul := cycle512(round(x*y));
  result := BGRA(mul,mul,mul,255);
end;

function TBGRAMultiplyScanner2.ScanAt(X, Y: Single): TBGRAPixel;
  function cycle512(value: integer): integer; inline;
  begin
    result := value and 511;
    if result >= 256 then result := 511-result;
  end;

var
  mul: integer;
begin
  mul := round(x*y);
  result := BGRA(cycle512(round(x*10)),cycle512(mul),cycle512(round(y*10)),255);
end;

procedure TForm1.Button1Click(Sender: TObject);
var image: TBGRABitmap;
    grad: TBGRAGradientScanner;
    affine: TBGRAAffineScannerTransform;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, BGRABlack );

  grad := TBGRAGradientScanner.Create(BGRA(0,0,255),BGRAWhite,gtRadial,PointF(0,0),PointF(1,0),True,True);

  affine := TBGRAAffineScannerTransform.Create(grad);
  affine.Scale(150,80);
  affine.RotateDeg(-30);
  affine.Translate(ClientWidth/2, ClientHeight/2);

  image.Fill(affine);

  affine.free;
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var image: TBGRABitmap;
    grad: TBGRAGradientScanner;
    affine: TBGRAAffineScannerTransform;
    twirl: TBGRATwirlScanner;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, BGRABlack );

  grad := TBGRAGradientScanner.Create(BGRA(0,0,255),BGRAWhite,gtRadial,PointF(0,0),PointF(1,0),True,True);

  affine := TBGRAAffineScannerTransform.Create(grad);
  affine.Scale(150,80);
  affine.RotateDeg(-30);
  affine.Translate(ClientWidth/2, ClientHeight/2);

  twirl := TBGRATwirlScanner.Create(affine,Point(ClientWidth div 2, ClientHeight div 2),100);
  image.Fill(twirl);
  twirl.Free;

  affine.free;
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var image: TBGRABitmap;
    grad: TBGRAMultiplyScanner;
    affine: TBGRAAffineScannerTransform;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, BGRABlack );

  grad := TBGRAMultiplyScanner.Create;
  affine := TBGRAAffineScannerTransform.Create(grad);
  affine.Scale(6,4);
  affine.Translate(ClientWidth/2, ClientHeight/2);
  image.Fill(affine);
  affine.free;
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var image: TBGRABitmap;
    grad: TBGRAMultiplyScanner2;
    affine: TBGRAAffineScannerTransform;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, BGRABlack );

  grad := TBGRAMultiplyScanner2.Create;
  affine := TBGRAAffineScannerTransform.Create(grad);
  affine.Scale(6,4);
  affine.Translate(ClientWidth/2, ClientHeight/2);
  image.Fill(affine);
  affine.free;
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button5Click(Sender: TObject);
var image: TBGRABitmap;
    grad: TBGRAMultiplyScanner2;
    affine: TBGRAAffineScannerTransform;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight, BGRABlack );

  grad := TBGRAMultiplyScanner2.Create;
  affine := TBGRAAffineScannerTransform.Create(grad);
  affine.Scale(6,4);
  affine.RotateDeg(-30);
  affine.Translate(ClientWidth/2, ClientHeight/2);
  image.Fill(affine);
  affine.free;
  grad.free;

  image.Draw(Canvas,0,0,True);
  image.free;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  g: TBGRAMultiGradient;
  gs: TBGRAGradientScanner;
  ArrBgraColor: array [0..2] of TBGRAPixel;
  bmpTemp: TBGRABitmap;
  pStart, pEnd: TPointF;
  w, h: integer;
begin
  Refresh;  //erases window.
  w := 600;
  h := 360;
  bmpTemp := TBGRABitmap.Create(w, h, clWhite);
  ArrBgraColor[0] := BGRA(255, 0, 0);//Red
  ArrBgraColor[1] := BGRA(0, 255, 0);//Green
  ArrBgraColor[2] := BGRA(0, 0, 255);//Blue
  g := TBGRAMultiGradient.Create(ArrBgraColor, [0, 0.49, 1], True, False);
  pStart.x := 0;
  pStart.y := h div 2;
  pEnd.x := w ;
  pEnd.y := h div 2;
  gs := TBGRAGradientScanner.Create(g, gtLinear, pStart, pEnd);
  bmpTemp.FillRect(0, 0, w, h, gs, dmSet, daFloydSteinberg);
  bmpTemp.Draw(Canvas,0,0,true);
   bmpTemp.Free;
  g.Free;
  gs.Free;
end;

procedure TForm1.Button7Click(Sender: TObject);
var image: TBGRABitmap;
begin
  Refresh;  //erases window.
  image := TBGRABitmap.Create(ClientWidth,ClientHeight);
  image.GradientFill(0,0,ClientWidth,ClientHeight,BGRA(0,0,0),BGRA(255,0,255),
                     gtDiamond,PointF(ClientWidth/2,ClientHeight/2),
                     PointF(ClientWidth/2,0),
                     dmSet);
  image.Draw(Canvas,0,0,True);
  image.free;
end;

end.
