object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Tarefas'
  ClientHeight = 704
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline TaskViewFrame1: TTaskViewFrame
    Left = 0
    Top = 0
    Width = 1089
    Height = 704
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1089
    ExplicitHeight = 704
    inherited dxLayoutControl1: TdxLayoutControl
      Width = 1089
      Height = 704
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1089
      ExplicitHeight = 704
      inherited gTask: TcxGrid
        Width = 1069
        Height = 635
        ExplicitWidth = 1069
        ExplicitHeight = 635
        inherited tvTask: TcxGridDBTableView
          inherited tvTaskID_TASK: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited tvTaskDESCRIPTION: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited tvTaskPRIORITY: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited tvTaskSTATUS: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited tvTaskCREATED: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited tvTaskFINISHED: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
        end
      end
    end
    inherited cxImageList1: TcxImageList
      FormatVersion = 1
    end
  end
end
