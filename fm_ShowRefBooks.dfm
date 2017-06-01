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
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TAdvPanel
    Left = 0
    Top = 0
    Width = 886
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
    object btnRefresh: TcxButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnRefreshClick
    end
  end
  object pnlBottom: TAdvPanel
    Left = 0
    Top = 481
    Width = 886
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
      886
      64)
    FullHeight = 200
    object btnAdd: TcxButton
      Left = 44
      Top = 16
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TcxButton
      Left = 156
      Top = 16
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnView: TcxButton
      Left = 268
      Top = 16
      Width = 75
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 2
      OnClick = btnViewClick
    end
    object btnDel: TcxButton
      Left = 380
      Top = 16
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = btnDelClick
    end
    object btnClose: TcxButton
      Left = 782
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = btnCloseClick
    end
  end
  object GridRefBook: TcxGrid
    Left = 0
    Top = 41
    Width = 886
    Height = 440
    Align = alClient
    PopupMenu = pmDefaultPopupMenu
    TabOrder = 2
    object tvRefBook: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsShowRefBook
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
    end
    object GridRefBookLevel1: TcxGridLevel
      GridView = tvRefBook
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
  object pmDefaultPopupMenu: TAdvPopupMenu
    MenuStyler = dmMain.AdvMenuFantasyStyler1
    Version = '2.5.7.0'
    Left = 540
    Top = 204
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object N2: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    end
    object N3: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Excel1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
    end
    object N6: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
    end
    object N7: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    end
    object N10: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    end
  end
end
