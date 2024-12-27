program TaskManager;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Login in 'Login.pas' {LoginForm},
  APIDao in 'DAO\APIDao.pas' {APIClient: TDataModule},
  TaskModel in 'Model\TaskModel.pas',
  TaskView in 'View\TaskView.pas' {TaskViewForm},
  TaskEdit in 'View\TaskEdit.pas' {TaskEditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAPIClient, APIClient);
  Application.Run;
end.
