program Tutorial10;

uses
  Vcl.Forms,
  Tutorial10Unit1 in 'Tutorial10Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
