object fmAddEditRefBookGoods: TfmAddEditRefBookGoods
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fmAddEditRefBookGoods'
  ClientHeight = 587
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlClient: TAdvPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 523
    Align = alClient
    BevelOuter = bvNone
    Color = 16643823
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    FullHeight = 200
    object lblLabel1: THTMLabel
      Left = 10
      Top = 38
      Width = 125
      Height = 17
      FocusControl = ProdDescription
      HTMLText.Strings = (
        #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lblLabel2: THTMLabel
      Left = 10
      Top = 65
      Width = 125
      Height = 17
      FocusControl = ArticleNumber
      HTMLText.Strings = (
        #1040#1088#1090#1080#1082#1091#1083)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lblLabel4: THTMLabel
      Left = 310
      Top = 65
      Width = 41
      Height = 17
      FocusControl = CountryID
      HTMLText.Strings = (
        #1057#1090#1088#1072#1085#1072)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lblLabel7: THTMLabel
      Left = 10
      Top = 224
      Width = 80
      Height = 17
      FocusControl = Comment
      HTMLText.Strings = (
        #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lblLabel3: THTMLabel
      Left = 10
      Top = 92
      Width = 128
      Height = 17
      FocusControl = ThermoTypeID
      HTMLText.Strings = (
        #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1085#1099#1081' '#1088#1077#1078#1080#1084)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lblLabel5: THTMLabel
      Left = 10
      Top = 10
      Width = 125
      Height = 17
      AutoSizeType = asHorizontal
      FocusControl = ProdName
      HTMLText.Strings = (
        #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object lbl1: THTMLabel
      Left = 310
      Top = 92
      Width = 155
      Height = 17
      FocusControl = OnlyIntSales
      HTMLText.Strings = (
        #1062#1077#1083#1086#1095#1080#1089#1083#1077#1085#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077)
      Transparent = True
      VAlignment = tvaCenter
      Version = '1.9.2.0'
    end
    object ProdDescription: TcxTextEdit
      Tag = 1
      Left = 135
      Top = 36
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 400
    end
    object CountryID: TcxLookupComboBox
      Tag = 6
      Left = 357
      Top = 63
      Properties.KeyFieldNames = 'CountryID'
      Properties.ListColumns = <
        item
          FieldName = 'CountryName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCountries
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 178
    end
    object ArticleNumber: TcxTextEdit
      Tag = 1
      Left = 135
      Top = 63
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 168
    end
    object OnlyIntSales: TcxCheckBox
      Tag = 5
      Left = 515
      Top = 90
      Style.BorderStyle = ebsSingle
      TabOrder = 5
      Width = 20
    end
    object cxGroupBox1: TcxGroupBox
      Left = 10
      Top = 122
      Caption = ' '#1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1077#1076#1080#1085#1080#1094#1099' '#1090#1086#1074#1072#1088#1072' '
      TabOrder = 6
      Transparent = True
      Height = 91
      Width = 525
      object lblLabel9: THTMLabel
        Left = 16
        Top = 24
        Width = 80
        Height = 17
        FocusControl = NettoWeight
        HTMLText.Strings = (
          #1042#1077#1089' '#1085#1077#1090#1090#1086)
        Transparent = True
        VAlignment = tvaCenter
        Version = '1.9.2.0'
      end
      object lblLabel12: THTMLabel
        Left = 16
        Top = 56
        Width = 80
        Height = 17
        FocusControl = BruttoWeight
        HTMLText.Strings = (
          #1042#1077#1089' '#1073#1088#1091#1090#1090#1086)
        Transparent = True
        VAlignment = tvaCenter
        Version = '1.9.2.0'
      end
      object lblLabel13: THTMLabel
        Left = 253
        Top = 24
        Width = 85
        Height = 17
        FocusControl = ProdVolume
        HTMLText.Strings = (
          #1054#1073#1098#1077#1084)
        Transparent = True
        VAlignment = tvaCenter
        Version = '1.9.2.0'
      end
      object lblLabel8: THTMLabel
        Left = 253
        Top = 56
        Width = 85
        Height = 17
        FocusControl = UnitID
        HTMLText.Strings = (
          #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103)
        Transparent = True
        VAlignment = tvaCenter
        Version = '1.9.2.0'
      end
      object BruttoWeight: TcxCalcEdit
        Tag = 3
        Left = 95
        Top = 54
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Properties.ButtonGlyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000000000005252
          5157F1F0ECFFECEBE7FFD7D4CFFFE3E1DCFFF1F0ECFFDBD8D3FFDBD8D3FFF1F0
          ECFFE3E1DCFFD7D4CFFFECEBE7FFF1F0ECFF5252515700000000000000005353
          5158F1F0ECFFE0DED9FFC7C3BDFFD0CDC7FFEDECE8FFC7C3BDFFC7C3BDFFEDEC
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFEDECE7FFD8D6D1FFE4E2DDFFF1F0ECFFDCDAD5FFDCDAD5FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1EFEBFFE4E2DEFFECEBE6FFF1F0ECFFE8E6E2FFE8E6E2FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE1DFDAFFC7C3BDFFD1CEC9FFEEEDE8FFC7C3BDFFC7C3BDFFEEED
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE7E6E1FFCBC8C2FFD9D7D2FFF0EEEAFFCFCCC6FFCFCCC6FFF0EE
          EAFFD9D7D2FFCBC8C2FFE7E6E1FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE6E4E0FFC7C3BDFFD6D4CEFFEFEEEAFFCBC7C2FFCBC7C2FFEFEE
          EAFFD6D4CEFFC7C3BDFFE6E4E0FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE2E0DCFFC7C3BDFFD3CFCAFFEEEDE9FFC8C4BEFFC8C4BEFFEEED
          E9FFD3CFCAFFC7C3BDFFE2E0DCFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFE8E7E2FFEEEDE8FFF1F0ECFFEBE9E5FFEBE9E5FFF1F0
          ECFFEEEDE8FFE8E7E2FFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1ECE4FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DC
          C3FFF0DCC3FFF0DCC3FFF1ECE4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005252
          5157F1F0ECFFF1EDE5FFF0DEC7FFF0DEC6FFF0DEC6FFF0DEC6FFF0DEC6FFF0DE
          C6FFF0DEC6FFF0DEC7FFF1EDE5FFF1F0ECFF5252515700000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000}
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtAlways
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 121
      end
      object ProdVolume: TcxCalcEdit
        Tag = 3
        Left = 347
        Top = 22
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Properties.ButtonGlyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000000000005252
          5157F1F0ECFFECEBE7FFD7D4CFFFE3E1DCFFF1F0ECFFDBD8D3FFDBD8D3FFF1F0
          ECFFE3E1DCFFD7D4CFFFECEBE7FFF1F0ECFF5252515700000000000000005353
          5158F1F0ECFFE0DED9FFC7C3BDFFD0CDC7FFEDECE8FFC7C3BDFFC7C3BDFFEDEC
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFEDECE7FFD8D6D1FFE4E2DDFFF1F0ECFFDCDAD5FFDCDAD5FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1EFEBFFE4E2DEFFECEBE6FFF1F0ECFFE8E6E2FFE8E6E2FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE1DFDAFFC7C3BDFFD1CEC9FFEEEDE8FFC7C3BDFFC7C3BDFFEEED
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE7E6E1FFCBC8C2FFD9D7D2FFF0EEEAFFCFCCC6FFCFCCC6FFF0EE
          EAFFD9D7D2FFCBC8C2FFE7E6E1FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE6E4E0FFC7C3BDFFD6D4CEFFEFEEEAFFCBC7C2FFCBC7C2FFEFEE
          EAFFD6D4CEFFC7C3BDFFE6E4E0FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE2E0DCFFC7C3BDFFD3CFCAFFEEEDE9FFC8C4BEFFC8C4BEFFEEED
          E9FFD3CFCAFFC7C3BDFFE2E0DCFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFE8E7E2FFEEEDE8FFF1F0ECFFEBE9E5FFEBE9E5FFF1F0
          ECFFEEEDE8FFE8E7E2FFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1ECE4FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DC
          C3FFF0DCC3FFF0DCC3FFF1ECE4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005252
          5157F1F0ECFFF1EDE5FFF0DEC7FFF0DEC6FFF0DEC6FFF0DEC6FFF0DEC6FFF0DE
          C6FFF0DEC6FFF0DEC7FFF1EDE5FFF1F0ECFF5252515700000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000}
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtAlways
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 140
      end
      object NettoWeight: TcxCalcEdit
        Tag = 3
        Left = 95
        Top = 22
        EditValue = 0.000000000000000000
        Properties.ButtonGlyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000000000005252
          5157F1F0ECFFECEBE7FFD7D4CFFFE3E1DCFFF1F0ECFFDBD8D3FFDBD8D3FFF1F0
          ECFFE3E1DCFFD7D4CFFFECEBE7FFF1F0ECFF5252515700000000000000005353
          5158F1F0ECFFE0DED9FFC7C3BDFFD0CDC7FFEDECE8FFC7C3BDFFC7C3BDFFEDEC
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFEDECE7FFD8D6D1FFE4E2DDFFF1F0ECFFDCDAD5FFDCDAD5FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1EFEBFFE4E2DEFFECEBE6FFF1F0ECFFE8E6E2FFE8E6E2FFF1F0
          ECFFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE1DFDAFFC7C3BDFFD1CEC9FFEEEDE8FFC7C3BDFFC7C3BDFFEEED
          E8FFD0CDC7FFC7C3BDFFE0DED9FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE7E6E1FFCBC8C2FFD9D7D2FFF0EEEAFFCFCCC6FFCFCCC6FFF0EE
          EAFFD9D7D2FFCBC8C2FFE7E6E1FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE6E4E0FFC7C3BDFFD6D4CEFFEFEEEAFFCBC7C2FFCBC7C2FFEFEE
          EAFFD6D4CEFFC7C3BDFFE6E4E0FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFE2E0DCFFC7C3BDFFD3CFCAFFEEEDE9FFC8C4BEFFC8C4BEFFEEED
          E9FFD3CFCAFFC7C3BDFFE2E0DCFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1F0ECFFE8E7E2FFEEEDE8FFF1F0ECFFEBE9E5FFEBE9E5FFF1F0
          ECFFEEEDE8FFE8E7E2FFF1F0ECFFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1ECE4FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DCC3FFF0DC
          C3FFF0DCC3FFF0DCC3FFF1ECE4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005353
          5158F1F0ECFFF1E4D4FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3B0FFF0D3
          B0FFF0D3B0FFF0D3B0FFF1E4D4FFF1F0ECFF5353515800000000000000005252
          5157F1F0ECFFF1EDE5FFF0DEC7FFF0DEC6FFF0DEC6FFF0DEC6FFF0DEC6FFF0DE
          C6FFF0DEC6FFF0DEC7FFF1EDE5FFF1F0ECFF5252515700000000000000001B1B
          1B1DD7D6D2E3F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFD7D6D2E31B1B1B1D00000000}
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtAlways
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 121
      end
      object UnitID: TcxLookupComboBox
        Tag = 6
        Left = 347
        Top = 54
        Properties.KeyFieldNames = 'UnitID'
        Properties.ListColumns = <
          item
            FieldName = 'UnitName'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsUnit
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 140
      end
    end
    object Comment: TcxTextEdit
      Tag = 1
      Left = 105
      Top = 223
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      Width = 430
    end
    object cxPageControl1: TcxPageControl
      Left = 10
      Top = 260
      Width = 525
      Height = 251
      TabOrder = 8
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 247
      ClientRectLeft = 4
      ClientRectRight = 521
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = #1054#1087#1080#1089#1072#1085#1080#1103' '#1090#1086#1074#1072#1088#1072
        ImageIndex = 0
        object GridDescr: TcxGrid
          Left = 0
          Top = 29
          Width = 517
          Height = 194
          Align = alClient
          PopupMenu = pmDescr
          TabOrder = 0
          object tvDescriptions: TcxGridDBTableView
            Navigator.Buttons.ConfirmDelete = True
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Images = ilRefBookActionImages
            Navigator.Buttons.First.Visible = False
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.Prior.Visible = False
            Navigator.Buttons.Next.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Last.Visible = False
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Append.ImageIndex = 0
            Navigator.Buttons.Append.Visible = True
            Navigator.Buttons.Delete.ImageIndex = 3
            Navigator.Buttons.Edit.ImageIndex = 1
            Navigator.Buttons.Cancel.ImageIndex = 7
            Navigator.Buttons.Refresh.ImageIndex = 4
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            DataController.DataSource = dsDescriptions
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Images = ilRefBookActionImages
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            OptionsView.ShowColumnFilterButtons = sfbAlways
            Styles.ContentEven = dmMain.GridStyleEvenRow
            Styles.Inactive = dmMain.GridStyleSelectedRow
            Styles.Selection = dmMain.GridStyleSelectedRow
            object tvDescriptionsColumn1: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'ProdDescription'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.HideSelection = False
              Properties.ValidateOnEnter = True
            end
            object tvDescriptionsRecId: TcxGridDBColumn
              DataBinding.FieldName = 'RecId'
              Visible = False
            end
          end
          object GridDescrLevel1: TcxGridLevel
            GridView = tvDescriptions
          end
        end
        object tbDescr: TRzToolbar
          Left = 0
          Top = 0
          Width = 517
          Height = 29
          Images = ilRefBookActionImages
          BorderInner = fsNone
          BorderOuter = fsGroove
          BorderSides = [sdTop]
          BorderWidth = 0
          GradientColorStyle = gcsMSOffice
          TabOrder = 1
          VisualStyle = vsGradient
          ToolbarControls = (
            RzToolButton1
            RzSpacer1
            RzToolButton2
            RzSpacer2
            RzToolButton3)
          object RzToolButton1: TRzToolButton
            Left = 4
            Top = 2
            Action = actAddDescr
            ParentShowHint = False
            ShowHint = True
          end
          object RzSpacer1: TRzSpacer
            Left = 29
            Top = 2
          end
          object RzToolButton2: TRzToolButton
            Left = 37
            Top = 2
            Action = actEditDescr
            ParentShowHint = False
            ShowHint = True
          end
          object RzSpacer2: TRzSpacer
            Left = 62
            Top = 2
          end
          object RzToolButton3: TRzToolButton
            Left = 70
            Top = 2
            Action = actDeleteDescr
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1064#1090#1088#1080#1093#1082#1086#1076#1099
        ImageIndex = 1
        object GridBarcode: TcxGrid
          Left = 0
          Top = 29
          Width = 517
          Height = 194
          Align = alClient
          PopupMenu = pmBarcode
          TabOrder = 0
          object tvBarcodes: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsBarcodes
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.ShowColumnFilterButtons = sfbAlways
            Styles.ContentEven = dmMain.GridStyleEvenRow
            Styles.Inactive = dmMain.GridStyleSelectedRow
            Styles.Selection = dmMain.GridStyleSelectedRow
            object tvBarcodesColumn1: TcxGridDBColumn
              Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076#1099
              DataBinding.FieldName = 'BarCode'
              PropertiesClassName = 'TcxTextEditProperties'
            end
            object tvBarcodesColumn2: TcxGridDBColumn
              Caption = #1050#1086#1083'-'#1074#1086' '#1077#1076#1080#1085#1080#1094' '#1090#1086#1074#1072#1088#1072
              DataBinding.FieldName = 'UnitQty'
              PropertiesClassName = 'TcxTextEditProperties'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = tvBarcodes
          end
        end
        object tbBarcode: TRzToolbar
          Left = 0
          Top = 0
          Width = 517
          Height = 29
          Images = ilRefBookActionImages
          BorderInner = fsNone
          BorderOuter = fsGroove
          BorderSides = [sdTop]
          BorderWidth = 0
          GradientColorStyle = gcsMSOffice
          TabOrder = 1
          VisualStyle = vsGradient
          ToolbarControls = (
            RzToolButton4
            RzSpacer5
            RzToolButton5
            RzSpacer6
            RzToolButton6)
          object RzToolButton4: TRzToolButton
            Left = 4
            Top = 2
            Action = actAddBarcode
            ParentShowHint = False
            ShowHint = True
          end
          object RzSpacer5: TRzSpacer
            Left = 29
            Top = 2
          end
          object RzToolButton5: TRzToolButton
            Left = 37
            Top = 2
            Action = actEditBarcode
            ParentShowHint = False
            ShowHint = True
          end
          object RzSpacer6: TRzSpacer
            Left = 62
            Top = 2
          end
          object RzToolButton6: TRzToolButton
            Left = 70
            Top = 2
            Action = actDeleteBarcode
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
    end
    object ThermoTypeID: TcxLookupComboBox
      Tag = 6
      Left = 135
      Top = 90
      Properties.KeyFieldNames = 'ThermoTypeID'
      Properties.ListColumns = <
        item
          FieldName = 'ThermoTypeName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsThermoType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 168
    end
    object ProdName: TcxTextEdit
      Tag = 1
      Left = 135
      Top = 8
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 400
    end
  end
  object pnlBottom: TAdvPanel
    Left = 0
    Top = 523
    Width = 549
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
      549
      64)
    FullHeight = 200
    object btnSave: TcxButton
      Left = 319
      Top = 20
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000002000000070000000C0000001000000012000000110000
        000E000000080000000200000000000000000000000000000000000000000000
        000100000004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A53
        3AD20F2F21840001011500000005000000010000000000000000000000000000
        0005050F0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE
        80FF258560FF1A563DD405110C3D00000007000000010000000000000003040E
        0A31206548ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C9
        96FF32CA99FF2BA479FF227050F805110C3D00000005000000000000000A1A57
        3DD02EA57CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB
        99FF31CB98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A
        66FF3BCD9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3
        A8FF36CF9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB3
        8CFF39CD9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4
        A1FF43D5A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCA
        A4FF44D2A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B75
        4FFF60DCB8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9
        B8FF46D3A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A2
        8BFF46A685FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9
        BEFF52DAB1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EA
        E7FF4F886CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8
        B0FF62E0BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E
        76FFE6E1DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C
        7BFF95ECD6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A1
        7EFF1F6D4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F
        46B578C6ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEA
        C9FF5ED6B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A
        0718247B5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2
        DDFFBAF4E7FF78CDB3FF2A906DEA0615102E0000000200000000000000000000
        0001030A07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8
        C1FF4BB692FF237F60CB05130E27000000030000000000000000000000000000
        000000000001000000030A241B411B60489D258464CF2C9D77EE258867CF1F71
        56B00E3226560000000600000002000000000000000000000000}
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TcxButton
      Left = 439
      Top = 20
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      OptionsImage.Glyph.Data = {
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
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object spRefBookFieldsAddEditView: TUniStoredProc
    StoredProcName = 'spGetReferenceFieldList'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spGetReferenceFieldList (:ReferenceID)}')
    Connection = dmMain.MainConnection
    Left = 424
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'ReferenceID'
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsCountries: TUniDataSource
    DataSet = qCountries
    Left = 460
    Top = 52
  end
  object qCountries: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprCountry'
      'order by CountryName')
    Left = 410
    Top = 52
  end
  object qUnit: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprUnit'
      'order by UnitName')
    Left = 406
    Top = 164
  end
  object dsUnit: TUniDataSource
    DataSet = qUnit
    Left = 464
    Top = 164
  end
  object ilRefBookActionImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 22020456
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
  object alRefBook: TActionList
    Images = ilRefBookActionImages
    Left = 488
    Top = 340
    object actAddDescr: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = actAddDescrExecute
    end
    object actEditDescr: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = actEditDescrExecute
    end
    object actDeleteDescr: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDeleteDescrExecute
    end
    object actAddBarcode: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = actAddBarcodeExecute
    end
    object actEditBarcode: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = actEditBarcodeExecute
    end
    object actDeleteBarcode: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDeleteBarcodeExecute
    end
  end
  object spDescriptions: TUniStoredProc
    StoredProcName = 'br_aspProdDescription;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspProdDescription;1 (:ProdID)}')
    Connection = dmMain.MainConnection
    Left = 72
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'ProdID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'br_aspProdDescription;1'
  end
  object dsDescriptions: TUniDataSource
    DataSet = mdDescr
    Left = 72
    Top = 440
  end
  object dsBarcodes: TUniDataSource
    DataSet = mdBarcode
    Left = 156
    Top = 444
  end
  object spBarcodes: TUniStoredProc
    StoredProcName = 'br_aspBarCode;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspBarCode;1 (:ProdID)}')
    Connection = dmMain.MainConnection
    Left = 156
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'ProdID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'br_aspBarCode;1'
  end
  object pmDescr: TAdvPopupMenu
    MenuStyler = dmMain.AdvMenuFantasyStyler1
    Version = '2.5.7.0'
    Left = 236
    Top = 360
    object MenuItem1: TMenuItem
      Action = actAddDescr
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Action = actEditDescr
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object MenuItem5: TMenuItem
      Action = actDeleteDescr
    end
  end
  object pmBarcode: TAdvPopupMenu
    MenuStyler = dmMain.AdvMenuFantasyStyler1
    Version = '2.5.7.0'
    Left = 236
    Top = 416
    object MenuItem9: TMenuItem
      Action = actAddBarcode
    end
    object MenuItem10: TMenuItem
      Caption = '-'
    end
    object MenuItem11: TMenuItem
      Action = actEditBarcode
    end
    object MenuItem12: TMenuItem
      Caption = '-'
    end
    object MenuItem13: TMenuItem
      Action = actDeleteBarcode
    end
  end
  object dsThermoType: TUniDataSource
    DataSet = qThermoType
    Left = 244
    Top = 80
  end
  object qThermoType: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprThermoType'
      'order by ThermoTypeName')
    Left = 186
    Top = 80
  end
  object mdDescr: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDescrAfterPost
    Left = 72
    Top = 384
    object mdDescrProdDescrID: TIntegerField
      FieldName = 'ProdDescrID'
    end
    object mdDescrProdDescription: TStringField
      FieldName = 'ProdDescription'
    end
  end
  object mdBarcode: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDescrAfterPost
    Left = 152
    Top = 388
    object mdBarcodeBarCodeID: TIntegerField
      FieldName = 'BarCodeID'
    end
    object mdBarcodeBarCode: TStringField
      FieldName = 'BarCode'
    end
    object mdBarcodeUnitQty: TIntegerField
      FieldName = 'UnitQty'
    end
  end
  object spInsertUpdateDeleteRefBook: TUniStoredProc
    StoredProcName = 'spThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spThermoType;1}')
    Connection = dmMain.MainConnection
    Left = 404
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = 'spThermoType;1'
  end
end
