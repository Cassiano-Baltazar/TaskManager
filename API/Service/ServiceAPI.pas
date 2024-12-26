unit ServiceAPI;

interface

uses
  Horse, Classes, SysUtils, System.Math, System.Generics.Collections, System.Json, System.DateUtils;

type
  ETipoResponse = (scSomenteMensagem, scRetornoCompleto);

  TServiceApi = class(TInterfacedObject)
  protected
    FSucess: Boolean;
    FMessage: string;
    FPageIndex: Integer;
    FPageSize: Integer;
    FTotalResults: Integer;
    FRequest: THorseRequest;
    FResponse: THorseResponse;

    function CarregarBody: TObject; virtual;
    function CarregarQueryParams: TObject; virtual;
    function MapRequest(pRequest, pEntity: TObject): TObject; virtual; Abstract;

    procedure Get; virtual; Abstract;
    procedure Post; virtual; Abstract;
    procedure Delete; virtual; Abstract;

    function MontarJsonResponse(pData: TJsonArray; pTipoRetorno: ETipoResponse = scRetornoCompleto): TJsonObject; virtual;
    function DataJSONToData(aDataJSON: String): TDateTime;
  public
    constructor Create(const ARequest: THorseRequest; const AResponse: THorseResponse);
  end;

implementation

{ TServiceApi }

function TServiceApi.CarregarBody: TObject;
begin
  Result := nil;

  if FRequest.Body = EmptyStr then
    raise Exception.CreateFmt('Request Body não informado.', ['Request Body']);
end;

function TServiceApi.CarregarQueryParams: TObject;
begin
  Result := nil;
end;

constructor TServiceApi.Create(const ARequest: THorseRequest; const AResponse: THorseResponse);
begin
  FRequest := ARequest;
  FResponse := AResponse;
end;

function TServiceApi.DataJSONToData(aDataJSON: String): TDateTime;
begin
  // Formato da data JSON: '2016-09-14'
  // mas poderá vir como '15/06/2016' (dd/mm/yyyy)
  // ou como "2018-04-28 14:04:16"
  if Trim(aDataJSON) = '' then
    Result := 0
  else if (Trim(aDataJSON) = '00:00:00') or (Trim(aDataJSON) = '0000-00-00') then
    Result := 0
  else if (Length(Trim(aDataJSON)) = 19) and (Copy(aDataJSON, 3, 1) = '/') and (Copy(aDataJSON, 14, 1) = ':') and (Copy(aDataJSON, 17, 1) = ':') then
  begin
    // ex.:  24/08/2018 10:43:59
    Result := EncodeDateTime(
      StrToInt(Copy(aDataJSON, 7, 4)),
      StrToInt(Copy(aDataJSON, 4, 2)),
      StrToInt(Copy(aDataJSON, 1, 2)),
      StrToInt(Copy(aDataJSON, 12, 2)),
      StrToInt(Copy(aDataJSON, 15, 2)),
      StrToInt(Copy(aDataJSON, 18, 2)),
      0);
  end
  else if (Length(Trim(aDataJSON)) = 19) and (Copy(aDataJSON, 5, 1) = '-') and (Copy(aDataJSON, 14, 1) = ':') then
  begin
    // ex.:  24/08/2018 10:43:59
    Result := EncodeDateTime(
      StrToInt(Copy(aDataJSON, 1, 4)),
      StrToInt(Copy(aDataJSON, 6, 2)),
      StrToInt(Copy(aDataJSON, 9, 2)),
      StrToInt(Copy(aDataJSON, 12, 2)),
      StrToInt(Copy(aDataJSON, 15, 2)),
      StrToInt(Copy(aDataJSON, 18, 2)),
      0);
  end
  else if (Copy(aDataJSON, 3, 1) = '/') and (Copy(aDataJSON, 6, 1) = '/') then
  begin
    try
      Result := StrToDate(Copy(aDataJSON, 1, 10));

      // Coloquei data limite 1920 pra evitar digtitacoes muito erradas e erro de conversao (ex.: "1582-06-30")
      if YearOf(Result) < 1920 then
        Result := 0;
    except
      Result := 0;
    end;
  end
  else
  begin
    try
      Result := StrToDate(Copy(aDataJSON, 9, 2) + '/' + Copy(aDataJSON, 6, 2) + '/' + Copy(aDataJSON, 1, 4));

      // Coloquei data limite 1920 pra evitar digtitacoes muito erradas e erro de conversao (ex.: "1582-06-30")
      if StrToInt(Copy(aDataJSON, 1, 4)) < 1920 then
        Result := 0;
    except
      Result := 0;
    end;
  end;
end;

function TServiceApi.MontarJsonResponse(pData: TJsonArray; pTipoRetorno: ETipoResponse): TJsonObject;
var
  TotalPages: Integer;
begin
  Result := TJsonObject.Create;
  if pTipoRetorno = scSomenteMensagem then
    Result.AddPair('message', FMessage)
  else
  begin
    if FPageSize = 0 then
      TotalPages := 1
    else
      TotalPages := Ceil(FTotalResults / FPageSize);

    Result.AddPair('success', TJSONBool.Create(FSucess));
    Result.AddPair('message', FMessage);
    Result.AddPair('data', pData);
    Result.AddPair('pageIndex', TJSONNumber.Create(FPageIndex));
    Result.AddPair('pageSize', TJSONNumber.Create(FPageSize));
    Result.AddPair('totalPages', TJSONNumber.Create(TotalPages));
    Result.AddPair('totalResults', TJSONNumber.Create(FTotalResults));
  end;
end;

end.
