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
      'where IsSimpleRefBook = 1'
      'order by ReferenceRUSName')
    Left = 72
    Top = 24
  end
  object dsShowRefBookGoods: TUniDataSource
    DataSet = spShowRefBookGoods
    Left = 360
    Top = 20
  end
  object spShowRefBookGoods: TUniStoredProc
    StoredProcName = 'br_aspProdCat;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspProdCat;1}')
    Connection = dmMain.MainConnection
    AfterScroll = spShowRefBookGoodsAfterScroll
    Left = 240
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = 'br_aspProdCat;1'
  end
  object spGetGoodsForProdCat: TUniStoredProc
    StoredProcName = 'br_aspProd;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL br_aspProd;1 (:ProdCatID)}')
    Connection = dmMain.MainConnection
    Left = 240
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ProdCatID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'br_aspProd;1'
  end
  object dsGetGoodsForProdCat: TUniDataSource
    DataSet = spGetGoodsForProdCat
    Left = 364
    Top = 80
  end
  object spGetReferenceFieldList: TUniStoredProc
    StoredProcName = 'spGetReferenceFieldList;1'
    SQL.Strings = (
      '{:RETURN_VALUE = CALL spGetReferenceFieldList;1 (:ReferenceID)}')
    Connection = dmMain.MainConnection
    Left = 68
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ReferenceID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'spGetReferenceFieldList;1'
  end
end
