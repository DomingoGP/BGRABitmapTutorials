unit Tutorial14Unit1;

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
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  BGRABitmap,BGRAGraphics, BGRABitmapTypes,bgratransform,bgracanvas2d;

const
  BOTTOM_MARGIN=40;



procedure TForm1.Button1Click(Sender: TObject);
var bmp: TBGRABitmap;
    ctx: TBGRACanvas2D;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRA(210,210,210));

  ctx := bmp.Canvas2D;
  ctx.fillStyle('rgb(240,128,0)');

  ctx.fillRect(30,30,80,60);
  ctx.strokeRect(50,50,80,60);

  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;


procedure TForm1.Button2Click(Sender: TObject);
var bmp: TBGRABitmap;
    ctx: TBGRACanvas2D;

  procedure pave();
  begin
    ctx.fillStyle ('rgb(130,100,255)');
    ctx.strokeStyle ('rgb(0,255,0)');
    ctx.beginPath();
    ctx.lineWidth:=2;
    ctx.moveTo(5,5);ctx.lineTo(20,10);ctx.lineTo(55,5);ctx.lineTo(45,18);ctx.lineTo(30,50);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
  end;

begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRA(210,210,210));
  ctx := bmp.Canvas2D;
  pave();
  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var bmp: TBGRABitmap;
    ctx: TBGRACanvas2D;
  procedure pave();
  begin
    ctx.fillStyle ('rgb(130,100,255)');
    ctx.strokeStyle ('rgb(0,0,255)');
    ctx.beginPath();
    ctx.lineWidth:=2;
    ctx.moveTo(5,5);ctx.lineTo(20,10);ctx.lineTo(55,5);ctx.lineTo(45,18);ctx.lineTo(30,50);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
  end;
  procedure six();
  var
    i: Integer;
  begin
     ctx.save();
     for i := 0 to 5 do
     begin
        ctx.rotate(2*PI/6);
        pave();
     end;
     ctx.restore();
  end;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRA(210,210,210));
  ctx := bmp.Canvas2D;
  ctx.translate(80,80);
  six;
  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  bmp: TBGRABitmap;
  ctx: TBGRACanvas2D;

procedure PacMan;
var
  grad: IBGRACanvasGradient2D;
begin
  grad := ctx.createLinearGradient(0,0,320,240);
  grad.addColorStop(0.3, '#ff0000');
  grad.addColorStop(0.6, '#0000ff');
  ctx.fillStyle(grad);

  grad := ctx.createLinearGradient(0,0,320,240);
  grad.addColorStop(0.3, '#ffffff');
  grad.addColorStop(0.6, '#000000');
  ctx.strokeStyle(grad);
  ctx.lineWidth := 5;

  ctx.moveto(160,120);
  ctx.arc(160,120,100,Pi/6,-Pi/6,false);
  ctx.fill();
  ctx.stroke();
end;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRA(210,210,210));
  ctx := bmp.Canvas2D;
  PacMan;
  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;

//polygon with holes using canvas2D like javascript.
procedure TForm1.Button5Click(Sender: TObject);
var
  bmp: TBGRABitmap;
  ctx: TBGRACanvas2D;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight,BGRA(210,210,210));
  ctx := bmp.Canvas2D;

    ctx.fillStyle ('rgb(130,100,255)');
    ctx.strokeStyle ('rgb(0,0,255)');
    ctx.beginPath();
    ctx.lineWidth:=2;
    ctx.moveTo(5,5);ctx.lineTo(20,10);ctx.lineTo(155,5);ctx.lineTo(45,180);ctx.lineTo(30,50);
    ctx.closePath();
    ctx.strokeStyle ('rgb(0,255,0)');
    ctx.moveTo(15,15);ctx.lineTo(45,45);ctx.lineTo(85,15);;
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;

//polygon with holes
procedure TForm1.Button6Click(Sender: TObject);
var
  image: TBGRABitmap;
begin
  image := TBGRABitmap.Create(ClientWidth,ClientHeight,ColorToBGRA(ColorToRGB(clBtnFace)));
  image.DrawPolygonAntialias([PointF(50,50),PointF(220,100),PointF(195,250),PointF(50,200)
  ,EmptyPointF     //polygon separator, new polygon
  ,PointF(180,160),PointF(130,100),PointF(70,160)          // sentido antihorario  anti clockwise
  //  ,PointF(70,160),PointF(130,100),PointF(180,160)      // sentido horario   clockwise
  ,EmptyPointF     //polygon separator, new polygon

  ,PointF(180,200),PointF(130,180),PointF(70,200)

  ],BGRA(200,0,0),3,BGRA(0,200,0));

  image.Draw(Canvas,0,0,True);
  image.free;
end;

end.
