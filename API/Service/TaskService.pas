unit TaskService;

interface

uses
  ServiceAPI, Horse;

type
  ITaskService = interface
    ['{B1534F12-2CFE-424B-9B64-35BE6D54B7F3}']
    procedure GetAllTask;
    procedure GetByIDTask;
    procedure InsertTask;
    procedure UpdateTask;
    procedure DeleteTask;
    procedure ChangeStatus;
  end;

  TTaskService = class(TServiceApi, ITaskService)
  protected
    function CarregarBody: TObject; override;
  public
    procedure GetAllTask;
    procedure GetByIDTask;
    procedure InsertTask;
    procedure UpdateTask;
    procedure DeleteTask;
    procedure ChangeStatus;

    class function New(const ARequest: THorseRequest; const AResponse: THorseResponse): ITaskService;
  end;

implementation

uses
  TaskRequest, REST.Json, GBSwagger.Validator.Interfaces, TaskModel, System.JSON, System.SysUtils;

{ TTaskService }

function TTaskService.CarregarBody: TObject;
begin
  Result := TJson.JsonToObject<TTaskRequest>(FRequest.Body);
  SwaggerValidator.Validate(Result);
end;


procedure TTaskService.ChangeStatus;
var
  Resultado: string;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    if TTaskModel.New.ChangeStatus(StrToInt(FRequest.Query['ID']), StrToInt(FRequest.Query['STATUS'])).GetMensagemErro(Resultado).GetStatus then
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil)).Status(THTTPStatus.NoContent)
    else
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + Resultado;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

procedure TTaskService.DeleteTask;
var
  Resultado: string;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    if TTaskModel.New.DeleteTask(StrToInt(FRequest.Query['ID'])).GetMensagemErro(Resultado).GetStatus then
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil)).Status(THTTPStatus.NoContent)
    else
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + Resultado;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

procedure TTaskService.GetAllTask;
var
  Resultado, Dados: string;
  JsonArray: TJSONArray;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    if TTaskModel.New.GetAll.GetMensagemErro(Resultado).GetData(Dados).GetStatus then
    begin
      JsonArray := TJSONObject.ParseJSONValue(Dados) as TJSONArray;
      FTotalResults := JsonArray.Count;
      FResponse.Send<TJSONObject>(MontarJsonResponse(JsonArray)).Status(THTTPStatus.OK)
    end
    else
    begin
      FSucess := False;
      FMessage := 'Erro ao buscar a tarefa com o ID ' + FRequest.Query['ID'] + '. Erro: ' + Resultado;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

procedure TTaskService.GetByIDTask;
var
  Resultado, Dados: string;
  JsonDados: TJSONObject;
  JsonArray: TJSONArray;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    if TTaskModel.New.GetByID(StrToInt(FRequest.Query['ID'])).GetMensagemErro(Resultado).GetData(Dados).GetStatus then
    begin
      JsonArray := TJSONArray.Create;
      JsonDados := TJSONObject.ParseJSONValue(Dados) as TJSONObject;
      if JsonDados <> nil then
        JsonArray.Add(JsonDados);
      FTotalResults := JsonArray.Count;
      FResponse.Send<TJSONObject>(MontarJsonResponse(JsonArray)).Status(THTTPStatus.OK)
    end
    else
    begin
      FSucess := False;
      FMessage := 'Erro ao buscar a tarefa com o ID ' + FRequest.Query['ID'] + '. Erro: ' + Resultado;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao alterar a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

procedure TTaskService.InsertTask;
var
  Body: TTaskRequest;
  Resultado, Dados: string;
  JsonDados: TJSONObject;
  JsonArray: TJSONArray;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    Body := TTaskRequest(CarregarBody);
    try
      if TTaskModel.New.InsertTask(Body).GetMensagemErro(Resultado).GetData(Dados).GetStatus then
      begin
        JsonArray := TJSONArray.Create;
        JsonDados := TJSONObject.ParseJSONValue(Dados) as TJSONObject;
        if JsonDados <> nil then
          JsonArray.Add(JsonDados);
        FResponse.Send<TJSONObject>(MontarJsonResponse(JsonArray)).Status(THTTPStatus.OK)
      end
      else
      begin
        FSucess := False;
        FMessage := 'Erro ao inserir a tarefa. Erro: ' + Resultado;
        FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
      end;
    finally
      Body.Free;
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao inserir a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

class function TTaskService.New(const ARequest: THorseRequest; const AResponse: THorseResponse): ITaskService;
begin
  Result := Self.Create(ARequest, AResponse);
end;

procedure TTaskService.UpdateTask;
var
  Body: TTaskRequest;
  Resultado, Dados: string;
  JsonDados: TJSONObject;
  JsonArray: TJSONArray;
begin
  try
    FSucess := True;
    FMessage := 'OK';

    Body := TTaskRequest(CarregarBody);
    try
      if TTaskModel.New.UpdateTask(StrToInt(FRequest.Query['ID']), Body).GetMensagemErro(Resultado).GetData(Dados).GetStatus then
      begin
        JsonArray := TJSONArray.Create;
        JsonDados := TJSONObject.ParseJSONValue(Dados) as TJSONObject;
        if JsonDados <> nil then
          JsonArray.Add(JsonDados);
        FResponse.Send<TJSONObject>(MontarJsonResponse(JsonArray)).Status(THTTPStatus.OK)
      end
      else
      begin
        FSucess := False;
        FMessage := 'Erro ao inserir a tarefa. Erro: ' + Resultado;
        FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.BadRequest);
      end;
    finally
      Body.Free;
    end;
  except
    on E: Exception do
    begin
      FSucess := False;
      FMessage := 'Erro ao inserir a tarefa. Erro: ' + E.Message;
      FResponse.Send<TJSONObject>(MontarJsonResponse(nil, scSomenteMensagem)).Status(THTTPStatus.InternalServerError);
    end;
  end;
end;

end.
