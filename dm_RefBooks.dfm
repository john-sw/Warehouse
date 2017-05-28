object dmRefBooks: TdmRefBooks
  OldCreateOrder = False
  Height = 261
  Width = 273
  object UniStoredProc1: TUniStoredProc
    Left = 32
    Top = 84
  end
  object qSprRef: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprReference'
      'order by ReferenceRUSName')
    Left = 24
    Top = 12
  end
end
