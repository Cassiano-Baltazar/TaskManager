unit TaskModel;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.Generics.Collections;

type
  TTaskModel = class(TComponent)
  private
    FTaskData: TFDMemTable;
  public
    constructor Create(AOwner: TComponent); override;

    procedure GetAllTask;
    procedure GetByID(const AID: Integer);
    property TaskData: TFDMemTable read FTaskData write FTaskData;
  end;

implementation

uses
  APIDao, System.JSON, System.DateUtils, Data.DB, System.SysUtils;

{ TTaskModel }

constructor TTaskModel.Create(AOwner: TComponent);
  procedure AddFieldDef(const ATable: TFDMemTable; const AName: string; const ADataType: TFieldType; const ASize: Integer = 0);
  begin
    ATable.FieldDefs.Add(AName, ADataType, ASize);
  end;
begin
  inherited;
  FTaskData := TFDMemTable.Create(Self);
  AddFieldDef(FTaskData, 'ID_TASK', ftInteger);
  AddFieldDef(FTaskData, 'DESCRIPTION', ftString, 100);
  AddFieldDef(FTaskData, 'PRIORITY', ftInteger);
  AddFieldDef(FTaskData, 'STATUS', ftInteger);
  AddFieldDef(FTaskData, 'CREATED', ftDateTime);
  AddFieldDef(FTaskData, 'FINISHED', ftDateTime);
  FTaskData.CreateDataSet;
end;

procedure TTaskModel.GetAllTask;
var
  JsonArray: TJsonArray;
  JsonObject: TJSONObject;
  I: Integer;
  Value: string;
begin
  FTaskData.Active := False;
  JSONArray := TJSONObject.ParseJSONValue(APIClient.GetData('Task/Get')) as TJSONArray;
  try
    FTaskData.Active := True;
    for I := 0 to JsonArray.Count - 1 do
    begin
      JsonObject := JsonArray.Items[I] as TJSONObject;

      FTaskData.Append;
      try
        FTaskData.FieldByName('ID_TASK').AsInteger := JsonObject.GetValue<Integer>('IDTask');
        FTaskData.FieldByName('DESCRIPTION').Value := JsonObject.GetValue<string>('Description');
        FTaskData.FieldByName('PRIORITY').Value := JsonObject.GetValue<Integer>('Priority');
        FTaskData.FieldByName('STATUS').Value := JsonObject.GetValue<Integer>('Status');
        FTaskData.FieldByName('CREATED').Value := ISO8601ToDate(JsonObject.GetValue<string>('Created'));
        Value := JsonObject.GetValue<string>('Finished');
        if Value = 'Null' then
          FTaskData.FieldByName('FINISHED').Clear
        else
          FTaskData.FieldByName('FINISHED').Value := ISO8601ToDate(Value);
        FTaskData.Post;
      finally
        FTaskData.Cancel;
      end;
    end;
  finally
    JsonArray.Free;
  end;
end;

procedure TTaskModel.GetByID(const AID: Integer);
begin
  TJSONObject.ParseJSONValue(APIClient.GetData('Task/GetByID?ID=' + AID.ToString));
end;

end.
