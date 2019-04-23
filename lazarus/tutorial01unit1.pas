unit tutorial01unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,BGRABitmap, BGRABitmapTypes;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.FormPaint(Sender: TObject);
var bmp: TBGRABitmap;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight,BGRABlack);
  bmp.FillRect(20,20,100,40,BGRA(255,192,0),dmSet);
  bmp.Draw(Canvas,0,0,True);
  bmp.Free;
end;

end.

