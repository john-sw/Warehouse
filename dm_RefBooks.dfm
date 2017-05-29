object dmRefBooks: TdmRefBooks
  OldCreateOrder = False
  Height = 261
  Width = 273
  object qSprRef: TUniQuery
    Connection = dmMain.MainConnection
    SQL.Strings = (
      'select * from sprReference'
      'order by ReferenceRUSName')
    Left = 24
    Top = 12
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
end
