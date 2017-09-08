program test001;

uses
  Vcl.Forms,
  Unit13 in 'Unit13.pas' {Form13},
  superobject in 'superobject.pas',
  Vcl.Themes,
  Vcl.Styles,
  Unit14 in 'Unit14.pas' {Form14},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
