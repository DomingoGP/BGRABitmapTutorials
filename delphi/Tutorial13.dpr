program Tutorial13;

uses
  Vcl.Forms,
  Tutorial13Unit1 in 'Tutorial13Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
