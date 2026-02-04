library ClienteClientes;

uses
  System.Win.ComServ,
  ActiveClientes_TLB in 'ActiveClientes_TLB.pas',
  UClientes in 'UClientes.pas' {Cliente: TActiveForm} {Cliente: CoClass};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}

begin
end.
