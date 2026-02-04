program ServidorDCOM;

uses
  Vcl.Forms,
  UForm in 'UForm.pas' {FrmApp},
  UDataModulo in 'UDataModulo.pas' {Servidor: TRemoteDataModule} {Servidor: CoClass},
  ServidorDCOM_TLB in 'ServidorDCOM_TLB.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TFrmApp, FrmApp);
  Application.Run;
end.
