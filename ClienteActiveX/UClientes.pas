unit UClientes;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Winapi.ActiveX, Vcl.AxCtrls, ActiveClientes_TLB, StdVcl,
  Data.DB, Datasnap.DBClient, Datasnap.Win.MConnect, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls,Vcl.recerror,
  Vcl.Mask, System.UITypes,UComun, Vcl.Samples.Spin, System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TCliente = class(TActiveForm, ICliente)
    DCOMConnection: TDCOMConnection;
    DsClientes: TDataSource;
    pcGeneral: TPageControl;
    TbsClientes: TTabSheet;
    DbClientesLista: TDBGrid;
    DBNavCliente: TDBNavigator;
    BtnAgregar: TButton;
    CdsClientes: TClientDataSet;
    CdsClientesCLIENTE: TAutoIncField;
    CdsClientesNOMBRE_CLIENTE: TStringField;
    CdsClientesDIRECCION: TStringField;
    BtnEliminar: TButton;
    PnlFiltrar: TPanel;
    LblFiltro: TLabel;
    EdtFiltrar: TEdit;
    DbEdtNombres: TDBEdit;
    DbEdtDireccion: TDBEdit;
    LblNombres: TLabel;
    LblDireccion: TLabel;
    TbProductos: TTabSheet;
    BtnAgregarProduc: TButton;
    BtnEliminarProduc: TButton;
    DbProductosLista: TDBGrid;
    LblNombreProducto: TLabel;
    DBEdtNombreProducto: TDBEdit;
    Label2: TLabel;
    DBEdtPrecio: TDBEdit;
    DBNavProduc: TDBNavigator;
    Panel1: TPanel;
    Label3: TLabel;
    EdtFiltrarProduc: TEdit;
    DsProductos: TDataSource;
    CdsProductos: TClientDataSet;
    BtnActualizar: TButton;
    BtnActualizarProduc: TButton;
    CdsProductosPRODUCTO: TAutoIncField;
    CdsProductosNOMBRE_PRODUCTO: TStringField;
    CdsProductosVALOR: TFMTBCDField;
    TbFacturar: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DsDetalleFactura: TDataSource;
    DBLCBCliente: TDBLookupComboBox;
    DBLCBProducto: TDBLookupComboBox;
    Label5: TLabel;
    SECantidad: TSpinEdit;
    Label6: TLabel;
    BtnAgregarDetalle: TButton;
    BtnGenerarFactura: TButton;
    BtnLimpiarFactura: TButton;
    DBNavigator1: TDBNavigator;
    MTDetalleFactura: TFDMemTable;
    MTDetalleFacturaNOMBRE_PRODUCTO: TStringField;
    MTDetalleFacturaCLIENTE_ID: TIntegerField;
    MTDetalleFacturaCANTIDAD: TIntegerField;
    MTDetalleFacturaPRODUCTO_ID: TIntegerField;
    MTDetalleFacturaNOMBRE_CLIENTE: TStringField;
    MTDetalleFacturaVALOR: TBCDField;
    LBlTotalFactura: TLabel;
    Label7: TLabel;
    procedure ActiveFormCreate(Sender: TObject);
    procedure CdsClientesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnAgregarClick(Sender: TObject);
    procedure EdtFiltrarChange(Sender: TObject);
    procedure BtnActualizarClick(Sender: TObject);
    procedure BtnAgregarDetalleClick(Sender: TObject);
    procedure BtnLimpiarFacturaClick(Sender: TObject);
    procedure pcGeneralChange(Sender: TObject);
    procedure BtnActualizarProducClick(Sender: TObject);
    procedure BtnGenerarFacturaClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IClienteEvents;
    FTotalFactura: Currency;
    procedure ActivateEvent(Sender: TObject);
    procedure AfterMonitorDpiChangedEvent(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure BeforeMonitorDpiChangedEvent(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
    procedure InicializarCOM;
    procedure CargarDatosClientes;
    procedure CargarDatosProductos;
    procedure DispararMensaje(AMensaje: string; ATipoNovedad: Integer);
    procedure CambiarEstadoBotonesCliente(AEstado: EnumEstadoForm);
    procedure CambiarEstadoBotonesProductos(AEstado: EnumEstadoForm);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_CurrentPPI: Integer; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DoubleBufferedMode: TxDoubleBufferedMode; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_IsDrawingLocked: WordBool; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_RaiseOnNonMainThreadUsage: WordBool; safecall;
    function Get_RedrawDisabled: WordBool; safecall;
    function Get_RoundedCorners: TxRoundedCornerType; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScaleFactor: Single; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_StyleName: WideString; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DoubleBufferedMode(Value: TxDoubleBufferedMode); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_RaiseOnNonMainThreadUsage(Value: WordBool); safecall;
    procedure Set_RoundedCorners(Value: TxRoundedCornerType); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_StyleName(const Value: WideString); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;


implementation

uses System.Win.ComObj, System.Win.ComServ;

{$R *.DFM}

{ TCliente }

procedure TCliente.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ClientePage); }
end;

