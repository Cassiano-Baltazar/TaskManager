unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxLayoutContainer,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutControl, cxDBLookupComboBox, TaskModel, cxContainer, dxLayoutcxEditAdapters, dxGDIPlusClasses, cxImage,
  dxBarBuiltInMenu, cxPC, System.ImageList, Vcl.ImgList, cxImageList, Vcl.Menus;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Tarefas1: TMenuItem;
    cxImageList1: TcxImageList;
    procedure Tarefas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses
  Login, TaskView;

{$R *.dfm}

procedure TMainForm.Tarefas1Click(Sender: TObject);
var
  TaskView: TTaskViewForm;
begin
  TaskView := TTaskViewForm.Create(Self);
  TaskView.Parent := Self;
  TaskView.Visible := True;
  TaskView.Show;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not TLoginForm.DoLogin then
    Halt(0);
end;

end.
