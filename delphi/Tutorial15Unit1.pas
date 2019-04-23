unit Tutorial15Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  BGRAScene3D, BGRABitmap, BGRABitmapTypes;

const
  BOTTOM_MARGIN=40;



procedure TForm1.Button1Click(Sender: TObject);
var
  scene: TBGRAScene3D;
  bmp: TBGRABitmap;
 //   base: array of IBGRAVertex3D;
  base: arrayofIBGRAVertex3D;

  topV: IBGRAVertex3D;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRABlack);

  scene := TBGRAScene3D.Create(bmp);
  //create a pyramid
  with scene.CreateObject(BGRA(255,240,128)) do
  begin
    //create vertices
    topV := MainPart.Add(0,-15,0);
    //pyramid base is in a clockwise order if we look at the pyramid from below
    base := MainPart.Add([-20,15,-20, 20,15,-20, 20,15,20, -20,15,20]);

    AddFace(base);
    //add four faces, the three vertices are in a clockwise order
    AddFace([base[0],topV,base[1]]);
    AddFace([base[1],topV,base[2]]);
    AddFace([base[2],topV,base[3]]);
    AddFace([base[3],topV,base[0]]);
    topV := nil;
    base := nil;
  end;
  scene.Render;
  scene.Free;

  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  scene: TBGRAScene3D;
  bmp: TBGRABitmap;
 //   base: array of IBGRAVertex3D;
  base: arrayofIBGRAVertex3D;

  topV: IBGRAVertex3D;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRABlack);

  scene := TBGRAScene3D.Create(bmp);
  //create a pyramid
  with scene.CreateObject(BGRA(255,240,128)) do
  begin
    //create vertices
    topV := MainPart.Add(0,-15,0);
    //pyramid base is in a clockwise order if we look at the pyramid from below
    base := MainPart.Add([-20,15,-20, 20,15,-20, 20,15,20, -20,15,20]);

    AddFace(base);
    //add four faces, the three vertices are in a clockwise order
    AddFace([base[0],topV,base[1]]);
    AddFace([base[1],topV,base[2]]);
    AddFace([base[2],topV,base[3]]);
    AddFace([base[3],topV,base[0]]);
    topV := nil;
    base := nil;
    MainPart.Scale(1.3);
    MainPart.RotateYDeg(30);
    MainPart.RotateXDeg(20);
    MainPart.Translate(0,-5,0);

  end;
  scene.Render;
  scene.Free;

  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  scene: TBGRAScene3D;
  bmp: TBGRABitmap;
 //   base: array of IBGRAVertex3D;
  base: arrayofIBGRAVertex3D;

  topV: IBGRAVertex3D;
begin
  bmp := TBGRABitmap.Create(ClientWidth,ClientHeight-BOTTOM_MARGIN,BGRABlack);

  scene := TBGRAScene3D.Create(bmp);
  //create a pyramid
  with scene.CreateObject(BGRA(255,240,128)) do
  begin
    //create vertices
    topV := MainPart.Add(0,-15,0);
    //pyramid base is in a clockwise order if we look at the pyramid from below
    base := MainPart.Add([-20,15,-20, 20,15,-20, 20,15,20, -20,15,20]);

    AddFace(base);
    //add four faces, the three vertices are in a clockwise order
    AddFace([base[0],topV,base[1]]);
    AddFace([base[1],topV,base[2]]);
    AddFace([base[2],topV,base[3]]);
    AddFace([base[3],topV,base[0]]);
    topV := nil;
    base := nil;
    MainPart.Scale(1.3);
    MainPart.RotateYDeg(30);
    MainPart.RotateXDeg(20);
    MainPart.Translate(0,-5,0);
end;

  //set ambiant lightness to dark (1 is normal lightness, 2 is complete whiteness)
  scene.AmbiantLightness := 0.5;
  //add a directional light from top-left, maximum lightness will be 0.5 + 1 = 1.5
  scene.AddDirectionalLight(Point3D(1,1,1), 1);

  scene.Render;
  scene.Free;

  bmp.Draw(Canvas,0,0);
  bmp.Free;
end;

end.
