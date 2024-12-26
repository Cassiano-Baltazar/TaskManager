unit TaskRequest;

interface

uses
  System.Classes;

type
  TTaskRequest = class
  private
    FDescription: string;
    FStatus: Integer;
  public
    property Description: string read FDescription write FDescription;
    property Status: Integer read FStatus write FStatus;
  end;

implementation

end.
