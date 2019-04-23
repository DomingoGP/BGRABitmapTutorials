unit tutorial03unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,BGRABitmap, BGRABitmapTypes;

type

  { TForm2 }

  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
  private
    image: TBGRABitmap;
    mouseDrawing: boolean;
    mouseOrigin: TPoint;
    procedure DrawBrush(X, Y: Integer; Closed: Boolean);
    procedure PaintImage;
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  image := TBGRABitmap.Create(420,480,BGRAWhite);
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    mouseDrawing := True;
    mouseOrigin := Point(X,Y);
    DrawBrush(X,Y,True);
  end;
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mouseDrawing then DrawBrush(X,Y,False);
end;

procedure TForm2.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    mouseDrawing := False;
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
  PaintImage;
end;

procedure TForm2.DrawBrush(X, Y: Integer; Closed: Boolean);
const brushRadius = 20;
begin
  image.DrawLineAntialias(X,Y,mouseOrigin.X,mouseOrigin.Y,BGRA(0,0,0,128),brushRadius,Closed);
  mouseOrigin := Point(X,Y);

  PaintImage;
end;


procedure TForm2.PaintImage;
begin
  image.Draw(Canvas,0,0,True);
end;


end.
