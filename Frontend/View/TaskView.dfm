object TaskViewFrame: TTaskViewFrame
  Left = 0
  Top = 0
  Width = 894
  Height = 705
  TabOrder = 0
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 894
    Height = 705
    Align = alClient
    TabOrder = 0
    object gTask: TcxGrid
      Left = 10
      Top = 59
      Width = 874
      Height = 636
      TabOrder = 2
      object tvTask: TcxGridDBTableView
        PopupMenu = pmTask
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsTask
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
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
    object btSearch: TcxButton
      Left = 10
      Top = 10
      Width = 87
      Height = 25
      Caption = 'Atualizar'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      TabOrder = 0
      OnClick = btSearchClick
    end
    object btReport: TcxButton
      Left = 103
      Top = 10
      Width = 86
      Height = 25
      Caption = 'Relat'#243'rio'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = cxImageList1
      TabOrder = 1
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
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 87
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btReport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object dsTask: TDataSource
    AutoEdit = False
    Left = 408
    Top = 284
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 13632228
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000027744558745469746C6500526566726573683B5265706561743B4261
          72733B526962626F6E3B52656C6F6164CD4DF6E90000030249444154785EA593
          6D4C926B18C76F018114A40D6D619DE98433AAE3F16D7CB173AC43666FE69C7A
          D4F48825339D4E6136D314EB2C23B46C332B957484A0522E5B6E2C31B537B437
          319BCECC17B2652D672FC715E03194AEEE875A6BB53E796DBFDDCF7EF7FFFFE1
          DAB3DB0500D052C6E5A7FEC73B70F2FDC89A4D48D664FA5A5AF5DB1FE4E8928B
          E2226D9F11FB0F04459A7B3D052A63DE0E71B11B91C10E77FA9D5D94DF70DF59
          4E93EB7EC957DF1B4F935FE009B3EBB7A59FE8704C59E6E185E503DC9D7C0B9A
          5B66D8A7BA33243AD4E087F3A4E9F98F683FD1959EBD8BF0B8E6D418BB1F3C9B
          855DA57A23871BC00C15D755FD99D508E1521DE49EB90E833356B8D4F71C726A
          7A460285F11EC48A92CF5D44D973CC50A8BDF504C6FE7780F2CA3044481AFEF5
          FE3598C1DD24F5E10A73F88109958A8DD94DF69E171638D53E0AA2A36D07885E
          E6E95E8476E6D5090AD57D0B66DB02F45B1661DC6A87B4B2F685E0D8C3422284
          21619605FC5DA148ADE884F303D3905C6630112EF5C40D449AB550D5BDBDA314
          D9C99BC862B52379ED6DF478E215C595B9AAFE4B9918D2CC4857CBE4F834A22D
          672287831C881D4B9B2F74232EE918CFA81283FDDA4B1B241CE9062F7E441076
          0C0C19438B2CD63F8A3AD8017187BB4033F61E88EFA8920E882CD24F92F8D1D5
          F3383467B3D846269EFE877CBC5928707372CAB7FFFFF9F01D890783BE98951E
          8628542ACACDDC88ACAF5E3B4C8656090ACBBD4C846802514DE9DEDAFBD038F4
          06E28F742F083395C7F91B44416BFEDACDA731BD38214995E519AA01A837CF41
          A2A213BC422455B8C744828C56E78E8C956B3921E226739666109A47DE81E4DC
          0024286E424CE935F83DA95A87337E41A92A93ECEA14B043F63F2451591CE78A
          01BB5B50DB14B105725D199C28F0FF47FD24EEF86D28D19B4139340BCAC15908
          2F6807DFF042317BCD9650FF14ED33EA8AB0F5384F65AC2B40889FD48CD1394F
          42D2D9BCD53E5BE515BC98DA21EC017BE0C52A877DB797CBC8547716CE786068
          74AE1411E0F90132C61DC3C67030DE18CF2F8EFC7D78C9CFF9136643522887EA
          10230000000049454E44AE426082}
        FileName = 'Images\Actions\Refresh_16x16.png'
        Keywords = 'Actions;Refresh'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000024744558745469746C6500526570656174416C6C4974656D4C616265
          6C735069766F745461626C653B4976752E0000014849444154785E8593CB4AC3
          501086DB9064E3A2F82CBE9408A2882045AA14114514940A826EBA10152A8AA8
          88E0C68DE0E545A452AB6D9A7BC699211325CEA1810F06FE2F3F93704E05002A
          F8545BA72F07FB676F300EF2C8A7F70829B0F68E9F21CB00923433C13979E497
          0BECEDF613C4490653D3374C10A5D0EEBC1232734E1EF9E50267E3F0118514FC
          3031C13979E4970BDC66EB01A2382D36F0824436909973F2C8FF57B0B27B0F21
          0A433F36C1397A7AC1F2CE1D0451526CF0ED45B281CC9CA3A717D4B76EF93BFB
          C3D004E7E8E9054B9BD7300A7F37E80D42D94066CED1D30B16D7AFC00B62F8F8
          0A4C708E9E5EB0B076099E1F171B74FBBE6C2033E7E8E905F3CD0BFED3EF9FBE
          09CED1530B9CB9D5733EAE8351648273F4D48364CFD44F8E661B1D180779DA51
          B6101799406AC8A4422DCF5DED3255F3121B71485270F2DCFA7B9D7F006D1797
          5CAE46A7290000000049454E44AE426082}
        FileName = 'Images\Spreadsheet\RepeatAllItemLabelsPivotTable_16x16.png'
        Keywords = 'Spreadsheet;RepeatAllItemLabelsPivotTable'
      end>
  end
  object pmTask: TPopupMenu
    Left = 248
    Top = 224
    object miNewTask: TMenuItem
      Caption = 'Nova tarefa'
      OnClick = miNewTaskClick
    end
    object miUpdateTask: TMenuItem
      Caption = 'Atualizar tarefa'
      Enabled = False
      OnClick = miUpdateTaskClick
    end
    object miDeleteTask: TMenuItem
      Caption = 'Excluir tarefa'
      Enabled = False
      OnClick = miDeleteTaskClick
    end
    object miUpdateStatus: TMenuItem
      Caption = 'Mover status'
      Enabled = False
      OnClick = miUpdateStatusClick
    end
  end
  object frxReport1: TfrxReport
    Version = '2022.2'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45653.747521296300000000
    ReportOptions.LastChange = 45653.747521296300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 488
    Top = 392
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 528
    Top = 456
  end
end
