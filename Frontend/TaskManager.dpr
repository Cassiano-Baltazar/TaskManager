program TaskManager;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Login in 'Login.pas' {LoginForm},
  APIDao in 'DAO\APIDao.pas' {APIClient: TDataModule},
  TaskModel in 'Model\TaskModel.pas',
  TaskEdit in 'View\TaskEdit.pas' {TaskEditForm},
  TaskView in 'View\TaskView.pas' {TaskViewFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAPIClient, APIClient);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
