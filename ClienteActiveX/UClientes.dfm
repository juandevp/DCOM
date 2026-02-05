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
  OnCreate = ActiveFormCreate
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
      object LblNombres: TLabel
        Left = 24
        Top = 11
        Width = 107
        Height = 15
        Alignment = taCenter
        Caption = 'Nombre completo*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDireccion: TLabel
        Left = 288
        Top = 11
        Width = 58
        Height = 15
        Alignment = taCenter
        Caption = 'Direcci'#243'n*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DbClientesLista: TDBGrid
        Left = 0
        Top = 176
        Width = 632
        Height = 249
        Align = alBottom
        DataSource = DsClientes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE_CLIENTE'
            ReadOnly = True
            Title.Caption = 'Nombre completo'
            Width = 328
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIRECCION'
            ReadOnly = True
            Title.Caption = 'Direcci'#243'n'
            Width = 285
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 425
        Width = 632
        Height = 25
        DataSource = DsClientes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alBottom
        TabOrder = 1
      end
      object BtnAgregar: TButton
        Left = 288
        Top = 74
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 2
        OnClick = BtnAgregarClick
      end
      object BtnEliminar: TButton
        Left = 182
        Top = 74
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 3
        OnClick = BtnEliminarClick
      end
      object PnlFiltrar: TPanel
        Left = 0
        Top = 135
        Width = 632
        Height = 41
        Align = alBottom
        TabOrder = 4
        object LblFiltro: TLabel
          Left = 112
          Top = 16
          Width = 33
          Height = 15
          Caption = 'Filtrar:'
        end
        object EdtFiltrar: TEdit
          Left = 168
          Top = 12
          Width = 273
          Height = 23
          TabOrder = 0
          OnChange = EdtFiltrarChange
        end
      end
      object DbEdtNombres: TDBEdit
        Left = 24
        Top = 32
        Width = 233
        Height = 23
        DataField = 'NOMBRE_CLIENTE'
        DataSource = DsClientes
        TabOrder = 5
      end
      object DbEdtDireccion: TDBEdit
        Left = 288
        Top = 32
        Width = 233
        Height = 23
        DataField = 'DIRECCION'
        DataSource = DsClientes
        TabOrder = 6
      end
    end
  end
  object DCOMConnection: TDCOMConnection
    Connected = True
    ServerGUID = '{6F1086A2-D41B-4D1E-9350-9B485DD19391}'
    ServerName = 'ServidorDCOM.Servidor'
    Left = 520
    Top = 344
  end
  object DsClientes: TDataSource
    DataSet = CdsClientes
    Left = 520
    Top = 248
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientes'
    RemoteServer = DCOMConnection
    OnReconcileError = CdsClientesReconcileError
    Left = 524
    Top = 290
    object CdsClientesCLIENTE: TAutoIncField
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object CdsClientesNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object CdsClientesDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 255
    end
  end
end
