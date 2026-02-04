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
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.Provider;

type
  TServidor = class(TRemoteDataModule, IServidor)
    Conn: TFDConnection;
    QClientes: TFDQuery;
    DspClientes: TDataSetProvider;
    qInsertarCliente: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    QClientesCLIENTE: TFDAutoIncField;
    QClientesNOMBRE_CLIENTE: TStringField;
    QClientesDIRECCION: TStringField;
    procedure DspClientesBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    { Private declarations }
  protected

    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public

    { Public declarations }
  end;

implementation

{$R *.DFM}



procedure TServidor.DspClientesBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  raise Exception.Create('Código de cliente obligatorio');
  if Trim(DeltaDS.FieldByName('CLIENTE').AsString) = '' then


  if Trim(DeltaDS.FieldByName('NOMBRE_CLIENTE').AsString) = '' then
    raise Exception.Create('Nombre obligatorio');
end;

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

initialization
  TComponentFactory.Create(ComServer, TServidor,
    Class_Servidor, ciMultiInstance, tmApartment);
end.
