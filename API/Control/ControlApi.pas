unit ControlApi;

interface

uses
  Horse, System.Classes;

type
  TControlApi = class
  protected
    FRequest: THorseRequest;
    FResponse: THorseResponse;
  public
    constructor Create(ARequest: THorseRequest; AResponse: THorseResponse);
  end;

  TMensagem = class
  private
    FMenssage: string;
  public
    property Menssage: string read FMenssage write FMenssage;
  end;

implementation

{ TControlApi }

constructor TControlApi.Create(ARequest: THorseRequest; AResponse: THorseResponse);
begin
  FRequest := ARequest;
  FResponse := AResponse;
end;

end.
