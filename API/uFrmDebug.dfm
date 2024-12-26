object frmDebug: TfrmDebug
  Left = 778
  Top = 314
  Caption = 'Debug Service'
  ClientHeight = 710
  ClientWidth = 1123
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1123
    Height = 710
    Align = alClient
    TabOrder = 0
    object Image1: TImage
      Left = 10
      Top = 10
      Width = 48
      Height = 48
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F987000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
        C14944415478DAEDD6B10DC2400C05509B25AE08B002D727A246CC014B651268
        490648582142220C814993160A2B677CFABF76F15F637D26E761EB0200581700
        C0BA0000BF0EEEEDEB28F2AE89B948DA4CE421C2A7B80F1715A06B9E0333AF93
        969F0D4443ACC25605E8DB512CCACFD955E16B47000000207780FB37DADDC603
        ADA89E0E37A9CB4FEDCEB10C5715E0DF933F005B4863C01602000000FC03DCBF
        516CA185933F005B4863C01602000000FC03DCBF516CA18503807500B00E00D6
        F90028D5A8312B45DAA20000000049454E44AE426082}
    end
    object Server: TcxTextEdit
      Left = 10
      Top = 82
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
      Text = 'localhost'
      Width = 180
    end
    object ServerPort: TcxCurrencyEdit
      Left = 10
      Top = 127
      EditValue = 1433.000000000000000000
      Properties.Alignment.Horz = taLeftJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ' 0.;'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 180
    end
    object ServerDatabase: TcxTextEdit
      Left = 10
      Top = 172
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Text = 'master'
      Width = 180
    end
    object ServerUser: TcxTextEdit
      Left = 10
      Top = 217
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Text = 'sa'
      Width = 180
    end
    object ServerPass: TcxTextEdit
      Left = 10
      Top = 262
      Properties.EchoMode = eemPassword
      Properties.ShowPasswordRevealButton = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 180
    end
    object CreateIni: TcxButton
      Left = 10
      Top = 289
      Width = 180
      Height = 25
      Caption = 'Gerar Ini'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002B744558745469746C650053657475703B437573746F6D697A3B4465
        7369676E3B53657474696E673B50726F70657274381FB5210000033849444154
        785E7D937D4C535718C69F7B7B4AE52355971095599D2B3A0264A6219A85AA03
        679832C3A21665A2F891CD124704D9206340746B46623019C6A82C565315043F
        96383F83124D86D3B9580BCC39C0E98A6C4080B60B850BB7F79E7BBC6D5AFE5A
        78935FCE93933CEF7DCFCDF3629AE25478154D484F57D5872FA3B2F6D29429C8
        17DF380ACA6BCEB3325B23DB576DDF116E14812BAEB6E3F38A93200060FBD2C2
        590ACAE2CABF6BBCAA50DAEF1919A8A18C59766C30833106FBF93B96DC5D158F
        E3E72CA800C7199F3C6CC93E62FBF43F6BF971C647C65D98987A65775E46C696
        9CF4ADC6C4C44EC6F0D192450930BC190F4561D9C9C9A91DF99B32F2ADDBD7BE
        976A7AFF27004412259048834040F2F8C72690B4643E9216CFE7BD3E3F348487
        2228282C58CB2F5E34175461B8FBB30B7DAF7ABD002049D2D4CFD1E4EEFA3A25
        39E55D5769610E2F49140A63E0390E924C43CF5025C40045D5B7F5CAD3F6472B
        DA1F5D730290B8A0796751ED368D56BB9968C8BAAAD23C4E1B45F0C7B3976868
        BA054234D8BE351B06430286863DA83BFEA332210AADA22034FFD97EAF890020
        4437C3B1273F4B1DDD0042087CFE71D41D6B46FF3FEECD248A7027CFE2C2A183
        56F01A82BD9F6DE4BD5E5FD6E973B7B2DC7FB92E11009C1C0884DEE71F9F84A4
        5050CA10131B0DDD0C5DB4362A4AD5B1102519E38208AA500C794621CB0104BD
        3C00F9E5F3AEA2AF0ED4B5EEAF3CC10607BD989C10B1735B0E92524D67826C5C
        BF1263C2243CBE51D86C2760B737B4F5B9BB4B010422E1D1A5993F5EBEA7E47B
        F9EFBE21F6C0D9C3DA1E77B1DFBBFB588F7B80B53FEB652D6D9DEC5AAB93ADB3
        942886B7D33201C4A8F0040053417C82B12C739549234C8AA1AF8D8CF830365B
        1FCC008646BC9839531F0AD5F2654BB9DE172FF603CEBC7796AE57A672C02816
        44C7EA70F3F62F68BD7D1F94D3B2A2BD9F700149467D7D239BA58F41DA3213A7
        D7C781CA745ED023530991244A1DBFDDD870E468C3AF0E47F3F5A71DF7B32684
        D1078303C370BBFF85E0F73DEC74B6655F6EBA78F5D40F0E57FF2BD71600A242
        2942B53AA718E1258909136B4ACF2D367F58C8CC6BACCC98F2410980B8E07DF8
        D4AA706F25AD997695A355DE0812D63CFEA75E03CFF56ADF743CC88500000000
        49454E44AE426082}
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = CreateIniClick
    end
    object ServiceStart: TcxButton
      Left = 10
      Top = 582
      Width = 180
      Height = 25
      Caption = 'Iniciar Servi'#231'o'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001B744558745469746C65004E6578743B506C61793B4172726F773B52
        6967687416E40EAE000002AF49444154785EA5925D6895751CC73FCFD14D46BE
        B41AF6C20A870425152C2F82A08B0ABD295D05416F572184045D2644082A425A
        831A62128E2E448C59108D9430D84A1C81DBD4D6B6D05C3B739B5B3BB1EDAC73
        CEF33CFFDF4BCFE1807076DB173E7CF95FFC3E7C2FFE91BB136501D600D556C0
        3F3839EC8262062A86A9A3E2881B224AE9DF949E032F90A396B5877A46C3BEAF
        0687DF3DDABB0B683CBAE7A99C064352458212AA484053218943F55D3BA4969C
        A8B2E7C5C71E3FF7EBFAEFDEEBFAA56FE1D6C4FECFF73E7D1908638BC1821A6A
        10D439DCD58FA8D7092255A3A5B9898EE71F213FBBF9B99F06365D7CFBE0F9AF
        676E0C1FDED6DC70030803B3154B122388616AF582204A2A30B562DCD5BC8137
        3AB6716DEC9ED7FBD76F7C75C3E6B3DD7F0EF67EFCCC834D7380EC78BFD7D457
        2D90E0A46A9412A5583688E081875A78B3F5DEC6CBD75AF636346D7AAB65EBB3
        9DBF5F387EE242D7AE2520D0E59EBBB320552AC1A8A4423938C58A905F4C3302
        AD5BEE67F72BDB373EB1BDFDC0932F7D34D4FE5AE73B4063DD822408A5D4AB20
        6224197195580966AC6B8878B47D0B0F6FBDAFB5E754F205701A48EE082AA540
        A124148A29E6206A04ABC9725184C6C6D0C84D4606AF2FAE14663E03A47E811A
        CB15214E0D7343CC897211EBD6464C8C4F73F5D278BCFCF7ADEEF93F7A3B97A7
        06E680A44E90A6CA526CC4C18822674D2EC7FCC43C570646AD3033F5CD3F13FD
        870AD7CFFD05C480B5ED3CEEAB048195B262EE141796B87A7194DBF97CDFCAF4
        9583B77F3B35045400FDF0C7593F7DE45B4484D50B982B14B3C33126C76F8E94
        1646F74F0F7ED9079401D9F7C3AC03A880AA60AB7EA2A6B1F27DF7F9A9CAE2E4
        91C94B9F9C014A4068DB71CCCD9C339F9EA5DAA686BB634E9DA0FCF38997EFA6
        961848DB761E7337C7CC5071DC0C73C7AB4419A60044EECEFFC97FFDEAC21326
        FC988F0000000049454E44AE426082}
      TabOrder = 6
      OnClick = ServiceStartClick
    end
    object ServiceStop: TcxButton
      Left = 10
      Top = 613
      Width = 180
      Height = 25
      Caption = 'Parar Servi'#231'o'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C0000000B744558745469746C650053746F703BBA6D204F000001
        2449444154785EAD91B14A03411086E74E4E7C085FC3C25EED62E1C3D8D8D9F8
        08DA59F80C4284086A9D46EC4451825828B990E4727BBB3BB371FE42482EE79E
        A0071F2C33DFFCECECA5F4C7EFDF0292D36EE7F2ECAAE394790B0E2E661603D2
        2061676FEB30DBDF3EA21870D4DDC5CC5280E7B09EA58106A3EB2870D4CDEA01
        093BD146452212050EDCFA0AE4BC36C51007890107EEEA5FF09A6AFC98583806
        1CB8AB014E8B63F346D61724411A410F8E6B0CB0B8C18446664093EA9D2C17C4
        C1019C51430F0EDCE615D0F4E2A9B0390D67AFF4317D0438A3861E9C1F56F042
        959BB6BD019CE647642B3E3725AD251B517263E0723D606E2ABEEDF79EE5AEFB
        4231FABD2751F706338B01E1E2E4E1E0FCF87EF337C0C5CC5280522A43E5B305
        38E577C017B8899A7278A6B7920000000049454E44AE426082}
      TabOrder = 7
      OnClick = ServiceStopClick
    end
    object ServiceInstall: TcxButton
      Left = 10
      Top = 644
      Width = 180
      Height = 25
      Caption = 'Instalar Servi'#231'o'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000021744558745469746C65004170706C793B4F4B3B436865636B3B4261
        72733B526962626F6E3B6463C8680000037D49444154785E4D8E7F4C94051CC6
        3FEF7B77E02073EA92742577579B684891E62AB6C4526B6013696BC9DC5A0B33
        D0322DA716D3CA94A21A8E96E976AEB654688E409B46B859CC249500E3F81588
        234EE0F875DC1DF7A3BB7BDFF7DBC16AEBD9F3D9BEFF3CCFF7C13555CB58A801
        40014CC5E5696BF638D24FBEF7EDF2D683550F7B0E5666B4969C5A5EBBEBCB65
        2F0209803A116E6438F82377A66A60385007A0E4EFB2A5BC51B1B4AEF4EC5AB9
        D476583A87AA642C7055BA47CE4A43F72752713157F67D93DE54B0DFBE04308D
        867E9E290050725F4BBDB7F8E8B29EAA86B7C4E5BF203DDEE3D23E71585AC6F6
        48E7E4C7D2E777C870A05E7E68DE277B4F668C6EDE6BCF00D4017F350A607EF5
        48DAB99CECBC9CF4343BC3E1264CAA60C282AAA8288A028A30313E852DE509EE
        0C4D72EEF26967CD17FD4F0EDE0A064DF9BBEDEB6CD6C51F3C9DF5382EFF1540
        104014216E500C2ED6DDA4F67C3BEDB79BC9C95EC3E8F8784AD28288BBADC1D3
        6C4E98652A7C2C7D2543816674430304C4885B0755E1CC99EBCC51D750F14E35
        DBCB32E91DF98DCCA5ABE8FCB36733E0500D3132EF9EAB108C7AE9ED1BA6B4AC
        969F2E39896A11CE5F68212529975D5B4A395A59C40B79CF6049D0489AAD81AA
        3C0A9854436741140FE148809AEA16CA8AAEA34C65F1E9E7F524EBEBD99A7F80
        53751FB2707118EB836642311F31C63174497C286BEE6C55D3F48971DF2088C1
        A60D6BF9BAB6849D0547D8FD520D2F3F5F822FD8C7AFCEEF58B16A11FEC82831
        3DC6A87F8868C488745C9D0C9AF5A8D2E51EF15BE72FD248B127E2F5FE8DE3FB
        FDEC28280755E1FDCFB691BF310B6FC48566C4C030F08D458984B40E4057837E
        ADAAA7CB87A0E2090EB2E491594C1A4DD45C2EC779AB0E53B287C4399384A353
        718288A8F4767B09F8F4F380069094BBDD7AB3E474869CB8B1428E5DCB90AAB6
        0DB2E59055B2B621C72EAF93134D99723C8EE3F79572A83A5336EEB439EF9A67
        990FA82A1071F7855EF9E35AC0D3EB0C010A9EF000799B56F1EEDBAFC7BF87D0
        0D411185BEEE30AD8DFE88AB2B501CF0C4FC5706DE34CC0D7F15E9AB53BF6A17
        784ED78C4AB72BF6803DDD82B6B013D5A420064CB875FABB628CB8A21DEEDBA1
        A2D6FAB11B8066480C7EE92F045000737CD6BCA736DFB77F7D616A63EE769BCC
        B0C326CF6E4D6D5B5D70FF47C9732CF700164099CE4D3373FCA76CAB43052CFF
        62065440001D884E130F19FC4FFF00FE20CB5D5DF1FFF30000000049454E44AE
        426082}
      TabOrder = 8
      OnClick = ServiceInstallClick
    end
    object ServiceUninstall: TcxButton
      Left = 10
      Top = 675
      Width = 180
      Height = 25
      Caption = 'Desinstalar Servi'#231'o'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000023744558745469746C650043616E63656C3B53746F703B457869743B
        426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
        18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
        3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
        8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
        E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
        A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
        673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
        5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
        D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
        3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
        D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
        2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
        CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
        CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
        2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
        2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
        B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
        82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
        17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
        F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
        33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
        097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
        646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
        266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
        2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
        72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
        2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
        CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
        1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
        01D589CC0000000049454E44AE426082}
      TabOrder = 9
      OnClick = ServiceUninstallClick
    end
    object PortAPI: TcxCurrencyEdit
      Left = 790
      Top = 10
      EditValue = 9005.000000000000000000
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ' 0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 10
      Width = 80
    end
    object APIStart: TcxButton
      Left = 876
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 11
      OnClick = APIStartClick
    end
    object APIStop: TcxButton
      Left = 957
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 12
      OnClick = APIStopClick
    end
    object APISwagger: TcxButton
      Left = 1038
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Swagger'
      TabOrder = 13
      OnClick = APISwaggerClick
    end
    object Log: TcxRichEdit
      Left = 208
      Top = 59
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 14
      Height = 598
      Width = 893
    end
    object LogClear: TcxButton
      Left = 1026
      Top = 663
      Width = 75
      Height = 25
      Caption = 'LogClear'
      TabOrder = 15
      OnClick = LogClearClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 6
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Dados de conex'#227'o'
      CaptionOptions.Layout = clRight
      Control = Image1
      ControlOptions.OriginalHeight = 48
      ControlOptions.OriginalWidth = 48
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Servidor'
      CaptionOptions.Layout = clTop
      Control = Server
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Port'
      CaptionOptions.Layout = clTop
      Control = ServerPort
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Database'
      CaptionOptions.Layout = clTop
      Control = ServerDatabase
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'User'
      CaptionOptions.Layout = clTop
      Control = ServerUser
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Pass'
      CaptionOptions.Layout = clTop
      Control = ServerPass
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = CreateIni
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = ServiceStart
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = ServiceStop
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = ServiceInstall
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton5'
      CaptionOptions.Visible = False
      Control = ServiceUninstall
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Port API'
      Control = PortAPI
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 80
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton6'
      CaptionOptions.Visible = False
      Control = APIStart
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton7'
      CaptionOptions.Visible = False
      Control = APIStop
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton8'
      CaptionOptions.Visible = False
      Control = APISwagger
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxRichEdit1'
      CaptionOptions.Visible = False
      Control = Log
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton9'
      CaptionOptions.Visible = False
      Control = LogClear
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Log'
      ItemIndex = 1
      Index = 1
    end
  end
end
