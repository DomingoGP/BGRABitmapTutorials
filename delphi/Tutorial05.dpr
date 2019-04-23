program Tutorial05;

uses
  Vcl.Forms,
  Tutorial05Unit1 in 'Tutorial05Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
