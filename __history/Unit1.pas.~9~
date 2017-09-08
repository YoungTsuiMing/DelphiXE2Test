unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure TreeViewOnChange(Sender: TObject; Node: TTreeNode);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Vcl.Shell.ShellCtrls;

var
  C: TShellComboBox;
  T: TShellTreeView;
  L: TShellListView;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C := TShellComboBox.Create(Self);
  T := TShellTreeView.Create(Self);
  L := TShellListView.Create(Self);

  C.Parent := Self;
  T.Parent := Self;
  L.Parent := Self;
  T.Width := Screen.Width div 4;

  C.Align := alTop;
  T.Align := alLeft;
  L.Align := alClient;

  T.ShellComboBox := C;
  L.ShellTreeView := T;

  L.ViewStyle := vsList;

  T.OnChange := TreeViewOnChange;
end;

procedure TForm1.TreeViewOnChange(Sender: TObject; Node: TTreeNode);
begin
  Caption := T.SelectedFolder.PathName;
end;

end.

