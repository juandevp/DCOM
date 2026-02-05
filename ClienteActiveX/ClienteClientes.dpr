library ClienteClientes;

uses
  System.Win.ComServ,
  ActiveClientes_TLB in 'ActiveClientes_TLB.pas',
  UClientes in 'UClientes.pas' {Cliente: TActiveForm} {Cliente: CoClass},
  Vcl.recerror in 'C:\Program Files (x86)\Embarcadero\Studio\37.0\ObjRepos\en\DelphiWin32\Vcl.recerror.pas' {ReconcileErrorForm};

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
