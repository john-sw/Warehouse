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
  Menu = AdvMainMenu1
  OldCreateOrder = False
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
    ApplicationButton.Menu = dxBarApplicationMenu1
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
      'Default'
      'MainMenu1'
      #1054#1082#1085#1086)
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    ShowHelpButton = True
    Style = bmsOffice11
    UseSystemFont = True
    Left = 684
    Top = 84
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = #1054#1090#1095#1077#1090#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = #1054#1082#1085#1086
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem5'
        end>
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object N1: TdxBarButton
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Category = 1
      Visible = ivAlways
    end
    object N2: TdxBarButton
      Caption = #1054#1090#1095#1077#1090#1099
      Category = 1
      Visible = ivAlways
    end
    object N5: TdxBarButton
      Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
      Category = 2
      Visible = ivAlways
    end
    object N7: TdxBarButton
      Caption = #1081#1094
      Category = 2
      Visible = ivAlways
    end
    object dxBarGroup1: TdxBarGroup
      Items = ()
    end
  end
  object dxBarApplicationMenu1: TdxBarApplicationMenu
    BarManager = MainBarManager
    Buttons = <>
    ExtraPane.Items = <>
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarSubItem1'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem3'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem2'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem4'
      end>
    UseOwnFont = False
    Left = 468
    Top = 232
  end
  object dxRibbonPopupMenu2: TdxRibbonPopupMenu
    BarManager = MainBarManager
    ItemLinks = <>
    Ribbon = dxRibbon1
    UseOwnFont = False
    Left = 476
    Top = 92
  end
  object pmRefBooks: TdxBarPopupMenu
    BarManager = MainBarManager
    ItemLinks = <>
    UseOwnFont = False
    Left = 516
    Top = 32
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
    object N9: TMenuItem
      Caption = #1054#1082#1085#1086
      object N10: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
      end
      object N11: TMenuItem
        Caption = '-'
      end
    end
  end
end
