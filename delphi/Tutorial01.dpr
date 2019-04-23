program Tutorial01;

uses
  Vcl.Forms,
  Tutorial01Unit1 in 'Tutorial01Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
