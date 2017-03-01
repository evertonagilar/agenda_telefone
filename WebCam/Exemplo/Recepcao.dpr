program Recepcao;

uses
  Forms,
  Principal in 'Principal.pas' {fPrincipal},
  DataModule in 'DataModule.pas' {dmPrincipal: TDataModule},
  CapturaCam in 'CapturaCam.pas' {fCaptura};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
