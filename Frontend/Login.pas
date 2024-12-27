unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxLayoutContainer, cxTextEdit, cxClasses,
  dxLayoutControl;

type
  TLoginForm = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    Usuario: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    Senha: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Login: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    procedure LoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    class function DoLogin: Boolean;
  end;

implementation

uses
  APIDao, TaskModel;

{$R *.dfm}

class function TLoginForm.DoLogin: Boolean;
var
  frm: TLoginForm;
begin
  frm := TLoginForm.Create(nil);
  try
    Result := frm.ShowModal = mrOk;
  finally
    frm.Free;
  end;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  Usuario.SetFocus;
end;

procedure TLoginForm.LoginClick(Sender: TObject);
begin
  APIClient.User := Usuario.Text;
  APIClient.Pass := Senha.Text;
  APIClient.GetData('Task/GetByID?ID=0');
  if APIClient.NotAuthorized then
    ShowMessage('Usuário e senha inválido')
  else
    ModalResult := mrOk;
end;

end.
