unit TaskView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxDBLookupComboBox, dxLayoutContainer, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxLayoutControl, TaskModel;

type
  TTaskViewForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
  private
    FTaskModel: TTaskModel;
  public
    { Public declarations }
  end;

var
  TaskViewForm: TTaskViewForm;

implementation

uses
  APIDao;

{$R *.dfm}

procedure TTaskViewForm.FormCreate(Sender: TObject);
begin
  FTaskModel := TTaskModel.Create(Self);
  FTaskModel.GetAllTask;
  dsTask.DataSet := FTaskModel.TaskData;
end;

end.
