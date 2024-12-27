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
  public
    function GetData(const AResource: string): string;

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

end.
