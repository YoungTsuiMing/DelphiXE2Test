unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Rtti;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    btn13: TButton;
    btn14: TButton;
    btn15: TButton;
    btn16: TButton;
    btn17: TButton;
    btn18: TButton;
    btn19: TButton;
    btn20: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TMyYxmClass = class
    const
      name: string = 'yangxuming';
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  System.IOUtils, superobject;

const
  JsonStr = '{"NO1":"yangshuaiguo","NO2":123456}';

procedure TForm3.btn10Click(Sender: TObject);
const
  path = 'c:\temp\json.txt';
var
  jo: ISuperObject;
begin
  jo := SO(JsonStr);
  jo.SaveTo(path);
  ShowMessage(jo.AsJSon(True, False));
  Memo1.Lines.LoadFromFile(path);
end;

procedure TForm3.btn11Click(Sender: TObject);
var
  jo: ISuperObject;
  stm: TStringStream;
  b: Byte;
begin
  stm := TStringStream.Create('{"No2":"\u674e\u56db","No1":"\u5f20\u4e09"}');
  jo := TSuperObject.ParseStream(stm, True);
  ShowMessage(jo.AsJSon(True, False));
  stm.Free;
end;

procedure TForm3.btn12Click(Sender: TObject);
var
  jo: ISuperObject;
begin
  jo := SO(JsonStr);
  ShowMessage(jo.AsJSon);
  ShowMessage(jo.AsJSon(True));
  ShowMessage(jo.AsJSon(True, False));
  ShowMessage(jo.AsJSon(False, False));
end;

procedure TForm3.btn13Click(Sender: TObject);
var
 jo:ISuperObject;
begin
  jo:= SO(Memo1.Text);
  ShowMessage(jo['name'].AsString);
  ShowMessage(jo['age'].AsString);
  ShowMessage(jo['sex'].AsString);
  ShowMessage(jo['weight'].AsString);
  ShowMessage(jo['tel'].AsString);
  ShowMessage(jo['addresses'].AsString);

  ShowMessage(jo['children'].AsString);
end;

procedure TForm3.btn14Click(Sender: TObject);
var
  jo: ISuperObject;
  s: string;
  i: Integer;
  d: Double;
  b: Boolean;
begin
  jo := SO(Memo1.Text);

  s := jo['name'].AsString;
  i := jo['age'].AsInteger;
  b := jo['sex'].AsBoolean;
  d := jo['weight'].AsDouble;

  ShowMessage(s);
  ShowMessage(IntToStr(i));
  ShowMessage(BoolToStr(b, True));
  ShowMessage(FloatToStr(d));

  s := jo.S['name'];
  i := jo.I['age'];
  b := jo.B['sex'];
  d := jo.D['weight'];

  ShowMessage(s);
  ShowMessage(IntToStr(i));
  ShowMessage(BoolToStr(b, True));
  ShowMessage(FloatToStr(d));
  {
    jo['name'] 是 jo.O['name'] 的简化形式, 因为它是类的默认数组;
    jo.N 类似 jo.O, 区别是 jo.N 在参数不妥时可返回空;
    jo.M 和方法有关, 对象中可嵌入方法.
  }
end;

procedure TForm3.btn1Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
begin
  Memo1.Clear;
  for t in ctx.GetTypes do
  begin
    Memo1.Lines.Add(t.Name);
  end;
end;

procedure TForm3.btn2Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  m: TRttiMethod;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  //for m in t.GetMethods do Memo1.Lines.Add(m.Name);
  for m in t.GetMethods do
    Memo1.Lines.Add(m.ToString);
end;

procedure TForm3.btn3Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  p: TRttiProperty;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  //for p in t.GetProperties do Memo1.Lines.Add(p.Name);
  for p in t.GetProperties do
    Memo1.Lines.Add(p.ToString);
end;

procedure TForm3.btn4Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  f: TRttiField;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  //for f in t.GetFields do Memo1.Lines.Add(f.Name);
  for f in t.GetFields do
    Memo1.Lines.Add(f.ToString);
end;

procedure TForm3.btn5Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  ms: TArray<TRttiMethod>;
  ps: TArray<TRttiProperty>;
  fs: TArray<TRttiField>;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);

  ms := t.GetMethods;
  ps := t.GetProperties;
  fs := t.GetFields;

  Memo1.Lines.Add(Format('%s 类共有 %d 个方法', [t.Name, Length(ms)]));
  Memo1.Lines.Add(Format('%s 类共有 %d 个属性', [t.Name, Length(ps)]));
  Memo1.Lines.Add(Format('%s 类共有 %d 个字段', [t.Name, Length(fs)]));
end;

procedure TForm3.btn6Click(Sender: TObject);
var
  p, f: string;
  b: Boolean;
begin
  {设置与获取当前路径}
  SetCurrentDir('C:\Temp\');
  ShowMessage(GetCurrentDir);         { C:\Temp }

  {获取当前目录下子目录的全路径}
  p := GetLocaleDirectory('ABC');
  ShowMessage(p);
                       { C:\Temp\ABC\ }
  {获取当前目录下文件的全路径}
  f := GetLocaleFile('X.txt');
  ShowMessage(f);                     { C:\Temp\X.txt }
  f := GetLocaleFile('ABC\X.txt');
  ShowMessage(f);                     { C:\Temp\ABC\X.txt }

  {IOUtils 下的 TPath 也有类似功能}
  f := TPath.GetFullPath('X.txt');
  ShowMessage(f);                     { C:\Temp\X.txt }
  f := TPath.GetFullPath('ABC\X.txt');
  ShowMessage(f);                     { C:\Temp\ABC\X.txt }

  {判断当前文件夹下的文件或子文件夹是否存在}
  b := LocaleDirectoryExists('ABC'); //这相当于: DirectoryExists(GetCurrentDir + '\ABC');
  b := LocaleFileExists('X.txt');    //这相当于: FileExists(GetCurrentDir + '\X.txt');
end;

procedure TForm3.btn7Click(Sender: TObject);
var
  bit: TBitmap;
  DC: HDC;
  cvs: TCanvas;
begin
  bit := TBitmap.Create;
  bit.SetSize(Screen.Width, Screen.Height);

  DC := GetDC(0);
  cvs := TCanvas.Create;
  cvs.Handle := DC;

  bit.Canvas.CopyRect(Screen.DesktopRect, cvs, Screen.DesktopRect);
  bit.SaveToFile('c:\temp\Screen.bmp');

  ReleaseDC(0, DC);
  cvs.Free;
  bit.Free;
end;

procedure TForm3.btn8Click(Sender: TObject);
var
  jo: ISuperObject;
begin
  jo := SO('{"name":"yangxuming","class":"sannian二班"}');
  ShowMessage(jo['class'].AsString);
end;

procedure TForm3.btn9Click(Sender: TObject);
var
  jo: ISuperObject;
begin
  jo := SO(jsonstr);
  ShowMessage(jo.AsJSon(True, False));
end;

end.

