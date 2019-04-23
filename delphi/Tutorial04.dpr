program Tutorial04;

uses
  Vcl.Forms,
  Tutorial04Unit1 in 'Tutorial04Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
