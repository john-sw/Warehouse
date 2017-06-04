object dmRefBooks: TdmRefBooks
  OldCreateOrder = False
  Height = 342
  Width = 483
  object spInsertUpdateDeleteRefBook: TUniStoredProc
    StoredProcName = 'spThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spThermoType;1}')
    Connection = dmMain.MainConnection
    Left = 68
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = 'spThermoType;1'
  end
  object qSprRefForMainMenu: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprReference'
      'order by ReferenceRUSName')
    Left = 72
    Top = 24
  end
end
