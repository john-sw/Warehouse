object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 428
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = AdvMainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 408
    Width = 755
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 755
    Height = 117
    BarManager = MainBarManager
    Style = rs2010
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 5
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Groups = <>
      Index = 0
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = #1054#1090#1095#1077#1090#1099
      Groups = <>
      Index = 1
    end
    object dxRibbon1Tab3: TdxRibbonTab
      Active = True
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Groups = <>
      Index = 2
    end
  end
  object MainBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    ShowHelpButton = True
    Style = bmsOffice11
    UseSystemFont = True
    Left = 700
    Top = 48
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarGroup1: TdxBarGroup
      Items = ()
    end
  end
  object AdvMainMenu1: TAdvMainMenu
    Version = '2.5.7.0'
    Left = 308
    Top = 65532
    object N3: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
    end
    object N6: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
    end
    object miRefBooks: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    object miWindow: TMenuItem
      Caption = #1054#1082#1085#1086
      object N10: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
        object N4: TMenuItem
          Caption = #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080
        end
        object N8: TMenuItem
          Caption = #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080
        end
        object N12: TMenuItem
          Caption = #1050#1072#1089#1082#1072#1076#1086#1084
        end
      end
      object N11: TMenuItem
        Caption = '-'
      end
    end
  end
end
