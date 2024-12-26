unit TaskControl;

interface

uses
  ControlApi, GBSwagger.Path.Attributes, TaskRequest, TaskResponse;

type

  [SwagPath('Task')]
  TTaskControl = class(TControlApi)
  public
    [SwagGET('Task/Get', 'Get All Task', False)]
    [SwagResponse(200, TResponseDefault)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure GetAllTask;

    [SwagGET('Task/GetByID', 'Get Task By ID', False)]
    [SwagParamQuery('ID', 'ID Task', True)]
    [SwagResponse(200, TResponseDefault)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure GetByIDTask;

    [SwagPost('Task/Insert', 'Insert Task', False)]
    [SwagParamBody('Request body', TTaskRequest, False, 'Request body', True)]
    [SwagResponse(200, TResponseDefault)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure InsertTask;

    [SwagPUT('Task/Update', 'Update Task', False)]
    [SwagParamQuery('ID', 'ID Task', True)]
    [SwagParamBody('Request body', TTaskRequest, False, 'Request body', True)]
    [SwagResponse(200, TResponseDefault)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure UpdateTask;

    [SwagDELETE('Task/Delete', 'Delete Task', False)]
    [SwagParamQuery('ID', 'ID Task', True)]
    [SwagResponse(204)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure DeleteTask;

    [SwagPUT('Task/ChangeStatus', 'Change Status of Task', False)]
    [SwagParamQuery('ID', 'ID Task', True, True)]
    [SwagParamQuery('STATUS', 'Status', True, True)]
    [SwagResponse(204)]
    [SwagResponse(400, TMensagem)]
    [SwagResponse(500)]
    procedure ChangeStatus;
  end;

procedure Registrar;

implementation

uses
  Horse.GBSwagger.Register, TaskService;

procedure Registrar;
begin
  THorseGBSwaggerRegister.RegisterPath(TTaskControl);
end;

{ TTaskControl }

procedure TTaskControl.ChangeStatus;
begin
  TTaskService.New(FRequest, FResponse).ChangeStatus;
end;

procedure TTaskControl.DeleteTask;
begin
  TTaskService.New(FRequest, FResponse).DeleteTask;
end;

procedure TTaskControl.GetAllTask;
begin
  TTaskService.New(FRequest, FResponse).GetAllTask;
end;

procedure TTaskControl.GetByIDTask;
begin
  TTaskService.New(FRequest, FResponse).GetByIDTask;
end;

procedure TTaskControl.InsertTask;
begin
  TTaskService.New(FRequest, FResponse).InsertTask;
end;

procedure TTaskControl.UpdateTask;
begin
  TTaskService.New(FRequest, FResponse).UpdateTask;
end;

end.
