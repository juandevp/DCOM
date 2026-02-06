unit ServidorDCOM_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 122765 $
// File generated on 5/02/2026 11:55:04 p. m. from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\DigitalWare\Entregables\Servidor\ServidorDCOM (1)
// LIBID: {B1F22042-8BC5-47E3-9CD3-D6FC4F11053A}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServidorDCOMMajorVersion = 1;
  ServidorDCOMMinorVersion = 0;

  LIBID_ServidorDCOM: TGUID = '{B1F22042-8BC5-47E3-9CD3-D6FC4F11053A}';

  IID_IServidor: TGUID = '{3FBE46FA-62E0-46F1-A60F-759E205E822D}';
  CLASS_Servidor: TGUID = '{6F1086A2-D41B-4D1E-9350-9B485DD19391}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IServidor = interface;
  IServidorDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  Servidor = IServidor;


// *********************************************************************//
// Interface: IServidor
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3FBE46FA-62E0-46F1-A60F-759E205E822D}
// *********************************************************************//
  IServidor = interface(IAppServer)
    ['{3FBE46FA-62E0-46F1-A60F-759E205E822D}']
    function EjecutarSql(const Sql: WideString): Integer; safecall;
    function EliminarCliente(AIdCliente: Integer): Integer; safecall;
    function Get_PEstado: WideString; safecall;
    procedure Set_PEstado(const Value: WideString); safecall;
    function CrearCliente(const ANombresCliente: WideString; const ADireccion: WideString): Integer; safecall;
    function CrearProducto(const ANombreProduc: WideString; AValor: Double): Integer; safecall;
    function EliminarProducto(AIdProduc: Integer): Integer; safecall;
    procedure ActualizaCliente; safecall;
    procedure ActualizarProducto; safecall;
    function Facturar(AIdFacura: Integer; AIdProducto: Integer; AIdCliente: Integer;
                      ATotalFactura: Double; AValor: Double; ACantidad: Integer): Integer; safecall;
    function Get_IdFactura: Integer; safecall;
    procedure Set_IdFactura(Value: Integer); safecall;
    property PEstado: WideString read Get_PEstado write Set_PEstado;
    property IdFactura: Integer read Get_IdFactura write Set_IdFactura;
  end;

// *********************************************************************//
// DispIntf:  IServidorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3FBE46FA-62E0-46F1-A60F-759E205E822D}
// *********************************************************************//
  IServidorDisp = dispinterface
    ['{3FBE46FA-62E0-46F1-A60F-759E205E822D}']
    function EjecutarSql(const Sql: WideString): Integer; dispid 301;
    function EliminarCliente(AIdCliente: Integer): Integer; dispid 302;
    property PEstado: WideString dispid 303;
    function CrearCliente(const ANombresCliente: WideString; const ADireccion: WideString): Integer; dispid 304;
    function CrearProducto(const ANombreProduc: WideString; AValor: Double): Integer; dispid 305;
    function EliminarProducto(AIdProduc: Integer): Integer; dispid 306;
    procedure ActualizaCliente; dispid 307;
    procedure ActualizarProducto; dispid 308;
    function Facturar(AIdFacura: Integer; AIdProducto: Integer; AIdCliente: Integer;
                      ATotalFactura: Double; AValor: Double; ACantidad: Integer): Integer; dispid 309;
    property IdFactura: Integer dispid 310;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: SYSINT;
                             out ErrorCount: SYSINT; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: SYSINT; out RecsOut: SYSINT;
                           Options: SYSINT; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: SYSINT;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServidor provides a Create and CreateRemote method to
// create instances of the default interface IServidor exposed by
// the CoClass Servidor. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoServidor = class
    class function Create: IServidor;
    class function CreateRemote(const MachineName: string): IServidor;
  end;

implementation

uses System.Win.ComObj;

class function CoServidor.Create: IServidor;
begin
  Result := CreateComObject(CLASS_Servidor) as IServidor;
end;

class function CoServidor.CreateRemote(const MachineName: string): IServidor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Servidor) as IServidor;
end;

end.

