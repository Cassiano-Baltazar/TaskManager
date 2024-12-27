unit TaskModel;

interface

uses
  System.Classes, TaskRequest, ModelInterface, FireDAC.Comp.Client;

type

  TTaskModel = class(TInterfacedObject, IModel)
  private
    FData: string;
    FMensagemErro: string;
    function GetJson(const AQry: TFDQuery): string;
  public
    constructor Create;
    class function New: TTaskModel;
    function GetData(out OData: string): IModel;
    function GetMensagemErro(out OMensagemErro: string): IModel;
    function GetStatus: Boolean;

    function GetAll: TTaskModel;
    function GetByID(const AIDTask: Int64): TTaskModel;
    function InsertTask(const ARequest: TTaskRequest): TTaskModel;
    function UpdateTask(const AIDTask: Int64; const ARequest: TTaskRequest): TTaskModel;
    function DeleteTask(const AIDTask: Int64): TTaskModel;
    function ChangeStatus(const AIDTask: Int64; const AStatus: Integer): TTaskModel;
  end;

implementation

uses
  System.SysUtils, SQLServer, FireDAC.Stan.Param, Data.DB, System.JSON, System.DateUtils;

{ TTaskModel }

function TTaskModel.ChangeStatus(const AIDTask: Int64; const AStatus: Integer): TTaskModel;
var
  qry: TFDQuery;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Text := 'select * from DBO.TASK T where T.ID_TASK = :ID_TASK';
    qry.Params.ParamByName('ID_TASK').DataType := ftInteger;
    qry.Params.ParamByName('ID_TASK').ParamType := ptInput;
    qry.Params.ParamByName('ID_TASK').Value := AIDTask;
    qry.Open;
    if qry.IsEmpty then
      FMensagemErro := 'Não foi encontrado uma tarefa com o ID ' + AIDTask.ToString
    else if ((qry.FieldByName('STATUS').AsInteger = 2) and (AStatus = 2)) then
      FMensagemErro := 'A tarefa já está finalizada'
    else
    begin
      qry.Edit;
      qry.FieldByName('STATUS').AsInteger := AStatus;
      qry.FieldByName('FINISHED').Clear;
      if AStatus = 2 then
        qry.FieldByName('FINISHED').AsDateTime := SqlServerDAO.GetServerDate;
      qry.Post;
    end;
  finally
    qry.Free;
  end;
end;

constructor TTaskModel.Create;
begin
  FMensagemErro := EmptyStr;
  FData := '[]';
end;

function TTaskModel.DeleteTask(const AIDTask: Int64): TTaskModel;
var
  qry: TFDQuery;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Text := 'select * from DBO.TASK T where T.ID_TASK = :ID_TASK';
    qry.Params.ParamByName('ID_TASK').DataType := ftInteger;
    qry.Params.ParamByName('ID_TASK').ParamType := ptInput;
    qry.Params.ParamByName('ID_TASK').Value := AIDTask;
    qry.Open;
    if qry.IsEmpty then
      FMensagemErro := 'Não foi encontrado uma tarefa com o ID ' + AIDTask.ToString
    else
      qry.Delete;
  finally
    qry.Free;
  end;
end;

function TTaskModel.GetAll: TTaskModel;
var
  qry: TFDQuery;
  JsonArray: TJSONArray;
  JsonObject: TJSONObject;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Text := 'select * from DBO.TASK T';
    qry.Open;
    JsonArray := TJSONArray.Create;
    try
      qry.First;
      while not qry.Eof do
      begin
        JsonObject := JsonObject.ParseJSONValue(GetJson(qry)) as TJSONObject;
        JsonArray.Add(JsonObject);
        qry.Next;
      end;

      FData := JsonArray.ToString;
    finally
      JsonArray.Free;
    end;
  finally
    qry.Free;
  end;
end;

function TTaskModel.GetByID(const AIDTask: Int64): TTaskModel;
var
  qry: TFDQuery;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Text := 'select * from DBO.TASK T where T.ID_TASK = :ID_TASK';
    qry.Params.ParamByName('ID_TASK').DataType := ftInteger;
    qry.Params.ParamByName('ID_TASK').ParamType := ptInput;
    qry.Params.ParamByName('ID_TASK').Value := AIDTask;
    qry.Open;

    FData := GetJson(qry);
  finally
    qry.Free;
  end;
end;

function TTaskModel.GetData(out OData: string): IModel;
begin
  Result := Self;
  OData := FData;
end;

function TTaskModel.GetJson(const AQry: TFDQuery): string;
var
  JsonObject: TJSONObject;
