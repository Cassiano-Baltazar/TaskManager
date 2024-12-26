unit ModelInterface;

interface

type
  IModel = interface
    ['{D684C121-BE77-43CD-9A5E-4C562882D26A}']
    function GetData(out OData: String): IModel;
    function GetMensagemErro(out OMensagemErro: String): IModel;
    function GetStatus: Boolean;
  end;

implementation

end.
