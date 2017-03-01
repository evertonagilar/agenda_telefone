program AgendaTelefoneUnB;

uses
  Forms,
  UnMultInstGestor in 'UnMultInstGestor.pas',
  frmAgenda in 'frmAgenda.pas' {FormAgenda},
  uLkJSON in 'uLkJSON.pas',
  Vcl.Themes,
  Vcl.Styles,
  avicaptura in 'WebCam\TCamera\avicaptura.pas',
  cam in 'WebCam\TCamera\cam.pas' {MainForm},
  camera in 'WebCam\TCamera\camera.pas',
  piconebarretache in 'WebCam\TCamera\piconebarretache.pas',
  CapturaCam in 'WebCam\Exemplo\CapturaCam.pas' {fCaptura};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Pesquisar Telefone/Ramal no CPD/UnB';
  if not AppExecutando then
  begin
    Application.CreateForm(TFormAgenda, FormAgenda);
    Application.Run;
  end;
end.
