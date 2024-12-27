object TaskViewForm: TTaskViewForm
  Left = 0
  Top = 0
  Caption = 'Tarefas'
  ClientHeight = 840
  ClientWidth = 1265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1265
    Height = 840
    Align = alClient
    TabOrder = 0
    object gTask: TcxGrid
      Left = 10
      Top = 28
      Width = 1245
      Height = 802
      TabOrder = 0
      object tvTask: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsTask
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object tvTaskID_TASK: TcxGridDBColumn
          Caption = 'ID Tarefa'
          DataBinding.FieldName = 'ID_TASK'
          DataBinding.IsNullValueType = True
          Options.Editing = False
          Width = 72
        end
        object tvTaskDESCRIPTION: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRIPTION'
          DataBinding.IsNullValueType = True
          Width = 342
        end
        object tvTaskPRIORITY: TcxGridDBColumn
          Caption = 'Prioridade'
          DataBinding.FieldName = 'PRIORITY'
          DataBinding.IsNullValueType = True
          Width = 66
        end
        object tvTaskSTATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESC'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = APIClient.dsStatus
          Width = 110
        end
        object tvTaskCREATED: TcxGridDBColumn
          Caption = 'Criado em'
          DataBinding.FieldName = 'CREATED'
          DataBinding.IsNullValueType = True
          Options.Editing = False
          Width = 110
        end
        object tvTaskFINISHED: TcxGridDBColumn
          Caption = 'Finalizado em'
          DataBinding.FieldName = 'FINISHED'
          DataBinding.IsNullValueType = True
          Options.Editing = False
          Width = 110
        end
      end
      object glTask: TcxGridLevel
        GridView = tvTask
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Task'
      CaptionOptions.Layout = clTop
      Control = gTask
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dsTask: TDataSource
    Left = 408
    Top = 284
  end
end
