unit TaskManagerRoute;

interface

uses
  DefaultRoute;

Type
  TTaskManagerRoute = class(TDefaultRoute)
  public
    class procedure Registrar; override;
    class procedure SwaggerConfig; override;
  end;

implementation

uses
  TaskControl;

class procedure TTaskManagerRoute.Registrar;
begin
  NomeApi := 'TaskManagerAPI';
  FBasePath := '/' + NomeApi + '/v1/';
  FTitle := 'Task Manager API';
  FDescription := 'Task Manager API';
  FVersion := '1.0';
  PathSwaggerHtml := '/' + NomeApi + '/swagger/index.html';
  FPathSwaggerJson := '/' + NomeApi + '/swagger/index.json';
  FAuthentication := scBasicAuthentication;
  FAutenticaAd := True;
  FLog := True;
  inherited;
end;

class procedure TTaskManagerRoute.SwaggerConfig;
begin
  inherited;
  TaskControl.Registrar;
end;

end.
