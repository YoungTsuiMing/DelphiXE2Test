unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Themes,
  Vcl.Styles, Vcl.Grids;

type
  TForm14 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    lst1: TListBox;
    OpenDialog1: TOpenDialog;
    drwgrd1: TDrawGrid;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure StylesListRefresh();
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

{ TForm14 }

procedure TForm14.btn1Click(Sender: TObject);
begin
  TStyleManager.SetStyle(lst1.Items[lst1.ItemIndex]);
end;

procedure TForm14.btn2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if TStyleManager.IsValidStyle(OpenDialog1.FileName) then
    begin
        //load the style file
      TStyleManager.LoadFromFile(OpenDialog1.FileName);
        //refresh the list with the currently available styles
      StylesListRefresh;
      ShowMessage('New VCL Style has been loaded');
    end
    else
      ShowMessage('The file is not a valid VCL Style!');
  end;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  Self.StylesListRefresh;
end;

procedure TForm14.StylesListRefresh;
var
  stylename: string;
begin
  Self.lst1.Clear;
// retrieve all the styles linked in the executable
  for stylename in TStyleManager.StyleNames do
  begin
    lst1.Items.Add(stylename);
  end;
end;

end.

