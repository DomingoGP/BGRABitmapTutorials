program Tutorial11;

uses
  Vcl.Forms,
  Tutorial11Unit1 in 'Tutorial11Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
