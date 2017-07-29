object fmShowRefBook: TfmShowRefBook
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '
  ClientHeight = 545
  ClientWidth = 886
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridRefBook: TcxGrid
    Left = 0
    Top = 0
    Width = 886
    Height = 516
    Align = alClient
    PopupMenu = pmDefaultPopupMenu
    TabOrder = 0
    object tvRefBook: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsShowRefBook
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ShowColumnFilterButtons = sfbAlways
      Styles.ContentEven = dmMain.GridStyleEvenRow
      Styles.Inactive = dmMain.GridStyleSelectedRow
      Styles.Selection = dmMain.GridStyleSelectedRow
    end
    object GridRefBookLevel1: TcxGridLevel
      GridView = tvRefBook
    end
  end
  object RzToolbar2: TRzToolbar
    Left = 0
    Top = 516
    Width = 886
    Height = 29
    Align = alBottom
    Images = ilRefBookActionImages
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdBottom]
    BorderWidth = 0
    GradientColorStyle = gcsMSOffice
    TabOrder = 1
    VisualStyle = vsGradient
    ToolbarControls = (
      RzToolButton6
      RzSpacer5
      RzToolButton7
      RzSpacer6
      RzToolButton8
      RzSpacer7
      RzToolButton9
      RzSpacer8
      RzToolButton10
      RzSpacer9
      RzToolButton11)
    object RzToolButton6: TRzToolButton
      Left = 4
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actAdd
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer5: TRzSpacer
      Left = 94
      Top = 2
    end
    object RzToolButton7: TRzToolButton
      Left = 102
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actEdit
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer6: TRzSpacer
      Left = 192
      Top = 2
    end
    object RzToolButton8: TRzToolButton
      Left = 200
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actView
    end
    object RzSpacer7: TRzSpacer
      Left = 290
      Top = 2
    end
    object RzToolButton9: TRzToolButton
      Left = 298
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actDelete
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer8: TRzSpacer
      Left = 388
      Top = 2
    end
    object RzToolButton10: TRzToolButton
      Left = 396
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actRefresh
      ParentShowHint = False
      ShowHint = True
    end
    object RzSpacer9: TRzSpacer
      Left = 486
      Top = 2
    end
    object RzToolButton11: TRzToolButton
      Left = 494
      Top = 2
      Width = 90
      ShowCaption = True
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Action = actClose
      ParentShowHint = False
      ShowHint = True
    end
  end
  object spShowRefBook: TUniStoredProc
    StoredProcName = 'br_aspThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspThermoType;1}')
    Connection = dmMain.MainConnection
    AfterOpen = spShowRefBookAfterOpen
    Left = 48
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = 'br_aspThermoType;1'
    StoredProcIsQuery = True
  end
  object dsShowRefBook: TUniDataSource
    DataSet = spShowRefBook
    Left = 152
    Top = 88
  end
  object pmDefaultPopupMenu: TAdvPopupMenu
    MenuStyler = dmMain.AdvMenuFantasyStyler1
    Version = '2.5.7.0'
    Left = 540
    Top = 204
    object N14: TMenuItem
      Action = actRefresh
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = actAdd
    end
    object N2: TMenuItem
      Action = actEdit
    end
    object N3: TMenuItem
      Action = actView
    end
    object N4: TMenuItem
      Action = actDelete
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Action = actCopyCell
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object miExportToExcel: TMenuItem
      Action = actExport
    end
    object miPrint: TMenuItem
      Action = actPrint
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N9Click
    end
  end
  object spRefBookFieldsBrowse: TUniStoredProc
    StoredProcName = 'spGetReferenceBrowser;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spGetReferenceBrowser;1 (:ReferenceID)}')
    Connection = dmMain.MainConnection
    Left = 256
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ReferenceID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'spGetReferenceBrowser;1'
  end
  object qSprRef: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprReference'
      'where ReferenceID = :ID')
    Left = 52
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
  object ExportToExcelSaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 (*.xlsx)|*.xlsx|Excel XP files (*.xls)|*.xls'
    Left = 492
    Top = 92
  end
  object prnStyleManager: TdxPrintStyleManager
    Version = 0
    Left = 620
    Top = 92
  end
  object prnRefBook: TdxComponentPrinter
    CurrentLink = prnRefBookLink1
    Version = 0
    Left = 712
    Top = 92
    object prnRefBookLink1: TdxGridReportLink
      Active = True
      Component = GridRefBook
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 42946.085737615740000000
      BuiltInReportLink = True
    end
  end
  object alRefBook: TActionList
    Images = ilRefBookActionImages
    Left = 188
    Top = 196
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = actEditExecute
    end
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      ImageIndex = 2
      OnExecute = actViewExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 4
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' Excel'
      ImageIndex = 5
      OnExecute = actExportExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 6
      OnExecute = actPrintExecute
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 7
      OnExecute = actCloseExecute
    end
    object actCopyCell: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      ShortCut = 16451
      OnExecute = actCopyCellExecute
    end
  end
  object ilRefBookActionImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 16253112
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000B8824DFFB882
          4DFFB8824DFF251A0F3300000000000000000000000000000000000000000000
          0000848484FF848484FF848484FF848484FF848484FFFFFFFFFFB8824DFFB882
          4DFFF1E6DBFFB8824DFF251A0F33000000000000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8824DFFF1E6
          DBFFB8824DFFB8824DFFB8824DFF251A0F330000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6DBFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF251A0F3300000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6
          DBFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF251A0F33000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E6DBFFB8824DFFB8824DFFB8824DFF251A0F33B8824DFF000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF1E6DBFFB8824DFFF1E6DBFFB8824DFFB8824DFF000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E6DBFFB8824DFFB8824DFF251A0F33000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF848484FF848484FF848484FF848484FF0000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
          0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
          0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
          83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000040000000A000000100000001300000015000000140000
          00110000000C0000000500000001000000000000000000000000000000000000
          00030000000C070404263F271F836E4235CA7A4839DE915644FF774436DE693C
          30CE3A2019870704032B00000010000000040000000000000000000000030000
          0011442C2486976253F5BE998EFFD9C5BEFFE0CFCAFFEFE6E3FFDDCAC4FFD3BC
          B5FFB48B7FFF895140F540231B92000000180000000500000001010204145536
          2D9CC5A398FFF2E9E7FFF5EFEDFFBCAEA8FF71574CFF593A2DFF755B4EFFBEAE
          A7FFEBE2DEFFE5D8D3FFB79085FF4E2A21A90101021A000000032F23246BB58D
          80FFF9F5F4FFF7F3F2FFC1B3ADFF826555FFB19A85FFC2AC97FFB09783FF7F62
          51FFC0B0A9FFECE3DFFFECE2DFFFA37467FF28191A750000000A5E4F60E1BCB1
          ACFFF6F3F3FFF8F4F3FF7A5E50FFBEA995FF857162FF3F2A22FF746053FFB8A3
          8FFF806658FFEEE5E2FFECE2DFFFB1A29CFF503F50E40000000D182C4D885C63
          72FFB2B0B0FFF1EEEDFF725242FFDDD1B9FF806D5EFF493229FF493228FFCFC0
          A9FF745545FFEBE3E1FFABA6A3FF505566FF142A55AA0000000A05080F21395F
          9DFA697F9AFF626160FF55443CFFB2A894FFE4E0C1FF584135FF847466FFA498
          87FF58483FFF5F5C5CFF4E6586FF2F5191FF050B173C00000004000000031221
          3B685A7FB7FFA6C5E3FF7990ABFF444D59FF3E4248FF2B2A25FF3C4148FF3E48
          56FF627D9EFF789DC9FF3C609FFD0B172E630000000600000000000000000000
          00030F1B3159315593ED6F91C1FF9BB9DCFFB0CDE9FFCBE8FCFFA7C7E6FF87AA
          D3FF5A7EB3FF284B8BF10A152958000000060000000100000000000000000000
          0000000000020204071112223E6F1C3765B0213F76D0274C91FC1E3C74D01933
          62B40F1F3D750204081700000003000000000000000000000000000000000000
          0000000000000000000000000002000000030000000400000005000000050000
          0004000000020000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFDEAF75FFDEAF75FFDEB074FFDDAF
          75FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFDFB279FFE0B379FFE0B27AFFE0B2
          79FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFE1B67EFFE2B67FFFE2B77FFFE2B7
          7FFFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFE8C494FFE8C594FFE8C495FFE8C4
          95FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFB0794AFFAB7245FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF5EEE9FFFAF6F3FFFAF7F3FFFBF7F4FFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE6D9D2FFE7DBD4FFE9DED7FFEAE0D9FFEAE0DAFFEBE1
          DBFFEBE0DBFFEEE5E1FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFF1D7ABFFF1D8ADFFF1D8ADFFF1D8
          ADFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFF3DCB3FFF3DEB4FFF3DEB4FFF3DE
          B4FFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFF4E1B9FFF5E3BBFFF5E2BBFFF5E2
          BBFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000150F091D51392270845D37B7A97747EAA97747EA845D
          37B751392270150F091D00000000000000000000000000000000000000000000
          000000000000291D11397F5A35B0B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF3928184F00000000000000000000000000000000000000000000
          0000150F091D7F5A35B0B8824DFF8A613ABF4A341F661610091F1610091F4A34
          1F663E2C1A56000000003827174D000000000000000000000000000000000000
          000051392270B8824DFF8A613ABF21170E2E0000000000000000000000000000
          0000000000003827174DB8824DFF3827174D0000000000000000000000000000
          0000845D37B7B8824DFF4A341F66000000000000000000000000000000000000
          00003827174DB8824DFFB8824DFFB8824DFF3827174D00000000B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF00000000020302043827
          174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF3827174D3827174DB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF3827174D0000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000003827
          174DB8824DFFB8824DFFB8824DFF3827174D0000000000000000000000000000
          0000000000004A341F66B8824DFF845D37B70000000000000000000000000000
          0000422E1B5BB8824DFF3827174D000000000000000000000000000000000000
          000021170E2E8A613ABFB8824DFF513922700000000000000000000000000000
          00000C0805103827174D01010001563D24774A341F661610091F1610091F4A34
          1F668A613ABFB8824DFF7F5A35B0150F091D0000000000000000000000000000
          000000000000010100014F38216EB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF7F5A35B0291D1139000000000000000000000000000000000000
          00000000000000000000150F091D51392270845D37B7A97747EAA97747EA845D
          37B751392270150F091D00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000090000000E0000000F000000100000001000000011000000110000
          00110000001200000012000000110000000C0000000300000000000000000000
          00087B5043C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D
          59FFAA6C59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000
          000CAD735FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1
          EDFFF8F1ECFFF8F0EBFFF8F0EAFFD5B6ADFF00000011000000003E5803AD5D81
          05FF5C8004FF5B7F04FF5A7E03FF5A7D03FF587C02FF577B02FF567902FF5679
          01FF557800FF537700FF547700FF537600FF537600FF385000AD5E8306FFFAF6
          F6FF5D8105FFF9F5F3FF5C7F04FFF8F2F1FFF7F2EFFFA7B678FFF7EFEDFFF6EE
          EBFFA6B476FF557801FFF4ECE7FF547700FFF3EAE5FF537600FF5F8406FFFBF7
          F6FF5D8205FFF9F5F4FF5C8004FFF8F4F2FF5A7E03FF597D03FF587C02FFA8B6
          78FFF6EEEBFF567901FFF5EDE8FF537700FFF4EBE6FF537600FF618507FFADBE
          7FFFFBF7F6FFACBD7DFF5B8104FFF9F5F2FF5B7F04FF5A7E03FFA9B879FFF6F1
          EEFF597B03FF557A01FFA6B376FFF5EDE8FFA4B274FF547700FF608606FFFCF8
          F8FF5F8406FFFBF7F6FF5F8206FFFAF5F3FF5C8004FF5B7F04FFF8F3F0FF5A7D
          03FF587C02FF577A02FFF6EEEAFF547801FFF4ECE8FF537700FF618607FFFBFA
          F9FF618507FFFAF8F7FF5D8306FFFAF7F5FF5D8105FF5D8005FFAAB97BFFF8F2
          F0FFF7F2EFFF597C02FFF6EFECFF557A01FFF5EDE9FF557801FF425B05AD6186
          07FF608507FF5F8506FF5F8406FF5E8306FF5E8305FF5D8105FF5D8005FF5B7F
          04FF5A7E03FF577C03FF567B02FF577B02FF567A01FF3A5201AD000000000000
          0006C18F7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5
          F0FFFAF4EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B00000000000000000000
          0006C49382FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4
          F2FFFBF5F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B00000000000000000000
          0005C79985FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6
          F4FFFCF6F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A00000000000000000000
          0004C99A89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FDFFFEFEFDFFFEFDFDFFFEFDFDFFC49382FF0000000800000000000000000000
          0002977567C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A
          88FFC99987FFC79887FFC89886FF927163C20000000500000000000000000000
          0001000000020000000300000004000000040000000500000005000000050000
          0006000000060000000600000006000000050000000100000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000030000000C000000120000001400000014000000150000
          0015000000140000000D00000003000000000000000000000000000000000000
          00000000000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD89
          78FFBE8978FF876356C30000000B000000000000000000000000000000030000
          000E0000001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4EC
          E8FFF5ECE7FFBF8D7BFF00000026000000180000000F000000040000000C7B50
          42C5A76E5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE
          72FFF6EEEAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E
          6BFFECD9CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B1
          76FFF7F0EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE85
          71FFF1E5DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
          35FF7A4835FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B
          78FFF5EEE7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7
          DDFFF2E7DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC793
          7FFFFAF4F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D
          32FF5D3D34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC99
          86FFFDFAFAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D
          42FF724C41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F
          8DFFFFFFFFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5
          DEFFF6EFEBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE95
          84E9F5ECE8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7
          E1FFF8F2EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA00000008000000023429
          2545A78375CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EA
          E3FFF9F5F3FF977263FF876658FFA68072CE3428234800000003000000000000
          0001000000030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5EC
          E7FFFBF7F6FFC59685FF00000011000000040000000200000000000000000000
          00000000000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EF
          EAFFFCFAF8FFC89A89FF00000009000000000000000000000000000000000000
          00000000000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFC
          FBFFFDFBFAFFCB9F8DFF00000007000000000000000000000000000000000000
          000000000000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA3
          91FFCDA391FF98786BC100000004000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
          76E4120852AD06031B4D0000000E000000030000000000000000000000000000
          000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
          C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
          03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
          D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
          5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
          BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
          A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
          CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
          BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
          EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
          CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
          E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
          D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
          E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
          D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
          E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
          DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
          EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
          DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
          D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
          D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
          A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
          79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
          BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
          050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
          EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
          000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
          EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
          000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
          B5D040437D951212223000000004000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000090000000E0000000F0000000F0000001000000010000000110000
          0011000000100000000B00000003000000000000000000000000000000000000
          00087C5345C0AD725EFFAC725DFFAC715DFFAC6F5BFFAB705CFFAB705CFFAB6E
          5CFFAB6E5AFF7A4E41C30000000B000000000000000000000000000000000000
          000BAF7462FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFAC715DFF0000000F000000000000000000000000000000000000
          000BB17964FFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFFAF2EEFFAE7260FF01010120010101100101010B00000003000000000000
          000BB37C69FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFFAF3EFFFB07863FFC19D92FFB57D6AFF815A4EC30101010B000000000000
          000AB57F6CFFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
          E7FFFBF5F1FFB27A66FFEBE6E2FFFAF3EDFFB6806DFF0101010F000000000000
          0009B98270FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFFBF6F3FFB37D6AFFE9E1DAFFFAF3EFFFB88170FF01010110000000000000
          0008BB8775FFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFFCF8F5FFB6806DFFEAE1DBFFFAF4F0FFB98673FF0101010F000000000000
          0007BF8B78FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFFCF9F7FFBA8471FFECE4DDFFFBF5F2FFBB8876FF0101010E000000000000
          0007C18E7EFFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFDFAF8FFBC8978FFEDE7E0FFFBF6F4FFBC8B7AFF0101010D000000000000
          0006C49382FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFDFBF9FFBF8C7CFFEFE8E3FFFCF8F5FFBF8E7CFF0101010D000000000000
          0005C49785FFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFDFDFFFEFD
          FDFFFEFDFCFFC2907FFFF0EBE6FFFCF9F7FFC29180FF0101010C000000000000
          0003967265C0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC596
          84FFC59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0101010B000000000000
          000100000003000000040000000BD8BBB0FFF8F8F8FFF5F0EFFFF5F0EFFFF5EF
          EDFFF5EFEDFFF7F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A000000000000
          0000000000000000000000000005CCA392FFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFCA9D8DFF00000009000000000000
          00000000000000000000000000039A7B6FC0CEA495FFCFA494FFCDA494FFCCA3
          93FFCDA392FFCDA391FFCCA291FFCCA290FF97776BC200000006}
      end>
  end
end
