program Tutorial08;

uses
  Vcl.Forms,
  Tutorial08Unit1 in 'Tutorial08Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
