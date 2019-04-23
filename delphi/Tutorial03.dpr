program Tutorial03;

uses
  Vcl.Forms,
  Tutorial03Unit1 in 'Tutorial03Unit1.pas' {Form1},
  Tutorial03Unit2 in 'Tutorial03Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Form2.Top:=Form1.Top;
  Form2.Left:=Form1.Left+Form1.Width+30;
  Form2.Show;
  Application.Run;
end.
