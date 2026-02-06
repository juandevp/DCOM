object Servidor: TServidor
  Height = 480
  Width = 640
  object Conn: TFDConnection
    Params.Strings = (
      'Database=dw'
      'OSAuthent=Yes'
      'Server=LAPTOP-K8JF3JJ2'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object DspClientes: TDataSetProvider
    DataSet = QClientes
    ResolveToDataSet = True
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 160
    Top = 96
  end
  object QClientes: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from [DW].[dbo].clientes order by cliente desc')
    Left = 56
    Top = 90
    object QClientesCLIENTE: TFDAutoIncField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QClientesNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object QClientesDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Origin = 'DIRECCION'
      Size = 255
    end
  end
  object QValidarFacturasCliente: TFDQuery
    Connection = Conn
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.UpdateTableName = 'CLIENTES'
    UpdateOptions.KeyFields = 'CLIENTE_ID'
    SQL.Strings = (
      
        'SELECT COUNT(*) As TotalFac FROM PRODUCTOS P INNER JOIN DETALLE_' +
        'FACTURA CF ON  CF.PRODUCTO_ID =  P.PRODUCTO WHERE P.PRODUCTO = :' +
        'PRODUCTO')
    Left = 184
    Top = 208
    ParamData = <
      item
        Name = 'PRODUCTO'
        ParamType = ptInput
      end>
  end
  object QEliminarCliente: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'DELETE FROM CLIENTES WHERE CLIENTE =:CLIENTE')
    Left = 56
    Top = 206
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QCrearCliente: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'INSERT INTO CLIENTES (NOMBRE_CLIENTE, DIRECCION) VALUES (:NOMBRE' +
        '_CLIENTE, :DIRECCION)')
    Left = 56
    Top = 148
    ParamData = <
      item
        Name = 'NOMBRE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = 'SDASDASD'
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        ParamType = ptInput
        Value = 'ASDASDASD'
      end>
  end
  object qProductos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from [DW].[dbo].PRODUCTOS order by producto desc')
    Left = 528
    Top = 32
    object qProductosPRODUCTO: TFDAutoIncField
      FieldName = 'PRODUCTO'
      Origin = 'PRODUCTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qProductosNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Origin = 'NOMBRE_PRODUCTO'
      Size = 100
    end
    object qProductosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object qEliminarProductos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'DELETE FROM PRODUCTOS WHERE PRODUCTO =:PRODUCTO')
    Left = 528
    Top = 160
    ParamData = <
      item
        Name = 'PRODUCTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qCrearProductos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'INSERT INTO PRODUCTOS (NOMBRE_PRODUCTO, VALOR) VALUES (:NOMBRE_P' +
        'RODUCTO, :VALOR)')
    Left = 528
    Top = 96
    ParamData = <
      item
        Name = 'NOMBRE_PRODUCTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
  end
  object qActualizarProducto: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'UPDATE PRODUCTOS'
      '   SET NOMBRE_PRODUCTO = :NOMBRE_PRODUCTO, VALOR = :VALOR'
      ' WHERE PRODUCTO = :PRODUCTO'
      '')
    Left = 528
    Top = 224
    ParamData = <
      item
        Name = 'NOMBRE_PRODUCTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRODUCTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qActualizarCliente: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'UPDATE CLIENTES SET NOMBRE_CLIENTE = :NOMBRE_CLIENTE, DIRECCION ' +
        '= :DIRECCION'
      'WHERE CLIENTE = :CLIENTE ')
    Left = 56
    Top = 264
    ParamData = <
      item
        Name = 'NOMBRE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DspProductos: TDataSetProvider
    DataSet = qProductos
    ResolveToDataSet = True
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 432
    Top = 32
  end
  object qVerificarFacturasProducto: TFDQuery
    Connection = Conn
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.UpdateTableName = 'CLIENTES'
    UpdateOptions.KeyFields = 'CLIENTE_ID'
    SQL.Strings = (
      
        'SELECT COUNT(*) As TotalFac FROM CLIENTES C INNER JOIN CABEZA_FA' +
        'CTURA CF ON  CF.CLIENTE_ID =  C.CLIENTE WHERE C.CLIENTE = :CLIEN' +
        'TE')
    Left = 392
    Top = 160
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
end
