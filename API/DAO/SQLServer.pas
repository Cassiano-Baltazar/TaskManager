unit SQLServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.ODBCBase;

type
  TSqlServerDAO = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  public
    function GetDataset: TFDQuery;
    function GetServerDate: TDateTime;
  end;

var
  SqlServerDAO: TSqlServerDAO;

implementation

uses
  IniUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TSqlServerDAO.DataModuleCreate(Sender: TObject);
var
  Ini: TIniUtils;
begin
  Ini := TIniUtils.New;
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('DriverID=MSSQL');
  FDConnection1.Params.Add('Server=' + Ini.Server);
  FDConnection1.Params.Add('Database=' + Ini.Database);
  FDConnection1.Params.Add('User_Name=' + Ini.User);
  FDConnection1.Params.Add('Password=' + Ini.Pass);
  FDConnection1.Connected := True;
end;

function TSqlServerDAO.GetDataset: TFDQuery;
begin
  Result := TFDQuery.Create(Self);
  Result.Connection := FDConnection1;
end;

function TSqlServerDAO.GetServerDate: TDateTime;
var
  qry: TFDQuery;
begin
  qry := GetDataset;
  try
    qry.Open('SELECT GETDATE()');
    Result := qry.Fields[0].AsDateTime;
  finally
    qry.Free;
  end;
end;

end.
