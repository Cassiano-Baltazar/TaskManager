unit uFrmDebug;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxLayoutContainer,
  dxLayoutcxEditAdapters, cxCurrencyEdit, cxClasses, dxLayoutControl, cxTextEdit, dxLayoutControlAdapters, Vcl.Menus, cxMemo,
  cxRichEdit, cxButtons;

type
  TfrmDebug = class(TForm)
    Image1: TImage;
    Server: TcxTextEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    ServerPort: TcxCurrencyEdit;
    dxLayoutItem3: TdxLayoutItem;
    ServerDatabase: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    ServerUser: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    ServerPass: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    CreateIni: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    ServiceStart: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    ServiceStop: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    ServiceInstall: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    ServiceUninstall: TcxButton;
    dxLayoutItem11: TdxLayoutItem;
    PortAPI: TcxCurrencyEdit;
    dxLayoutItem12: TdxLayoutItem;
    APIStart: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    APIStop: TcxButton;
    dxLayoutItem14: TdxLayoutItem;
    APISwagger: TcxButton;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    Log: TcxRichEdit;
    dxLayoutItem16: TdxLayoutItem;
    LogClear: TcxButton;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LogClearClick(Sender: TObject);
    procedure APIStartClick(Sender: TObject);
    procedure APIStopClick(Sender: TObject);
    procedure APISwaggerClick(Sender: TObject);
    procedure CreateIniClick(Sender: TObject);
    procedure ServiceStartClick(Sender: TObject);
    procedure ServiceStopClick(Sender: TObject);
    procedure ServiceInstallClick(Sender: TObject);
    procedure ServiceUninstallClick(Sender: TObject);
  private
    procedure LoadIniInfo;
    procedure LimparLog;
    procedure HabilitarBotoes;
    procedure Status;
    procedure Start;
    procedure Stop;
  public
    procedure RegistrarLog(pMsg: string);
  end;

var
  frmDebug: TfrmDebug;

const ServiceDescription = 'Task Manager API';

implementation

uses
  Horse, Horse.Commons,
  uServiceUtil,
  System.Json, Winapi.ShellAPI, IniUtils, Routes, uUtils, TaskManagerRoute;

{$R *.dfm}

procedure TfrmDebug.APIStartClick(Sender: TObject);
begin
  Start;
  Status;
end;

procedure TfrmDebug.APIStopClick(Sender: TObject);
begin
  Stop;
  Status;
end;

procedure TfrmDebug.APISwaggerClick(Sender: TObject);
var
  cmd: PWideChar;
begin
  cmd := PWideChar('http://localhost:' + FloatToStr(PortAPI.Value) + TTaskManagerRoute.PathSwaggerHtml);
  ShellExecute(Handle, 'open', cmd, '', '', 1);
end;

procedure TfrmDebug.btnLimparClick(Sender: TObject);
begin
  LimparLog
end;

procedure TfrmDebug.CreateIniClick(Sender: TObject);
var
  Ini: TIniUtils;
begin
  Ini := TIniUtils.New;
  Ini.Server := Server.Text;
  Ini.Port := Trunc(ServerPort.Value);
  Ini.Database := ServerDatabase.Text;
  Ini.User := ServerUser.Text;
  Ini.Pass := ServerPass.Text;
  Ini.PortAPI := Trunc(PortAPI.Value);
  Ini.SaveIniFile;
end;

procedure TfrmDebug.FormCreate(Sender: TObject);
begin
  HabilitarBotoes;
  LoadIniInfo;
  Status;
end;

procedure TfrmDebug.HabilitarBotoes;
begin
  ServiceInstall.Enabled := not uServiceUtil.IsServiceInstalled(uUtils.GetNomeComputador, TTaskManagerRoute.NomeApi);
  ServiceUninstall.Enabled := not ServiceInstall.Enabled;
  ServiceStart.Enabled := uServiceUtil.IsServiceStopped(uUtils.GetNomeComputador, TTaskManagerRoute.NomeApi);
  ServiceStop.Enabled := (not ServiceStart.Enabled) and (uServiceUtil.IsServiceInstalled(uUtils.GetNomeComputador, TTaskManagerRoute.NomeApi));
end;

procedure TfrmDebug.limparLog;
begin
  log.Clear;
end;

procedure TfrmDebug.LoadIniInfo;
var
  Ini: TIniUtils;
begin
  Ini := TIniUtils.New;
  Server.Text := Ini.Server;
  ServerPort.Value := Ini.Port;
  ServerDatabase.Text := Ini.Database;
  ServerUser.Text := Ini.User;
  ServerPass.Text := Ini.Pass;
  PortAPI.Value := Ini.PortAPI;
end;

procedure TfrmDebug.LogClearClick(Sender: TObject);
begin
  LimparLog;
end;

procedure TfrmDebug.RegistrarLog(pMsg: string);
begin
  Log.Lines.Add(pMsg);
end;

procedure TfrmDebug.ServiceInstallClick(Sender: TObject);
begin
  try
    uServiceUtil.InstallService(TTaskManagerRoute.NomeApi, ServiceDescription, Application.ExeName, ServiceDescription);
    ShowMessage('Serviço instalado com sucesso!');
    HabilitarBotoes;
  except
    on E: Exception do
    begin
      HabilitarBotoes;
    end;
  end;
end;

procedure TfrmDebug.ServiceStartClick(Sender: TObject);
begin
  try
    uServiceUtil.ServiceStart(uUtils.GetNomeComputador, TTaskManagerRoute.NomeApi);
    ShowMessage('Serviço iniciado com sucesso!');
    HabilitarBotoes;
  except
    on E: Exception do
    begin
      HabilitarBotoes;
    end;
  end;
end;

procedure TfrmDebug.ServiceStopClick(Sender: TObject);
begin
  try
    uServiceUtil.ServiceStop(uUtils.GetNomeComputador, TTaskManagerRoute.NomeApi);
    ShowMessage('Serviço parado com sucesso!');
    HabilitarBotoes;
  except
    on E: Exception do
    begin
      HabilitarBotoes;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmDebug.ServiceUninstallClick(Sender: TObject);
begin
  try
    uServiceUtil.DelService(TTaskManagerRoute.NomeApi);
    ShowMessage('Serviço desinstalado com sucesso!');
    HabilitarBotoes;
  except
    on E: Exception do
    begin
      HabilitarBotoes;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmDebug.Start;
begin
  TTaskManagerRoute.Registrar;
  THorse.Listen(Trunc(PortAPI.Value));
end;

procedure TfrmDebug.Status;
begin
  APISwagger.Enabled := THorse.IsRunning;
  APIStop.Enabled := THorse.IsRunning;
  APIStart.Enabled := not THorse.IsRunning;
  PortAPI.Enabled := not THorse.IsRunning;
end;

procedure TfrmDebug.Stop;
begin
  THorse.StopListen;
end;

end.

