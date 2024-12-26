object MainTaskManager: TMainTaskManager
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'Task Manager'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
