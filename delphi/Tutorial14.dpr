program Tutorial14;

uses
  Vcl.Forms,
  Tutorial14Unit1 in 'Tutorial14Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
