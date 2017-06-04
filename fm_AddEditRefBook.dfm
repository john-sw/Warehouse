object fmAddEditRefBook: TfmAddEditRefBook
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 562
  ClientWidth = 775
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
  object pnlBottom: TAdvPanel
    Left = 0
    Top = 498
    Width = 775
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
    DesignSize = (
      775
      64)
    FullHeight = 200
    object btnSave: TcxButton
      Left = 539
      Top = 20
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TcxButton
      Left = 683
      Top = 20
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object pnlClient: TAdvPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 498
    Align = alClient
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
    FullHeight = 200
  end
  object spRefBookFieldsAddEditView: TUniStoredProc
    StoredProcName = 'spGetReferenceFieldList'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spGetReferenceFieldList (:ReferenceID)}')
    Connection = dmMain.MainConnection
    Left = 92
    Top = 32
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
  object dsForeignRefBook: TUniDataSource
    DataSet = spForeignRefBook
    Left = 192
    Top = 108
  end
  object spForeignRefBook: TUniStoredProc
    StoredProcName = 'spThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spThermoType;1}')
    Connection = dmMain.MainConnection
    Left = 76
    Top = 108
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
