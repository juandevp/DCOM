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
    Left = 216
    Top = 96
  end
  object QClientes: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from [DW].[dbo].clientes order by cliente desc')
    Left = 56
    Top = 88
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
      
        'SELECT COUNT(*) As TotalFac FROM CLIENTES C INNER JOIN CABEZA_FA' +
        'CTURA CF ON  CF.CLIENTE_ID =  C.CLIENTE WHERE C.CLIENTE = :CLIEN' +
        'TE')
    Left = 168
    Top = 144
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
  object QEliminarCliente: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'DELETE FROM CLIENTES WHERE CLIENTE =:CLIENTE')
    Left = 56
    Top = 208
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
    Top = 144
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
end
