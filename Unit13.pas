﻿unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,superobject,system.DateUtils;

type
  TForm13 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    mmo1: TMemo;
    btn5: TButton;
    idhtp1: TIdHTTP;
    btn6: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Tmyform = class(TForm13)
    procedure btn1Click(Sender: TObject);
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

function GB2Big(GB: string): string; //简体转换成繁体
var
  Len: Integer;
begin
  Len := Length(GB);
  SetLength(Result, Len);
  LCMapString(GetUserDefaultLCID, LCMAP_TRADITIONAL_CHINESE, PChar(GB), Len, PChar(Result), Len);
end;

function Big2GB(Big: string): string; //繁体转换成简体
var
  Len: Integer;
begin
  Len := Length(Big);
  SetLength(Result, Len);
  LCMapString(GetUserDefaultLCID, LCMAP_SIMPLIFIED_CHINESE, PChar(Big), Len, PChar(Result), Len);
end;

procedure TForm13.btn1Click(Sender: TObject);
var
  myvalue: string;
begin
  {$IFDEF DEBUG}
  ShowMessage('test!');
  {$ELSE}
  ShowMessage('not test!');
  {$ENDIF}
end;

procedure TForm13.btn2Click(Sender: TObject);
begin
  ShowMessage(GB2Big('汉字繁简转换')); {漢字繁簡轉換}
  ShowMessage(Big2GB('漢字繁簡轉換')); {汉字繁简转换}
end;

procedure TForm13.btn3Click(Sender: TObject);
var
  i: Integer;
begin
  i := 100;
end;

procedure TForm13.btn4Click(Sender: TObject);
var
  myform: Tmyform;
  i: Integer;
begin
  for i := 1 to 100 do
  begin
    myform := Tmyform.Create(nil);
    myform.Show;
  end;
end;

procedure TForm13.btn5Click(Sender: TObject);
var
  s:string;
  jo:ISuperObject;
  s,fBaiduKey:string;
begin
  s:=idhtp1.Get('http://api.map.baidu.com/location/ip?ak='+fBaiduKey+'&coor=bd09ll');
  jo:=SO(s);
  mmo1.Text :=   jo.AsString;
end;

procedure TForm13.btn6Click(Sender: TObject);
var
   t1,t2,t3: TDateTime;
begin
  t1 := Yesterday;
  t2 := Today;     //同 SysUtils.Date;
  t3 := Tomorrow;

  ShowMessageFmt('%s, %s, %s', [DateToStr(t1), DateToStr(t2), DateToStr(t3)]);
  {2009-5-20, 2009-5-21, 2009-5-22}
end;

procedure TMyForm.btn1Click(Sender: TObject);
begin
  inherited;  //继承 Button1 原有的功能
  ShowMessage('TMyForm');
end;

end.

