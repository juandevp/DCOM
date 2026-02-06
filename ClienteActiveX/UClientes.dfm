object Cliente: TCliente
  Left = 0
  Top = 0
  Width = 640
  Height = 506
  Caption = 'Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = ActiveFormCreate
  TextHeight = 15
  object Label4: TLabel
    Left = 192
    Top = 51
    Width = 44
    Height = 15
    Alignment = taCenter
    Caption = 'Cliente*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pcGeneral: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 506
    ActivePage = TbFacturar
    Align = alClient
    TabOrder = 0
    OnChange = pcGeneralChange
    ExplicitHeight = 480
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
        Top = 202
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
      object DBNavCliente: TDBNavigator
        Left = 0
        Top = 451
        Width = 632
        Height = 25
        DataSource = DsClientes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 425
      end
      object BtnAgregar: TButton
        Left = 255
        Top = 98
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 2
        OnClick = BtnAgregarClick
      end
      object BtnEliminar: TButton
        Left = 174
        Top = 98
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 3
        OnClick = BtnEliminarClick
      end
      object PnlFiltrar: TPanel
        Left = 0
        Top = 161
        Width = 632
        Height = 41
        Align = alBottom
        TabOrder = 4
        ExplicitTop = 135
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
        CharCase = ecUpperCase
        DataField = 'NOMBRE_CLIENTE'
        DataSource = DsClientes
        TabOrder = 5
      end
      object DbEdtDireccion: TDBEdit
        Left = 288
        Top = 32
        Width = 233
        Height = 23
        CharCase = ecUpperCase
        DataField = 'DIRECCION'
        DataSource = DsClientes
        TabOrder = 6
      end
      object BtnActualizar: TButton
        Left = 336
        Top = 98
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 7
        OnClick = BtnActualizarClick
      end
    end
    object TbProductos: TTabSheet
      Caption = 'Productos'
      ImageIndex = 1
      object LblNombreProducto: TLabel
        Left = 32
        Top = 19
        Width = 105
        Height = 15
        Alignment = taCenter
        Caption = 'Nombre producto*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 296
        Top = 19
        Width = 33
        Height = 15
        Alignment = taCenter
        Caption = 'Valor*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnAgregarProduc: TButton
        Left = 257
        Top = 106
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 0
        OnClick = BtnAgregarClick
      end
      object BtnEliminarProduc: TButton
        Left = 176
        Top = 106
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 1
        OnClick = BtnEliminarClick
      end
      object DbProductosLista: TDBGrid
        Left = 0
        Top = 202
        Width = 632
        Height = 249
        Align = alBottom
        DataSource = DsProductos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE_PRODUCTO'
            Title.Caption = 'Nombre producto'
            Width = 436
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Width = 168
            Visible = True
          end>
      end
      object DBEdtNombreProducto: TDBEdit
        Left = 32
        Top = 40
        Width = 233
        Height = 23
        DataField = 'NOMBRE_PRODUCTO'
        DataSource = DsProductos
        TabOrder = 3
      end
      object DBEdtPrecio: TDBEdit
        Left = 296
        Top = 40
        Width = 233
        Height = 23
        DataField = 'VALOR'
        DataSource = DsProductos
        TabOrder = 4
      end
      object DBNavProduc: TDBNavigator
        Left = 0
        Top = 451
        Width = 632
        Height = 25
        DataSource = DsClientes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alBottom
        TabOrder = 5
        ExplicitLeft = -3
        ExplicitTop = 440
      end
      object Panel1: TPanel
        Left = 0
        Top = 161
        Width = 632
        Height = 41
        Align = alBottom
        TabOrder = 6
        ExplicitTop = 143
        object Label3: TLabel
          Left = 112
          Top = 16
          Width = 33
          Height = 15
          Caption = 'Filtrar:'
        end
        object EdtFiltrarProduc: TEdit
          Left = 168
          Top = 12
          Width = 273
          Height = 23
          TabOrder = 0
          OnChange = EdtFiltrarChange
        end
      end
      object BtnActualizarProduc: TButton
        Left = 338
        Top = 106
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 7
        OnClick = BtnActualizarProducClick
      end
    end
    object TbFacturar: TTabSheet
      Caption = 'Facturar'
      ImageIndex = 2
      object Label1: TLabel
        Left = 21
        Top = 1
        Width = 44
        Height = 15
        Alignment = taCenter
        Caption = 'Cliente*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 21
        Top = 57
        Width = 56
        Height = 15
        Alignment = taCenter
        Caption = 'Producto*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 293
        Top = 57
        Width = 53
        Height = 15
        Alignment = taCenter
        Caption = 'Cantidad*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBlTotalFactura: TLabel
        Left = 504
        Top = 1
        Width = 7
        Height = 15
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCrimson
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 428
        Top = 1
        Width = 70
        Height = 15
        Caption = 'Total Factura:'
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 111
        Width = 632
        Height = 306
        Align = alBottom
        DataSource = DsDetalleFactura
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
            FieldName = 'NOMBRE_PRODUCTO'
            Title.Caption = 'Nombre producto'
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Width = 168
            Visible = True
          end>
      end
      object DBLCBCliente: TDBLookupComboBox
        Left = 21
        Top = 22
        Width = 249
        Height = 23
        KeyField = 'CLIENTE'
        ListField = 'NOMBRE_CLIENTE'
        ListSource = DsClientes
        TabOrder = 1
      end
      object DBLCBProducto: TDBLookupComboBox
        Left = 21
        Top = 78
        Width = 249
        Height = 23
        KeyField = 'PRODUCTO'
        ListField = 'NOMBRE_PRODUCTO'
        ListSource = DsProductos
        TabOrder = 2
      end
      object SECantidad: TSpinEdit
        Left = 293
        Top = 77
        Width = 121
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object BtnAgregarDetalle: TButton
        Left = 453
        Top = 77
        Width = 105
        Height = 24
        Caption = 'Agregar detalle'
        TabOrder = 4
        OnClick = BtnAgregarDetalleClick
      end
      object BtnGenerarFactura: TButton
        Left = 0
        Top = 442
        Width = 632
        Height = 34
        Align = alBottom
        Caption = 'Generar factura'
        TabOrder = 5
        OnClick = BtnGenerarFacturaClick
        ExplicitTop = 422
      end
      object BtnLimpiarFactura: TButton
        Left = 453
        Top = 47
        Width = 105
        Height = 24
        Caption = 'Limpiar factura'
        TabOrder = 6
        OnClick = BtnLimpiarFacturaClick
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 417
        Width = 632
        Height = 25
        DataSource = DsDetalleFactura
        VisibleButtons = [nbPrior, nbNext, nbDelete]
        Align = alBottom
        TabOrder = 7
        ExplicitTop = 385
      end
    end
  end
  object DCOMConnection: TDCOMConnection
    Connected = True
    ServerGUID = '{6F1086A2-D41B-4D1E-9350-9B485DD19391}'
    ServerName = 'ServidorDCOM.Servidor'
    Left = 528
    Top = 376
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
    Top = 306
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
  object DsProductos: TDataSource
    DataSet = CdsProductos
    Left = 408
    Top = 248
  end
  object CdsProductos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProductos'
    RemoteServer = DCOMConnection
    OnReconcileError = CdsClientesReconcileError
    Left = 412
    Top = 306
    object CdsProductosPRODUCTO: TAutoIncField
      FieldName = 'PRODUCTO'
      Origin = 'PRODUCTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CdsProductosNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Origin = 'NOMBRE_PRODUCTO'
      Size = 100
    end
    object CdsProductosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DsDetalleFactura: TDataSource
    DataSet = MTDetalleFactura
    Left = 156
    Top = 314
  end
  object MTDetalleFactura: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 156
    Top = 370
    object MTDetalleFacturaPRODUCTO_ID: TIntegerField
      FieldName = 'PRODUCTO_ID'
    end
    object MTDetalleFacturaNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 100
    end
    object MTDetalleFacturaCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object MTDetalleFacturaVALOR: TBCDField
      FieldName = 'VALOR'
    end
    object MTDetalleFacturaCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object MTDetalleFacturaNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 0
    end
  end
end
