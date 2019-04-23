program Tutorial06;

uses
  Vcl.Forms,
  Tutorial06Unit1 in 'Tutorial06Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
