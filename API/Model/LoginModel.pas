unit LoginModel;

interface

uses
  System.Classes, FireDAC.Stan.Param, Data.DB;

type
  TLoginModel = class(TComponent)
  public
    function Login(const AUser, APass: string): Boolean;
  end;

implementation

uses
  SQLServer, FireDAC.Comp.Client;

{ TLoginModel }

function TLoginModel.Login(const AUser, APass: string): Boolean;
var
  qUser: TFDQuery;
begin
  qUser := SqlServerDAO.GetDataset;
  try
    qUser.SQL.Text := 'select * from DBO.USERS U where U.USER_NAME = :USER_NAME and U.USER_PASS = :USER_PASS';
    qUser.ParamByName('USER_NAME').AsString := AUser;
    qUser.ParamByName('USER_PASS').AsString := APass;
    qUser.Open;

    Result := not qUser.IsEmpty;
  finally
    qUser.Free;
  end;
end;

end.
