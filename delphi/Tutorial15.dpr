program Tutorial15;

uses
  Vcl.Forms,
  Tutorial15Unit1 in 'Tutorial15Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
