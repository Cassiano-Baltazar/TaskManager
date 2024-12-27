unit TaskView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxDBLookupComboBox, dxLayoutContainer, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxLayoutControl, TaskModel, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  System.ImageList, Vcl.ImgList, cxImageList, frxClass, frxDBSet, APIDao;

type
  TTaskViewFrame = class(TFrame)
    dxLayoutControl1: TdxLayoutControl;
    gTask: TcxGrid;
    tvTask: TcxGridDBTableView;
    tvTaskID_TASK: TcxGridDBColumn;
    tvTaskDESCRIPTION: TcxGridDBColumn;
    tvTaskPRIORITY: TcxGridDBColumn;
    tvTaskSTATUS: TcxGridDBColumn;
    tvTaskCREATED: TcxGridDBColumn;
    tvTaskFINISHED: TcxGridDBColumn;
    glTask: TcxGridLevel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dsTask: TDataSource;
    btSearch: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    cxImageList1: TcxImageList;
    pmTask: TPopupMenu;
    miNewTask: TMenuItem;
    miUpdateTask: TMenuItem;
    miDeleteTask: TMenuItem;
    miUpdateStatus: TMenuItem;
    btReport: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure btSearchClick(Sender: TObject);
    procedure miNewTaskClick(Sender: TObject);
    procedure miUpdateTaskClick(Sender: TObject);
    procedure miDeleteTaskClick(Sender: TObject);
    procedure miUpdateStatusClick(Sender: TObject);
  private
    FTaskModel: TTaskModel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  TaskEdit;

{$R *.dfm}

{ TFrame1 }

constructor TTaskViewFrame.Create(AOwner: TComponent);
begin
  inherited;
  FTaskModel := TTaskModel.Create(Self);
  TcxLookupComboBoxProperties(tvTaskSTATUS.Properties).ListSource := APIClient.dsStatus;
end;

procedure TTaskViewFrame.miDeleteTaskClick(Sender: TObject);
begin
  FTaskModel.Delete;
  btSearch.Click;
end;

procedure TTaskViewFrame.miNewTaskClick(Sender: TObject);
begin
  if TTaskEditForm.Execute(Null) then
    btSearch.Click;
end;

procedure TTaskViewFrame.miUpdateStatusClick(Sender: TObject);
begin
  FTaskModel.UpdateStatus;
  btSearch.Click;
end;

procedure TTaskViewFrame.miUpdateTaskClick(Sender: TObject);
begin
  if TTaskEditForm.Execute(dsTask.DataSet.FieldByName('ID_TASK').AsInteger) then
    btSearch.Click;
end;

procedure TTaskViewFrame.btSearchClick(Sender: TObject);
begin
  FTaskModel.GetAllTask;
  dsTask.DataSet := FTaskModel.TaskData;

  miUpdateTask.Enabled := not dsTask.DataSet.IsEmpty;
  miDeleteTask.Enabled := not dsTask.DataSet.IsEmpty;
  miUpdateStatus.Enabled := not dsTask.DataSet.IsEmpty;
end;

end.
