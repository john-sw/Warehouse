object fmShowRefBook: TfmShowRefBook
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '
  ClientHeight = 592
  ClientWidth = 1044
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 1044
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 16643823
    TabOrder = 0
    UseDockManager = True
    Version = '2.3.0.8'
    BorderColor = 13087391
    Caption.Color = 16643823
    Caption.ColorTo = 15784647
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 15784647
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16643823
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 5978398
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16643823
    StatusBar.ColorTo = 15784647
    StatusBar.GradientDirection = gdVertical
    Styler = dmMain.AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object cxButton6: TcxButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 528
    Width = 1044
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    Color = 16643823
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.3.0.8'
    BorderColor = 13087391
    Caption.Color = 16643823
    Caption.ColorTo = 15784647
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = 5978398
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 15784647
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16643823
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 5978398
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16643823
    StatusBar.ColorTo = 15784647
    StatusBar.GradientDirection = gdVertical
    Styler = dmMain.AdvPanelStyler1
    Text = ''
    DesignSize = (
      1044
      64)
    FullHeight = 200
    object cxButton1: TcxButton
      Left = 44
      Top = 16
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 156
      Top = 16
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
    end
    object cxButton3: TcxButton
      Left = 264
      Top = 16
      Width = 75
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 2
    end
    object cxButton4: TcxButton
      Left = 380
      Top = 16
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
    end
    object cxButton5: TcxButton
      Left = 952
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = cxButton5Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 1044
    Height = 487
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsShowRefBook
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object spShowRefBook: TUniStoredProc
    StoredProcName = 'br_aspThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspThermoType;1}')
    Connection = dmMain.MainConnection
    Left = 32
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
    Left = 124
    Top = 84
  end
end
