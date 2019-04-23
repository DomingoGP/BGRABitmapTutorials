program Tutorial02;

uses
  Vcl.Forms,
  Tutorial02Unit2 in 'Tutorial02Unit2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
