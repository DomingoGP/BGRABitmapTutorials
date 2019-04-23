program Tutorial07;

uses
  Vcl.Forms,
  Tutorial07Unit1 in 'Tutorial07Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
