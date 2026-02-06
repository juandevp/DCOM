unit UDataModulo;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Win.ComServ,
  System.Win.ComObj, System.Win.VCLCom, Datasnap.DataBkr, Datasnap.DBClient, ServidorDCOM_TLB, StdVcl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.Provider,Vcl.recerror;


type
  TServidor = class(TRemoteDataModule, IServidor)
    Conn: TFDConnection;
    DspClientes: TDataSetProvider;
    QClientes: TFDQuery;
    QClientesCLIENTE: TFDAutoIncField;
    QClientesNOMBRE_CLIENTE: TStringField;
    QClientesDIRECCION: TStringField;
    QValidarFacturasCliente: TFDQuery;
    QEliminarCliente: TFDQuery;
    QCrearCliente: TFDQuery;
    QProductos: TFDQuery;
    QEliminarProductos: TFDQuery;
    QCrearProductos: TFDQuery;
    QActualizarProducto: TFDQuery;
    qActualizarCliente: TFDQuery;
    QProductosPRODUCTO: TFDAutoIncField;
    QProductosNOMBRE_PRODUCTO: TStringField;
    QProductosVALOR: TFMTBCDField;
    DspProductos: TDataSetProvider;
    qVerificarFacturasProducto: TFDQuery;
    QInsertarCabezaFac: TFDQuery;
    QInsertarDetalleFac: TFDQuery;
    qFacSec: TFDQuery;
    qFacSecNumFac: TIntegerField;
    FDStoredProc: TFDStoredProc;
  private
    FNovedades: WideString;
    FIdFacura: Integer;
    procedure InsertarDetalleFac(AIdFacura, AIdProducto, ACantidad: Integer; AValor: Double);
    { Private declarations }
  protected

    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function EjecutarSql(const Sql: WideString): Integer; safecall;
    function EliminarCliente(AIdCliente: Integer): Integer; safecall;
    function Get_PEstado: WideString; safecall;
    procedure Set_PEstado(const Value: WideString); safecall;
    function CrearCliente(const ANombresCliente, ADireccion: WideString): Integer; safecall;
    function CrearProducto(const ANombreProduc: WideString; AValor: Double): Integer;
          safecall;
    function EliminarProducto(AIdProduc: Integer): Integer; safecall;
    function ActualizarCliente(AIdCliente: Integer; const ANombresCliente, ADireccionCliente: WideString): Integer;
          safecall;
    function ActualizarProducto(AIdProducto: Integer; const ANombreProducto: WideString;
          AValor: Double): Integer; safecall;
    function Get_IdFactura: Integer; safecall;
    procedure Set_IdFactura(Value: Integer); safecall;
    function Facturar(AIdFacura, AIdProducto, AIdCliente: Integer; ATotalFactura, AValor: Double;
          ACantidad: Integer): Integer; safecall;
    function EliminarFac(AIdFactura: Integer): Integer; safecall;





  public

    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TServidor.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TServidor.EjecutarSql(const Sql: WideString): Integer;
begin
  Result := -1;
  QEliminarCliente.SQL.Text := Sql;
  QEliminarCliente.ExecSQL;
  Result := 1;
end;

function TServidor.EliminarCliente(AIdCliente: Integer): Integer;
begin
 Result := -1;
  try
    QValidarFacturasCliente.ParamByName('CLIENTE').AsInteger := AIdCliente;
    QValidarFacturasCliente.Open;
    try
      if QValidarFacturasCliente.FieldByName('TotalFac').AsInteger > 0 then
      begin
        FNovedades := 'No se puede eliminar el cliente porque '+
          ' tiene más de una factura registrada.';
      end
      else
      begin
        QEliminarCliente.ParamByName('CLIENTE').AsInteger := AIdCliente;
        QEliminarCliente.ExecSQL;
        FNovedades:= 'El cliente fue eliminado correctamente.';
        Result := 1;
      end;
    finally
      QValidarFacturasCliente.Close;
    end;
    except
      on E: Exception do
      FNovedades:= E.Message + '. Novedad eliminando cliente.';
  end;

end;

function TServidor.Get_PEstado: WideString;
begin
  Result := FNovedades;
end;

procedure TServidor.Set_PEstado(const Value: WideString);
begin
  FNovedades := Value;
end;

function TServidor.CrearCliente(const ANombresCliente, ADireccion: WideString): Integer;

begin
  Result := -1;
  QCrearCliente.ParamByName('NOMBRE_CLIENTE').AsString := ANombresCliente;
  QCrearCliente.ParamByName('DIRECCION').AsString := ADireccion;
  try
    QCrearCliente.ExecSQL;
    Result := 1;
    FNovedades:= 'El cliente fue creado correctamente.';
  except
    on E: Exception do
    FNovedades:= E.Message + '. Novedad creando cliente.';
  end;
end;

