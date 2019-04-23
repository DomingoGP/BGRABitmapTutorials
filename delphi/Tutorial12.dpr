program Tutorial12;

uses
  Vcl.Forms,
  Tutorial12Unit1 in 'Tutorial12Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
