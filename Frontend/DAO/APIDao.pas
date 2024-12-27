unit APIDao;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client, REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TAPIClient = class(TDataModule)
    RESTClient1: TRESTClient;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    mtStatus: TFDMemTable;
    dsStatus: TDataSource;
  private
    FUser: string;
    FPass: string;
    FNotAuthorized: Boolean;
    FSucess: Boolean;
    FClientError: Boolean;
    procedure SetAuthenticator;
    function MD5String(const AString: string): string;
    procedure PostPut(const AResource, ABody: string; const AMethod: TRESTRequestMethod);
  public
    function GetData(const AResource: string): string;
    procedure Post(const AResource, ABody: string);
    procedure Put(const AResource, ABody: string);
    procedure Delete(const AResource: string);

    property User: string read FUser write FUser;
    property Pass: string read FPass write FPass;
    property NotAuthorized: Boolean read FNotAuthorized;
    property Sucess: Boolean read FSucess;
    property ClientError: Boolean read FClientError;
  end;

var
  APIClient: TAPIClient;

implementation

uses
  IdHash, IdHashMessageDigest, System.DateUtils, System.Generics.Collections;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

procedure TAPIClient.SetAuthenticator;
begin
  HTTPBasicAuthenticator1.Username := FUser;
  HTTPBasicAuthenticator1.Password := MD5String(FPass);
end;

procedure TAPIClient.Delete(const AResource: string);
begin
  PostPut(AResource, '', rmDELETE);
end;

function TAPIClient.GetData(const AResource: string): string;
var
  Request: TRESTRequest;
  Response: TRESTResponse;
begin
  SetAuthenticator;
  Request := TRESTRequest.Create(Self);
  Response := TRESTResponse.Create(Self);
  try
    Request.Client := RESTClient1;
    Request.Response := Response;

    Request.Method := rmGET;
    Request.Resource := AResource;
    Response.ContentType := 'application/json';
    Response.RootElement := 'data';
    Request.Execute;

    FNotAuthorized := Response.Status.ClientErrorUnauthorized_401;
    FSucess := Response.Status.Success;
    FClientError := Response.Status.ClientError;

    Result := Response.JSONText;
  finally
    Request.Free;
    Response.Free;
  end;
end;

function TAPIClient.MD5String(const AString: string): string;
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStringAsHex(AString);
  finally
    MD5.Free;
  end;
end;

procedure TAPIClient.Post(const AResource, ABody: string);
begin
  PostPut(AResource, ABody, rmPOST);
end;

procedure TAPIClient.PostPut(const AResource, ABody: string; const AMethod: TRESTRequestMethod);
var
  Request: TRESTRequest;
  Response: TRESTResponse;
begin
  SetAuthenticator;
  Request := TRESTRequest.Create(Self);
  Response := TRESTResponse.Create(Self);
  try
    Request.Client := RESTClient1;
    Request.Response := Response;

    Request.Method := AMethod;
    Request.Resource := AResource;
    if not ABody.IsEmpty then
      Request.Body.Add(ABody, ctAPPLICATION_JSON);
    Request.Execute;

    FNotAuthorized := Response.Status.ClientErrorUnauthorized_401;
    FSucess := Response.Status.Success;
    FClientError := Response.Status.ClientError;
  finally
    Request.Free;
    Response.Free;
  end;
end;

procedure TAPIClient.Put(const AResource, ABody: string);
begin
  PostPut(AResource, ABody, rmPUT);
end;

end.
