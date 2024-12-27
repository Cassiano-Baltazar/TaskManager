unit TaskEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TaskModel, Data.DB, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTrackBar, cxDBTrackBar, dxLayoutContainer, cxTextEdit, cxClasses, dxLayoutControl,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, APIDao, cxSpinEdit;

type
  TTaskEditForm = class(TForm)
    dsTask: TDataSource;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    DESCRIPTION: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    Priority: TcxDBTrackBar;
    dxLayoutItem2: TdxLayoutItem;
    Status: TcxDBLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    Created: TcxDBDateEdit;
    dxLayoutItem4: TdxLayoutItem;
    Finished: TcxDBDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    ID: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    Save: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    procedure FormCreate(Sender: TObject);
    procedure SaveClick(Sender: TObject);
  private
    FTaskModel: TTaskModel;
    FIDTask: variant;
  protected
    property IDTask: variant read FIDTask write FIDTask;
    procedure LoadInfo;
  public
    class function Execute(const AID: Variant): Boolean;
  end;


implementation

{$R *.dfm}

{ TTaskEditForm }

class function TTaskEditForm.Execute(const AID: Variant): Boolean;
var
  frm: TTaskEditForm;
begin
  frm := TTaskEditForm.Create(nil);
  try
    frm.IDTask := AID;
    frm.LoadInfo;
    Result := frm.ShowModal = mrOk;
  finally
    frm.Free;
  end;
end;

procedure TTaskEditForm.FormCreate(Sender: TObject);
begin
  FTaskModel := TTaskModel.Create(Self);
  Status.Properties.ListSource := APIClient.dsStatus;
end;

procedure TTaskEditForm.LoadInfo;
begin
  if not VarIsNull(FIDTask) then
    FTaskModel.GetByID(FIDTask)
  else
    FTaskModel.TaskData.Active := True;

  dsTask.DataSet := FTaskModel.TaskData;
  Self.Caption := 'Alterando a tarefa';
  if VarIsNull(FIDTask) then
    Self.Caption := 'Incluindo uma nova tarefa';
end;

procedure TTaskEditForm.SaveClick(Sender: TObject);
begin
  FTaskModel.Save;
end;

end.
