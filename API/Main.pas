unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TMainTaskManager = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
  private
    function GetPort: Integer;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  MainTaskManager: TMainTaskManager;

implementation

uses
  Horse, IniUtils, TaskManagerRoute;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  MainTaskManager.Controller(CtrlCode);
end;

function TMainTaskManager.GetPort: Integer;
begin
  Result := TIniUtils.New.PortAPI;
end;

function TMainTaskManager.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TMainTaskManager.ServiceCreate(Sender: TObject);
begin
  TTaskManagerRoute.Registrar;
end;

procedure TMainTaskManager.ServiceStart(Sender: TService; var Started: Boolean);
begin
  THorse.Listen(GetPort);
  Started := True;
end;

procedure TMainTaskManager.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  THorse.StopListen;
  Stopped := True;
end;

end.