procedure TCliente.EdtFiltrarChange(Sender: TObject);
var
  Filtro: string;
begin
  CdsClientes.Filtered := False;

  if EdtFiltrar.Text = '' then Exit;
  Filtro :='NOMBRE_CLIENTE LIKE '+ QuotedStr('%'+EdtFiltrar.Text+'%');
  CdsClientes.Filter := Filtro;
  CdsClientes.Filtered := True;
end;

procedure TCliente.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IClienteEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TCliente.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnAfterMonitorDpiChanged := AfterMonitorDpiChangedEvent;
  OnBeforeMonitorDpiChanged := BeforeMonitorDpiChangedEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TCliente.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCliente.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TCliente.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TCliente.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCliente.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCliente.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCliente.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TCliente.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCliente.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCliente.Get_CurrentPPI: Integer;
begin
  Result := CurrentPPI;
end;

function TCliente.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TCliente.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCliente.Get_DoubleBufferedMode: TxDoubleBufferedMode;
begin
  Result := Ord(DoubleBufferedMode);
end;

function TCliente.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCliente.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCliente.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TCliente.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TCliente.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TCliente.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TCliente.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCliente.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCliente.Get_IsDrawingLocked: WordBool;
begin
  Result := IsDrawingLocked;
end;

function TCliente.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCliente.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TCliente.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TCliente.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TCliente.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCliente.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TCliente.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCliente.Get_RaiseOnNonMainThreadUsage: WordBool;
begin
  Result := RaiseOnNonMainThreadUsage;
end;

function TCliente.Get_RedrawDisabled: WordBool;
begin
  Result := RedrawDisabled;
end;

function TCliente.Get_RoundedCorners: TxRoundedCornerType;
begin
  Result := Ord(RoundedCorners);
end;

function TCliente.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCliente.Get_ScaleFactor: Single;
begin
  Result := ScaleFactor;
end;

function TCliente.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TCliente.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TCliente.Get_StyleName: WideString;
begin
  Result := WideString(StyleName);
end;

function TCliente.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TCliente.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCliente.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCliente._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCliente.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCliente.ActiveFormCreate(Sender: TObject);
begin
  InicializarCOM;
  CargarDatosClientes;
  CargarDatosProductos;
end;

procedure TCliente.AfterMonitorDpiChangedEvent(Sender: TObject; OldDPI, NewDPI: Integer);

begin
  if FEvents <> nil then FEvents.OnAfterMonitorDpiChanged(OldDPI, NewDPI);
end;

procedure TCliente.BeforeMonitorDpiChangedEvent(Sender: TObject; OldDPI, NewDPI: Integer);

begin
  if FEvents <> nil then FEvents.OnBeforeMonitorDpiChanged(OldDPI, NewDPI);
end;

procedure TCliente.BtnEliminarClick(Sender: TObject);
var
  Resultado: Integer;
