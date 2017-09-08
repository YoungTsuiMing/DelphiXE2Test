unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TShiftState = set of (ssShift, ssAlt, ssCtrl, ssLeft, ssRight, ssMiddle, ssDouble, ssTouch, ssPen);

type
  TForm2 = class(TForm)
    btn2: TButton;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
var
  P: Pointer;

procedure TForm2.btn1Click(Sender: TObject);
const
  P1: PChar = 'codegear';
  P2: PChar = 'delphi';
var
  strarr: array[0..15] of Char;
begin
  StrCopy(strarr, p1);
  StrCat(strarr, ' ');
  StrCat(strarr, P2);

  ShowMessage(strarr);
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  if p = nil then
    RunError(204);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  Str: string;
  pStr: PString;
begin
//  Str := 'Delphi 2007';
//  pStr := @Str;       {�� @ ��ȡָ��}
//  ShowMessage(pStr^); {Delphi 2007}
//
//  Str := 'Delphi 2008';
//  pStr := Addr(Str);  {Addr �� @ ��������һ����, ���ǻ�ȡָ��}
//  ShowMessage(pStr^); {Delphi 2008}
//
//  {��ȡ Form1 ��ָ��}
//  ShowMessage(IntToStr(Integer(@Self)));          {1244648; ���Ƕ�̬��}
//  ShowMessage(IntToStr(Integer(Addr(Self))));     {1244648}
//
//  {��ȡ Form1 �� FormCreate ���̵�ָ��}
//  ShowMessage(IntToStr(Integer(@OnCreate)));      {4570956}
//  ShowMessage(IntToStr(Integer(Addr(OnCreate)))); {4570956}
//
//  {
//    ���Ҫ��ȡָ��Ķ���ı���ʽ̫����, �� @ �Ͳ���ʹ��;
//    ��ʱֻ��ʹ�� Addr, ����ǰ�������������, �����벻������...
//  }
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Self.Caption := '';
  if (ssCtrl in Shift) and (ssShift in Shift) then
    Self.Caption := 'Ctrl'; //����
end;

end.
