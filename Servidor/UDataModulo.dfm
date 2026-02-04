object Servidor: TServidor
  Height = 480
  Width = 640
  object Conn: TFDConnection
    Params.Strings = (
      'Database=dw'
      'User_Name=digital'
      'Password=123456789'
      'OSAuthent=Yes'
      'Server=LAPTOP-K8JF3JJ2'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object QClientes: TFDQuery
    Connection = Conn
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.UpdateTableName = 'CLIENTES'
    SQL.Strings = (
      'select * from clientes')
    Left = 56
    Top = 104
    object QClientesCLIENTE: TFDAutoIncField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
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
  object DspClientes: TDataSetProvider
    DataSet = QClientes
    ResolveToDataSet = True
    Options = [poAutoRefresh, poUseQuoteChar]
    BeforeUpdateRecord = DspClientesBeforeUpdateRecord
    Left = 128
    Top = 96
  end
  object qInsertarCliente: TFDQuery
    Connection = Conn
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.UpdateTableName = 'CLIENTES'
    UpdateOptions.KeyFields = 'CLIENTE_ID'
    SQL.Strings = (
      'INSERT INTO [dbo].[CLIENTES]'
      '           ([CLIENTE_ID]'
      '           ,[CLIENTE]'
      '           ,[NOMBRE_CLIENTE]'
      '           ,[DIRECCION])'
      '     VALUES'
      '           (:NOMBRE_CLIENTE,'
      '            :DIRECCION)')
    Left = 64
    Top = 192
    ParamData = <
      item
        Name = 'NOMBRE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end>
    object IntegerField1: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'DIRECCION'
      Origin = 'DIRECCION'
      Size = 255
    end
  end
end
