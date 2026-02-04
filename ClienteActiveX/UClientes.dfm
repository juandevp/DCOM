object Cliente: TCliente
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Caption = 'Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pcGeneral: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    ActivePage = TbsClientes
    Align = alClient
    TabOrder = 0
    object TbsClientes: TTabSheet
      Caption = 'Clientes'
      object DbClientesLista: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 162
        Align = alTop
        DataSource = DsClientes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 162
        Width = 632
        Height = 25
        DataSource = DsClientes
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 312
        ExplicitTop = 208
        ExplicitWidth = 240
      end
    end
  end
  object DCOMConnection: TDCOMConnection
    Connected = True
    ServerGUID = '{6F1086A2-D41B-4D1E-9350-9B485DD19391}'
    ServerName = 'ServidorDCOM.Servidor'
    Left = 504
    Top = 64
  end
  object DsClientes: TDataSource
    DataSet = CdsClientes
    Left = 464
    Top = 120
  end
  object CdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientes'
    RemoteServer = DCOMConnection
    Left = 548
    Top = 130
    object CdsClientesCLIENTE: TAutoIncField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object CdsClientesNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object CdsClientesDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Origin = 'DIRECCION'
      Size = 255
    end
  end
end
