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
  private
    FNovedades: WideString;
    { Private declarations }
  protected

    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function EjecutarSql(const Sql: WideString): Integer; safecall;
    function EliminarCliente(AIdCliente: Integer): Integer; safecall;
    function Get_PEstado: WideString; safecall;
    procedure Set_PEstado(const Value: WideString); safecall;
    function CrearCliente(const ANombresCliente, ADireccion: WideString): Integer; safecall;





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

  QValidarFacturasCliente.ParamByName('CLIENTE').AsInteger := AIdCliente;
  QValidarFacturasCliente.Open;
  try
    if QValidarFacturasCliente.FieldByName('TotalFac').AsInteger > 0 then
    begin
      Result := 1;
      FNovedades := 'No se puede eliminar el cliente porque '+
        ' tiene más de una factura registrada.';
    end
    else
    begin
      QEliminarCliente.ParamByName('CLIENTE').AsInteger := AIdCliente;
      QEliminarCliente.ExecSQL;
      FNovedades:= 'El cliente fue eliminado correctamente.';
      Result := -1;
    end;
  finally
    QValidarFacturasCliente.Close;
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
  QCrearCliente.ParamByName('NOMBRE_CLIENTE').AsString := ANombresCliente;
  QCrearCliente.ParamByName('DIRECCION').AsString := ADireccion;
  QCrearCliente.ExecSQL;
  FNovedades:= 'El cliente fue creado correctamente.';
end;

initialization
  TComponentFactory.Create(ComServer, TServidor,
    Class_Servidor, ciMultiInstance, tmApartment);
end.