begin
  CambiarEstadoBotonesProductos(EEliminar);
  try
    if  MessageDlg('¿Está seguro de que desea eliminar este cliente?',
      TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      Resultado := DCOMConnection.AppServer.
        EliminarCliente(CdsClientesCLIENTE.AsInteger);
      DispararMensaje(DCOMConnection.AppServer.PEstado, Resultado);
      CargarDatosClientes;
    end;
  finally
    CambiarEstadoBotonesProductos(ENada);
  end;
end;

procedure TCliente.BtnGenerarFacturaClick(Sender: TObject);
var IdFactura: Integer;
begin
  MTDetalleFactura.First;
  IdFactura := -1;
  while not MTDetalleFactura.Eof do
  begin
    DCOMConnection.AppServer.Facturar(IdFactura, MTDetalleFacturaPRODUCTO_ID.AsInteger,
      MTDetalleFacturaCLIENTE_ID.AsInteger, FTotalFactura, MTDetalleFacturaVALOR.AsCurrency, MTDetalleFacturaCANTIDAD.AsInteger);
    MTDetalleFactura.Next;
    if IdFactura = -1 then
    begin
      if DCOMConnection.AppServer.IdFactura > 1 then
      begin
        IdFactura := DCOMConnection.AppServer.IdFactura;
      end
      else
        raise Exception.Create('Se detectaron inconsistencias en el consecutivo de la factura.');
    end
    else if (IdFactura <> DCOMConnection.AppServer.IdFactura) then
    begin
      raise Exception.Create('a numeración de la factura cambió. Por favor, vuelva a intentarlo.');
    end;
  end;
  BtnLimpiarFacturaClick(nil);
end;

procedure TCliente.BtnActualizarClick(Sender: TObject);
begin
  BtnActualizar.Caption := 'Guardar';
  CambiarEstadoBotonesCliente(EActualizar);
  try
    if (Trim(DbEdtNombres.Text)='') or  (Trim(DbEdtDireccion.Text)='')  then
    begin
       MessageDlg('Por favor, complete todos los campos obligatorios antes de guardar.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
       Exit;
    end;
  finally
    CambiarEstadoBotonesCliente(ENada);
  end;
end;

procedure TCliente.BtnActualizarProducClick(Sender: TObject);
begin
  BtnActualizar.Caption := 'Guardar';
  CambiarEstadoBotonesProductos(EActualizar);
  try
    if (Trim(DbEdtNombres.Text)='') or  (Trim(DbEdtDireccion.Text)='')  then
    begin
       MessageDlg('Por favor, complete todos los campos obligatorios antes de guardar.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
       Exit;
    end;
  finally
    CambiarEstadoBotonesProductos(ENada);
  end;
end;

procedure TCliente.BtnAgregarClick(Sender: TObject);
var
  Resultado: Integer;
begin
  if CdsProductosVALOR.Value < 1 then
  begin
    MessageDlg('Por favor, ingrese un valor de producto mayor a 0.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  CambiarEstadoBotonesProductos(ECrear);
  try
    if (Trim(DbEdtNombres.Text)='') or  (Trim(DbEdtDireccion.Text)='')  then
    begin
       MessageDlg('Por favor, complete todos los campos obligatorios antes de guardar.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
       Exit;
    end;

    if CdsClientes.State in [dsInsert] then
    begin
      BtnAgregar.Caption := 'Crear';
      Resultado := DCOMConnection.AppServer.
        CrearCliente(CdsClientesNOMBRE_CLIENTE.AsString,CdsClientesDIRECCION.AsString);
      DispararMensaje(DCOMConnection.AppServer.PEstado, Resultado);
      CargarDatosClientes;
    end
    else
    begin
      CdsClientes.Insert;
      BtnAgregar.Caption := 'Guardar';
    end;
  finally
    if CdsClientes.State in [dsBrowse] then
    begin
      CambiarEstadoBotonesProductos(ENada);
    end;
  end;
end;

procedure TCliente.BtnAgregarDetalleClick(Sender: TObject);
begin

 if SECantidad.Value > 0 then
  begin
     MessageDlg('Por favor, ingrese una cantidad mayor a 0.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
     Exit;
  end;

  MTDetalleFactura.Insert;
  MTDetalleFacturaNOMBRE_PRODUCTO.AsString := CdsClientesNOMBRE_CLIENTE.AsString;
  MTDetalleFacturaCLIENTE_ID.AsInteger := CdsClientesCLIENTE.AsInteger;
  MTDetalleFacturaCANTIDAD.AsInteger := SECantidad.Value;
  MTDetalleFacturaNOMBRE_PRODUCTO.AsString := CdsProductosNOMBRE_PRODUCTO.AsString;
  MTDetalleFacturaPRODUCTO_ID.AsInteger := CdsProductosPRODUCTO.AsInteger;
  MTDetalleFacturaVALOR.AsBCD := (MTDetalleFacturaCANTIDAD.AsInteger * CdsProductosVALOR.AsBCD);
  FTotalFactura := MTDetalleFacturaVALOR.AsCurrency + FTotalFactura;
  LBlTotalFactura.Caption := FormatCurr('#,##0', FTotalFactura);
  MTDetalleFactura.Post;
  DBLCBProducto.KeyValue := Null;
  SECantidad.Value := 0;
end;

procedure TCliente.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCliente.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCliente.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCliente.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCliente.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCliente.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCliente.BtnLimpiarFacturaClick(Sender: TObject);
begin
  DBLCBCliente.KeyValue := Null;
  DBLCBProducto.KeyValue := Null;
  SECantidad.Value := 0;
  MTDetalleFactura.EmptyDataSet;
  LBlTotalFactura.Caption := '0';
  FTotalFactura := 0;
end;

procedure TCliente.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TCliente.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TCliente.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCliente.pcGeneralChange(Sender: TObject);
begin
  MTDetalleFactura.Close;
  if pcGeneral.ActivePage = TbFacturar then
  begin
     MTDetalleFactura.Open;
     BtnLimpiarFacturaClick(nil);
  end;
end;

procedure TCliente.InicializarCOM;
begin
  DCOMConnection.Connected := True;
end;
procedure TCliente.CargarDatosClientes;
begin
  CdsClientes.Close;
  CdsClientes.Open;
end;

procedure TCliente.CargarDatosProductos;
begin
  CdsProductos.Close;
  CdsProductos.Open;
end;

procedure TCliente.CambiarEstadoBotonesProductos(AEstado: EnumEstadoForm);
begin
  BtnAgregarProduc.Enabled := (AEstado = EnumEstadoForm.ECrear)
    or (AEstado = EnumEstadoForm.ENada);
  BtnEliminarProduc.Enabled := (AEstado = EnumEstadoForm.EEliminar)
    or (AEstado = EnumEstadoForm.ENada);
  BtnActualizarProduc.Enabled := (AEstado = EnumEstadoForm.EActualizar)
    or (AEstado = EnumEstadoForm.ENada);
  DBNavProduc.Enabled := (AEstado = EnumEstadoForm.ENada);
  DbProductosLista.Enabled := (AEstado = EnumEstadoForm.ENada);
end;

procedure TCliente.CambiarEstadoBotonesCliente(AEstado: EnumEstadoForm);
begin
  BtnAgregar.Enabled := (AEstado = EnumEstadoForm.ECrear)
    or (AEstado = EnumEstadoForm.ENada);
  BtnEliminar.Enabled := (AEstado = EnumEstadoForm.EEliminar)
    or (AEstado = EnumEstadoForm.ENada);
  BtnActualizar.Enabled := (AEstado = EnumEstadoForm.EActualizar)
    or (AEstado = EnumEstadoForm.ENada);
  DBNavCliente.Enabled := (AEstado = EnumEstadoForm.ENada);
  DbClientesLista.Enabled := (AEstado = EnumEstadoForm.ENada);
end;

procedure TCliente.DispararMensaje(AMensaje: string; ATipoNovedad: Integer);
begin
  case ATipoNovedad of
    1:
      MessageDlg(AMensaje, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    -1:
      MessageDlg(AMensaje, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TCliente.CdsClientesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(Dataset, UpdateKind, E)
end;

procedure TCliente.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TCliente.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCliente.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCliente.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCliente.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TCliente.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCliente.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCliente.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TCliente.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCliente.Set_DoubleBufferedMode(Value: TxDoubleBufferedMode);
begin
  DoubleBufferedMode := TDoubleBufferedMode(Value);
end;

procedure TCliente.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCliente.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCliente.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCliente.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TCliente.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCliente.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TCliente.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TCliente.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCliente.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TCliente.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCliente.Set_RaiseOnNonMainThreadUsage(Value: WordBool);
begin
  RaiseOnNonMainThreadUsage := Value;
end;

procedure TCliente.Set_RoundedCorners(Value: TxRoundedCornerType);
begin
  RoundedCorners := TRoundedCornerType(Value);
end;

procedure TCliente.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCliente.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TCliente.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TCliente.Set_StyleName(const Value: WideString);
begin
  StyleName := string(Value);
end;

procedure TCliente.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TCliente.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCliente,
    CLASS_Clientes,
    0,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