begin
  if not AQry.IsEmpty then
  begin
    JsonObject := TJSONObject.Create;
    try
      JsonObject.AddPair('IDTask', TJSONNumber.Create(AQry.FieldByName('ID_TASK').AsInteger));
      JsonObject.AddPair('Description', AQry.FieldByName('DESCRIPTION').AsString);
      JsonObject.AddPair('Priority', TJSONNumber.Create(AQry.FieldByName('PRIORITY').AsInteger));
      JsonObject.AddPair('Status', TJSONNumber.Create(AQry.FieldByName('STATUS').AsInteger));
      JsonObject.AddPair('Created', DateToISO8601(AQry.FieldByName('CREATED').AsDateTime));
      if AQry.FieldByName('FINISHED').IsNull then
        JsonObject.AddPair('Finished', 'Null')
      else
        JsonObject.AddPair('Finished', DateToISO8601(AQry.FieldByName('FINISHED').AsDateTime));

      Result := JsonObject.ToString;
    finally
      JsonObject.Free;
    end;
  end;
end;

function TTaskModel.GetMensagemErro(out OMensagemErro: string): IModel;
begin
  Result := Self;
  OMensagemErro := FMensagemErro;
end;

function TTaskModel.GetStatus: Boolean;
begin
  Result := FMensagemErro.IsEmpty;
end;

function TTaskModel.InsertTask(const ARequest: TTaskRequest): TTaskModel;
var
  qry: TFDQuery;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Add('DECLARE @LastID INT;');
    qry.SQL.Add('INSERT INTO DBO.TASK (DESCRIPTION, PRIORITY, STATUS, CREATED, FINISHED) VALUES (:DESCRIPTION, :PRIORITY, :STATUS, :CREATED, :FINISHED);');
    qry.SQL.Add('SET @LastID = SCOPE_IDENTITY();');
    qry.SQL.Add('SELECT * FROM DBO.TASK WHERE ID_TASK = @LastID;');
    qry.Params.ParamByName('DESCRIPTION').DataType := ftString;
    qry.Params.ParamByName('DESCRIPTION').ParamType := ptInput;
    qry.Params.ParamByName('DESCRIPTION').AsString := ARequest.Description;
    qry.Params.ParamByName('PRIORITY').DataType := ftInteger;
    qry.Params.ParamByName('PRIORITY').ParamType := ptInput;
    qry.Params.ParamByName('PRIORITY').AsInteger := ARequest.Priority;
    qry.Params.ParamByName('STATUS').DataType := ftInteger;
    qry.Params.ParamByName('STATUS').ParamType := ptInput;
    qry.Params.ParamByName('STATUS').AsInteger := ARequest.Status;
    qry.Params.ParamByName('CREATED').DataType := ftDateTime;
    qry.Params.ParamByName('CREATED').ParamType := ptInput;
    qry.Params.ParamByName('CREATED').AsDateTime := SqlServerDAO.GetServerDate;
    qry.Params.ParamByName('FINISHED').DataType := ftDateTime;
    qry.Params.ParamByName('FINISHED').ParamType := ptInput;
    qry.Params.ParamByName('FINISHED').Clear;
    if ARequest.Status = 2 then
      qry.Params.ParamByName('FINISHED').AsDateTime := SqlServerDAO.GetServerDate;
    qry.Open;

    FData := GetJson(qry);
  finally
    qry.Free;
  end;
end;

class function TTaskModel.New: TTaskModel;
begin
  Result := Self.Create;
end;

function TTaskModel.UpdateTask(const AIDTask: Int64; const ARequest: TTaskRequest): TTaskModel;
var
  qry: TFDQuery;
begin
  Result := Self;
  qry := SqlServerDAO.GetDataset;
  try
    qry.SQL.Text := 'select * from DBO.TASK T where T.ID_TASK = :ID_TASK';
    qry.Params.ParamByName('ID_TASK').DataType := ftInteger;
    qry.Params.ParamByName('ID_TASK').ParamType := ptInput;
    qry.Params.ParamByName('ID_TASK').Value := AIDTask;
    qry.Open;
    if qry.IsEmpty then
      FMensagemErro := 'Não foi encontrado uma tarefa com o ID ' + AIDTask.ToString
    else if ((qry.FieldByName('STATUS').AsInteger = 2) and (ARequest.Status = 2)) then
      FMensagemErro := 'A tarefa já está finalizada'
    else
    begin
      qry.Edit;
      qry.FieldByName('DESCRIPTION').AsString := ARequest.Description;
      qry.FieldByName('PRIORITY').AsInteger := ARequest.Priority;
      qry.FieldByName('STATUS').AsInteger := ARequest.Status;
      qry.FieldByName('FINISHED').Clear;
      if ARequest.Status = 2 then
        qry.FieldByName('FINISHED').AsDateTime := SqlServerDAO.GetServerDate;
      qry.Post;

      FData := GetJson(qry);
    end;
  finally
    qry.Free;
  end;
end;

end.
