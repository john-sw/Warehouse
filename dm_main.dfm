object dmMain: TdmMain
  OldCreateOrder = False
  Height = 189
  Width = 143
  object MainConnection: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'RasprCenter2017'
    Username = 'eugene'
    Server = 'localhost'
    ConnectDialog = MainConnectDialog
    Left = 44
    Top = 64
  end
  object MainConnectDialog: TUniConnectDialog
    DatabaseLabel = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
    PortLabel = #1055#1086#1088#1090
    ProviderLabel = #1055#1088#1086#1074#1072#1081#1076#1077#1088
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
    UsernameLabel = #1048#1084#1103
    PasswordLabel = #1055#1072#1088#1086#1083#1100
    ServerLabel = #1057#1077#1088#1074#1077#1088
    ConnectButton = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    CancelButton = #1054#1090#1084#1077#1085#1072
    LabelSet = lsRussian
    Left = 44
    Top = 112
  end
  object MainProvider: TSQLServerUniProvider
    Left = 44
    Top = 12
  end
end
