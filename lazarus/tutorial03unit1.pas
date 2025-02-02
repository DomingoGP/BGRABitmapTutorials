unit tutorial03unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,BGRABitmap, BGRABitmapTypes;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
  private
    image: TBGRABitmap;
    procedure DrawBrush(X, Y: Integer);
    procedure PaintImage;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  image := TBGRABitmap.Create(420,480,BGRAWhite);
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then DrawBrush(X,Y);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssLeft in Shift then DrawBrush(X,Y);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  PaintImage;
end;

procedure TForm1.DrawBrush(X, Y: Integer);
const radius = 20;
begin
  image.GradientFill(X-radius,Y-radius, X+radius,Y+radius,
    BGRABlack,BGRAPixelTransparent,gtRadial,
    PointF(X,Y), PointF(X+radius,Y), dmDrawWithTransparency);

  PaintImage;
end;

procedure TForm1.PaintImage;
begin
  image.Draw(Canvas,0,0,True);
end;

end.

