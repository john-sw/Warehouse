object dmRefBooks: TdmRefBooks
  OldCreateOrder = False
  Height = 261
  Width = 273
  object qSprRef: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprReference'
      'order by ReferenceRUSName')
    Left = 32
    Top = 16
  end
  object spRefBookFields: TUniStoredProc
    StoredProcName = 'spGetReferenceFieldList'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spGetReferenceFieldList (:ReferenceID)}')
    Connection = dmMain.MainConnection
    Left = 120
    Top = 8
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
  object spForeignRefBook: TUniStoredProc
    StoredProcName = 'spThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spThermoType;1}')
    Connection = dmMain.MainConnection
    Active = True
    Left = 32
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = 'spThermoType;1'
  end
  object dsForeignRefBook: TUniDataSource
    DataSet = spForeignRefBook
    Left = 124
    Top = 92
  end
  object spInsertRefBook: TUniStoredProc
    StoredProcName = 'spThermoType;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spThermoType;1}')
    Connection = dmMain.MainConnection
    Active = True
    Left = 28
    Top = 160
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
