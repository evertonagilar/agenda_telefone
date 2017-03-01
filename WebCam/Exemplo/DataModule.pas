unit DataModule;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DBClient, Provider, DB,
  SqlExpr, Dialogs, MaskUtils, Forms;

type
  TdmPrincipal = class(TDataModule)
    sqlConexao: TSQLConnection;
    sdsVisitantes: TSQLDataSet;
    dspVisitantes: TDataSetProvider;
    cdsVisitantes: TClientDataSet;
    dspVisitas: TDataSetProvider;
    sdsVisitas: TSQLDataSet;
    cdsVisitas: TClientDataSet;
    cdsVisitasID: TIntegerField;
    cdsVisitasID_VISITANTE: TIntegerField;
    cdsVisitasANDAR: TIntegerField;
    cdsVisitasSALA: TStringField;
    cdsVisitasEMPRESA: TStringField;
    cdsVisitasCONTATO: TStringField;
    cdsVisitasDATA_VISITA: TSQLTimeStampField;
    cdsVisitantesID: TIntegerField;
    cdsVisitantesENDERECO: TStringField;
    cdsVisitantesCIDADE: TStringField;
    cdsVisitantesESTADO: TStringField;
    cdsVisitantesRG: TStringField;
    cdsVisitantesCPF: TStringField;
    cdsVisitantesDATA_NASC: TSQLTimeStampField;
    cdsVisitantesTELEFONE: TStringField;
    cdsVisitantesEMPRESA: TStringField;
    cdsVisitantesCONTATO: TStringField;
    cdsVisitantesDATA_CAD: TSQLTimeStampField;
    cdsVisitantesFOTO: TStringField;
    sdsAuxiliar: TSQLDataSet;
    cdsVisitantesNOME: TStringField;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
    dtsVisitas: TDataSource;
    dtsVisitantes: TDataSource;
    procedure dtsVisitantesDataChange(Sender: TObject; Field: TField);
    procedure cdsVisitantesAfterScroll(DataSet: TDataSet);
    procedure cdsVisitasAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses Principal;

{$R *.dfm}

procedure TdmPrincipal.cdsVisitantesAfterScroll(DataSet: TDataSet);
begin
  with cdsVisitas do
  begin
    Close;
    Params.ParamByName('ID_VISITANTE').AsInteger :=
      DataSet.FieldByName('ID').AsInteger;
    Open;
  end;
end;

procedure TdmPrincipal.cdsVisitasAfterInsert(DataSet: TDataSet);
begin
    cdsVisitas.FieldByName('EMPRESA').AsString :=
      cdsVisitantes.FieldByName('EMPRESA').AsString;
    cdsVisitas.FieldByName('CONTATO').AsString :=
      cdsVisitantes.FieldByName('CONTATO').AsString;
end;

procedure TdmPrincipal.dtsVisitantesDataChange(Sender: TObject; Field: TField);
var
  strCaminho: string;
  strRG : string;
begin
  if not cdsVisitantes.IsEmpty then
    if FileExists(dmPrincipal.cdsVisitantes.FieldByName('FOTO').AsString) then
      fPrincipal.imgFoto.Picture.LoadFromFile(
        dmPrincipal.cdsVisitantes.FieldByName('FOTO').AsString)
    else
      fPrincipal.imgFoto.Picture := Nil;
end;

end.
