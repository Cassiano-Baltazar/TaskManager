unit Routes;

interface

uses
  ControlApi, GBSwagger.Path.Attributes;

type
  EAuthentication = (scNone, scBasicAuthentication, scJwt);

  TRoutes = class
  protected
  class var FNomeApi, FBasePath, FTitle, FDescription, FVersion, FPathSwaggerJson: string;
    FAuthentication: EAuthentication;
    FAutenticaAd: Boolean;
    FLog: Boolean;
    FLogDir: string;
    class procedure SwaggerConfig; virtual;
    class function LogFormat: String; virtual;
    class function BasicAuthentication(const AUsername, APassword: string): Boolean; virtual;
  public
    class var FPathSwaggerHtml: string;
    class procedure Registrar; virtual;
  end;

  [SwagPath('APIStatus', 'API Status')]
  TRoutesCheck = class(TControlApi)
  public
    [SwagGet('Check', 'Verificar Status API', True)]
    [SwagResponse(200)]
    [SwagResponse(400)]
    [SwagResponse(500)]
    procedure CheckAPIStatus;
  end;

implementation

uses
  Horse, Horse.Logger.Provider.LogFile, System.SysUtils, Vcl.Forms, Horse.Logger.Manager, Horse.GBSwagger, Horse.Compression,
  Horse.Jhonson, Horse.HandleException, Horse.BasicAuthentication, LoginModel;

{ TRoutes }

class function TRoutes.BasicAuthentication(const AUsername, APassword: string): Boolean;
var
  Login: TLoginModel;
begin
  Login := TLoginModel.Create(nil);
  try
    Result := Login.Login(AUsername, APassword);
  finally
    Login.Free;
  end;
end;

class function TRoutes.LogFormat: String;
begin
  { All possibilities in the Horse.Logger.Manager unit in the DefaultHorseCallback procedure }
  Result :=
    '"Log":{' +
    '  "Method":"${request_method}",' +
    '  "RequestIP":"${request_clientip}",' +
    '  "RequestPath":"${request_path_info}",' +
    '  "RequestContent":[${request_content}],' +
    '  "Time":"${time_short}",' +
    '  "ExecutionTime":"${execution_time} ms",' +
    '  "ResponseStatus":"${response_status}"' +
    '}';
end;

class procedure TRoutes.Registrar;
var
  LLogFileConfig: THorseLoggerLogFileConfig;
begin
  SwaggerConfig;

  if FLog then
  begin
    if FLogDir = '' then
      FLogDir := ExtractFilePath(Application.ExeName) + 'Log';

    CreateDir(FLogDir);
    LLogFileConfig := THorseLoggerLogFileConfig.New.SetLogFormat(LogFormat).SetDir(FLogDir);

    THorseLoggerManager.RegisterProvider(THorseLoggerProviderLogFile.New(LLogFileConfig));
    THorse.Use(THorseLoggerManager.HorseCallback);
  end;

  THorse
    .Use(HorseSwagger(FPathSwaggerHtml, FPathSwaggerJson))
    .Use(Compression())
    .Use(Jhonson)
    .Use(HandleException)
    .Group
    .Prefix(FBasePath);
end;

class procedure TRoutes.SwaggerConfig;
begin
  Swagger
    .Info
      .Title(FTitle)
      .Description(FDescription)
      .Version(FVersion)
    .&End
    .AddProtocol(TGBSwaggerProtocol.gbHttp)
    .BasePath(FBasePath)
  .&End;
  if FAuthentication = scBasicAuthentication then
    Swagger.AddBasicSecurity.AddCallback(HorseBasicAuthentication(BasicAuthentication));

  THorseGBSwaggerRegister.RegisterPath(TRoutesCheck);
end;

{ TRoutesCheck }

procedure TRoutesCheck.CheckAPIStatus;
begin
  FResponse.Send('API Online').Status(THTTPStatus.OK);
end;

end.
