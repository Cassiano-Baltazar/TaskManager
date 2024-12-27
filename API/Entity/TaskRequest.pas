unit TaskRequest;

interface

uses
  System.Classes;

type
  TTaskRequest = class
  private
    FDescription: string;
    FStatus: Integer;
    FPriority: Integer;
  public
    property Description: string read FDescription write FDescription;
    property Priority: Integer read FPriority write FPriority;
    property Status: Integer read FStatus write FStatus;
  end;

implementation

end.
