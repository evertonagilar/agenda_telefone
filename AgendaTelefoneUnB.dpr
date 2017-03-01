program AgendaTelefoneUnB;

uses
  Forms,
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
  Application.CreateForm(TFormAgenda, FormAgenda);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfCaptura, fCaptura);
  Application.Run;
end.
