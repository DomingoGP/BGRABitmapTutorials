program Tutorial09;

uses
  Vcl.Forms,
  Tutorial09Unit1 in 'Tutorial09Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
