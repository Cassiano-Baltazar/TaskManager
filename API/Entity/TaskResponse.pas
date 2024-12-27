unit TaskResponse;

interface

uses
  System.Classes, System.Generics.Collections;

type
  TTaskResponse = class
  private
    FIDTask: Int64;
    FDescription: string;
    FStatus: Integer;
    FCreated: TDateTime;
    FFinished: TDateTime;
    FPriority: Integer;
  public
    property IDTask: Int64 read FIDTask write FIDTask;
    property Description: string read FDescription write FDescription;
    property Priority: Integer read FPriority write FPriority;
    property Status: Integer read FStatus write FStatus;
    property Created: TDateTime read FCreated write FCreated;
    property Finished: TDateTime read FFinished write FFinished;
  end;

  TResponseDefault = class
  private
    Fsuccess: Boolean;
    Fmessage: string;
    Fdata: TList<TTaskResponse>;
    FpageIndex: Integer;
    FpageSize: Integer;
    FtotalPages: Integer;
    FtotalResults: Integer;
  public
    property success: Boolean read Fsuccess write Fsuccess;
    property message: string read Fmessage write Fmessage;
    property data: TList<TTaskResponse> read Fdata write Fdata;
    property pageIndex: Integer read FpageIndex write FpageIndex;
    property pageSize: Integer read FpageSize write FpageSize;
    property totalPages: Integer read FtotalPages write FtotalPages;
    property totalResults: Integer read FtotalResults write FtotalResults;
  end;

implementation

end.