function TServidor.CrearProducto(const ANombreProduc: WideString; AValor: Double): Integer;
begin
  Result := -1;
  qCrearProductos.ParamByName('NOMBRE_PRODUCTO').AsString := ANombreProduc;
  qCrearProductos.ParamByName('VALOR').AsBCD := AValor;
  try
    qCrearProductos.ExecSQL;
    Result := 1;
    FNovedades:= 'El producto fue creado correctamente.';
  except
    on E: Exception do
    FNovedades:= E.Message + '. Novedad creando producto.';
  end;
end;

function TServidor.EliminarProducto(AIdProduc: Integer): Integer;
begin
  Result := -1;
  try
    qVerificarFacturasProducto.ParamByName('PRODUCTO').AsInteger := AIdProduc;
    qVerificarFacturasProducto.Open;
    try
      if qVerificarFacturasProducto.FieldByName('TotalFac').AsInteger > 0 then
      begin
        FNovedades := 'No se puede eliminar el producto porque '+
          ' tiene más de una factura registrada.';
      end
      else
      begin
        QEliminarProductos.ParamByName('PRODUCTO').AsInteger := AIdProduc;
        QEliminarProductos.ExecSQL;
        FNovedades:= 'El producto fue eliminado correctamente.';
        Result := 1;
      end;
    finally
      qVerificarFacturasProducto.Close;
    end;
    except
      on E: Exception do
      FNovedades:= E.Message + '. Novedad eliminando producto.';
  end;
end;

function TServidor.ActualizarCliente(AIdCliente: Integer; const ANombresCliente, ADireccionCliente: WideString): Integer;

begin
 Result := -1;
  qActualizarCliente.ParamByName('NOMBRE_CLIENTE').AsString := ANombresCliente;
  qActualizarCliente.ParamByName('DIRECCION').AsString := ADireccionCliente;
  qActualizarCliente.ParamByName('CLIENTE').AsString := ADireccionCliente;
  try
    qActualizarCliente.ExecSQL;
    Result := 1;
    FNovedades:= 'El cliente fue actualizado correctamente.';
  except
    on E: Exception do
    FNovedades:= E.Message + '. Novedad actualizando cliente.';
  end;
end;

function TServidor.ActualizarProducto(AIdProducto: Integer; const ANombreProducto: WideString;
          AValor: Double): Integer;
begin
    Result := -1;
  QActualizarProducto.ParamByName('NOMBRE_PRODUCTO').AsString := ANombreProducto;
  QActualizarProducto.ParamByName('VALOR').AsBCD := AValor;
  QActualizarProducto.ParamByName('PRODUCTO').AsInteger := AIdProducto;
  try
    QActualizarProducto.ExecSQL;
    Result := 1;
    FNovedades:= 'El producto fue acutalizado correctamente.';
  except
    on E: Exception do
    FNovedades:= E.Message + '. Novedad actualizando producto.';
  end;
end;

procedure TServidor.InsertarDetalleFac(AIdFacura, AIdProducto, ACantidad: Integer; AValor: Double);
begin
  QInsertarDetalleFac.ParamByName('NUMERO_FACTURA').AsInteger := AIdFacura;
  QInsertarDetalleFac.ParamByName('PRODUCTO_ID').AsInteger := AIdProducto;
  QInsertarDetalleFac.ParamByName('CANTIDAD').AsInteger := ACantidad;
  QInsertarDetalleFac.ParamByName('VALOR').AsBCD := AValor;
  QInsertarDetalleFac.ExecSQL;
end;
function TServidor.Get_IdFactura: Integer;
begin
 Result := FIdFacura;
end;

procedure TServidor.Set_IdFactura(Value: Integer);
begin
  FIdFacura := Value;
end;

function TServidor.Facturar(AIdFacura, AIdProducto, AIdCliente: Integer; ATotalFactura,
          AValor: Double; ACantidad: Integer): Integer;
begin
   FIdFacura := -1;
   if AIdFacura = -1 then
   begin
      qFacSec.Open;
      try
        FIdFacura := qFacSecNumFac.AsInteger;
        QInsertarCabezaFac.ParamByName('NUMERO').AsInteger := FIdFacura;
        QInsertarCabezaFac.ParamByName('CLIENTE_ID').AsInteger := AIdCliente;
        QInsertarCabezaFac.ParamByName('TOTAL').AsBCD := ATotalFactura;
        QInsertarCabezaFac.ExecSQL;
        InsertarDetalleFac(FIdFacura, AIdProducto, ACantidad, AValor);
        Result := 1;
      finally
        qFacSec.Close;
      end;
   end
   else
   begin
     InsertarDetalleFac(FIdFacura, AIdProducto, ACantidad, AValor);
     Result := 1;
   end;
end;

function TServidor.EliminarFac(AIdFactura: Integer): Integer;
begin
  Result := -1;
  FDStoredProc.Params[1].AsInteger := AIdFactura;
  FDStoredProc.ExecProc;
  Result := 1;
end;

initialization
  TComponentFactory.Create(ComServer, TServidor,
    Class_Servidor, ciMultiInstance, tmApartment);
end.
