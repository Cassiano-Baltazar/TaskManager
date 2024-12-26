program TaskManagerAPI;

uses
  Vcl.SvcMgr,
  Main in 'Main.pas' {MainTaskManager: TService} ,
  DefaultRoute in 'Route\DefaultRoute.pas',
  ControlApi in 'Control\ControlApi.pas',
  LoginModel in 'Model\LoginModel.pas',
  SQLServer in 'DAO\SQLServer.pas' {SqlServerDAO: TDataModule} ,
  IniUtils in 'Utils\IniUtils.pas',
  uServiceUtil in 'Utils\uServiceUtil.pas',
  WinSvcEx in 'Utils\WinSvcEx.pas',
  uFrmDebug in 'uFrmDebug.pas' {frmDebug} ,
  uUtils in 'Utils\uUtils.pas',
  TaskManagerRoute in 'Route\TaskManagerRoute.pas',
  TaskModel in 'Model\TaskModel.pas',
  TaskRequest in 'Entity\TaskRequest.pas',
  TaskResponse in 'Entity\TaskResponse.pas',
  ModelInterface in 'Model\ModelInterface.pas',
  TaskControl in 'Control\TaskControl.pas',
  TaskService in 'Service\TaskService.pas',
  ServiceAPI in 'Service\ServiceAPI.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //

  if uServiceUtil.IsServiceProcess then
  begin
    if not Application.DelayInitialize or Application.Installing then
      Application.Initialize;

    Application.CreateForm(TSqlServerDAO, SqlServerDAO);
    Application.CreateForm(TMainTaskManager, MainTaskManager);
    Application.Run;
  end
  else
  begin
    ReportMemoryLeaksOnShutdown := True;
    Application.CreateForm(TSqlServerDAO, SqlServerDAO);
    Application.CreateForm(TfrmDebug, frmDebug);
    frmDebug.ShowModal;
  end;

end.
